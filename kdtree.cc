#include "kdtree.h"
#define SPACE_3D 3

BoundingBox::BoundingBox() { }

BoundingBox::BoundingBox(Vector<FLOAT,3> min, Vector<FLOAT,3> max) 
 : min(min), max(max) { }

void BoundingBox::split(BoundingBox & left, BoundingBox & right) {
  // ^ y   z
  // |   /
  // | /
  // --------> x
  // axes[0] = x-axis, axes[1] = y-axis, axes[2] = z-axis
  Vector<FLOAT, 3> axes = max - min;
  left.min = min;
  right.max = max;
  // Case x-axis
  if(axes[0] >= axes[1] && axes[0] >= axes[2]) {
    FLOAT x = (max[0] + min[0]) * 0.5f;
    left.max = {x, max[1], max[2]};
    right.min = {x, min[1], min[2]};
  } 
  // Case y-axis
  else if(axes[1] >= axes[2]) {
    FLOAT y = (max[1] + min[1]) * 0.5f;
    left.max = {max[0], y, max[2]};
    right.min = {min[0], y, min[2]};
  }
  // Case z-axis
  else {
    FLOAT z = (max[2] + min[2]) * 0.5f;
    left.max = {max[0], max[1], z};
    right.min = {min[0], min[1], z};
  }
}

bool BoundingBox::contains(Vector<FLOAT, 3> point) {

  return (min[0] <= point[0] && point[0] <= max[0]) && 
         (min[1] <= point[1] && point[1] <= max[1]) && 
         (min[2] <= point[2] && point[2] <= max[2]);
}

bool BoundingBox::contains(Triangle<FLOAT> *triangle) {
  
  return contains(triangle->p1) || contains(triangle->p2) || contains(triangle->p3);
}

bool BoundingBox::intersects(Vector<FLOAT,3> eye, Vector<FLOAT, 3> direction) {
    // slab test implementation
    FLOAT tmin[3] = { (min[0] - eye[0]) / direction[0],
                      (min[1] - eye[1]) / direction[1],
                      (min[2] - eye[2]) / direction[2] };
    FLOAT tmax[3] = { (max[0] - eye[0]) / direction[0],
                      (max[1] - eye[1]) / direction[1],
                      (max[2] - eye[2]) / direction[2] };
    FLOAT tminimum = std::min(tmin[0], tmax[0]);
    FLOAT tmaximum = std::max(tmin[0], tmax[0]);
    tminimum = std::max(tminimum, std::min(tmin[1], tmax[1]) );
    tmaximum = std::min(tmaximum, std::max(tmin[1], tmax[1]) );
    tminimum = std::max(tminimum, std::min(tmin[2], tmax[2]) );
    tmaximum = std::min(tmaximum, std::max(tmin[2], tmax[2]) );

    return tmaximum >= tminimum;
}


KDTree::~KDTree() {
  delete left;
  delete right;
}

KDTree * KDTree::buildTree(KDTree * tree, std::vector< Triangle<FLOAT> *> & triangles) {
  
  if(triangles.size() < MAX_TRIANGLES_PER_LEAF) {
    this->triangles = triangles;
    return tree;
  }
  left = new KDTree();
  right = new KDTree();
  box.split(left->box, right->box);
  std::vector< Triangle<FLOAT> *> leftTreeTriangles;
  std::vector< Triangle<FLOAT> *> rightTreeTriangles;
  for(Triangle<FLOAT> * triangle : triangles) {
    if(left->box.contains(triangle)) {
      if(right->box.contains(triangle)) {
        this->triangles.push_back(triangle);
      } else {
        leftTreeTriangles.push_back(triangle);
      }
    } else {
      rightTreeTriangles.push_back(triangle);
    }
  }
  left->buildTree(left, leftTreeTriangles);
  right->buildTree(right, rightTreeTriangles);
  return tree;
}

KDTree * KDTree::buildTree(std::vector<Triangle<FLOAT> *> & triangles)  {
  
  KDTree * root = new KDTree();
  Vector<FLOAT, 3> min = triangles[0]->p1;
  Vector<FLOAT, 3> max = triangles[0]->p1;
  for(Triangle<FLOAT> * triangle : triangles) {
    for(size_t i = 0; i < SPACE_3D; i++) {
      FLOAT iteration_min = triangle->p1[i] < triangle->p2[i] ? 
                         (triangle->p1[i] < triangle->p3[i] ? triangle->p1[i] : triangle->p3[i]) : 
                         (triangle->p2[i] < triangle->p3[i] ? triangle->p2[i] : triangle->p3[i]);
      min[i] = min[i] <= iteration_min ? min[i] : iteration_min;
      FLOAT iteration_max = triangle->p1[i] > triangle->p2[i] ? 
                         (triangle->p1[i] > triangle->p3[i] ? triangle->p1[i] : triangle->p3[i]) : 
                         (triangle->p2[i] > triangle->p3[i] ? triangle->p2[i] : triangle->p3[i]);
      max[i] = max[i] >= iteration_max ? max[i] : iteration_max;
    }
  }
  root->box = * new BoundingBox(min, max);
  return root->buildTree(root, triangles);
}

bool KDTree::hasNearestTriangle(Vector<FLOAT,3> eye, Vector<FLOAT,3> direction, Triangle<FLOAT> * & nearest_triangle, FLOAT &t, FLOAT &u, FLOAT &v, FLOAT minimum_t) {
  
  if (!box.intersects(eye, direction)) return false;
  
  if (left != nullptr && left->hasNearestTriangle(eye, direction, nearest_triangle, t, u, v, minimum_t) && t < minimum_t) {
    minimum_t = t;
  }
  if (right != nullptr && right->hasNearestTriangle(eye, direction, nearest_triangle, t, u, v, minimum_t) && t < minimum_t) {
    minimum_t = t;
  }
  for(Triangle<FLOAT> * triangle : triangles) {
    stats.no_ray_triangle_intersection_tests++;
    if(triangle->intersects(eye, direction, t, u, v, minimum_t)) {
      stats.no_ray_triangle_intersections_found++;
      nearest_triangle = triangle;
      minimum_t = t;
    }
  }
  t = minimum_t;
  return nearest_triangle != nullptr;
}
