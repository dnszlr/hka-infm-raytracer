#include "kdtree.h"
#define SPACE_3D 3

BoundingBox::BoundingBox() { }

BoundingBox::BoundingBox(Vector<FLOAT,3> min, Vector<FLOAT,3> max) 
 : min(min), max(max) { }

void BoundingBox::split(BoundingBox & left, BoundingBox & right) {
  // from here
  // TODO: your code
  // to here
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

KDTree *  KDTree::buildTree(std::vector<Triangle<FLOAT> *> & triangles)  {
  KDTree * root = new KDTree();
  Vector<FLOAT, 3> min = triangles[0]->p1;
  Vector<FLOAT, 3> max = triangles[0]->p1;
  for(Triangle<FLOAT> * triangle : triangles) {
    for(size_t i = 0; i < SPACE_3D; i++) {
      FLOAT current_min = std::min(triangle->p1[i], std::min(triangle->p2[i], triangle->p3[i]));
      min[i] = std::min(min[i], current_min);
      FLOAT current_max = std::max(triangle->p1[i], std::max(triangle->p2[i], triangle->p3[i]));
      max[i] = std::max(max[i], current_max);
    }
  }
  root->box = * new BoundingBox(min, max);
  return root;
}

bool KDTree::hasNearestTriangle(Vector<FLOAT,3> eye, Vector<FLOAT,3> direction, Triangle<FLOAT> *  & nearest_triangle, FLOAT &t, FLOAT &u, FLOAT &v, FLOAT minimum_t) {
  // from here
  // TODO: your code
  // to here
  return nearest_triangle != nullptr;
}
