
.\sqrt_opt.o:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <__tcf_0>:
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
   0:	48 8d 0d 08 0a 00 00 	lea    0xa08(%rip),%rcx        # a0f <_ZStL8__ioinit+0x7>
   7:	e9 00 00 00 00       	jmpq   c <__tcf_0+0xc>
   c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000010 <_Z13random_doublev>:
#include <random>
#include "measure_time.h"
#include "sqrt_opt.h"

double random_double()
{
  10:	56                   	push   %rsi
  11:	53                   	push   %rbx
  12:	48 83 ec 58          	sub    $0x58,%rsp
  16:	c5 f8 29 74 24 40    	vmovaps %xmm6,0x40(%rsp)
  static std::random_device device;
  1c:	0f b6 05 20 00 00 00 	movzbl 0x20(%rip),%eax        # 43 <_Z13random_doublev+0x33>
  23:	84 c0                	test   %al,%al
  25:	75 14                	jne    3b <_Z13random_doublev+0x2b>
  27:	48 8d 0d 20 00 00 00 	lea    0x20(%rip),%rcx        # 4e <_Z13random_doublev+0x3e>
  2e:	e8 00 00 00 00       	callq  33 <_Z13random_doublev+0x23>
  33:	85 c0                	test   %eax,%eax
  35:	0f 85 bb 00 00 00    	jne    f6 <_Z13random_doublev+0xe6>
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  3b:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 42 <_Z13random_doublev+0x32>
  42:	84 c0                	test   %al,%al
  44:	74 7b                	je     c1 <_Z13random_doublev+0xb1>
    operator()()
    {
#ifdef _GLIBCXX_USE_RANDOM_TR1
      return this->_M_getval();
#else
      return this->_M_getval_pretr1();
  46:	48 8d 0d 40 00 00 00 	lea    0x40(%rip),%rcx        # 8d <_Z13random_doublev+0x7d>
  4d:	e8 00 00 00 00       	callq  52 <_Z13random_doublev+0x42>
      _RealType __ret;
      _RealType __sum = _RealType(0);
      _RealType __tmp = _RealType(1);
      for (size_t __k = __m; __k != 0; --__k)
	{
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
  52:	c5 e1 57 db          	vxorpd %xmm3,%xmm3,%xmm3
  56:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
  5a:	48 8d 0d 40 00 00 00 	lea    0x40(%rip),%rcx        # a1 <_Z13random_doublev+0x91>
  61:	89 c0                	mov    %eax,%eax
  63:	c4 e1 fb 2a c0       	vcvtsi2sd %rax,%xmm0,%xmm0
  68:	c5 fb 58 f3          	vaddsd %xmm3,%xmm0,%xmm6
  6c:	e8 00 00 00 00       	callq  71 <_Z13random_doublev+0x61>
  71:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
  75:	89 c0                	mov    %eax,%eax
  77:	c4 e1 fb 2a c0       	vcvtsi2sd %rax,%xmm0,%xmm0
  7c:	c4 e2 c9 99 05 30 01 	vfmadd132sd 0x130(%rip),%xmm6,%xmm0        # 1b5 <_ZZ13random_doublevE6device+0x175>
  83:	00 00 
	  __tmp *= __r;
	}
      __ret = __sum / __tmp;
  85:	c5 fb 59 05 38 01 00 	vmulsd 0x138(%rip),%xmm0,%xmm0        # 1c5 <_ZZ13random_doublevE6device+0x185>
  8c:	00 
      if (__builtin_expect(__ret >= _RealType(1), 0))
  8d:	c5 f9 2e 05 40 01 00 	vucomisd 0x140(%rip),%xmm0        # 1d5 <_ZZ13random_doublevE6device+0x195>
  94:	00 
  95:	0f 83 c5 00 00 00    	jae    160 <_Z13random_doublev+0x150>
  9b:	c5 fb 10 15 10 00 00 	vmovsd 0x10(%rip),%xmm2        # b3 <_Z13random_doublev+0xa3>
  a2:	00 
	operator()(_UniformRandomNumberGenerator& __urng,
		   const param_type& __p)
	{
	  __detail::_Adaptor<_UniformRandomNumberGenerator, result_type>
	    __aurng(__urng);
	  return (__aurng() * (__p.b() - __p.a())) + __p.a();
  a3:	c5 fb 10 0d 18 00 00 	vmovsd 0x18(%rip),%xmm1        # c3 <_Z13random_doublev+0xb3>
  aa:	00 
  return dist(device);
}
  ab:	c5 f8 28 74 24 40    	vmovaps 0x40(%rsp),%xmm6
  b1:	c5 f3 5c ca          	vsubsd %xmm2,%xmm1,%xmm1
  b5:	c4 e2 e9 99 c1       	vfmadd132sd %xmm1,%xmm2,%xmm0
  ba:	48 83 c4 58          	add    $0x58,%rsp
  be:	5b                   	pop    %rbx
  bf:	5e                   	pop    %rsi
  c0:	c3                   	retq   
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  c1:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # c8 <_Z13random_doublev+0xb8>
  c8:	e8 00 00 00 00       	callq  cd <_Z13random_doublev+0xbd>
  cd:	85 c0                	test   %eax,%eax
  cf:	0f 84 71 ff ff ff    	je     46 <_Z13random_doublev+0x36>
	: _M_a(__a), _M_b(__b)
  d5:	c5 f8 28 05 20 01 00 	vmovaps 0x120(%rip),%xmm0        # 1fd <_ZZ13random_doublevE6device+0x1bd>
  dc:	00 
  dd:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # e4 <_Z13random_doublev+0xd4>
  e4:	c5 f8 29 05 10 00 00 	vmovaps %xmm0,0x10(%rip)        # fc <_Z13random_doublev+0xec>
  eb:	00 
  ec:	e8 00 00 00 00       	callq  f1 <_Z13random_doublev+0xe1>
  f1:	e9 50 ff ff ff       	jmpq   46 <_Z13random_doublev+0x36>

      // Use empty-base optimization: http://www.cantrip.org/emptyopt.html
      struct _Alloc_hider : allocator_type // TODO check __is_final
      {
	_Alloc_hider(pointer __dat, const _Alloc& __a = _Alloc())
	: allocator_type(__a), _M_p(__dat) { }
  f6:	48 8d 5c 24 20       	lea    0x20(%rsp),%rbx
      static char_type*
      copy(char_type* __s1, const char_type* __s2, size_t __n)
      {
	if (__n == 0)
	  return __s1;
	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
  fb:	c7 44 24 30 6d 74 31 	movl   $0x3931746d,0x30(%rsp)
 102:	39 
    { _M_init_pretr1(__token); }
 103:	48 8d 0d 40 00 00 00 	lea    0x40(%rip),%rcx        # 14a <_Z13random_doublev+0x13a>
      _M_data(pointer __p)
      { _M_dataplus._M_p = __p; }

      void
      _M_length(size_type __length)
      { _M_string_length = __length; }
 10a:	48 c7 44 24 28 07 00 	movq   $0x7,0x28(%rsp)
 111:	00 00 
	: allocator_type(__a), _M_p(__dat) { }
 113:	48 8d 43 10          	lea    0x10(%rbx),%rax
 117:	66 c7 43 14 39 33    	movw   $0x3339,0x14(%rbx)
 11d:	c6 43 16 37          	movb   $0x37,0x16(%rbx)
 121:	48 89 da             	mov    %rbx,%rdx
 124:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
      { __c1 = __c2; }
 129:	c6 44 24 37 00       	movb   $0x0,0x37(%rsp)
 12e:	e8 00 00 00 00       	callq  133 <_Z13random_doublev+0x123>
  static std::random_device device;
 133:	48 8d 0d 20 00 00 00 	lea    0x20(%rip),%rcx        # 15a <_Z13random_doublev+0x14a>
      _M_create(size_type&, size_type);

      void
      _M_dispose()
      {
	if (!_M_is_local())
 13a:	48 83 c3 10          	add    $0x10,%rbx
 13e:	e8 00 00 00 00       	callq  143 <_Z13random_doublev+0x133>
 143:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
 148:	48 39 d9             	cmp    %rbx,%rcx
 14b:	0f 84 ea fe ff ff    	je     3b <_Z13random_doublev+0x2b>
      }

      // __p is not permitted to be a null pointer.
      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }
 151:	e8 00 00 00 00       	callq  156 <_Z13random_doublev+0x146>
 156:	e9 e0 fe ff ff       	jmpq   3b <_Z13random_doublev+0x2b>
 15b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
	{
#if _GLIBCXX_USE_C99_MATH_TR1
	  __ret = std::nextafter(_RealType(1), _RealType(0));
 160:	c5 fb 10 05 40 01 00 	vmovsd 0x140(%rip),%xmm0        # 2a8 <_ZZ13random_doublevE6device+0x268>
 167:	00 
 168:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
 16c:	e8 00 00 00 00       	callq  171 <_Z13random_doublev+0x161>
 171:	e9 25 ff ff ff       	jmpq   9b <_Z13random_doublev+0x8b>
 176:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
 17b:	48 83 c3 10          	add    $0x10,%rbx
 17f:	48 89 c6             	mov    %rax,%rsi
 182:	48 39 d9             	cmp    %rbx,%rcx
 185:	74 1c                	je     1a3 <_Z13random_doublev+0x193>
 187:	c5 f8 77             	vzeroupper 
 18a:	e8 00 00 00 00       	callq  18f <_Z13random_doublev+0x17f>
 18f:	48 8d 0d 20 00 00 00 	lea    0x20(%rip),%rcx        # 1b6 <_ZZ13random_doublevE6device+0x176>
 196:	e8 00 00 00 00       	callq  19b <_Z13random_doublev+0x18b>
 19b:	48 89 f1             	mov    %rsi,%rcx
 19e:	e8 00 00 00 00       	callq  1a3 <_Z13random_doublev+0x193>
 1a3:	c5 f8 77             	vzeroupper 
 1a6:	eb e7                	jmp    18f <_Z13random_doublev+0x17f>
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop

Disassembly of section .text$_ZNKSt5ctypeIcE8do_widenEc:

0000000000000000 <_ZNKSt5ctypeIcE8do_widenEc>:
   0:	89 d0                	mov    %edx,%eax
   2:	c3                   	retq   
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop

Disassembly of section .text$_Z17measure_sqrt_timeILy2EEvv:

0000000000000000 <_Z17measure_sqrt_timeILy2EEvv>:
   0:	55                   	push   %rbp
   1:	41 57                	push   %r15
   3:	41 56                	push   %r14
   5:	41 55                	push   %r13
   7:	41 54                	push   %r12
   9:	57                   	push   %rdi
   a:	56                   	push   %rsi
   b:	53                   	push   %rbx
   c:	48 83 ec 78          	sub    $0x78,%rsp
{
  10:	48 8d ac 24 80 00 00 	lea    0x80(%rsp),%rbp
  17:	00 
  18:	c5 f8 29 75 d0       	vmovaps %xmm6,-0x30(%rbp)
  static std::random_device device;
  1d:	c5 f8 29 7d e0       	vmovaps %xmm7,-0x20(%rbp)
  22:	b8 80 6a 18 00       	mov    $0x186a80,%eax
  27:	e8 00 00 00 00       	callq  2c <_Z17measure_sqrt_timeILy2EEvv+0x2c>
  2c:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33 <_Z17measure_sqrt_timeILy2EEvv+0x33>
  33:	ba 02 00 00 00       	mov    $0x2,%edx
  38:	48 29 c4             	sub    %rax,%rsp
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  3b:	e8 00 00 00 00       	callq  40 <_Z17measure_sqrt_timeILy2EEvv+0x40>
  40:	41 b8 0b 00 00 00    	mov    $0xb,%r8d
      return this->_M_getval_pretr1();
  46:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 4d <_Z17measure_sqrt_timeILy2EEvv+0x4d>
  4d:	4c 8d a4 24 9f 00 00 	lea    0x9f(%rsp),%r12
  54:	00 
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
  55:	48 89 c6             	mov    %rax,%rsi
  58:	48 89 c1             	mov    %rax,%rcx
  5b:	49 83 e4 80          	and    $0xffffffffffffff80,%r12
  5f:	e8 00 00 00 00       	callq  64 <_Z17measure_sqrt_timeILy2EEvv+0x64>
  64:	48 8b 06             	mov    (%rsi),%rax
  67:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  6b:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  72:	00 
  73:	48 85 db             	test   %rbx,%rbx
  76:	0f 84 e9 01 00 00    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
  7c:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
  80:	0f 84 f9 06 00 00    	je     77f <_Z17measure_sqrt_timeILy2EEvv+0x77f>
      __ret = __sum / __tmp;
  86:	0f be 53 43          	movsbl 0x43(%rbx),%edx
  8a:	48 89 f1             	mov    %rsi,%rcx
      if (__builtin_expect(__ret >= _RealType(1), 0))
  8d:	e8 00 00 00 00       	callq  92 <_Z17measure_sqrt_timeILy2EEvv+0x92>
  92:	48 89 c1             	mov    %rax,%rcx
  95:	e8 00 00 00 00       	callq  9a <_Z17measure_sqrt_timeILy2EEvv+0x9a>
  9a:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # a1 <_Z17measure_sqrt_timeILy2EEvv+0xa1>
  a1:	41 b8 0b 00 00 00    	mov    $0xb,%r8d
	  return (__aurng() * (__p.b() - __p.a())) + __p.a();
  a7:	48 8d 15 0c 00 00 00 	lea    0xc(%rip),%rdx        # ba <_Z17measure_sqrt_timeILy2EEvv+0xba>
}
  ae:	e8 00 00 00 00       	callq  b3 <_Z17measure_sqrt_timeILy2EEvv+0xb3>
  b3:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # ba <_Z17measure_sqrt_timeILy2EEvv+0xba>
  ba:	ba 40 0d 03 00       	mov    $0x30d40,%edx
  bf:	e8 00 00 00 00       	callq  c4 <_Z17measure_sqrt_timeILy2EEvv+0xc4>
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  c4:	41 b8 11 00 00 00    	mov    $0x11,%r8d
  ca:	48 8d 15 18 00 00 00 	lea    0x18(%rip),%rdx        # e9 <_Z17measure_sqrt_timeILy2EEvv+0xe9>
  d1:	48 89 c6             	mov    %rax,%rsi
  d4:	48 89 c1             	mov    %rax,%rcx
	: _M_a(__a), _M_b(__b)
  d7:	e8 00 00 00 00       	callq  dc <_Z17measure_sqrt_timeILy2EEvv+0xdc>
  dc:	48 8b 06             	mov    (%rsi),%rax
  df:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  e3:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  ea:	00 
  eb:	48 85 db             	test   %rbx,%rbx
  ee:	0f 84 71 01 00 00    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
  f4:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
	: allocator_type(__a), _M_p(__dat) { }
  f8:	0f 84 50 06 00 00    	je     74e <_Z17measure_sqrt_timeILy2EEvv+0x74e>
	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
  fe:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 102:	48 89 f1             	mov    %rsi,%rcx
    { _M_init_pretr1(__token); }
 105:	49 8d bc 24 00 35 0c 	lea    0xc3500(%r12),%rdi
 10c:	00 
      { _M_string_length = __length; }
 10d:	49 8d 9c 24 00 6a 18 	lea    0x186a00(%r12),%rbx
 114:	00 
	: allocator_type(__a), _M_p(__dat) { }
 115:	e8 00 00 00 00       	callq  11a <_Z17measure_sqrt_timeILy2EEvv+0x11a>
 11a:	49 89 ff             	mov    %rdi,%r15
 11d:	48 89 c1             	mov    %rax,%rcx
 120:	e8 00 00 00 00       	callq  125 <_Z17measure_sqrt_timeILy2EEvv+0x125>
 125:	e8 10 00 00 00       	callq  13a <_Z17measure_sqrt_timeILy2EEvv+0x13a>
      { __c1 = __c2; }
 12a:	c5 e8 57 d2          	vxorps %xmm2,%xmm2,%xmm2
 12e:	49 83 c7 04          	add    $0x4,%r15
 132:	c5 eb 5a d0          	vcvtsd2ss %xmm0,%xmm2,%xmm2
  static std::random_device device;
 136:	c4 c1 7a 11 57 fc    	vmovss %xmm2,-0x4(%r15)
	if (!_M_is_local())
 13c:	4c 39 fb             	cmp    %r15,%rbx
 13f:	75 e4                	jne    125 <_Z17measure_sqrt_timeILy2EEvv+0x125>
 141:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 148 <_Z17measure_sqrt_timeILy2EEvv+0x148>
 148:	41 b8 09 00 00 00    	mov    $0x9,%r8d
 14e:	48 8d 15 2a 00 00 00 	lea    0x2a(%rip),%rdx        # 17f <_Z17measure_sqrt_timeILy2EEvv+0x17f>
 155:	e8 00 00 00 00       	callq  15a <_Z17measure_sqrt_timeILy2EEvv+0x15a>
 15a:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 161 <_Z17measure_sqrt_timeILy2EEvv+0x161>
	  __ret = std::nextafter(_RealType(1), _RealType(0));
 161:	49 8b 45 00          	mov    0x0(%r13),%rax
 165:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 169:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 170:	00 
 171:	48 85 db             	test   %rbx,%rbx
 174:	0f 84 eb 00 00 00    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 17a:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 17e:	0f 84 2c 06 00 00    	je     7b0 <_Z17measure_sqrt_timeILy2EEvv+0x7b0>
 184:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 188:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 18f <_Z17measure_sqrt_timeILy2EEvv+0x18f>
 18f:	41 be e8 03 00 00    	mov    $0x3e8,%r14d
 195:	e8 00 00 00 00       	callq  19a <_Z17measure_sqrt_timeILy2EEvv+0x19a>
 19a:	48 89 c1             	mov    %rax,%rcx
 19d:	e8 00 00 00 00       	callq  1a2 <_Z17measure_sqrt_timeILy2EEvv+0x1a2>
 1a2:	e8 00 00 00 00       	callq  1a7 <_Z17measure_sqrt_timeILy2EEvv+0x1a7>
 1a7:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
 1ab:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
 1af:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 1b3:	4c 89 e6             	mov    %r12,%rsi
 1b6:	48 89 fb             	mov    %rdi,%rbx
 1b9:	e9 87 00 00 00       	jmpq   245 <_Z17measure_sqrt_timeILy2EEvv+0x245>
 1be:	66 90                	xchg   %ax,%ax
 1c0:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1c4:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
 1c8:	c5 fa 5a 43 04       	vcvtss2sd 0x4(%rbx),%xmm0,%xmm0
 1cd:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 1d1:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1d5:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1d9:	c5 fa 11 2e          	vmovss %xmm5,(%rsi)
 1dd:	0f 87 61 05 00 00    	ja     744 <_Z17measure_sqrt_timeILy2EEvv+0x744>

template <size_t LOOPS = 2>
void measure_sqrt_time(void) {
 1e3:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1e7:	c5 d8 57 e4          	vxorps %xmm4,%xmm4,%xmm4
 1eb:	c5 fa 5a 43 08       	vcvtss2sd 0x8(%rbx),%xmm0,%xmm0
 1f0:	c5 db 5a e7          	vcvtsd2ss %xmm7,%xmm4,%xmm4
 1f4:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1f8:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1fc:	c5 fa 11 66 04       	vmovss %xmm4,0x4(%rsi)
 201:	0f 87 33 05 00 00    	ja     73a <_Z17measure_sqrt_timeILy2EEvv+0x73a>
 207:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 20b:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
      operator<<(long long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long long __n)
      { return _M_insert(__n); }
 20f:	c5 fa 5a 43 0c       	vcvtss2sd 0xc(%rbx),%xmm0,%xmm0
 214:	c5 e3 5a df          	vcvtsd2ss %xmm7,%xmm3,%xmm3
 218:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 21c:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
 220:	c5 fa 11 5e 08       	vmovss %xmm3,0x8(%rsi)
 225:	0f 87 05 05 00 00    	ja     730 <_Z17measure_sqrt_timeILy2EEvv+0x730>
 22b:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
 22f:	48 83 c3 10          	add    $0x10,%rbx
 233:	48 83 c6 10          	add    $0x10,%rsi
      { return _M_insert(__n); }
 237:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 23b:	c5 fa 11 6e fc       	vmovss %xmm5,-0x4(%rsi)
	__ostream_insert(__out, __s,
 240:	49 39 df             	cmp    %rbx,%r15
 243:	74 2b                	je     270 <_Z17measure_sqrt_timeILy2EEvv+0x270>
   *  for more on this subject.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
    { return flush(__os.put(__os.widen('\n'))); }
 245:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
       *  Additional l10n notes are at
       *  http://gcc.gnu.org/onlinedocs/libstdc++/manual/localization.html
      */
      char_type
      widen(char __c) const
      { return __check_facet(_M_ctype).widen(__c); }
 249:	c5 fa 5a 03          	vcvtss2sd (%rbx),%xmm0,%xmm0
 24d:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 251:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
      if (!__f)
 255:	0f 86 65 ff ff ff    	jbe    1c0 <_Z17measure_sqrt_timeILy2EEvv+0x1c0>
 25b:	e8 00 00 00 00       	callq  260 <_Z17measure_sqrt_timeILy2EEvv+0x260>
       *  @return  The converted character.
      */
      char_type
      widen(char __c) const
      {
	if (_M_widen_ok)
 260:	e9 5b ff ff ff       	jmpq   1c0 <_Z17measure_sqrt_timeILy2EEvv+0x1c0>
 265:	e8 00 00 00 00       	callq  26a <_Z17measure_sqrt_timeILy2EEvv+0x26a>
 26a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 270:	41 ff ce             	dec    %r14d
   *  This manipulator simply calls the stream's @c flush() member function.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
 273:	0f 85 3a ff ff ff    	jne    1b3 <_Z17measure_sqrt_timeILy2EEvv+0x1b3>
 279:	e8 00 00 00 00       	callq  27e <_Z17measure_sqrt_timeILy2EEvv+0x27e>
	__ostream_insert(__out, __s,
 27e:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 285:	9b c4 20 
 288:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 28c:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
 290:	48 89 c1             	mov    %rax,%rcx
    MeasureTime<std::chrono::nanoseconds> time;
    alignas(128) float floats[N * 4];
    alignas(128) float roots[N * 4];

    std::cout << LOOPS  << " iterations" << std::endl;
    std::cout << "generating " << (4 * N) << " random values..." << std::endl;
 293:	48 f7 ea             	imul   %rdx
 296:	48 c1 f9 3f          	sar    $0x3f,%rcx
 29a:	48 c1 fa 07          	sar    $0x7,%rdx
 29e:	48 29 ca             	sub    %rcx,%rdx
 2a1:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2a8 <_Z17measure_sqrt_timeILy2EEvv+0x2a8>
 2a8:	e8 00 00 00 00       	callq  2ad <_Z17measure_sqrt_timeILy2EEvv+0x2ad>
 2ad:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 2b3:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 2ee <_Z17measure_sqrt_timeILy2EEvv+0x2ee>
 2ba:	48 89 c6             	mov    %rax,%rsi
    { return flush(__os.put(__os.widen('\n'))); }
 2bd:	48 89 c1             	mov    %rax,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 2c0:	e8 00 00 00 00       	callq  2c5 <_Z17measure_sqrt_timeILy2EEvv+0x2c5>
 2c5:	48 8b 06             	mov    (%rsi),%rax
 2c8:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      if (!__f)
 2cc:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 2d3:	00 
 2d4:	48 85 db             	test   %rbx,%rbx
 2d7:	74 8c                	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 2d9:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 2dd:	0f 84 91 05 00 00    	je     874 <_Z17measure_sqrt_timeILy2EEvv+0x874>
 2e3:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 2e7:	48 89 f1             	mov    %rsi,%rcx
 2ea:	e8 00 00 00 00       	callq  2ef <_Z17measure_sqrt_timeILy2EEvv+0x2ef>
 2ef:	48 89 c1             	mov    %rax,%rcx
 2f2:	e8 00 00 00 00       	callq  2f7 <_Z17measure_sqrt_timeILy2EEvv+0x2f7>
 2f7:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2fe <_Z17measure_sqrt_timeILy2EEvv+0x2fe>
    { return __os.flush(); }
 2fe:	41 b8 37 00 00 00    	mov    $0x37,%r8d
 304:	48 8d 15 40 00 00 00 	lea    0x40(%rip),%rdx        # 34b <_Z17measure_sqrt_timeILy2EEvv+0x34b>
    for (int i = 0; i < 4 * N; i++) {
       floats[i] = random_double();
 30b:	e8 00 00 00 00       	callq  310 <_Z17measure_sqrt_timeILy2EEvv+0x310>
 310:	49 8b 45 00          	mov    0x0(%r13),%rax
 314:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 318:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 31f:	00 
    for (int i = 0; i < 4 * N; i++) {
 320:	48 85 db             	test   %rbx,%rbx
	__ostream_insert(__out, __s,
 323:	0f 84 3c ff ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 329:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 32d:	0f 84 df 04 00 00    	je     812 <_Z17measure_sqrt_timeILy2EEvv+0x812>
 333:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 337:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33e <_Z17measure_sqrt_timeILy2EEvv+0x33e>
    { return flush(__os.put(__os.widen('\n'))); }
 33e:	bb e8 03 00 00       	mov    $0x3e8,%ebx
 343:	e8 00 00 00 00       	callq  348 <_Z17measure_sqrt_timeILy2EEvv+0x348>
      { return __check_facet(_M_ctype).widen(__c); }
 348:	48 89 c1             	mov    %rax,%rcx
 34b:	e8 00 00 00 00       	callq  350 <_Z17measure_sqrt_timeILy2EEvv+0x350>
 350:	e8 00 00 00 00       	callq  355 <_Z17measure_sqrt_timeILy2EEvv+0x355>
      if (!__f)
 355:	48 89 c6             	mov    %rax,%rsi
 358:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 35c:	31 d2                	xor    %edx,%edx
 35e:	41 b8 00 35 0c 00    	mov    $0xc3500,%r8d
 364:	4c 89 e1             	mov    %r12,%rcx
 367:	e8 00 00 00 00       	callq  36c <_Z17measure_sqrt_timeILy2EEvv+0x36c>
 36c:	ff cb                	dec    %ebx
 36e:	75 ec                	jne    35c <_Z17measure_sqrt_timeILy2EEvv+0x35c>
   DURATION time = DURATION(0);
   bool stopped = true;
public:
   void start_clock() {
     if (stopped) {
       start = steady_clock::now();
 370:	e8 00 00 00 00       	callq  375 <_Z17measure_sqrt_timeILy2EEvv+0x375>
 375:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 37c:	9b c4 20 
    { return __os.flush(); }
 37f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 383:	48 29 f0             	sub    %rsi,%rax
 386:	48 89 c1             	mov    %rax,%rcx
 389:	48 f7 ea             	imul   %rdx
 38c:	48 c1 f9 3f          	sar    $0x3f,%rcx
 390:	48 c1 fa 07          	sar    $0x7,%rdx
 394:	48 29 ca             	sub    %rcx,%rdx
 397:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 39e <_Z17measure_sqrt_timeILy2EEvv+0x39e>
 39e:	e8 00 00 00 00       	callq  3a3 <_Z17measure_sqrt_timeILy2EEvv+0x3a3>
    std::cout << "math sqrt" << std::endl;
    time.start_clock();
    for (int j = 0; j < LOOP; j++) {
      for (int i = 0; i < 4 * N; i += 4) {
        for (int k = 0; k < 4; k++) {
          roots[i + k] = sqrt(floats[i + k]);
 3a3:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 3a9:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 3e4 <_Z17measure_sqrt_timeILy2EEvv+0x3e4>
 3b0:	48 89 c6             	mov    %rax,%rsi
 3b3:	48 89 c1             	mov    %rax,%rcx
 3b6:	e8 00 00 00 00       	callq  3bb <_Z17measure_sqrt_timeILy2EEvv+0x3bb>
 3bb:	48 8b 06             	mov    (%rsi),%rax
 3be:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 3c2:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 3c9:	00 
 3ca:	48 85 db             	test   %rbx,%rbx
 3cd:	0f 84 92 fe ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 3d3:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 3d7:	0f 84 66 04 00 00    	je     843 <_Z17measure_sqrt_timeILy2EEvv+0x843>
 3dd:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 3e1:	48 89 f1             	mov    %rsi,%rcx
 3e4:	e8 00 00 00 00       	callq  3e9 <_Z17measure_sqrt_timeILy2EEvv+0x3e9>
 3e9:	48 89 c1             	mov    %rax,%rcx
 3ec:	e8 00 00 00 00       	callq  3f1 <_Z17measure_sqrt_timeILy2EEvv+0x3f1>
 3f1:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 3f8 <_Z17measure_sqrt_timeILy2EEvv+0x3f8>
 3f8:	41 b8 39 00 00 00    	mov    $0x39,%r8d
 3fe:	48 8d 15 78 00 00 00 	lea    0x78(%rip),%rdx        # 47d <_Z17measure_sqrt_timeILy2EEvv+0x47d>
 405:	e8 00 00 00 00       	callq  40a <_Z17measure_sqrt_timeILy2EEvv+0x40a>
 40a:	49 8b 45 00          	mov    0x0(%r13),%rax
 40e:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 412:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 419:	00 
 41a:	48 85 db             	test   %rbx,%rbx
 41d:	0f 84 42 fe ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
      for (int i = 0; i < 4 * N; i += 4) {
 423:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
          roots[i + k] = sqrt(floats[i + k]);
 427:	0f 84 b4 03 00 00    	je     7e1 <_Z17measure_sqrt_timeILy2EEvv+0x7e1>
 42d:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 431:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 438 <_Z17measure_sqrt_timeILy2EEvv+0x438>
 438:	e8 00 00 00 00       	callq  43d <_Z17measure_sqrt_timeILy2EEvv+0x43d>
 43d:	48 89 c1             	mov    %rax,%rcx
 440:	e8 00 00 00 00       	callq  445 <_Z17measure_sqrt_timeILy2EEvv+0x445>
	__throw_bad_cast();
 445:	e8 00 00 00 00       	callq  44a <_Z17measure_sqrt_timeILy2EEvv+0x44a>
 44a:	ba e8 03 00 00       	mov    $0x3e8,%edx
 44f:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    for (int j = 0; j < LOOP; j++) {
 453:	48 89 c3             	mov    %rax,%rbx
 456:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     }
   }

   void stop_clock() {
     if (! stopped) {
       end = steady_clock::now();
 45a:	4c 89 e0             	mov    %r12,%rax
 45d:	0f 1f 00             	nopl   (%rax)
        }
      }    
    }
    time.stop_clock();
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 460:	c5 f8 29 00          	vmovaps %xmm0,(%rax)
 464:	48 83 c0 10          	add    $0x10,%rax
 468:	48 39 c7             	cmp    %rax,%rdi
 46b:	75 f3                	jne    460 <_Z17measure_sqrt_timeILy2EEvv+0x460>
		const duration<_Rep2, _Period2>& __rhs)
      {
	typedef duration<_Rep1, _Period1>			__dur1;
	typedef duration<_Rep2, _Period2>			__dur2;
	typedef typename common_type<__dur1,__dur2>::type	__cd;
	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
 46d:	ff ca                	dec    %edx
 46f:	75 e9                	jne    45a <_Z17measure_sqrt_timeILy2EEvv+0x45a>
 471:	e8 00 00 00 00       	callq  476 <_Z17measure_sqrt_timeILy2EEvv+0x476>
 476:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 47d:	9b c4 20 
 480:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
      { return _M_insert(__n); }
 484:	48 29 d8             	sub    %rbx,%rax
 487:	48 89 c1             	mov    %rax,%rcx
 48a:	48 f7 ea             	imul   %rdx
	__ostream_insert(__out, __s,
 48d:	48 c1 f9 3f          	sar    $0x3f,%rcx
 491:	48 c1 fa 07          	sar    $0x7,%rdx
 495:	48 29 ca             	sub    %rcx,%rdx
 498:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 49f <_Z17measure_sqrt_timeILy2EEvv+0x49f>
 49f:	e8 00 00 00 00       	callq  4a4 <_Z17measure_sqrt_timeILy2EEvv+0x4a4>
 4a4:	41 b8 05 00 00 00    	mov    $0x5,%r8d
      { return __check_facet(_M_ctype).widen(__c); }
 4aa:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 4e5 <_Z17measure_sqrt_timeILy2EEvv+0x4e5>
 4b1:	48 89 c6             	mov    %rax,%rsi
      if (!__f)
 4b4:	48 89 c1             	mov    %rax,%rcx
 4b7:	e8 00 00 00 00       	callq  4bc <_Z17measure_sqrt_timeILy2EEvv+0x4bc>
 4bc:	48 8b 06             	mov    (%rsi),%rax
 4bf:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 4c3:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 4ca:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 4cb:	48 85 db             	test   %rbx,%rbx
 4ce:	0f 84 91 fd ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
    { return __os.flush(); }
 4d4:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
	__ostream_insert(__out, __s,
 4d8:	0f 84 8b 04 00 00    	je     969 <_Z17measure_sqrt_timeILy2EEvv+0x969>
 4de:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 4e2:	48 89 f1             	mov    %rsi,%rcx
 4e5:	e8 00 00 00 00       	callq  4ea <_Z17measure_sqrt_timeILy2EEvv+0x4ea>
 4ea:	48 89 c1             	mov    %rax,%rcx
 4ed:	e8 00 00 00 00       	callq  4f2 <_Z17measure_sqrt_timeILy2EEvv+0x4f2>
    { return flush(__os.put(__os.widen('\n'))); }
 4f2:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 4f9 <_Z17measure_sqrt_timeILy2EEvv+0x4f9>
      { return __check_facet(_M_ctype).widen(__c); }
 4f9:	41 b8 2e 00 00 00    	mov    $0x2e,%r8d
 4ff:	48 8d 15 b8 00 00 00 	lea    0xb8(%rip),%rdx        # 5be <_Z17measure_sqrt_timeILy2EEvv+0x5be>
      if (!__f)
 506:	e8 00 00 00 00       	callq  50b <_Z17measure_sqrt_timeILy2EEvv+0x50b>
 50b:	49 8b 45 00          	mov    0x0(%r13),%rax
 50f:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 513:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 51a:	00 
 51b:	48 85 db             	test   %rbx,%rbx
       start = steady_clock::now();
 51e:	0f 84 41 fd ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 524:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
    { return __os.flush(); }
 528:	0f 84 0a 04 00 00    	je     938 <_Z17measure_sqrt_timeILy2EEvv+0x938>
 52e:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 532:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 539 <_Z17measure_sqrt_timeILy2EEvv+0x539>
 539:	e8 00 00 00 00       	callq  53e <_Z17measure_sqrt_timeILy2EEvv+0x53e>
 53e:	48 89 c1             	mov    %rax,%rcx
 541:	e8 00 00 00 00       	callq  546 <_Z17measure_sqrt_timeILy2EEvv+0x546>
 546:	e8 00 00 00 00       	callq  54b <_Z17measure_sqrt_timeILy2EEvv+0x54b>
 54b:	48 89 c3             	mov    %rax,%rbx
    time.reset_clock();

    std::cout << "sqrt1 (Newton method for single float, one time a loop)" << std::endl;
    time.start_clock();
    for (int j = 0; j < LOOP; j++) {
 54e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
       end = steady_clock::now();
 552:	e8 00 00 00 00       	callq  557 <_Z17measure_sqrt_timeILy2EEvv+0x557>
      for (int i = 0; i < 4 * N; i++) {
        roots[i] = sqrt1<LOOPS>(floats + i);
      }
    }    
    time.stop_clock();
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 557:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 55b:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 562:	9b c4 20 
 565:	48 29 d8             	sub    %rbx,%rax
 568:	48 89 c1             	mov    %rax,%rcx
 56b:	48 f7 ea             	imul   %rdx
 56e:	48 c1 f9 3f          	sar    $0x3f,%rcx
 572:	48 c1 fa 07          	sar    $0x7,%rdx
 576:	48 29 ca             	sub    %rcx,%rdx
      { return _M_insert(__n); }
 579:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 580 <_Z17measure_sqrt_timeILy2EEvv+0x580>
 580:	e8 00 00 00 00       	callq  585 <_Z17measure_sqrt_timeILy2EEvv+0x585>
	__ostream_insert(__out, __s,
 585:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 58b:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 5c6 <_Z17measure_sqrt_timeILy2EEvv+0x5c6>
      { return _M_insert(__n); }
 592:	48 89 c6             	mov    %rax,%rsi
	__ostream_insert(__out, __s,
 595:	48 89 c1             	mov    %rax,%rcx
 598:	e8 00 00 00 00       	callq  59d <_Z17measure_sqrt_timeILy2EEvv+0x59d>
    { return flush(__os.put(__os.widen('\n'))); }
 59d:	48 8b 06             	mov    (%rsi),%rax
      { return __check_facet(_M_ctype).widen(__c); }
 5a0:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 5a4:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 5ab:	00 
      if (!__f)
 5ac:	48 85 db             	test   %rbx,%rbx
 5af:	0f 84 b0 fc ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 5b5:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 5b9:	0f 84 e6 02 00 00    	je     8a5 <_Z17measure_sqrt_timeILy2EEvv+0x8a5>
 5bf:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 5c3:	48 89 f1             	mov    %rsi,%rcx
 5c6:	e8 00 00 00 00       	callq  5cb <_Z17measure_sqrt_timeILy2EEvv+0x5cb>
    { return __os.flush(); }
 5cb:	48 89 c1             	mov    %rax,%rcx
 5ce:	e8 00 00 00 00       	callq  5d3 <_Z17measure_sqrt_timeILy2EEvv+0x5d3>
	__ostream_insert(__out, __s,
 5d3:	e8 00 00 00 00       	callq  5d8 <_Z17measure_sqrt_timeILy2EEvv+0x5d8>
 5d8:	ba e8 03 00 00       	mov    $0x3e8,%edx
 5dd:	c5 f8 28 25 50 01 00 	vmovaps 0x150(%rip),%xmm4        # 735 <_Z17measure_sqrt_timeILy2EEvv+0x735>
 5e4:	00 
 5e5:	c5 f8 28 1d 60 01 00 	vmovaps 0x160(%rip),%xmm3        # 74d <_Z17measure_sqrt_timeILy2EEvv+0x74d>
 5ec:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 5ed:	48 89 c6             	mov    %rax,%rsi
      { return __check_facet(_M_ctype).widen(__c); }
 5f0:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 5f4:	31 c0                	xor    %eax,%eax
 5f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 5fd:	00 00 00 
      if (!__f)
 600:	c5 f8 28 04 07       	vmovaps (%rdi,%rax,1),%xmm0
 605:	48 83 c0 10          	add    $0x10,%rax
 609:	c5 f1 72 e0 01       	vpsrad $0x1,%xmm0,%xmm1
 60e:	c5 f1 fe d4          	vpaddd %xmm4,%xmm1,%xmm2
 612:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 616:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 61a:	c5 f0 59 cb          	vmulps %xmm3,%xmm1,%xmm1
    { return __os.flush(); }
 61e:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 622:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
       start = steady_clock::now();
 626:	c5 f8 59 c3          	vmulps %xmm3,%xmm0,%xmm0
 62a:	c4 a1 78 29 44 20 f0 	vmovaps %xmm0,-0x10(%rax,%r12,1)
    std::cout << "sqrt1 (Newton method for single float, four times a loop)" << std::endl;
    time.start_clock();
    for (int j = 0; j < LOOP; j++) {
      for (int i = 0; i < 4 * N; i += 4) {
        for (int k = 0; k < 4; k++) {
          roots[i + k] = sqrt1<LOOPS>(floats + i + k);
 631:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
 637:	75 c7                	jne    600 <_Z17measure_sqrt_timeILy2EEvv+0x600>
 639:	ff ca                	dec    %edx
 63b:	75 b7                	jne    5f4 <_Z17measure_sqrt_timeILy2EEvv+0x5f4>
 63d:	e8 00 00 00 00       	callq  642 <_Z17measure_sqrt_timeILy2EEvv+0x642>
 642:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 649 <_Z17measure_sqrt_timeILy2EEvv+0x649>
 649:	41 b8 34 00 00 00    	mov    $0x34,%r8d
    for (int j = 0; j < LOOP; j++) {
 64f:	48 8d 15 e8 00 00 00 	lea    0xe8(%rip),%rdx        # 73e <_Z17measure_sqrt_timeILy2EEvv+0x73e>
        }
      }
    }    
    time.stop_clock();
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 656:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 65a:	48 29 f0             	sub    %rsi,%rax
 65d:	48 89 c3             	mov    %rax,%rbx
       end = steady_clock::now();
 660:	e8 00 00 00 00       	callq  665 <_Z17measure_sqrt_timeILy2EEvv+0x665>
 665:	49 8b 45 00          	mov    0x0(%r13),%rax
 669:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 66d:	49 8b b4 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rsi
 674:	00 
 675:	48 85 f6             	test   %rsi,%rsi
      { return _M_insert(__n); }
 678:	0f 84 e7 fb ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 67e:	80 7e 38 00          	cmpb   $0x0,0x38(%rsi)
 682:	0f 84 7f 02 00 00    	je     907 <_Z17measure_sqrt_timeILy2EEvv+0x907>
	__ostream_insert(__out, __s,
 688:	0f be 56 43          	movsbl 0x43(%rsi),%edx
 68c:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 693 <_Z17measure_sqrt_timeILy2EEvv+0x693>
      { return _M_insert(__n); }
 693:	e8 00 00 00 00       	callq  698 <_Z17measure_sqrt_timeILy2EEvv+0x698>
	__ostream_insert(__out, __s,
 698:	48 89 c1             	mov    %rax,%rcx
 69b:	e8 00 00 00 00       	callq  6a0 <_Z17measure_sqrt_timeILy2EEvv+0x6a0>
      { return __check_facet(_M_ctype).widen(__c); }
 6a0:	48 89 d8             	mov    %rbx,%rax
 6a3:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 6aa:	9b c4 20 
      if (!__f)
 6ad:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 6b4 <_Z17measure_sqrt_timeILy2EEvv+0x6b4>
 6b4:	48 c1 fb 3f          	sar    $0x3f,%rbx
 6b8:	48 f7 ea             	imul   %rdx
 6bb:	48 c1 fa 07          	sar    $0x7,%rdx
 6bf:	48 29 da             	sub    %rbx,%rdx
    { return flush(__os.put(__os.widen('\n'))); }
 6c2:	e8 00 00 00 00       	callq  6c7 <_Z17measure_sqrt_timeILy2EEvv+0x6c7>
 6c7:	41 b8 05 00 00 00    	mov    $0x5,%r8d
    { return __os.flush(); }
 6cd:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 708 <_Z17measure_sqrt_timeILy2EEvv+0x708>
	__ostream_insert(__out, __s,
 6d4:	48 89 c6             	mov    %rax,%rsi
 6d7:	48 89 c1             	mov    %rax,%rcx
 6da:	e8 00 00 00 00       	callq  6df <_Z17measure_sqrt_timeILy2EEvv+0x6df>
 6df:	48 8b 06             	mov    (%rsi),%rax
 6e2:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 6e6:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 6ed:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 6ee:	48 85 db             	test   %rbx,%rbx
      { return __check_facet(_M_ctype).widen(__c); }
 6f1:	0f 84 6e fb ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 6f7:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
      if (!__f)
 6fb:	0f 84 d5 01 00 00    	je     8d6 <_Z17measure_sqrt_timeILy2EEvv+0x8d6>
 701:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 705:	48 89 f1             	mov    %rsi,%rcx
 708:	e8 00 00 00 00       	callq  70d <_Z17measure_sqrt_timeILy2EEvv+0x70d>
 70d:	90                   	nop
 70e:	c5 f8 28 75 d0       	vmovaps -0x30(%rbp),%xmm6
 713:	c5 f8 28 7d e0       	vmovaps -0x20(%rbp),%xmm7
 718:	48 89 c1             	mov    %rax,%rcx
 71b:	48 8d 65 f8          	lea    -0x8(%rbp),%rsp
    { return __os.flush(); }
 71f:	5b                   	pop    %rbx
 720:	5e                   	pop    %rsi
 721:	5f                   	pop    %rdi
 722:	41 5c                	pop    %r12
 724:	41 5d                	pop    %r13
       start = steady_clock::now();
 726:	41 5e                	pop    %r14
 728:	41 5f                	pop    %r15
 72a:	5d                   	pop    %rbp
 72b:	e9 00 00 00 00       	jmpq   730 <_Z17measure_sqrt_timeILy2EEvv+0x730>
 730:	e8 00 00 00 00       	callq  735 <_Z17measure_sqrt_timeILy2EEvv+0x735>
       end = steady_clock::now();
 735:	e9 f1 fa ff ff       	jmpq   22b <_Z17measure_sqrt_timeILy2EEvv+0x22b>
 73a:	e8 00 00 00 00       	callq  73f <_Z17measure_sqrt_timeILy2EEvv+0x73f>
      for (int i = 0; i < 4 * N; i += 4) {
        sqrt2<LOOPS>(floats + i, roots + i);
      }
    }    
    time.stop_clock();
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 73f:	e9 c3 fa ff ff       	jmpq   207 <_Z17measure_sqrt_timeILy2EEvv+0x207>
 744:	e8 00 00 00 00       	callq  749 <_Z17measure_sqrt_timeILy2EEvv+0x749>
 749:	e9 95 fa ff ff       	jmpq   1e3 <_Z17measure_sqrt_timeILy2EEvv+0x1e3>
 74e:	48 89 d9             	mov    %rbx,%rcx
 751:	e8 00 00 00 00       	callq  756 <_Z17measure_sqrt_timeILy2EEvv+0x756>
 756:	48 8b 03             	mov    (%rbx),%rax
      { return _M_insert(__n); }
 759:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 760 <_Z17measure_sqrt_timeILy2EEvv+0x760>
 760:	ba 0a 00 00 00       	mov    $0xa,%edx
	__ostream_insert(__out, __s,
 765:	48 8b 40 30          	mov    0x30(%rax),%rax
 769:	48 39 c8             	cmp    %rcx,%rax
 76c:	0f 84 90 f9 ff ff    	je     102 <_Z17measure_sqrt_timeILy2EEvv+0x102>
      { return _M_insert(__n); }
 772:	48 89 d9             	mov    %rbx,%rcx
	__ostream_insert(__out, __s,
 775:	ff d0                	callq  *%rax
 777:	0f be d0             	movsbl %al,%edx
 77a:	e9 83 f9 ff ff       	jmpq   102 <_Z17measure_sqrt_timeILy2EEvv+0x102>
    { return flush(__os.put(__os.widen('\n'))); }
 77f:	48 89 d9             	mov    %rbx,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 782:	e8 00 00 00 00       	callq  787 <_Z17measure_sqrt_timeILy2EEvv+0x787>
 787:	48 8b 03             	mov    (%rbx),%rax
 78a:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 791 <_Z17measure_sqrt_timeILy2EEvv+0x791>
      if (!__f)
 791:	ba 0a 00 00 00       	mov    $0xa,%edx
 796:	48 8b 40 30          	mov    0x30(%rax),%rax
 79a:	48 39 c8             	cmp    %rcx,%rax
 79d:	0f 84 e7 f8 ff ff    	je     8a <_Z17measure_sqrt_timeILy2EEvv+0x8a>
 7a3:	48 89 d9             	mov    %rbx,%rcx
 7a6:	ff d0                	callq  *%rax
 7a8:	0f be d0             	movsbl %al,%edx
    { return __os.flush(); }
 7ab:	e9 da f8 ff ff       	jmpq   8a <_Z17measure_sqrt_timeILy2EEvv+0x8a>
 7b0:	48 89 d9             	mov    %rbx,%rcx
       start = steady_clock::now();
 7b3:	e8 00 00 00 00       	callq  7b8 <_Z17measure_sqrt_timeILy2EEvv+0x7b8>
 7b8:	48 8b 03             	mov    (%rbx),%rax
 7bb:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 7c2 <_Z17measure_sqrt_timeILy2EEvv+0x7c2>
 7c2:	ba 0a 00 00 00       	mov    $0xa,%edx
 7c7:	48 8b 40 30          	mov    0x30(%rax),%rax
 7cb:	48 39 c8             	cmp    %rcx,%rax
 7ce:	0f 84 b4 f9 ff ff    	je     188 <_Z17measure_sqrt_timeILy2EEvv+0x188>
 7d4:	48 89 d9             	mov    %rbx,%rcx
 7d7:	ff d0                	callq  *%rax
 7d9:	0f be d0             	movsbl %al,%edx
 7dc:	e9 a7 f9 ff ff       	jmpq   188 <_Z17measure_sqrt_timeILy2EEvv+0x188>

template <size_t LOOPS = 2>
void v4sf_sqrt(v4sf *  __restrict__  a, v4sf *  __restrict__  root) {
  v4si * ai = reinterpret_cast<v4si *>(a);
  v4si * initial = reinterpret_cast<v4si *>(root);
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 7e1:	48 89 d9             	mov    %rbx,%rcx
 7e4:	e8 00 00 00 00       	callq  7e9 <_Z17measure_sqrt_timeILy2EEvv+0x7e9>
 7e9:	48 8b 03             	mov    (%rbx),%rax
 7ec:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 7f3 <_Z17measure_sqrt_timeILy2EEvv+0x7f3>
  root = reinterpret_cast<v4sf *>(initial);
  for (size_t i = 0; i < LOOPS; i++) {
    * root = 0.5 * (* root + (* a / * root));
 7f3:	ba 0a 00 00 00       	mov    $0xa,%edx
 7f8:	48 8b 40 30          	mov    0x30(%rax),%rax
 7fc:	48 39 c8             	cmp    %rcx,%rax
 7ff:	0f 84 2c fc ff ff    	je     431 <_Z17measure_sqrt_timeILy2EEvv+0x431>
 805:	48 89 d9             	mov    %rbx,%rcx
 808:	ff d0                	callq  *%rax
 80a:	0f be d0             	movsbl %al,%edx
 80d:	e9 1f fc ff ff       	jmpq   431 <_Z17measure_sqrt_timeILy2EEvv+0x431>
    time.reset_clock();

    time.start_clock();
    for (int j = 0; j < LOOP; j++) {
      for (int i = 0; i < 4 * N; i += 4) {
 812:	48 89 d9             	mov    %rbx,%rcx
 815:	e8 00 00 00 00       	callq  81a <_Z17measure_sqrt_timeILy2EEvv+0x81a>
    for (int j = 0; j < LOOP; j++) {
 81a:	48 8b 03             	mov    (%rbx),%rax
       end = steady_clock::now();
 81d:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 824 <_Z17measure_sqrt_timeILy2EEvv+0x824>
	__ostream_insert(__out, __s,
 824:	ba 0a 00 00 00       	mov    $0xa,%edx
 829:	48 8b 40 30          	mov    0x30(%rax),%rax
 82d:	48 39 c8             	cmp    %rcx,%rax
 830:	0f 84 01 fb ff ff    	je     337 <_Z17measure_sqrt_timeILy2EEvv+0x337>
 836:	48 89 d9             	mov    %rbx,%rcx
 839:	ff d0                	callq  *%rax
 83b:	0f be d0             	movsbl %al,%edx
 83e:	e9 f4 fa ff ff       	jmpq   337 <_Z17measure_sqrt_timeILy2EEvv+0x337>
 843:	48 89 d9             	mov    %rbx,%rcx
    { return flush(__os.put(__os.widen('\n'))); }
 846:	e8 00 00 00 00       	callq  84b <_Z17measure_sqrt_timeILy2EEvv+0x84b>
      { return __check_facet(_M_ctype).widen(__c); }
 84b:	48 8b 03             	mov    (%rbx),%rax
 84e:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 855 <_Z17measure_sqrt_timeILy2EEvv+0x855>
      if (!__f)
 855:	ba 0a 00 00 00       	mov    $0xa,%edx
 85a:	48 8b 40 30          	mov    0x30(%rax),%rax
 85e:	48 39 c8             	cmp    %rcx,%rax
 861:	0f 84 7a fb ff ff    	je     3e1 <_Z17measure_sqrt_timeILy2EEvv+0x3e1>
 867:	48 89 d9             	mov    %rbx,%rcx
 86a:	ff d0                	callq  *%rax
 86c:	0f be d0             	movsbl %al,%edx
 86f:	e9 6d fb ff ff       	jmpq   3e1 <_Z17measure_sqrt_timeILy2EEvv+0x3e1>
 874:	48 89 d9             	mov    %rbx,%rcx
 877:	e8 00 00 00 00       	callq  87c <_Z17measure_sqrt_timeILy2EEvv+0x87c>
    { return __os.flush(); }
 87c:	48 8b 03             	mov    (%rbx),%rax
 87f:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 886 <_Z17measure_sqrt_timeILy2EEvv+0x886>
      }
    }    
    time.stop_clock();

    std::cout << "sqrt3 (Newton method for sequence of 4 floats, SIMD)" << std::endl;
    std::cout << time.time_clock().count() / LOOP  << " [ns]" << std::endl;
 886:	ba 0a 00 00 00       	mov    $0xa,%edx
 88b:	48 8b 40 30          	mov    0x30(%rax),%rax
      { return _M_insert(__n); }
 88f:	48 39 c8             	cmp    %rcx,%rax
 892:	0f 84 4f fa ff ff    	je     2e7 <_Z17measure_sqrt_timeILy2EEvv+0x2e7>
 898:	48 89 d9             	mov    %rbx,%rcx
 89b:	ff d0                	callq  *%rax
 89d:	0f be d0             	movsbl %al,%edx
 8a0:	e9 42 fa ff ff       	jmpq   2e7 <_Z17measure_sqrt_timeILy2EEvv+0x2e7>
 8a5:	48 89 d9             	mov    %rbx,%rcx
	__ostream_insert(__out, __s,
 8a8:	e8 00 00 00 00       	callq  8ad <_Z17measure_sqrt_timeILy2EEvv+0x8ad>
 8ad:	48 8b 03             	mov    (%rbx),%rax
 8b0:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 8b7 <_Z17measure_sqrt_timeILy2EEvv+0x8b7>
 8b7:	ba 0a 00 00 00       	mov    $0xa,%edx
 8bc:	48 8b 40 30          	mov    0x30(%rax),%rax
    { return flush(__os.put(__os.widen('\n'))); }
 8c0:	48 39 c8             	cmp    %rcx,%rax
      { return __check_facet(_M_ctype).widen(__c); }
 8c3:	0f 84 fa fc ff ff    	je     5c3 <_Z17measure_sqrt_timeILy2EEvv+0x5c3>
 8c9:	48 89 d9             	mov    %rbx,%rcx
 8cc:	ff d0                	callq  *%rax
      if (!__f)
 8ce:	0f be d0             	movsbl %al,%edx
 8d1:	e9 ed fc ff ff       	jmpq   5c3 <_Z17measure_sqrt_timeILy2EEvv+0x5c3>
 8d6:	48 89 d9             	mov    %rbx,%rcx
 8d9:	e8 00 00 00 00       	callq  8de <_Z17measure_sqrt_timeILy2EEvv+0x8de>
 8de:	48 8b 03             	mov    (%rbx),%rax
 8e1:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 8e8 <_Z17measure_sqrt_timeILy2EEvv+0x8e8>
 8e8:	ba 0a 00 00 00       	mov    $0xa,%edx
 8ed:	48 8b 40 30          	mov    0x30(%rax),%rax
    time.reset_clock();
}
 8f1:	48 39 c8             	cmp    %rcx,%rax
 8f4:	0f 84 0b fe ff ff    	je     705 <_Z17measure_sqrt_timeILy2EEvv+0x705>
    { return __os.flush(); }
 8fa:	48 89 d9             	mov    %rbx,%rcx
 8fd:	ff d0                	callq  *%rax
 8ff:	0f be d0             	movsbl %al,%edx
 902:	e9 fe fd ff ff       	jmpq   705 <_Z17measure_sqrt_timeILy2EEvv+0x705>
 907:	48 89 f1             	mov    %rsi,%rcx
 90a:	e8 00 00 00 00       	callq  90f <_Z17measure_sqrt_timeILy2EEvv+0x90f>
 90f:	48 8b 06             	mov    (%rsi),%rax
          roots[i + k] = sqrt(floats[i + k]);
 912:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 919 <_Z17measure_sqrt_timeILy2EEvv+0x919>
 919:	ba 0a 00 00 00       	mov    $0xa,%edx
 91e:	48 8b 40 30          	mov    0x30(%rax),%rax
 922:	48 39 c8             	cmp    %rcx,%rax
 925:	0f 84 61 fd ff ff    	je     68c <_Z17measure_sqrt_timeILy2EEvv+0x68c>
 92b:	48 89 f1             	mov    %rsi,%rcx
	  return _M_widen[static_cast<unsigned char>(__c)];
	this->_M_widen_init();
 92e:	ff d0                	callq  *%rax
 930:	0f be d0             	movsbl %al,%edx
 933:	e9 54 fd ff ff       	jmpq   68c <_Z17measure_sqrt_timeILy2EEvv+0x68c>
	return this->do_widen(__c);
 938:	48 89 d9             	mov    %rbx,%rcx
 93b:	e8 00 00 00 00       	callq  940 <_Z17measure_sqrt_timeILy2EEvv+0x940>
 940:	48 8b 03             	mov    (%rbx),%rax
 943:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 94a <_Z17measure_sqrt_timeILy2EEvv+0x94a>
 94a:	ba 0a 00 00 00       	mov    $0xa,%edx
 94f:	48 8b 40 30          	mov    0x30(%rax),%rax
 953:	48 39 c8             	cmp    %rcx,%rax
 956:	0f 84 d6 fb ff ff    	je     532 <_Z17measure_sqrt_timeILy2EEvv+0x532>
 95c:	48 89 d9             	mov    %rbx,%rcx
	this->_M_widen_init();
 95f:	ff d0                	callq  *%rax
 961:	0f be d0             	movsbl %al,%edx
 964:	e9 c9 fb ff ff       	jmpq   532 <_Z17measure_sqrt_timeILy2EEvv+0x532>
	return this->do_widen(__c);
 969:	48 89 d9             	mov    %rbx,%rcx
 96c:	e8 00 00 00 00       	callq  971 <_Z17measure_sqrt_timeILy2EEvv+0x971>
 971:	48 8b 03             	mov    (%rbx),%rax
 974:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 97b <_Z17measure_sqrt_timeILy2EEvv+0x97b>
 97b:	ba 0a 00 00 00       	mov    $0xa,%edx
 980:	48 8b 40 30          	mov    0x30(%rax),%rax
 984:	48 39 c8             	cmp    %rcx,%rax
 987:	0f 84 55 fb ff ff    	je     4e2 <_Z17measure_sqrt_timeILy2EEvv+0x4e2>
 98d:	48 89 d9             	mov    %rbx,%rcx
	this->_M_widen_init();
 990:	ff d0                	callq  *%rax
 992:	0f be d0             	movsbl %al,%edx
 995:	e9 48 fb ff ff       	jmpq   4e2 <_Z17measure_sqrt_timeILy2EEvv+0x4e2>
	return this->do_widen(__c);
 99a:	90                   	nop
 99b:	90                   	nop
 99c:	90                   	nop
 99d:	90                   	nop
 99e:	90                   	nop
 99f:	90                   	nop

Disassembly of section .text$_Z17measure_sqrt_timeILy3EEvv:

0000000000000000 <_Z17measure_sqrt_timeILy3EEvv>:
   0:	55                   	push   %rbp
   1:	41 57                	push   %r15
   3:	41 56                	push   %r14
   5:	41 55                	push   %r13
   7:	41 54                	push   %r12
   9:	57                   	push   %rdi
   a:	56                   	push   %rsi
   b:	53                   	push   %rbx
   c:	48 83 ec 78          	sub    $0x78,%rsp
{
  10:	48 8d ac 24 80 00 00 	lea    0x80(%rsp),%rbp
  17:	00 
  18:	c5 f8 29 75 d0       	vmovaps %xmm6,-0x30(%rbp)
  static std::random_device device;
  1d:	c5 f8 29 7d e0       	vmovaps %xmm7,-0x20(%rbp)
  22:	b8 80 6a 18 00       	mov    $0x186a80,%eax
  27:	e8 00 00 00 00       	callq  2c <_Z17measure_sqrt_timeILy3EEvv+0x2c>
  2c:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33 <_Z17measure_sqrt_timeILy3EEvv+0x33>
  33:	ba 03 00 00 00       	mov    $0x3,%edx
  38:	48 29 c4             	sub    %rax,%rsp
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  3b:	e8 00 00 00 00       	callq  40 <_Z17measure_sqrt_timeILy3EEvv+0x40>
  40:	41 b8 0b 00 00 00    	mov    $0xb,%r8d
      return this->_M_getval_pretr1();
  46:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 4d <_Z17measure_sqrt_timeILy3EEvv+0x4d>
  4d:	4c 8d a4 24 9f 00 00 	lea    0x9f(%rsp),%r12
  54:	00 
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
  55:	48 89 c6             	mov    %rax,%rsi
  58:	48 89 c1             	mov    %rax,%rcx
  5b:	49 83 e4 80          	and    $0xffffffffffffff80,%r12
  5f:	e8 00 00 00 00       	callq  64 <_Z17measure_sqrt_timeILy3EEvv+0x64>
  64:	48 8b 06             	mov    (%rsi),%rax
  67:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  6b:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  72:	00 
  73:	48 85 db             	test   %rbx,%rbx
  76:	0f 84 e9 01 00 00    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
  7c:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
  80:	0f 84 09 07 00 00    	je     78f <_Z17measure_sqrt_timeILy3EEvv+0x78f>
      __ret = __sum / __tmp;
  86:	0f be 53 43          	movsbl 0x43(%rbx),%edx
  8a:	48 89 f1             	mov    %rsi,%rcx
      if (__builtin_expect(__ret >= _RealType(1), 0))
  8d:	e8 00 00 00 00       	callq  92 <_Z17measure_sqrt_timeILy3EEvv+0x92>
  92:	48 89 c1             	mov    %rax,%rcx
  95:	e8 00 00 00 00       	callq  9a <_Z17measure_sqrt_timeILy3EEvv+0x9a>
  9a:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # a1 <_Z17measure_sqrt_timeILy3EEvv+0xa1>
  a1:	41 b8 0b 00 00 00    	mov    $0xb,%r8d
	  return (__aurng() * (__p.b() - __p.a())) + __p.a();
  a7:	48 8d 15 0c 00 00 00 	lea    0xc(%rip),%rdx        # ba <_Z17measure_sqrt_timeILy3EEvv+0xba>
}
  ae:	e8 00 00 00 00       	callq  b3 <_Z17measure_sqrt_timeILy3EEvv+0xb3>
  b3:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # ba <_Z17measure_sqrt_timeILy3EEvv+0xba>
  ba:	ba 40 0d 03 00       	mov    $0x30d40,%edx
  bf:	e8 00 00 00 00       	callq  c4 <_Z17measure_sqrt_timeILy3EEvv+0xc4>
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  c4:	41 b8 11 00 00 00    	mov    $0x11,%r8d
  ca:	48 8d 15 18 00 00 00 	lea    0x18(%rip),%rdx        # e9 <_Z17measure_sqrt_timeILy3EEvv+0xe9>
  d1:	48 89 c6             	mov    %rax,%rsi
  d4:	48 89 c1             	mov    %rax,%rcx
	: _M_a(__a), _M_b(__b)
  d7:	e8 00 00 00 00       	callq  dc <_Z17measure_sqrt_timeILy3EEvv+0xdc>
  dc:	48 8b 06             	mov    (%rsi),%rax
  df:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  e3:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  ea:	00 
  eb:	48 85 db             	test   %rbx,%rbx
  ee:	0f 84 71 01 00 00    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
  f4:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
	: allocator_type(__a), _M_p(__dat) { }
  f8:	0f 84 60 06 00 00    	je     75e <_Z17measure_sqrt_timeILy3EEvv+0x75e>
	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
  fe:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 102:	48 89 f1             	mov    %rsi,%rcx
    { _M_init_pretr1(__token); }
 105:	49 8d bc 24 00 35 0c 	lea    0xc3500(%r12),%rdi
 10c:	00 
      { _M_string_length = __length; }
 10d:	49 8d 9c 24 00 6a 18 	lea    0x186a00(%r12),%rbx
 114:	00 
	: allocator_type(__a), _M_p(__dat) { }
 115:	e8 00 00 00 00       	callq  11a <_Z17measure_sqrt_timeILy3EEvv+0x11a>
 11a:	49 89 ff             	mov    %rdi,%r15
 11d:	48 89 c1             	mov    %rax,%rcx
 120:	e8 00 00 00 00       	callq  125 <_Z17measure_sqrt_timeILy3EEvv+0x125>
 125:	e8 10 00 00 00       	callq  13a <_Z17measure_sqrt_timeILy3EEvv+0x13a>
      { __c1 = __c2; }
 12a:	c5 d8 57 e4          	vxorps %xmm4,%xmm4,%xmm4
 12e:	49 83 c7 04          	add    $0x4,%r15
 132:	c5 db 5a e0          	vcvtsd2ss %xmm0,%xmm4,%xmm4
  static std::random_device device;
 136:	c4 c1 7a 11 67 fc    	vmovss %xmm4,-0x4(%r15)
	if (!_M_is_local())
 13c:	4c 39 fb             	cmp    %r15,%rbx
 13f:	75 e4                	jne    125 <_Z17measure_sqrt_timeILy3EEvv+0x125>
 141:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 148 <_Z17measure_sqrt_timeILy3EEvv+0x148>
 148:	41 b8 09 00 00 00    	mov    $0x9,%r8d
 14e:	48 8d 15 2a 00 00 00 	lea    0x2a(%rip),%rdx        # 17f <_Z17measure_sqrt_timeILy3EEvv+0x17f>
 155:	e8 00 00 00 00       	callq  15a <_Z17measure_sqrt_timeILy3EEvv+0x15a>
 15a:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 161 <_Z17measure_sqrt_timeILy3EEvv+0x161>
	  __ret = std::nextafter(_RealType(1), _RealType(0));
 161:	49 8b 45 00          	mov    0x0(%r13),%rax
 165:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 169:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 170:	00 
 171:	48 85 db             	test   %rbx,%rbx
 174:	0f 84 eb 00 00 00    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 17a:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 17e:	0f 84 3c 06 00 00    	je     7c0 <_Z17measure_sqrt_timeILy3EEvv+0x7c0>
 184:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 188:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 18f <_Z17measure_sqrt_timeILy3EEvv+0x18f>
 18f:	41 be e8 03 00 00    	mov    $0x3e8,%r14d
 195:	e8 00 00 00 00       	callq  19a <_Z17measure_sqrt_timeILy3EEvv+0x19a>
 19a:	48 89 c1             	mov    %rax,%rcx
 19d:	e8 00 00 00 00       	callq  1a2 <_Z17measure_sqrt_timeILy3EEvv+0x1a2>
 1a2:	e8 00 00 00 00       	callq  1a7 <_Z17measure_sqrt_timeILy3EEvv+0x1a7>
 1a7:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
 1ab:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
 1af:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 1b3:	4c 89 e6             	mov    %r12,%rsi
 1b6:	48 89 fb             	mov    %rdi,%rbx
 1b9:	e9 87 00 00 00       	jmpq   245 <_Z17measure_sqrt_timeILy3EEvv+0x245>
 1be:	66 90                	xchg   %ax,%ax
 1c0:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1c4:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
 1c8:	c5 fa 5a 43 04       	vcvtss2sd 0x4(%rbx),%xmm0,%xmm0
 1cd:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 1d1:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1d5:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1d9:	c5 fa 11 2e          	vmovss %xmm5,(%rsi)
 1dd:	0f 87 71 05 00 00    	ja     754 <_Z17measure_sqrt_timeILy3EEvv+0x754>
void measure_sqrt_time(void) {
 1e3:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1e7:	c5 d8 57 e4          	vxorps %xmm4,%xmm4,%xmm4
 1eb:	c5 fa 5a 43 08       	vcvtss2sd 0x8(%rbx),%xmm0,%xmm0
 1f0:	c5 db 5a e7          	vcvtsd2ss %xmm7,%xmm4,%xmm4
 1f4:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1f8:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1fc:	c5 fa 11 66 04       	vmovss %xmm4,0x4(%rsi)
 201:	0f 87 43 05 00 00    	ja     74a <_Z17measure_sqrt_timeILy3EEvv+0x74a>
 207:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 20b:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
      { return _M_insert(__n); }
 20f:	c5 fa 5a 43 0c       	vcvtss2sd 0xc(%rbx),%xmm0,%xmm0
 214:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 218:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 21c:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
	__ostream_insert(__out, __s,
 220:	c5 fa 11 6e 08       	vmovss %xmm5,0x8(%rsi)
 225:	0f 87 15 05 00 00    	ja     740 <_Z17measure_sqrt_timeILy3EEvv+0x740>
 22b:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 22f:	48 83 c3 10          	add    $0x10,%rbx
 233:	48 83 c6 10          	add    $0x10,%rsi
      { return _M_insert(__n); }
 237:	c5 e3 5a df          	vcvtsd2ss %xmm7,%xmm3,%xmm3
 23b:	c5 fa 11 5e fc       	vmovss %xmm3,-0x4(%rsi)
	__ostream_insert(__out, __s,
 240:	49 39 df             	cmp    %rbx,%r15
 243:	74 2b                	je     270 <_Z17measure_sqrt_timeILy3EEvv+0x270>
    { return flush(__os.put(__os.widen('\n'))); }
 245:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
      { return __check_facet(_M_ctype).widen(__c); }
 249:	c5 fa 5a 03          	vcvtss2sd (%rbx),%xmm0,%xmm0
 24d:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 251:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
      if (!__f)
 255:	0f 86 65 ff ff ff    	jbe    1c0 <_Z17measure_sqrt_timeILy3EEvv+0x1c0>
 25b:	e8 00 00 00 00       	callq  260 <_Z17measure_sqrt_timeILy3EEvv+0x260>
	if (_M_widen_ok)
 260:	e9 5b ff ff ff       	jmpq   1c0 <_Z17measure_sqrt_timeILy3EEvv+0x1c0>
 265:	e8 00 00 00 00       	callq  26a <_Z17measure_sqrt_timeILy3EEvv+0x26a>
 26a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 270:	41 ff ce             	dec    %r14d
    { return __os.flush(); }
 273:	0f 85 3a ff ff ff    	jne    1b3 <_Z17measure_sqrt_timeILy3EEvv+0x1b3>
 279:	e8 00 00 00 00       	callq  27e <_Z17measure_sqrt_timeILy3EEvv+0x27e>
	__ostream_insert(__out, __s,
 27e:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 285:	9b c4 20 
 288:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 28c:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
 290:	48 89 c1             	mov    %rax,%rcx
    std::cout << "generating " << (4 * N) << " random values..." << std::endl;
 293:	48 f7 ea             	imul   %rdx
 296:	48 c1 f9 3f          	sar    $0x3f,%rcx
 29a:	48 c1 fa 07          	sar    $0x7,%rdx
 29e:	48 29 ca             	sub    %rcx,%rdx
 2a1:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2a8 <_Z17measure_sqrt_timeILy3EEvv+0x2a8>
 2a8:	e8 00 00 00 00       	callq  2ad <_Z17measure_sqrt_timeILy3EEvv+0x2ad>
 2ad:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 2b3:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 2ee <_Z17measure_sqrt_timeILy3EEvv+0x2ee>
 2ba:	48 89 c6             	mov    %rax,%rsi
    { return flush(__os.put(__os.widen('\n'))); }
 2bd:	48 89 c1             	mov    %rax,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 2c0:	e8 00 00 00 00       	callq  2c5 <_Z17measure_sqrt_timeILy3EEvv+0x2c5>
 2c5:	48 8b 06             	mov    (%rsi),%rax
 2c8:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      if (!__f)
 2cc:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 2d3:	00 
 2d4:	48 85 db             	test   %rbx,%rbx
 2d7:	74 8c                	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 2d9:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 2dd:	0f 84 a1 05 00 00    	je     884 <_Z17measure_sqrt_timeILy3EEvv+0x884>
 2e3:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 2e7:	48 89 f1             	mov    %rsi,%rcx
 2ea:	e8 00 00 00 00       	callq  2ef <_Z17measure_sqrt_timeILy3EEvv+0x2ef>
 2ef:	48 89 c1             	mov    %rax,%rcx
 2f2:	e8 00 00 00 00       	callq  2f7 <_Z17measure_sqrt_timeILy3EEvv+0x2f7>
 2f7:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2fe <_Z17measure_sqrt_timeILy3EEvv+0x2fe>
    { return __os.flush(); }
 2fe:	41 b8 37 00 00 00    	mov    $0x37,%r8d
 304:	48 8d 15 40 00 00 00 	lea    0x40(%rip),%rdx        # 34b <_Z17measure_sqrt_timeILy3EEvv+0x34b>
       floats[i] = random_double();
 30b:	e8 00 00 00 00       	callq  310 <_Z17measure_sqrt_timeILy3EEvv+0x310>
 310:	49 8b 45 00          	mov    0x0(%r13),%rax
 314:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 318:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 31f:	00 
    for (int i = 0; i < 4 * N; i++) {
 320:	48 85 db             	test   %rbx,%rbx
	__ostream_insert(__out, __s,
 323:	0f 84 3c ff ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 329:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 32d:	0f 84 ef 04 00 00    	je     822 <_Z17measure_sqrt_timeILy3EEvv+0x822>
 333:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 337:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33e <_Z17measure_sqrt_timeILy3EEvv+0x33e>
    { return flush(__os.put(__os.widen('\n'))); }
 33e:	bb e8 03 00 00       	mov    $0x3e8,%ebx
 343:	e8 00 00 00 00       	callq  348 <_Z17measure_sqrt_timeILy3EEvv+0x348>
      { return __check_facet(_M_ctype).widen(__c); }
 348:	48 89 c1             	mov    %rax,%rcx
 34b:	e8 00 00 00 00       	callq  350 <_Z17measure_sqrt_timeILy3EEvv+0x350>
 350:	e8 00 00 00 00       	callq  355 <_Z17measure_sqrt_timeILy3EEvv+0x355>
      if (!__f)
 355:	48 89 c6             	mov    %rax,%rsi
 358:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 35c:	31 d2                	xor    %edx,%edx
 35e:	41 b8 00 35 0c 00    	mov    $0xc3500,%r8d
 364:	4c 89 e1             	mov    %r12,%rcx
 367:	e8 00 00 00 00       	callq  36c <_Z17measure_sqrt_timeILy3EEvv+0x36c>
 36c:	ff cb                	dec    %ebx
 36e:	75 ec                	jne    35c <_Z17measure_sqrt_timeILy3EEvv+0x35c>
       start = steady_clock::now();
 370:	e8 00 00 00 00       	callq  375 <_Z17measure_sqrt_timeILy3EEvv+0x375>
 375:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 37c:	9b c4 20 
    { return __os.flush(); }
 37f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 383:	48 29 f0             	sub    %rsi,%rax
 386:	48 89 c1             	mov    %rax,%rcx
 389:	48 f7 ea             	imul   %rdx
 38c:	48 c1 f9 3f          	sar    $0x3f,%rcx
 390:	48 c1 fa 07          	sar    $0x7,%rdx
 394:	48 29 ca             	sub    %rcx,%rdx
 397:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 39e <_Z17measure_sqrt_timeILy3EEvv+0x39e>
 39e:	e8 00 00 00 00       	callq  3a3 <_Z17measure_sqrt_timeILy3EEvv+0x3a3>
          roots[i + k] = sqrt(floats[i + k]);
 3a3:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 3a9:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 3e4 <_Z17measure_sqrt_timeILy3EEvv+0x3e4>
 3b0:	48 89 c6             	mov    %rax,%rsi
 3b3:	48 89 c1             	mov    %rax,%rcx
 3b6:	e8 00 00 00 00       	callq  3bb <_Z17measure_sqrt_timeILy3EEvv+0x3bb>
 3bb:	48 8b 06             	mov    (%rsi),%rax
 3be:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 3c2:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 3c9:	00 
 3ca:	48 85 db             	test   %rbx,%rbx
 3cd:	0f 84 92 fe ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 3d3:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 3d7:	0f 84 76 04 00 00    	je     853 <_Z17measure_sqrt_timeILy3EEvv+0x853>
 3dd:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 3e1:	48 89 f1             	mov    %rsi,%rcx
 3e4:	e8 00 00 00 00       	callq  3e9 <_Z17measure_sqrt_timeILy3EEvv+0x3e9>
 3e9:	48 89 c1             	mov    %rax,%rcx
 3ec:	e8 00 00 00 00       	callq  3f1 <_Z17measure_sqrt_timeILy3EEvv+0x3f1>
 3f1:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 3f8 <_Z17measure_sqrt_timeILy3EEvv+0x3f8>
 3f8:	41 b8 39 00 00 00    	mov    $0x39,%r8d
 3fe:	48 8d 15 78 00 00 00 	lea    0x78(%rip),%rdx        # 47d <_Z17measure_sqrt_timeILy3EEvv+0x47d>
 405:	e8 00 00 00 00       	callq  40a <_Z17measure_sqrt_timeILy3EEvv+0x40a>
 40a:	49 8b 45 00          	mov    0x0(%r13),%rax
 40e:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 412:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 419:	00 
 41a:	48 85 db             	test   %rbx,%rbx
 41d:	0f 84 42 fe ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
      for (int i = 0; i < 4 * N; i += 4) {
 423:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
          roots[i + k] = sqrt(floats[i + k]);
 427:	0f 84 c4 03 00 00    	je     7f1 <_Z17measure_sqrt_timeILy3EEvv+0x7f1>
 42d:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 431:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 438 <_Z17measure_sqrt_timeILy3EEvv+0x438>
 438:	e8 00 00 00 00       	callq  43d <_Z17measure_sqrt_timeILy3EEvv+0x43d>
 43d:	48 89 c1             	mov    %rax,%rcx
 440:	e8 00 00 00 00       	callq  445 <_Z17measure_sqrt_timeILy3EEvv+0x445>
	__throw_bad_cast();
 445:	e8 00 00 00 00       	callq  44a <_Z17measure_sqrt_timeILy3EEvv+0x44a>
 44a:	ba e8 03 00 00       	mov    $0x3e8,%edx
 44f:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    for (int j = 0; j < LOOP; j++) {
 453:	48 89 c3             	mov    %rax,%rbx
 456:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
       end = steady_clock::now();
 45a:	4c 89 e0             	mov    %r12,%rax
 45d:	0f 1f 00             	nopl   (%rax)
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 460:	c5 f8 29 00          	vmovaps %xmm0,(%rax)
 464:	48 83 c0 10          	add    $0x10,%rax
 468:	48 39 c7             	cmp    %rax,%rdi
 46b:	75 f3                	jne    460 <_Z17measure_sqrt_timeILy3EEvv+0x460>
 46d:	ff ca                	dec    %edx
 46f:	75 e9                	jne    45a <_Z17measure_sqrt_timeILy3EEvv+0x45a>
 471:	e8 00 00 00 00       	callq  476 <_Z17measure_sqrt_timeILy3EEvv+0x476>
 476:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 47d:	9b c4 20 
 480:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
      { return _M_insert(__n); }
 484:	48 29 d8             	sub    %rbx,%rax
 487:	48 89 c1             	mov    %rax,%rcx
 48a:	48 f7 ea             	imul   %rdx
	__ostream_insert(__out, __s,
 48d:	48 c1 f9 3f          	sar    $0x3f,%rcx
 491:	48 c1 fa 07          	sar    $0x7,%rdx
 495:	48 29 ca             	sub    %rcx,%rdx
 498:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 49f <_Z17measure_sqrt_timeILy3EEvv+0x49f>
 49f:	e8 00 00 00 00       	callq  4a4 <_Z17measure_sqrt_timeILy3EEvv+0x4a4>
 4a4:	41 b8 05 00 00 00    	mov    $0x5,%r8d
      { return __check_facet(_M_ctype).widen(__c); }
 4aa:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 4e5 <_Z17measure_sqrt_timeILy3EEvv+0x4e5>
 4b1:	48 89 c6             	mov    %rax,%rsi
      if (!__f)
 4b4:	48 89 c1             	mov    %rax,%rcx
 4b7:	e8 00 00 00 00       	callq  4bc <_Z17measure_sqrt_timeILy3EEvv+0x4bc>
 4bc:	48 8b 06             	mov    (%rsi),%rax
 4bf:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 4c3:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 4ca:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 4cb:	48 85 db             	test   %rbx,%rbx
 4ce:	0f 84 91 fd ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
    { return __os.flush(); }
 4d4:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
	__ostream_insert(__out, __s,
 4d8:	0f 84 9b 04 00 00    	je     979 <_Z17measure_sqrt_timeILy3EEvv+0x979>
 4de:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 4e2:	48 89 f1             	mov    %rsi,%rcx
 4e5:	e8 00 00 00 00       	callq  4ea <_Z17measure_sqrt_timeILy3EEvv+0x4ea>
 4ea:	48 89 c1             	mov    %rax,%rcx
 4ed:	e8 00 00 00 00       	callq  4f2 <_Z17measure_sqrt_timeILy3EEvv+0x4f2>
    { return flush(__os.put(__os.widen('\n'))); }
 4f2:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 4f9 <_Z17measure_sqrt_timeILy3EEvv+0x4f9>
      { return __check_facet(_M_ctype).widen(__c); }
 4f9:	41 b8 2e 00 00 00    	mov    $0x2e,%r8d
 4ff:	48 8d 15 b8 00 00 00 	lea    0xb8(%rip),%rdx        # 5be <_Z17measure_sqrt_timeILy3EEvv+0x5be>
      if (!__f)
 506:	e8 00 00 00 00       	callq  50b <_Z17measure_sqrt_timeILy3EEvv+0x50b>
 50b:	49 8b 45 00          	mov    0x0(%r13),%rax
 50f:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 513:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 51a:	00 
 51b:	48 85 db             	test   %rbx,%rbx
       start = steady_clock::now();
 51e:	0f 84 41 fd ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 524:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
    { return __os.flush(); }
 528:	0f 84 1a 04 00 00    	je     948 <_Z17measure_sqrt_timeILy3EEvv+0x948>
 52e:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 532:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 539 <_Z17measure_sqrt_timeILy3EEvv+0x539>
 539:	e8 00 00 00 00       	callq  53e <_Z17measure_sqrt_timeILy3EEvv+0x53e>
 53e:	48 89 c1             	mov    %rax,%rcx
 541:	e8 00 00 00 00       	callq  546 <_Z17measure_sqrt_timeILy3EEvv+0x546>
 546:	e8 00 00 00 00       	callq  54b <_Z17measure_sqrt_timeILy3EEvv+0x54b>
 54b:	48 89 c3             	mov    %rax,%rbx
    for (int j = 0; j < LOOP; j++) {
 54e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
       end = steady_clock::now();
 552:	e8 00 00 00 00       	callq  557 <_Z17measure_sqrt_timeILy3EEvv+0x557>
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 557:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 55b:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 562:	9b c4 20 
 565:	48 29 d8             	sub    %rbx,%rax
 568:	48 89 c1             	mov    %rax,%rcx
 56b:	48 f7 ea             	imul   %rdx
 56e:	48 c1 f9 3f          	sar    $0x3f,%rcx
 572:	48 c1 fa 07          	sar    $0x7,%rdx
 576:	48 29 ca             	sub    %rcx,%rdx
      { return _M_insert(__n); }
 579:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 580 <_Z17measure_sqrt_timeILy3EEvv+0x580>
 580:	e8 00 00 00 00       	callq  585 <_Z17measure_sqrt_timeILy3EEvv+0x585>
	__ostream_insert(__out, __s,
 585:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 58b:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 5c6 <_Z17measure_sqrt_timeILy3EEvv+0x5c6>
      { return _M_insert(__n); }
 592:	48 89 c6             	mov    %rax,%rsi
	__ostream_insert(__out, __s,
 595:	48 89 c1             	mov    %rax,%rcx
 598:	e8 00 00 00 00       	callq  59d <_Z17measure_sqrt_timeILy3EEvv+0x59d>
    { return flush(__os.put(__os.widen('\n'))); }
 59d:	48 8b 06             	mov    (%rsi),%rax
      { return __check_facet(_M_ctype).widen(__c); }
 5a0:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 5a4:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 5ab:	00 
      if (!__f)
 5ac:	48 85 db             	test   %rbx,%rbx
 5af:	0f 84 b0 fc ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 5b5:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 5b9:	0f 84 f6 02 00 00    	je     8b5 <_Z17measure_sqrt_timeILy3EEvv+0x8b5>
 5bf:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 5c3:	48 89 f1             	mov    %rsi,%rcx
 5c6:	e8 00 00 00 00       	callq  5cb <_Z17measure_sqrt_timeILy3EEvv+0x5cb>
    { return __os.flush(); }
 5cb:	48 89 c1             	mov    %rax,%rcx
 5ce:	e8 00 00 00 00       	callq  5d3 <_Z17measure_sqrt_timeILy3EEvv+0x5d3>
	__ostream_insert(__out, __s,
 5d3:	e8 00 00 00 00       	callq  5d8 <_Z17measure_sqrt_timeILy3EEvv+0x5d8>
 5d8:	ba e8 03 00 00       	mov    $0x3e8,%edx
 5dd:	c5 f8 28 25 50 01 00 	vmovaps 0x150(%rip),%xmm4        # 735 <_Z17measure_sqrt_timeILy3EEvv+0x735>
 5e4:	00 
 5e5:	c5 f8 28 1d 60 01 00 	vmovaps 0x160(%rip),%xmm3        # 74d <_Z17measure_sqrt_timeILy3EEvv+0x74d>
 5ec:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 5ed:	48 89 c6             	mov    %rax,%rsi
      { return __check_facet(_M_ctype).widen(__c); }
 5f0:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 5f4:	31 c0                	xor    %eax,%eax
 5f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 5fd:	00 00 00 
      if (!__f)
 600:	c5 f8 28 04 07       	vmovaps (%rdi,%rax,1),%xmm0
 605:	48 83 c0 10          	add    $0x10,%rax
 609:	c5 e9 72 e0 01       	vpsrad $0x1,%xmm0,%xmm2
 60e:	c5 e9 fe d4          	vpaddd %xmm4,%xmm2,%xmm2
 612:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 616:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 61a:	c5 f0 59 d3          	vmulps %xmm3,%xmm1,%xmm2
    { return __os.flush(); }
 61e:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 622:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
       start = steady_clock::now();
 626:	c5 f0 59 cb          	vmulps %xmm3,%xmm1,%xmm1
 62a:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 62e:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
          roots[i + k] = sqrt1<LOOPS>(floats + i + k);
 632:	c5 f8 59 c3          	vmulps %xmm3,%xmm0,%xmm0
 636:	c4 a1 78 29 44 20 f0 	vmovaps %xmm0,-0x10(%rax,%r12,1)
 63d:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
 643:	75 bb                	jne    600 <_Z17measure_sqrt_timeILy3EEvv+0x600>
 645:	ff ca                	dec    %edx
 647:	75 ab                	jne    5f4 <_Z17measure_sqrt_timeILy3EEvv+0x5f4>
 649:	e8 00 00 00 00       	callq  64e <_Z17measure_sqrt_timeILy3EEvv+0x64e>
    for (int j = 0; j < LOOP; j++) {
 64e:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 655 <_Z17measure_sqrt_timeILy3EEvv+0x655>
       end = steady_clock::now();
 655:	41 b8 34 00 00 00    	mov    $0x34,%r8d
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 65b:	48 8d 15 e8 00 00 00 	lea    0xe8(%rip),%rdx        # 74a <_Z17measure_sqrt_timeILy3EEvv+0x74a>
 662:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 666:	48 29 f0             	sub    %rsi,%rax
 669:	48 89 c3             	mov    %rax,%rbx
 66c:	e8 00 00 00 00       	callq  671 <_Z17measure_sqrt_timeILy3EEvv+0x671>
 671:	49 8b 45 00          	mov    0x0(%r13),%rax
 675:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      { return _M_insert(__n); }
 679:	49 8b b4 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rsi
 680:	00 
 681:	48 85 f6             	test   %rsi,%rsi
	__ostream_insert(__out, __s,
 684:	0f 84 db fb ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 68a:	80 7e 38 00          	cmpb   $0x0,0x38(%rsi)
 68e:	0f 84 83 02 00 00    	je     917 <_Z17measure_sqrt_timeILy3EEvv+0x917>
 694:	0f be 56 43          	movsbl 0x43(%rsi),%edx
 698:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 69f <_Z17measure_sqrt_timeILy3EEvv+0x69f>
      { return __check_facet(_M_ctype).widen(__c); }
 69f:	e8 00 00 00 00       	callq  6a4 <_Z17measure_sqrt_timeILy3EEvv+0x6a4>
 6a4:	48 89 c1             	mov    %rax,%rcx
 6a7:	e8 00 00 00 00       	callq  6ac <_Z17measure_sqrt_timeILy3EEvv+0x6ac>
      if (!__f)
 6ac:	48 89 d8             	mov    %rbx,%rax
 6af:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 6b6:	9b c4 20 
 6b9:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 6c0 <_Z17measure_sqrt_timeILy3EEvv+0x6c0>
 6c0:	48 c1 fb 3f          	sar    $0x3f,%rbx
    { return flush(__os.put(__os.widen('\n'))); }
 6c4:	48 f7 ea             	imul   %rdx
 6c7:	48 c1 fa 07          	sar    $0x7,%rdx
    { return __os.flush(); }
 6cb:	48 29 da             	sub    %rbx,%rdx
 6ce:	e8 00 00 00 00       	callq  6d3 <_Z17measure_sqrt_timeILy3EEvv+0x6d3>
	__ostream_insert(__out, __s,
 6d3:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 6d9:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 714 <_Z17measure_sqrt_timeILy3EEvv+0x714>
 6e0:	48 89 c6             	mov    %rax,%rsi
 6e3:	48 89 c1             	mov    %rax,%rcx
 6e6:	e8 00 00 00 00       	callq  6eb <_Z17measure_sqrt_timeILy3EEvv+0x6eb>
    { return flush(__os.put(__os.widen('\n'))); }
 6eb:	48 8b 06             	mov    (%rsi),%rax
 6ee:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      { return __check_facet(_M_ctype).widen(__c); }
 6f2:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 6f9:	00 
 6fa:	48 85 db             	test   %rbx,%rbx
      if (!__f)
 6fd:	0f 84 62 fb ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 703:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 707:	0f 84 d9 01 00 00    	je     8e6 <_Z17measure_sqrt_timeILy3EEvv+0x8e6>
 70d:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 711:	48 89 f1             	mov    %rsi,%rcx
 714:	e8 00 00 00 00       	callq  719 <_Z17measure_sqrt_timeILy3EEvv+0x719>
 719:	90                   	nop
 71a:	c5 f8 28 75 d0       	vmovaps -0x30(%rbp),%xmm6
    { return __os.flush(); }
 71f:	c5 f8 28 7d e0       	vmovaps -0x20(%rbp),%xmm7
 724:	48 89 c1             	mov    %rax,%rcx
       start = steady_clock::now();
 727:	48 8d 65 f8          	lea    -0x8(%rbp),%rsp
 72b:	5b                   	pop    %rbx
 72c:	5e                   	pop    %rsi
 72d:	5f                   	pop    %rdi
 72e:	41 5c                	pop    %r12
 730:	41 5d                	pop    %r13
       end = steady_clock::now();
 732:	41 5e                	pop    %r14
 734:	41 5f                	pop    %r15
 736:	5d                   	pop    %rbp
 737:	e9 00 00 00 00       	jmpq   73c <_Z17measure_sqrt_timeILy3EEvv+0x73c>
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 73c:	0f 1f 40 00          	nopl   0x0(%rax)
 740:	e8 00 00 00 00       	callq  745 <_Z17measure_sqrt_timeILy3EEvv+0x745>
 745:	e9 e1 fa ff ff       	jmpq   22b <_Z17measure_sqrt_timeILy3EEvv+0x22b>
 74a:	e8 00 00 00 00       	callq  74f <_Z17measure_sqrt_timeILy3EEvv+0x74f>
 74f:	e9 b3 fa ff ff       	jmpq   207 <_Z17measure_sqrt_timeILy3EEvv+0x207>
 754:	e8 00 00 00 00       	callq  759 <_Z17measure_sqrt_timeILy3EEvv+0x759>
      { return _M_insert(__n); }
 759:	e9 85 fa ff ff       	jmpq   1e3 <_Z17measure_sqrt_timeILy3EEvv+0x1e3>
 75e:	48 89 d9             	mov    %rbx,%rcx
 761:	e8 00 00 00 00       	callq  766 <_Z17measure_sqrt_timeILy3EEvv+0x766>
	__ostream_insert(__out, __s,
 766:	48 8b 03             	mov    (%rbx),%rax
 769:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 770 <_Z17measure_sqrt_timeILy3EEvv+0x770>
 770:	ba 0a 00 00 00       	mov    $0xa,%edx
 775:	48 8b 40 30          	mov    0x30(%rax),%rax
 779:	48 39 c8             	cmp    %rcx,%rax
 77c:	0f 84 80 f9 ff ff    	je     102 <_Z17measure_sqrt_timeILy3EEvv+0x102>
      { return __check_facet(_M_ctype).widen(__c); }
 782:	48 89 d9             	mov    %rbx,%rcx
 785:	ff d0                	callq  *%rax
 787:	0f be d0             	movsbl %al,%edx
 78a:	e9 73 f9 ff ff       	jmpq   102 <_Z17measure_sqrt_timeILy3EEvv+0x102>
      if (!__f)
 78f:	48 89 d9             	mov    %rbx,%rcx
 792:	e8 00 00 00 00       	callq  797 <_Z17measure_sqrt_timeILy3EEvv+0x797>
 797:	48 8b 03             	mov    (%rbx),%rax
 79a:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 7a1 <_Z17measure_sqrt_timeILy3EEvv+0x7a1>
 7a1:	ba 0a 00 00 00       	mov    $0xa,%edx
    { return flush(__os.put(__os.widen('\n'))); }
 7a6:	48 8b 40 30          	mov    0x30(%rax),%rax
 7aa:	48 39 c8             	cmp    %rcx,%rax
    { return __os.flush(); }
 7ad:	0f 84 d7 f8 ff ff    	je     8a <_Z17measure_sqrt_timeILy3EEvv+0x8a>
       start = steady_clock::now();
 7b3:	48 89 d9             	mov    %rbx,%rcx
 7b6:	ff d0                	callq  *%rax
 7b8:	0f be d0             	movsbl %al,%edx
 7bb:	e9 ca f8 ff ff       	jmpq   8a <_Z17measure_sqrt_timeILy3EEvv+0x8a>
 7c0:	48 89 d9             	mov    %rbx,%rcx
 7c3:	e8 00 00 00 00       	callq  7c8 <_Z17measure_sqrt_timeILy3EEvv+0x7c8>
 7c8:	48 8b 03             	mov    (%rbx),%rax
 7cb:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 7d2 <_Z17measure_sqrt_timeILy3EEvv+0x7d2>
 7d2:	ba 0a 00 00 00       	mov    $0xa,%edx
 7d7:	48 8b 40 30          	mov    0x30(%rax),%rax
 7db:	48 39 c8             	cmp    %rcx,%rax
 7de:	0f 84 a4 f9 ff ff    	je     188 <_Z17measure_sqrt_timeILy3EEvv+0x188>
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 7e4:	48 89 d9             	mov    %rbx,%rcx
 7e7:	ff d0                	callq  *%rax
 7e9:	0f be d0             	movsbl %al,%edx
 7ec:	e9 97 f9 ff ff       	jmpq   188 <_Z17measure_sqrt_timeILy3EEvv+0x188>
 7f1:	48 89 d9             	mov    %rbx,%rcx
    * root = 0.5 * (* root + (* a / * root));
 7f4:	e8 00 00 00 00       	callq  7f9 <_Z17measure_sqrt_timeILy3EEvv+0x7f9>
 7f9:	48 8b 03             	mov    (%rbx),%rax
 7fc:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 803 <_Z17measure_sqrt_timeILy3EEvv+0x803>
 803:	ba 0a 00 00 00       	mov    $0xa,%edx
 808:	48 8b 40 30          	mov    0x30(%rax),%rax
 80c:	48 39 c8             	cmp    %rcx,%rax
 80f:	0f 84 1c fc ff ff    	je     431 <_Z17measure_sqrt_timeILy3EEvv+0x431>
      for (int i = 0; i < 4 * N; i += 4) {
 815:	48 89 d9             	mov    %rbx,%rcx
 818:	ff d0                	callq  *%rax
    for (int j = 0; j < LOOP; j++) {
 81a:	0f be d0             	movsbl %al,%edx
       end = steady_clock::now();
 81d:	e9 0f fc ff ff       	jmpq   431 <_Z17measure_sqrt_timeILy3EEvv+0x431>
	__ostream_insert(__out, __s,
 822:	48 89 d9             	mov    %rbx,%rcx
 825:	e8 00 00 00 00       	callq  82a <_Z17measure_sqrt_timeILy3EEvv+0x82a>
 82a:	48 8b 03             	mov    (%rbx),%rax
 82d:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 834 <_Z17measure_sqrt_timeILy3EEvv+0x834>
 834:	ba 0a 00 00 00       	mov    $0xa,%edx
 839:	48 8b 40 30          	mov    0x30(%rax),%rax
 83d:	48 39 c8             	cmp    %rcx,%rax
 840:	0f 84 f1 fa ff ff    	je     337 <_Z17measure_sqrt_timeILy3EEvv+0x337>
    { return flush(__os.put(__os.widen('\n'))); }
 846:	48 89 d9             	mov    %rbx,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 849:	ff d0                	callq  *%rax
 84b:	0f be d0             	movsbl %al,%edx
 84e:	e9 e4 fa ff ff       	jmpq   337 <_Z17measure_sqrt_timeILy3EEvv+0x337>
 853:	48 89 d9             	mov    %rbx,%rcx
      if (!__f)
 856:	e8 00 00 00 00       	callq  85b <_Z17measure_sqrt_timeILy3EEvv+0x85b>
 85b:	48 8b 03             	mov    (%rbx),%rax
 85e:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 865 <_Z17measure_sqrt_timeILy3EEvv+0x865>
 865:	ba 0a 00 00 00       	mov    $0xa,%edx
 86a:	48 8b 40 30          	mov    0x30(%rax),%rax
 86e:	48 39 c8             	cmp    %rcx,%rax
 871:	0f 84 6a fb ff ff    	je     3e1 <_Z17measure_sqrt_timeILy3EEvv+0x3e1>
 877:	48 89 d9             	mov    %rbx,%rcx
    { return __os.flush(); }
 87a:	ff d0                	callq  *%rax
 87c:	0f be d0             	movsbl %al,%edx
 87f:	e9 5d fb ff ff       	jmpq   3e1 <_Z17measure_sqrt_timeILy3EEvv+0x3e1>
    std::cout << time.time_clock().count() / LOOP  << " [ns]" << std::endl;
 884:	48 89 d9             	mov    %rbx,%rcx
 887:	e8 00 00 00 00       	callq  88c <_Z17measure_sqrt_timeILy3EEvv+0x88c>
 88c:	48 8b 03             	mov    (%rbx),%rax
      { return _M_insert(__n); }
 88f:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 896 <_Z17measure_sqrt_timeILy3EEvv+0x896>
 896:	ba 0a 00 00 00       	mov    $0xa,%edx
 89b:	48 8b 40 30          	mov    0x30(%rax),%rax
 89f:	48 39 c8             	cmp    %rcx,%rax
 8a2:	0f 84 3f fa ff ff    	je     2e7 <_Z17measure_sqrt_timeILy3EEvv+0x2e7>
	__ostream_insert(__out, __s,
 8a8:	48 89 d9             	mov    %rbx,%rcx
 8ab:	ff d0                	callq  *%rax
 8ad:	0f be d0             	movsbl %al,%edx
 8b0:	e9 32 fa ff ff       	jmpq   2e7 <_Z17measure_sqrt_timeILy3EEvv+0x2e7>
      { return _M_insert(__n); }
 8b5:	48 89 d9             	mov    %rbx,%rcx
	__ostream_insert(__out, __s,
 8b8:	e8 00 00 00 00       	callq  8bd <_Z17measure_sqrt_timeILy3EEvv+0x8bd>
 8bd:	48 8b 03             	mov    (%rbx),%rax
    { return flush(__os.put(__os.widen('\n'))); }
 8c0:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 8c7 <_Z17measure_sqrt_timeILy3EEvv+0x8c7>
      { return __check_facet(_M_ctype).widen(__c); }
 8c7:	ba 0a 00 00 00       	mov    $0xa,%edx
 8cc:	48 8b 40 30          	mov    0x30(%rax),%rax
      if (!__f)
 8d0:	48 39 c8             	cmp    %rcx,%rax
 8d3:	0f 84 ea fc ff ff    	je     5c3 <_Z17measure_sqrt_timeILy3EEvv+0x5c3>
 8d9:	48 89 d9             	mov    %rbx,%rcx
 8dc:	ff d0                	callq  *%rax
 8de:	0f be d0             	movsbl %al,%edx
 8e1:	e9 dd fc ff ff       	jmpq   5c3 <_Z17measure_sqrt_timeILy3EEvv+0x5c3>
 8e6:	48 89 d9             	mov    %rbx,%rcx
 8e9:	e8 00 00 00 00       	callq  8ee <_Z17measure_sqrt_timeILy3EEvv+0x8ee>
}
 8ee:	48 8b 03             	mov    (%rbx),%rax
 8f1:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 8f8 <_Z17measure_sqrt_timeILy3EEvv+0x8f8>
    { return __os.flush(); }
 8f8:	ba 0a 00 00 00       	mov    $0xa,%edx
 8fd:	48 8b 40 30          	mov    0x30(%rax),%rax
 901:	48 39 c8             	cmp    %rcx,%rax
 904:	0f 84 07 fe ff ff    	je     711 <_Z17measure_sqrt_timeILy3EEvv+0x711>
 90a:	48 89 d9             	mov    %rbx,%rcx
 90d:	ff d0                	callq  *%rax
 90f:	0f be d0             	movsbl %al,%edx
          roots[i + k] = sqrt(floats[i + k]);
 912:	e9 fa fd ff ff       	jmpq   711 <_Z17measure_sqrt_timeILy3EEvv+0x711>
 917:	48 89 f1             	mov    %rsi,%rcx
 91a:	e8 00 00 00 00       	callq  91f <_Z17measure_sqrt_timeILy3EEvv+0x91f>
 91f:	48 8b 06             	mov    (%rsi),%rax
 922:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 929 <_Z17measure_sqrt_timeILy3EEvv+0x929>
 929:	ba 0a 00 00 00       	mov    $0xa,%edx
	this->_M_widen_init();
 92e:	48 8b 40 30          	mov    0x30(%rax),%rax
 932:	48 39 c8             	cmp    %rcx,%rax
 935:	0f 84 5d fd ff ff    	je     698 <_Z17measure_sqrt_timeILy3EEvv+0x698>
	return this->do_widen(__c);
 93b:	48 89 f1             	mov    %rsi,%rcx
 93e:	ff d0                	callq  *%rax
 940:	0f be d0             	movsbl %al,%edx
 943:	e9 50 fd ff ff       	jmpq   698 <_Z17measure_sqrt_timeILy3EEvv+0x698>
 948:	48 89 d9             	mov    %rbx,%rcx
 94b:	e8 00 00 00 00       	callq  950 <_Z17measure_sqrt_timeILy3EEvv+0x950>
 950:	48 8b 03             	mov    (%rbx),%rax
 953:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 95a <_Z17measure_sqrt_timeILy3EEvv+0x95a>
 95a:	ba 0a 00 00 00       	mov    $0xa,%edx
	this->_M_widen_init();
 95f:	48 8b 40 30          	mov    0x30(%rax),%rax
 963:	48 39 c8             	cmp    %rcx,%rax
 966:	0f 84 c6 fb ff ff    	je     532 <_Z17measure_sqrt_timeILy3EEvv+0x532>
	return this->do_widen(__c);
 96c:	48 89 d9             	mov    %rbx,%rcx
 96f:	ff d0                	callq  *%rax
 971:	0f be d0             	movsbl %al,%edx
 974:	e9 b9 fb ff ff       	jmpq   532 <_Z17measure_sqrt_timeILy3EEvv+0x532>
 979:	48 89 d9             	mov    %rbx,%rcx
 97c:	e8 00 00 00 00       	callq  981 <_Z17measure_sqrt_timeILy3EEvv+0x981>
 981:	48 8b 03             	mov    (%rbx),%rax
 984:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 98b <_Z17measure_sqrt_timeILy3EEvv+0x98b>
 98b:	ba 0a 00 00 00       	mov    $0xa,%edx
	this->_M_widen_init();
 990:	48 8b 40 30          	mov    0x30(%rax),%rax
 994:	48 39 c8             	cmp    %rcx,%rax
 997:	0f 84 45 fb ff ff    	je     4e2 <_Z17measure_sqrt_timeILy3EEvv+0x4e2>
	return this->do_widen(__c);
 99d:	48 89 d9             	mov    %rbx,%rcx
 9a0:	ff d0                	callq  *%rax
 9a2:	0f be d0             	movsbl %al,%edx
 9a5:	e9 38 fb ff ff       	jmpq   4e2 <_Z17measure_sqrt_timeILy3EEvv+0x4e2>
 9aa:	90                   	nop
 9ab:	90                   	nop
 9ac:	90                   	nop
 9ad:	90                   	nop
 9ae:	90                   	nop
 9af:	90                   	nop

Disassembly of section .text$_Z17measure_sqrt_timeILy4EEvv:

0000000000000000 <_Z17measure_sqrt_timeILy4EEvv>:
   0:	55                   	push   %rbp
   1:	41 57                	push   %r15
   3:	41 56                	push   %r14
   5:	41 55                	push   %r13
   7:	41 54                	push   %r12
   9:	57                   	push   %rdi
   a:	56                   	push   %rsi
   b:	53                   	push   %rbx
   c:	48 83 ec 78          	sub    $0x78,%rsp
{
  10:	48 8d ac 24 80 00 00 	lea    0x80(%rsp),%rbp
  17:	00 
  18:	c5 f8 29 75 d0       	vmovaps %xmm6,-0x30(%rbp)
  static std::random_device device;
  1d:	c5 f8 29 7d e0       	vmovaps %xmm7,-0x20(%rbp)
  22:	b8 80 6a 18 00       	mov    $0x186a80,%eax
  27:	e8 00 00 00 00       	callq  2c <_Z17measure_sqrt_timeILy4EEvv+0x2c>
  2c:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33 <_Z17measure_sqrt_timeILy4EEvv+0x33>
  33:	ba 04 00 00 00       	mov    $0x4,%edx
  38:	48 29 c4             	sub    %rax,%rsp
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  3b:	e8 00 00 00 00       	callq  40 <_Z17measure_sqrt_timeILy4EEvv+0x40>
  40:	41 b8 0b 00 00 00    	mov    $0xb,%r8d
      return this->_M_getval_pretr1();
  46:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 4d <_Z17measure_sqrt_timeILy4EEvv+0x4d>
  4d:	4c 8d a4 24 9f 00 00 	lea    0x9f(%rsp),%r12
  54:	00 
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
  55:	48 89 c6             	mov    %rax,%rsi
  58:	48 89 c1             	mov    %rax,%rcx
  5b:	49 83 e4 80          	and    $0xffffffffffffff80,%r12
  5f:	e8 00 00 00 00       	callq  64 <_Z17measure_sqrt_timeILy4EEvv+0x64>
  64:	48 8b 06             	mov    (%rsi),%rax
  67:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  6b:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  72:	00 
  73:	48 85 db             	test   %rbx,%rbx
  76:	0f 84 e9 01 00 00    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
  7c:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
  80:	0f 84 11 07 00 00    	je     797 <_Z17measure_sqrt_timeILy4EEvv+0x797>
      __ret = __sum / __tmp;
  86:	0f be 53 43          	movsbl 0x43(%rbx),%edx
  8a:	48 89 f1             	mov    %rsi,%rcx
      if (__builtin_expect(__ret >= _RealType(1), 0))
  8d:	e8 00 00 00 00       	callq  92 <_Z17measure_sqrt_timeILy4EEvv+0x92>
  92:	48 89 c1             	mov    %rax,%rcx
  95:	e8 00 00 00 00       	callq  9a <_Z17measure_sqrt_timeILy4EEvv+0x9a>
  9a:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # a1 <_Z17measure_sqrt_timeILy4EEvv+0xa1>
  a1:	41 b8 0b 00 00 00    	mov    $0xb,%r8d
	  return (__aurng() * (__p.b() - __p.a())) + __p.a();
  a7:	48 8d 15 0c 00 00 00 	lea    0xc(%rip),%rdx        # ba <_Z17measure_sqrt_timeILy4EEvv+0xba>
}
  ae:	e8 00 00 00 00       	callq  b3 <_Z17measure_sqrt_timeILy4EEvv+0xb3>
  b3:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # ba <_Z17measure_sqrt_timeILy4EEvv+0xba>
  ba:	ba 40 0d 03 00       	mov    $0x30d40,%edx
  bf:	e8 00 00 00 00       	callq  c4 <_Z17measure_sqrt_timeILy4EEvv+0xc4>
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  c4:	41 b8 11 00 00 00    	mov    $0x11,%r8d
  ca:	48 8d 15 18 00 00 00 	lea    0x18(%rip),%rdx        # e9 <_Z17measure_sqrt_timeILy4EEvv+0xe9>
  d1:	48 89 c6             	mov    %rax,%rsi
  d4:	48 89 c1             	mov    %rax,%rcx
	: _M_a(__a), _M_b(__b)
  d7:	e8 00 00 00 00       	callq  dc <_Z17measure_sqrt_timeILy4EEvv+0xdc>
  dc:	48 8b 06             	mov    (%rsi),%rax
  df:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  e3:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  ea:	00 
  eb:	48 85 db             	test   %rbx,%rbx
  ee:	0f 84 71 01 00 00    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
  f4:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
	: allocator_type(__a), _M_p(__dat) { }
  f8:	0f 84 68 06 00 00    	je     766 <_Z17measure_sqrt_timeILy4EEvv+0x766>
	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
  fe:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 102:	48 89 f1             	mov    %rsi,%rcx
    { _M_init_pretr1(__token); }
 105:	49 8d bc 24 00 35 0c 	lea    0xc3500(%r12),%rdi
 10c:	00 
      { _M_string_length = __length; }
 10d:	49 8d 9c 24 00 6a 18 	lea    0x186a00(%r12),%rbx
 114:	00 
	: allocator_type(__a), _M_p(__dat) { }
 115:	e8 00 00 00 00       	callq  11a <_Z17measure_sqrt_timeILy4EEvv+0x11a>
 11a:	49 89 ff             	mov    %rdi,%r15
 11d:	48 89 c1             	mov    %rax,%rcx
 120:	e8 00 00 00 00       	callq  125 <_Z17measure_sqrt_timeILy4EEvv+0x125>
 125:	e8 10 00 00 00       	callq  13a <_Z17measure_sqrt_timeILy4EEvv+0x13a>
      { __c1 = __c2; }
 12a:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 12e:	49 83 c7 04          	add    $0x4,%r15
 132:	c5 e3 5a d8          	vcvtsd2ss %xmm0,%xmm3,%xmm3
  static std::random_device device;
 136:	c4 c1 7a 11 5f fc    	vmovss %xmm3,-0x4(%r15)
	if (!_M_is_local())
 13c:	4c 39 fb             	cmp    %r15,%rbx
 13f:	75 e4                	jne    125 <_Z17measure_sqrt_timeILy4EEvv+0x125>
 141:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 148 <_Z17measure_sqrt_timeILy4EEvv+0x148>
 148:	41 b8 09 00 00 00    	mov    $0x9,%r8d
 14e:	48 8d 15 2a 00 00 00 	lea    0x2a(%rip),%rdx        # 17f <_Z17measure_sqrt_timeILy4EEvv+0x17f>
 155:	e8 00 00 00 00       	callq  15a <_Z17measure_sqrt_timeILy4EEvv+0x15a>
 15a:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 161 <_Z17measure_sqrt_timeILy4EEvv+0x161>
	  __ret = std::nextafter(_RealType(1), _RealType(0));
 161:	49 8b 45 00          	mov    0x0(%r13),%rax
 165:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 169:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 170:	00 
 171:	48 85 db             	test   %rbx,%rbx
 174:	0f 84 eb 00 00 00    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
 17a:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 17e:	0f 84 44 06 00 00    	je     7c8 <_Z17measure_sqrt_timeILy4EEvv+0x7c8>
 184:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 188:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 18f <_Z17measure_sqrt_timeILy4EEvv+0x18f>
 18f:	41 be e8 03 00 00    	mov    $0x3e8,%r14d
 195:	e8 00 00 00 00       	callq  19a <_Z17measure_sqrt_timeILy4EEvv+0x19a>
 19a:	48 89 c1             	mov    %rax,%rcx
 19d:	e8 00 00 00 00       	callq  1a2 <_Z17measure_sqrt_timeILy4EEvv+0x1a2>
 1a2:	e8 00 00 00 00       	callq  1a7 <_Z17measure_sqrt_timeILy4EEvv+0x1a7>
 1a7:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
 1ab:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
 1af:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 1b3:	4c 89 e6             	mov    %r12,%rsi
 1b6:	48 89 fb             	mov    %rdi,%rbx
 1b9:	e9 87 00 00 00       	jmpq   245 <_Z17measure_sqrt_timeILy4EEvv+0x245>
 1be:	66 90                	xchg   %ax,%ax
 1c0:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1c4:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
 1c8:	c5 fa 5a 43 04       	vcvtss2sd 0x4(%rbx),%xmm0,%xmm0
 1cd:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 1d1:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1d5:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1d9:	c5 fa 11 2e          	vmovss %xmm5,(%rsi)
 1dd:	0f 87 79 05 00 00    	ja     75c <_Z17measure_sqrt_timeILy4EEvv+0x75c>
void measure_sqrt_time(void) {
 1e3:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1e7:	c5 d8 57 e4          	vxorps %xmm4,%xmm4,%xmm4
 1eb:	c5 fa 5a 43 08       	vcvtss2sd 0x8(%rbx),%xmm0,%xmm0
 1f0:	c5 db 5a e7          	vcvtsd2ss %xmm7,%xmm4,%xmm4
 1f4:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1f8:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1fc:	c5 fa 11 66 04       	vmovss %xmm4,0x4(%rsi)
 201:	0f 87 4b 05 00 00    	ja     752 <_Z17measure_sqrt_timeILy4EEvv+0x752>
 207:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 20b:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
      { return _M_insert(__n); }
 20f:	c5 fa 5a 43 0c       	vcvtss2sd 0xc(%rbx),%xmm0,%xmm0
 214:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 218:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 21c:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
	__ostream_insert(__out, __s,
 220:	c5 fa 11 6e 08       	vmovss %xmm5,0x8(%rsi)
 225:	0f 87 1d 05 00 00    	ja     748 <_Z17measure_sqrt_timeILy4EEvv+0x748>
 22b:	c5 d8 57 e4          	vxorps %xmm4,%xmm4,%xmm4
 22f:	48 83 c3 10          	add    $0x10,%rbx
 233:	48 83 c6 10          	add    $0x10,%rsi
      { return _M_insert(__n); }
 237:	c5 db 5a e7          	vcvtsd2ss %xmm7,%xmm4,%xmm4
 23b:	c5 fa 11 66 fc       	vmovss %xmm4,-0x4(%rsi)
	__ostream_insert(__out, __s,
 240:	49 39 df             	cmp    %rbx,%r15
 243:	74 2b                	je     270 <_Z17measure_sqrt_timeILy4EEvv+0x270>
    { return flush(__os.put(__os.widen('\n'))); }
 245:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
      { return __check_facet(_M_ctype).widen(__c); }
 249:	c5 fa 5a 03          	vcvtss2sd (%rbx),%xmm0,%xmm0
 24d:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 251:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
      if (!__f)
 255:	0f 86 65 ff ff ff    	jbe    1c0 <_Z17measure_sqrt_timeILy4EEvv+0x1c0>
 25b:	e8 00 00 00 00       	callq  260 <_Z17measure_sqrt_timeILy4EEvv+0x260>
	if (_M_widen_ok)
 260:	e9 5b ff ff ff       	jmpq   1c0 <_Z17measure_sqrt_timeILy4EEvv+0x1c0>
 265:	e8 00 00 00 00       	callq  26a <_Z17measure_sqrt_timeILy4EEvv+0x26a>
 26a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 270:	41 ff ce             	dec    %r14d
    { return __os.flush(); }
 273:	0f 85 3a ff ff ff    	jne    1b3 <_Z17measure_sqrt_timeILy4EEvv+0x1b3>
 279:	e8 00 00 00 00       	callq  27e <_Z17measure_sqrt_timeILy4EEvv+0x27e>
	__ostream_insert(__out, __s,
 27e:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 285:	9b c4 20 
 288:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 28c:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
 290:	48 89 c1             	mov    %rax,%rcx
    std::cout << "generating " << (4 * N) << " random values..." << std::endl;
 293:	48 f7 ea             	imul   %rdx
 296:	48 c1 f9 3f          	sar    $0x3f,%rcx
 29a:	48 c1 fa 07          	sar    $0x7,%rdx
 29e:	48 29 ca             	sub    %rcx,%rdx
 2a1:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2a8 <_Z17measure_sqrt_timeILy4EEvv+0x2a8>
 2a8:	e8 00 00 00 00       	callq  2ad <_Z17measure_sqrt_timeILy4EEvv+0x2ad>
 2ad:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 2b3:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 2ee <_Z17measure_sqrt_timeILy4EEvv+0x2ee>
 2ba:	48 89 c6             	mov    %rax,%rsi
    { return flush(__os.put(__os.widen('\n'))); }
 2bd:	48 89 c1             	mov    %rax,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 2c0:	e8 00 00 00 00       	callq  2c5 <_Z17measure_sqrt_timeILy4EEvv+0x2c5>
 2c5:	48 8b 06             	mov    (%rsi),%rax
 2c8:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      if (!__f)
 2cc:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 2d3:	00 
 2d4:	48 85 db             	test   %rbx,%rbx
 2d7:	74 8c                	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
 2d9:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 2dd:	0f 84 a9 05 00 00    	je     88c <_Z17measure_sqrt_timeILy4EEvv+0x88c>
 2e3:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 2e7:	48 89 f1             	mov    %rsi,%rcx
 2ea:	e8 00 00 00 00       	callq  2ef <_Z17measure_sqrt_timeILy4EEvv+0x2ef>
 2ef:	48 89 c1             	mov    %rax,%rcx
 2f2:	e8 00 00 00 00       	callq  2f7 <_Z17measure_sqrt_timeILy4EEvv+0x2f7>
 2f7:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2fe <_Z17measure_sqrt_timeILy4EEvv+0x2fe>
    { return __os.flush(); }
 2fe:	41 b8 37 00 00 00    	mov    $0x37,%r8d
 304:	48 8d 15 40 00 00 00 	lea    0x40(%rip),%rdx        # 34b <_Z17measure_sqrt_timeILy4EEvv+0x34b>
       floats[i] = random_double();
 30b:	e8 00 00 00 00       	callq  310 <_Z17measure_sqrt_timeILy4EEvv+0x310>
 310:	49 8b 45 00          	mov    0x0(%r13),%rax
 314:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 318:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 31f:	00 
    for (int i = 0; i < 4 * N; i++) {
 320:	48 85 db             	test   %rbx,%rbx
	__ostream_insert(__out, __s,
 323:	0f 84 3c ff ff ff    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
 329:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 32d:	0f 84 f7 04 00 00    	je     82a <_Z17measure_sqrt_timeILy4EEvv+0x82a>
 333:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 337:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33e <_Z17measure_sqrt_timeILy4EEvv+0x33e>
    { return flush(__os.put(__os.widen('\n'))); }
 33e:	bb e8 03 00 00       	mov    $0x3e8,%ebx
 343:	e8 00 00 00 00       	callq  348 <_Z17measure_sqrt_timeILy4EEvv+0x348>
      { return __check_facet(_M_ctype).widen(__c); }
 348:	48 89 c1             	mov    %rax,%rcx
 34b:	e8 00 00 00 00       	callq  350 <_Z17measure_sqrt_timeILy4EEvv+0x350>
 350:	e8 00 00 00 00       	callq  355 <_Z17measure_sqrt_timeILy4EEvv+0x355>
      if (!__f)
 355:	48 89 c6             	mov    %rax,%rsi
 358:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 35c:	31 d2                	xor    %edx,%edx
 35e:	41 b8 00 35 0c 00    	mov    $0xc3500,%r8d
 364:	4c 89 e1             	mov    %r12,%rcx
 367:	e8 00 00 00 00       	callq  36c <_Z17measure_sqrt_timeILy4EEvv+0x36c>
 36c:	ff cb                	dec    %ebx
 36e:	75 ec                	jne    35c <_Z17measure_sqrt_timeILy4EEvv+0x35c>
       start = steady_clock::now();
 370:	e8 00 00 00 00       	callq  375 <_Z17measure_sqrt_timeILy4EEvv+0x375>
 375:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 37c:	9b c4 20 
    { return __os.flush(); }
 37f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 383:	48 29 f0             	sub    %rsi,%rax
 386:	48 89 c1             	mov    %rax,%rcx
 389:	48 f7 ea             	imul   %rdx
 38c:	48 c1 f9 3f          	sar    $0x3f,%rcx
 390:	48 c1 fa 07          	sar    $0x7,%rdx
 394:	48 29 ca             	sub    %rcx,%rdx
 397:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 39e <_Z17measure_sqrt_timeILy4EEvv+0x39e>
 39e:	e8 00 00 00 00       	callq  3a3 <_Z17measure_sqrt_timeILy4EEvv+0x3a3>
          roots[i + k] = sqrt(floats[i + k]);
 3a3:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 3a9:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 3e4 <_Z17measure_sqrt_timeILy4EEvv+0x3e4>
 3b0:	48 89 c6             	mov    %rax,%rsi
 3b3:	48 89 c1             	mov    %rax,%rcx
 3b6:	e8 00 00 00 00       	callq  3bb <_Z17measure_sqrt_timeILy4EEvv+0x3bb>
 3bb:	48 8b 06             	mov    (%rsi),%rax
 3be:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 3c2:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 3c9:	00 
 3ca:	48 85 db             	test   %rbx,%rbx
 3cd:	0f 84 92 fe ff ff    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
 3d3:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 3d7:	0f 84 7e 04 00 00    	je     85b <_Z17measure_sqrt_timeILy4EEvv+0x85b>
 3dd:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 3e1:	48 89 f1             	mov    %rsi,%rcx
 3e4:	e8 00 00 00 00       	callq  3e9 <_Z17measure_sqrt_timeILy4EEvv+0x3e9>
 3e9:	48 89 c1             	mov    %rax,%rcx
 3ec:	e8 00 00 00 00       	callq  3f1 <_Z17measure_sqrt_timeILy4EEvv+0x3f1>
 3f1:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 3f8 <_Z17measure_sqrt_timeILy4EEvv+0x3f8>
 3f8:	41 b8 39 00 00 00    	mov    $0x39,%r8d
 3fe:	48 8d 15 78 00 00 00 	lea    0x78(%rip),%rdx        # 47d <_Z17measure_sqrt_timeILy4EEvv+0x47d>
 405:	e8 00 00 00 00       	callq  40a <_Z17measure_sqrt_timeILy4EEvv+0x40a>
 40a:	49 8b 45 00          	mov    0x0(%r13),%rax
 40e:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 412:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 419:	00 
 41a:	48 85 db             	test   %rbx,%rbx
 41d:	0f 84 42 fe ff ff    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
      for (int i = 0; i < 4 * N; i += 4) {
 423:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
          roots[i + k] = sqrt(floats[i + k]);
 427:	0f 84 cc 03 00 00    	je     7f9 <_Z17measure_sqrt_timeILy4EEvv+0x7f9>
 42d:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 431:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 438 <_Z17measure_sqrt_timeILy4EEvv+0x438>
 438:	e8 00 00 00 00       	callq  43d <_Z17measure_sqrt_timeILy4EEvv+0x43d>
 43d:	48 89 c1             	mov    %rax,%rcx
 440:	e8 00 00 00 00       	callq  445 <_Z17measure_sqrt_timeILy4EEvv+0x445>
	__throw_bad_cast();
 445:	e8 00 00 00 00       	callq  44a <_Z17measure_sqrt_timeILy4EEvv+0x44a>
 44a:	ba e8 03 00 00       	mov    $0x3e8,%edx
 44f:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    for (int j = 0; j < LOOP; j++) {
 453:	48 89 c3             	mov    %rax,%rbx
 456:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
       end = steady_clock::now();
 45a:	4c 89 e0             	mov    %r12,%rax
 45d:	0f 1f 00             	nopl   (%rax)
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 460:	c5 f8 29 00          	vmovaps %xmm0,(%rax)
 464:	48 83 c0 10          	add    $0x10,%rax
 468:	48 39 c7             	cmp    %rax,%rdi
 46b:	75 f3                	jne    460 <_Z17measure_sqrt_timeILy4EEvv+0x460>
 46d:	ff ca                	dec    %edx
 46f:	75 e9                	jne    45a <_Z17measure_sqrt_timeILy4EEvv+0x45a>
 471:	e8 00 00 00 00       	callq  476 <_Z17measure_sqrt_timeILy4EEvv+0x476>
 476:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 47d:	9b c4 20 
 480:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
      { return _M_insert(__n); }
 484:	48 29 d8             	sub    %rbx,%rax
 487:	48 89 c1             	mov    %rax,%rcx
 48a:	48 f7 ea             	imul   %rdx
	__ostream_insert(__out, __s,
 48d:	48 c1 f9 3f          	sar    $0x3f,%rcx
 491:	48 c1 fa 07          	sar    $0x7,%rdx
 495:	48 29 ca             	sub    %rcx,%rdx
 498:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 49f <_Z17measure_sqrt_timeILy4EEvv+0x49f>
 49f:	e8 00 00 00 00       	callq  4a4 <_Z17measure_sqrt_timeILy4EEvv+0x4a4>
 4a4:	41 b8 05 00 00 00    	mov    $0x5,%r8d
      { return __check_facet(_M_ctype).widen(__c); }
 4aa:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 4e5 <_Z17measure_sqrt_timeILy4EEvv+0x4e5>
 4b1:	48 89 c6             	mov    %rax,%rsi
      if (!__f)
 4b4:	48 89 c1             	mov    %rax,%rcx
 4b7:	e8 00 00 00 00       	callq  4bc <_Z17measure_sqrt_timeILy4EEvv+0x4bc>
 4bc:	48 8b 06             	mov    (%rsi),%rax
 4bf:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 4c3:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 4ca:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 4cb:	48 85 db             	test   %rbx,%rbx
 4ce:	0f 84 91 fd ff ff    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
    { return __os.flush(); }
 4d4:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
	__ostream_insert(__out, __s,
 4d8:	0f 84 a3 04 00 00    	je     981 <_Z17measure_sqrt_timeILy4EEvv+0x981>
 4de:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 4e2:	48 89 f1             	mov    %rsi,%rcx
 4e5:	e8 00 00 00 00       	callq  4ea <_Z17measure_sqrt_timeILy4EEvv+0x4ea>
 4ea:	48 89 c1             	mov    %rax,%rcx
 4ed:	e8 00 00 00 00       	callq  4f2 <_Z17measure_sqrt_timeILy4EEvv+0x4f2>
    { return flush(__os.put(__os.widen('\n'))); }
 4f2:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 4f9 <_Z17measure_sqrt_timeILy4EEvv+0x4f9>
      { return __check_facet(_M_ctype).widen(__c); }
 4f9:	41 b8 2e 00 00 00    	mov    $0x2e,%r8d
 4ff:	48 8d 15 b8 00 00 00 	lea    0xb8(%rip),%rdx        # 5be <_Z17measure_sqrt_timeILy4EEvv+0x5be>
      if (!__f)
 506:	e8 00 00 00 00       	callq  50b <_Z17measure_sqrt_timeILy4EEvv+0x50b>
 50b:	49 8b 45 00          	mov    0x0(%r13),%rax
 50f:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 513:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 51a:	00 
 51b:	48 85 db             	test   %rbx,%rbx
       start = steady_clock::now();
 51e:	0f 84 41 fd ff ff    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
 524:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
    { return __os.flush(); }
 528:	0f 84 22 04 00 00    	je     950 <_Z17measure_sqrt_timeILy4EEvv+0x950>
 52e:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 532:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 539 <_Z17measure_sqrt_timeILy4EEvv+0x539>
 539:	e8 00 00 00 00       	callq  53e <_Z17measure_sqrt_timeILy4EEvv+0x53e>
 53e:	48 89 c1             	mov    %rax,%rcx
 541:	e8 00 00 00 00       	callq  546 <_Z17measure_sqrt_timeILy4EEvv+0x546>
 546:	e8 00 00 00 00       	callq  54b <_Z17measure_sqrt_timeILy4EEvv+0x54b>
 54b:	48 89 c3             	mov    %rax,%rbx
    for (int j = 0; j < LOOP; j++) {
 54e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
       end = steady_clock::now();
 552:	e8 00 00 00 00       	callq  557 <_Z17measure_sqrt_timeILy4EEvv+0x557>
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 557:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 55b:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 562:	9b c4 20 
 565:	48 29 d8             	sub    %rbx,%rax
 568:	48 89 c1             	mov    %rax,%rcx
 56b:	48 f7 ea             	imul   %rdx
 56e:	48 c1 f9 3f          	sar    $0x3f,%rcx
 572:	48 c1 fa 07          	sar    $0x7,%rdx
 576:	48 29 ca             	sub    %rcx,%rdx
      { return _M_insert(__n); }
 579:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 580 <_Z17measure_sqrt_timeILy4EEvv+0x580>
 580:	e8 00 00 00 00       	callq  585 <_Z17measure_sqrt_timeILy4EEvv+0x585>
	__ostream_insert(__out, __s,
 585:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 58b:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 5c6 <_Z17measure_sqrt_timeILy4EEvv+0x5c6>
      { return _M_insert(__n); }
 592:	48 89 c6             	mov    %rax,%rsi
	__ostream_insert(__out, __s,
 595:	48 89 c1             	mov    %rax,%rcx
 598:	e8 00 00 00 00       	callq  59d <_Z17measure_sqrt_timeILy4EEvv+0x59d>
    { return flush(__os.put(__os.widen('\n'))); }
 59d:	48 8b 06             	mov    (%rsi),%rax
      { return __check_facet(_M_ctype).widen(__c); }
 5a0:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 5a4:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 5ab:	00 
      if (!__f)
 5ac:	48 85 db             	test   %rbx,%rbx
 5af:	0f 84 b0 fc ff ff    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
 5b5:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 5b9:	0f 84 fe 02 00 00    	je     8bd <_Z17measure_sqrt_timeILy4EEvv+0x8bd>
 5bf:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 5c3:	48 89 f1             	mov    %rsi,%rcx
 5c6:	e8 00 00 00 00       	callq  5cb <_Z17measure_sqrt_timeILy4EEvv+0x5cb>
    { return __os.flush(); }
 5cb:	48 89 c1             	mov    %rax,%rcx
 5ce:	e8 00 00 00 00       	callq  5d3 <_Z17measure_sqrt_timeILy4EEvv+0x5d3>
	__ostream_insert(__out, __s,
 5d3:	e8 00 00 00 00       	callq  5d8 <_Z17measure_sqrt_timeILy4EEvv+0x5d8>
 5d8:	ba e8 03 00 00       	mov    $0x3e8,%edx
 5dd:	c5 f8 28 25 50 01 00 	vmovaps 0x150(%rip),%xmm4        # 735 <_Z17measure_sqrt_timeILy4EEvv+0x735>
 5e4:	00 
 5e5:	c5 f8 28 1d 60 01 00 	vmovaps 0x160(%rip),%xmm3        # 74d <_Z17measure_sqrt_timeILy4EEvv+0x74d>
 5ec:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 5ed:	48 89 c6             	mov    %rax,%rsi
      { return __check_facet(_M_ctype).widen(__c); }
 5f0:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 5f4:	31 c0                	xor    %eax,%eax
 5f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 5fd:	00 00 00 
      if (!__f)
 600:	c5 f8 28 04 07       	vmovaps (%rdi,%rax,1),%xmm0
 605:	48 83 c0 10          	add    $0x10,%rax
 609:	c5 e9 72 e0 01       	vpsrad $0x1,%xmm0,%xmm2
 60e:	c5 e9 fe cc          	vpaddd %xmm4,%xmm2,%xmm1
 612:	c5 f8 5e d1          	vdivps %xmm1,%xmm0,%xmm2
 616:	c5 e8 58 d1          	vaddps %xmm1,%xmm2,%xmm2
 61a:	c5 e8 59 d3          	vmulps %xmm3,%xmm2,%xmm2
    { return __os.flush(); }
 61e:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 622:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
       start = steady_clock::now();
 626:	c5 f0 59 d3          	vmulps %xmm3,%xmm1,%xmm2
 62a:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 62e:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
          roots[i + k] = sqrt1<LOOPS>(floats + i + k);
 632:	c5 f0 59 cb          	vmulps %xmm3,%xmm1,%xmm1
 636:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 63a:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
 63e:	c5 f8 59 c3          	vmulps %xmm3,%xmm0,%xmm0
 642:	c4 a1 78 29 44 20 f0 	vmovaps %xmm0,-0x10(%rax,%r12,1)
 649:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
    for (int j = 0; j < LOOP; j++) {
 64f:	75 af                	jne    600 <_Z17measure_sqrt_timeILy4EEvv+0x600>
       end = steady_clock::now();
 651:	ff ca                	dec    %edx
 653:	75 9f                	jne    5f4 <_Z17measure_sqrt_timeILy4EEvv+0x5f4>
 655:	e8 00 00 00 00       	callq  65a <_Z17measure_sqrt_timeILy4EEvv+0x65a>
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 65a:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 661 <_Z17measure_sqrt_timeILy4EEvv+0x661>
 661:	41 b8 34 00 00 00    	mov    $0x34,%r8d
 667:	48 8d 15 e8 00 00 00 	lea    0xe8(%rip),%rdx        # 756 <_Z17measure_sqrt_timeILy4EEvv+0x756>
 66e:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 672:	48 29 f0             	sub    %rsi,%rax
 675:	48 89 c3             	mov    %rax,%rbx
      { return _M_insert(__n); }
 678:	e8 00 00 00 00       	callq  67d <_Z17measure_sqrt_timeILy4EEvv+0x67d>
 67d:	49 8b 45 00          	mov    0x0(%r13),%rax
 681:	48 8b 40 e8          	mov    -0x18(%rax),%rax
	__ostream_insert(__out, __s,
 685:	49 8b b4 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rsi
 68c:	00 
 68d:	48 85 f6             	test   %rsi,%rsi
 690:	0f 84 cf fb ff ff    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
 696:	80 7e 38 00          	cmpb   $0x0,0x38(%rsi)
 69a:	0f 84 7f 02 00 00    	je     91f <_Z17measure_sqrt_timeILy4EEvv+0x91f>
      { return __check_facet(_M_ctype).widen(__c); }
 6a0:	0f be 56 43          	movsbl 0x43(%rsi),%edx
 6a4:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 6ab <_Z17measure_sqrt_timeILy4EEvv+0x6ab>
      if (!__f)
 6ab:	e8 00 00 00 00       	callq  6b0 <_Z17measure_sqrt_timeILy4EEvv+0x6b0>
 6b0:	48 89 c1             	mov    %rax,%rcx
 6b3:	e8 00 00 00 00       	callq  6b8 <_Z17measure_sqrt_timeILy4EEvv+0x6b8>
 6b8:	48 89 d8             	mov    %rbx,%rax
 6bb:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 6c2:	9b c4 20 
    { return flush(__os.put(__os.widen('\n'))); }
 6c5:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 6cc <_Z17measure_sqrt_timeILy4EEvv+0x6cc>
    { return __os.flush(); }
 6cc:	48 c1 fb 3f          	sar    $0x3f,%rbx
 6d0:	48 f7 ea             	imul   %rdx
	__ostream_insert(__out, __s,
 6d3:	48 c1 fa 07          	sar    $0x7,%rdx
 6d7:	48 29 da             	sub    %rbx,%rdx
 6da:	e8 00 00 00 00       	callq  6df <_Z17measure_sqrt_timeILy4EEvv+0x6df>
 6df:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 6e5:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 720 <_Z17measure_sqrt_timeILy4EEvv+0x720>
    { return flush(__os.put(__os.widen('\n'))); }
 6ec:	48 89 c6             	mov    %rax,%rsi
      { return __check_facet(_M_ctype).widen(__c); }
 6ef:	48 89 c1             	mov    %rax,%rcx
 6f2:	e8 00 00 00 00       	callq  6f7 <_Z17measure_sqrt_timeILy4EEvv+0x6f7>
 6f7:	48 8b 06             	mov    (%rsi),%rax
 6fa:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      if (!__f)
 6fe:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 705:	00 
 706:	48 85 db             	test   %rbx,%rbx
 709:	0f 84 56 fb ff ff    	je     265 <_Z17measure_sqrt_timeILy4EEvv+0x265>
 70f:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 713:	0f 84 d5 01 00 00    	je     8ee <_Z17measure_sqrt_timeILy4EEvv+0x8ee>
 719:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 71d:	48 89 f1             	mov    %rsi,%rcx
    { return __os.flush(); }
 720:	e8 00 00 00 00       	callq  725 <_Z17measure_sqrt_timeILy4EEvv+0x725>
 725:	90                   	nop
       start = steady_clock::now();
 726:	c5 f8 28 75 d0       	vmovaps -0x30(%rbp),%xmm6
 72b:	c5 f8 28 7d e0       	vmovaps -0x20(%rbp),%xmm7
 730:	48 89 c1             	mov    %rax,%rcx
       end = steady_clock::now();
 733:	48 8d 65 f8          	lea    -0x8(%rbp),%rsp
 737:	5b                   	pop    %rbx
 738:	5e                   	pop    %rsi
 739:	5f                   	pop    %rdi
 73a:	41 5c                	pop    %r12
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 73c:	41 5d                	pop    %r13
 73e:	41 5e                	pop    %r14
 740:	41 5f                	pop    %r15
 742:	5d                   	pop    %rbp
 743:	e9 00 00 00 00       	jmpq   748 <_Z17measure_sqrt_timeILy4EEvv+0x748>
 748:	e8 00 00 00 00       	callq  74d <_Z17measure_sqrt_timeILy4EEvv+0x74d>
 74d:	e9 d9 fa ff ff       	jmpq   22b <_Z17measure_sqrt_timeILy4EEvv+0x22b>
 752:	e8 00 00 00 00       	callq  757 <_Z17measure_sqrt_timeILy4EEvv+0x757>
 757:	e9 ab fa ff ff       	jmpq   207 <_Z17measure_sqrt_timeILy4EEvv+0x207>
      { return _M_insert(__n); }
 75c:	e8 00 00 00 00       	callq  761 <_Z17measure_sqrt_timeILy4EEvv+0x761>
 761:	e9 7d fa ff ff       	jmpq   1e3 <_Z17measure_sqrt_timeILy4EEvv+0x1e3>
	__ostream_insert(__out, __s,
 766:	48 89 d9             	mov    %rbx,%rcx
 769:	e8 00 00 00 00       	callq  76e <_Z17measure_sqrt_timeILy4EEvv+0x76e>
 76e:	48 8b 03             	mov    (%rbx),%rax
 771:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 778 <_Z17measure_sqrt_timeILy4EEvv+0x778>
 778:	ba 0a 00 00 00       	mov    $0xa,%edx
    { return flush(__os.put(__os.widen('\n'))); }
 77d:	48 8b 40 30          	mov    0x30(%rax),%rax
      { return __check_facet(_M_ctype).widen(__c); }
 781:	48 39 c8             	cmp    %rcx,%rax
 784:	0f 84 78 f9 ff ff    	je     102 <_Z17measure_sqrt_timeILy4EEvv+0x102>
 78a:	48 89 d9             	mov    %rbx,%rcx
      if (!__f)
 78d:	ff d0                	callq  *%rax
 78f:	0f be d0             	movsbl %al,%edx
 792:	e9 6b f9 ff ff       	jmpq   102 <_Z17measure_sqrt_timeILy4EEvv+0x102>
 797:	48 89 d9             	mov    %rbx,%rcx
 79a:	e8 00 00 00 00       	callq  79f <_Z17measure_sqrt_timeILy4EEvv+0x79f>
 79f:	48 8b 03             	mov    (%rbx),%rax
 7a2:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 7a9 <_Z17measure_sqrt_timeILy4EEvv+0x7a9>
 7a9:	ba 0a 00 00 00       	mov    $0xa,%edx
    { return __os.flush(); }
 7ae:	48 8b 40 30          	mov    0x30(%rax),%rax
 7b2:	48 39 c8             	cmp    %rcx,%rax
       start = steady_clock::now();
 7b5:	0f 84 cf f8 ff ff    	je     8a <_Z17measure_sqrt_timeILy4EEvv+0x8a>
 7bb:	48 89 d9             	mov    %rbx,%rcx
 7be:	ff d0                	callq  *%rax
 7c0:	0f be d0             	movsbl %al,%edx
 7c3:	e9 c2 f8 ff ff       	jmpq   8a <_Z17measure_sqrt_timeILy4EEvv+0x8a>
 7c8:	48 89 d9             	mov    %rbx,%rcx
 7cb:	e8 00 00 00 00       	callq  7d0 <_Z17measure_sqrt_timeILy4EEvv+0x7d0>
 7d0:	48 8b 03             	mov    (%rbx),%rax
 7d3:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 7da <_Z17measure_sqrt_timeILy4EEvv+0x7da>
 7da:	ba 0a 00 00 00       	mov    $0xa,%edx
 7df:	48 8b 40 30          	mov    0x30(%rax),%rax
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 7e3:	48 39 c8             	cmp    %rcx,%rax
 7e6:	0f 84 9c f9 ff ff    	je     188 <_Z17measure_sqrt_timeILy4EEvv+0x188>
 7ec:	48 89 d9             	mov    %rbx,%rcx
 7ef:	ff d0                	callq  *%rax
 7f1:	0f be d0             	movsbl %al,%edx
    * root = 0.5 * (* root + (* a / * root));
 7f4:	e9 8f f9 ff ff       	jmpq   188 <_Z17measure_sqrt_timeILy4EEvv+0x188>
 7f9:	48 89 d9             	mov    %rbx,%rcx
 7fc:	e8 00 00 00 00       	callq  801 <_Z17measure_sqrt_timeILy4EEvv+0x801>
 801:	48 8b 03             	mov    (%rbx),%rax
 804:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 80b <_Z17measure_sqrt_timeILy4EEvv+0x80b>
 80b:	ba 0a 00 00 00       	mov    $0xa,%edx
 810:	48 8b 40 30          	mov    0x30(%rax),%rax
      for (int i = 0; i < 4 * N; i += 4) {
 814:	48 39 c8             	cmp    %rcx,%rax
 817:	0f 84 14 fc ff ff    	je     431 <_Z17measure_sqrt_timeILy4EEvv+0x431>
       end = steady_clock::now();
 81d:	48 89 d9             	mov    %rbx,%rcx
 820:	ff d0                	callq  *%rax
	__ostream_insert(__out, __s,
 822:	0f be d0             	movsbl %al,%edx
 825:	e9 07 fc ff ff       	jmpq   431 <_Z17measure_sqrt_timeILy4EEvv+0x431>
 82a:	48 89 d9             	mov    %rbx,%rcx
 82d:	e8 00 00 00 00       	callq  832 <_Z17measure_sqrt_timeILy4EEvv+0x832>
 832:	48 8b 03             	mov    (%rbx),%rax
 835:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 83c <_Z17measure_sqrt_timeILy4EEvv+0x83c>
 83c:	ba 0a 00 00 00       	mov    $0xa,%edx
 841:	48 8b 40 30          	mov    0x30(%rax),%rax
    { return flush(__os.put(__os.widen('\n'))); }
 845:	48 39 c8             	cmp    %rcx,%rax
 848:	0f 84 e9 fa ff ff    	je     337 <_Z17measure_sqrt_timeILy4EEvv+0x337>
      { return __check_facet(_M_ctype).widen(__c); }
 84e:	48 89 d9             	mov    %rbx,%rcx
 851:	ff d0                	callq  *%rax
 853:	0f be d0             	movsbl %al,%edx
      if (!__f)
 856:	e9 dc fa ff ff       	jmpq   337 <_Z17measure_sqrt_timeILy4EEvv+0x337>
 85b:	48 89 d9             	mov    %rbx,%rcx
 85e:	e8 00 00 00 00       	callq  863 <_Z17measure_sqrt_timeILy4EEvv+0x863>
 863:	48 8b 03             	mov    (%rbx),%rax
 866:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 86d <_Z17measure_sqrt_timeILy4EEvv+0x86d>
 86d:	ba 0a 00 00 00       	mov    $0xa,%edx
 872:	48 8b 40 30          	mov    0x30(%rax),%rax
 876:	48 39 c8             	cmp    %rcx,%rax
    { return __os.flush(); }
 879:	0f 84 62 fb ff ff    	je     3e1 <_Z17measure_sqrt_timeILy4EEvv+0x3e1>
 87f:	48 89 d9             	mov    %rbx,%rcx
    std::cout << time.time_clock().count() / LOOP  << " [ns]" << std::endl;
 882:	ff d0                	callq  *%rax
 884:	0f be d0             	movsbl %al,%edx
 887:	e9 55 fb ff ff       	jmpq   3e1 <_Z17measure_sqrt_timeILy4EEvv+0x3e1>
 88c:	48 89 d9             	mov    %rbx,%rcx
      { return _M_insert(__n); }
 88f:	e8 00 00 00 00       	callq  894 <_Z17measure_sqrt_timeILy4EEvv+0x894>
 894:	48 8b 03             	mov    (%rbx),%rax
 897:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 89e <_Z17measure_sqrt_timeILy4EEvv+0x89e>
 89e:	ba 0a 00 00 00       	mov    $0xa,%edx
 8a3:	48 8b 40 30          	mov    0x30(%rax),%rax
	__ostream_insert(__out, __s,
 8a7:	48 39 c8             	cmp    %rcx,%rax
 8aa:	0f 84 37 fa ff ff    	je     2e7 <_Z17measure_sqrt_timeILy4EEvv+0x2e7>
 8b0:	48 89 d9             	mov    %rbx,%rcx
 8b3:	ff d0                	callq  *%rax
      { return _M_insert(__n); }
 8b5:	0f be d0             	movsbl %al,%edx
	__ostream_insert(__out, __s,
 8b8:	e9 2a fa ff ff       	jmpq   2e7 <_Z17measure_sqrt_timeILy4EEvv+0x2e7>
 8bd:	48 89 d9             	mov    %rbx,%rcx
    { return flush(__os.put(__os.widen('\n'))); }
 8c0:	e8 00 00 00 00       	callq  8c5 <_Z17measure_sqrt_timeILy4EEvv+0x8c5>
      { return __check_facet(_M_ctype).widen(__c); }
 8c5:	48 8b 03             	mov    (%rbx),%rax
 8c8:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 8cf <_Z17measure_sqrt_timeILy4EEvv+0x8cf>
      if (!__f)
 8cf:	ba 0a 00 00 00       	mov    $0xa,%edx
 8d4:	48 8b 40 30          	mov    0x30(%rax),%rax
 8d8:	48 39 c8             	cmp    %rcx,%rax
 8db:	0f 84 e2 fc ff ff    	je     5c3 <_Z17measure_sqrt_timeILy4EEvv+0x5c3>
 8e1:	48 89 d9             	mov    %rbx,%rcx
 8e4:	ff d0                	callq  *%rax
 8e6:	0f be d0             	movsbl %al,%edx
 8e9:	e9 d5 fc ff ff       	jmpq   5c3 <_Z17measure_sqrt_timeILy4EEvv+0x5c3>
}
 8ee:	48 89 d9             	mov    %rbx,%rcx
 8f1:	e8 00 00 00 00       	callq  8f6 <_Z17measure_sqrt_timeILy4EEvv+0x8f6>
 8f6:	48 8b 03             	mov    (%rbx),%rax
    { return __os.flush(); }
 8f9:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 900 <_Z17measure_sqrt_timeILy4EEvv+0x900>
 900:	ba 0a 00 00 00       	mov    $0xa,%edx
 905:	48 8b 40 30          	mov    0x30(%rax),%rax
 909:	48 39 c8             	cmp    %rcx,%rax
 90c:	0f 84 0b fe ff ff    	je     71d <_Z17measure_sqrt_timeILy4EEvv+0x71d>
          roots[i + k] = sqrt(floats[i + k]);
 912:	48 89 d9             	mov    %rbx,%rcx
 915:	ff d0                	callq  *%rax
 917:	0f be d0             	movsbl %al,%edx
 91a:	e9 fe fd ff ff       	jmpq   71d <_Z17measure_sqrt_timeILy4EEvv+0x71d>
 91f:	48 89 f1             	mov    %rsi,%rcx
 922:	e8 00 00 00 00       	callq  927 <_Z17measure_sqrt_timeILy4EEvv+0x927>
 927:	48 8b 06             	mov    (%rsi),%rax
 92a:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 931 <_Z17measure_sqrt_timeILy4EEvv+0x931>
	this->_M_widen_init();
 931:	ba 0a 00 00 00       	mov    $0xa,%edx
	return this->do_widen(__c);
 936:	48 8b 40 30          	mov    0x30(%rax),%rax
 93a:	48 39 c8             	cmp    %rcx,%rax
 93d:	0f 84 61 fd ff ff    	je     6a4 <_Z17measure_sqrt_timeILy4EEvv+0x6a4>
 943:	48 89 f1             	mov    %rsi,%rcx
 946:	ff d0                	callq  *%rax
 948:	0f be d0             	movsbl %al,%edx
 94b:	e9 54 fd ff ff       	jmpq   6a4 <_Z17measure_sqrt_timeILy4EEvv+0x6a4>
 950:	48 89 d9             	mov    %rbx,%rcx
 953:	e8 00 00 00 00       	callq  958 <_Z17measure_sqrt_timeILy4EEvv+0x958>
 958:	48 8b 03             	mov    (%rbx),%rax
 95b:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 962 <_Z17measure_sqrt_timeILy4EEvv+0x962>
	this->_M_widen_init();
 962:	ba 0a 00 00 00       	mov    $0xa,%edx
	return this->do_widen(__c);
 967:	48 8b 40 30          	mov    0x30(%rax),%rax
 96b:	48 39 c8             	cmp    %rcx,%rax
 96e:	0f 84 be fb ff ff    	je     532 <_Z17measure_sqrt_timeILy4EEvv+0x532>
 974:	48 89 d9             	mov    %rbx,%rcx
 977:	ff d0                	callq  *%rax
 979:	0f be d0             	movsbl %al,%edx
 97c:	e9 b1 fb ff ff       	jmpq   532 <_Z17measure_sqrt_timeILy4EEvv+0x532>
 981:	48 89 d9             	mov    %rbx,%rcx
 984:	e8 00 00 00 00       	callq  989 <_Z17measure_sqrt_timeILy4EEvv+0x989>
 989:	48 8b 03             	mov    (%rbx),%rax
 98c:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 993 <_Z17measure_sqrt_timeILy4EEvv+0x993>
	this->_M_widen_init();
 993:	ba 0a 00 00 00       	mov    $0xa,%edx
	return this->do_widen(__c);
 998:	48 8b 40 30          	mov    0x30(%rax),%rax
 99c:	48 39 c8             	cmp    %rcx,%rax
 99f:	0f 84 3d fb ff ff    	je     4e2 <_Z17measure_sqrt_timeILy4EEvv+0x4e2>
 9a5:	48 89 d9             	mov    %rbx,%rcx
 9a8:	ff d0                	callq  *%rax
 9aa:	0f be d0             	movsbl %al,%edx
 9ad:	e9 30 fb ff ff       	jmpq   4e2 <_Z17measure_sqrt_timeILy4EEvv+0x4e2>
 9b2:	90                   	nop
 9b3:	90                   	nop
 9b4:	90                   	nop
 9b5:	90                   	nop
 9b6:	90                   	nop
 9b7:	90                   	nop
 9b8:	90                   	nop
 9b9:	90                   	nop
 9ba:	90                   	nop
 9bb:	90                   	nop
 9bc:	90                   	nop
 9bd:	90                   	nop
 9be:	90                   	nop
 9bf:	90                   	nop

Disassembly of section .text.startup:

0000000000000000 <main>:
   0:	48 83 ec 28          	sub    $0x28,%rsp
   4:	e8 00 00 00 00       	callq  9 <main+0x9>
   9:	e8 00 00 00 00       	callq  e <main+0xe>
   e:	e8 00 00 00 00       	callq  13 <main+0x13>
{
  13:	e8 00 00 00 00       	callq  18 <main+0x18>
  18:	31 c0                	xor    %eax,%eax
  1a:	48 83 c4 28          	add    $0x28,%rsp
  static std::random_device device;
  1e:	c3                   	retq   
  1f:	90                   	nop

0000000000000020 <_GLOBAL__sub_I__Z13random_doublev>:
  20:	48 83 ec 28          	sub    $0x28,%rsp
  24:	48 8d 0d 08 0a 00 00 	lea    0xa08(%rip),%rcx        # a33 <_ZStL8__ioinit+0x2b>
  2b:	e8 00 00 00 00       	callq  30 <_GLOBAL__sub_I__Z13random_doublev+0x10>
  30:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 37 <_GLOBAL__sub_I__Z13random_doublev+0x17>
  37:	48 83 c4 28          	add    $0x28,%rsp
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  3b:	e9 00 00 00 00       	jmpq   40 <_ZZ13random_doublevE6device>
