
sqrt_opt.o:     file format pe-x86-64


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
  4d:	48 8d bc 24 9f 00 00 	lea    0x9f(%rsp),%rdi
  54:	00 
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
  55:	48 89 c6             	mov    %rax,%rsi
  58:	48 89 c1             	mov    %rax,%rcx
  5b:	48 83 e7 80          	and    $0xffffffffffffff80,%rdi
  5f:	e8 00 00 00 00       	callq  64 <_Z17measure_sqrt_timeILy2EEvv+0x64>
  64:	48 8b 06             	mov    (%rsi),%rax
  67:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  6b:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  72:	00 
  73:	48 85 db             	test   %rbx,%rbx
  76:	0f 84 e9 01 00 00    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
  7c:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
  80:	0f 84 59 08 00 00    	je     8df <_Z17measure_sqrt_timeILy2EEvv+0x8df>
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
  f8:	0f 84 b0 07 00 00    	je     8ae <_Z17measure_sqrt_timeILy2EEvv+0x8ae>
	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
  fe:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 102:	48 89 f1             	mov    %rsi,%rcx
    { _M_init_pretr1(__token); }
 105:	4c 8d a7 00 35 0c 00 	lea    0xc3500(%rdi),%r12
      { _M_string_length = __length; }
 10c:	48 8d 9f 00 6a 18 00 	lea    0x186a00(%rdi),%rbx
	: allocator_type(__a), _M_p(__dat) { }
 113:	e8 00 00 00 00       	callq  118 <_Z17measure_sqrt_timeILy2EEvv+0x118>
 118:	4d 89 e6             	mov    %r12,%r14
 11b:	48 89 c1             	mov    %rax,%rcx
 11e:	e8 00 00 00 00       	callq  123 <_Z17measure_sqrt_timeILy2EEvv+0x123>
 123:	e8 10 00 00 00       	callq  138 <_Z17measure_sqrt_timeILy2EEvv+0x138>
 128:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
      { __c1 = __c2; }
 12c:	49 83 c6 04          	add    $0x4,%r14
 130:	c5 d3 5a e8          	vcvtsd2ss %xmm0,%xmm5,%xmm5
  static std::random_device device;
 134:	c4 c1 7a 11 6e fc    	vmovss %xmm5,-0x4(%r14)
	if (!_M_is_local())
 13a:	49 39 de             	cmp    %rbx,%r14
 13d:	75 e4                	jne    123 <_Z17measure_sqrt_timeILy2EEvv+0x123>
 13f:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 146 <_Z17measure_sqrt_timeILy2EEvv+0x146>
 146:	41 b8 09 00 00 00    	mov    $0x9,%r8d
 14c:	48 8d 15 2a 00 00 00 	lea    0x2a(%rip),%rdx        # 17d <_Z17measure_sqrt_timeILy2EEvv+0x17d>
 153:	e8 00 00 00 00       	callq  158 <_Z17measure_sqrt_timeILy2EEvv+0x158>
 158:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 15f <_Z17measure_sqrt_timeILy2EEvv+0x15f>
 15f:	49 8b 45 00          	mov    0x0(%r13),%rax
	  __ret = std::nextafter(_RealType(1), _RealType(0));
 163:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 167:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 16e:	00 
 16f:	48 85 db             	test   %rbx,%rbx
 172:	0f 84 ed 00 00 00    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 178:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 17c:	0f 84 8e 07 00 00    	je     910 <_Z17measure_sqrt_timeILy2EEvv+0x910>
 182:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 186:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 18d <_Z17measure_sqrt_timeILy2EEvv+0x18d>
 18d:	e8 00 00 00 00       	callq  192 <_Z17measure_sqrt_timeILy2EEvv+0x192>
 192:	48 89 c1             	mov    %rax,%rcx
 195:	e8 00 00 00 00       	callq  19a <_Z17measure_sqrt_timeILy2EEvv+0x19a>
 19a:	e8 00 00 00 00       	callq  19f <_Z17measure_sqrt_timeILy2EEvv+0x19f>
 19f:	c7 45 ac e8 03 00 00 	movl   $0x3e8,-0x54(%rbp)
 1a6:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
 1aa:	49 89 c7             	mov    %rax,%r15
 1ad:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 1b1:	48 89 fe             	mov    %rdi,%rsi
 1b4:	4c 89 e3             	mov    %r12,%rbx
 1b7:	e9 89 00 00 00       	jmpq   245 <_Z17measure_sqrt_timeILy2EEvv+0x245>
 1bc:	0f 1f 40 00          	nopl   0x0(%rax)
 1c0:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1c4:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
 1c8:	c5 fa 5a 43 04       	vcvtss2sd 0x4(%rbx),%xmm0,%xmm0
 1cd:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 1d1:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1d5:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1d9:	c5 fa 11 2e          	vmovss %xmm5,(%rsi)
 1dd:	0f 87 c1 06 00 00    	ja     8a4 <_Z17measure_sqrt_timeILy2EEvv+0x8a4>

template <size_t LOOPS = 2>
void measure_sqrt_time(void) {
 1e3:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1e7:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 1eb:	c5 fa 5a 43 08       	vcvtss2sd 0x8(%rbx),%xmm0,%xmm0
 1f0:	c5 e3 5a df          	vcvtsd2ss %xmm7,%xmm3,%xmm3
 1f4:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1f8:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1fc:	c5 fa 11 5e 04       	vmovss %xmm3,0x4(%rsi)
 201:	0f 87 93 06 00 00    	ja     89a <_Z17measure_sqrt_timeILy2EEvv+0x89a>
 207:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 20b:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
      operator<<(long long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long long __n)
      { return _M_insert(__n); }
 20f:	c5 fa 5a 43 0c       	vcvtss2sd 0xc(%rbx),%xmm0,%xmm0
 214:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 218:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 21c:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
 220:	c5 fa 11 6e 08       	vmovss %xmm5,0x8(%rsi)
 225:	0f 87 65 06 00 00    	ja     890 <_Z17measure_sqrt_timeILy2EEvv+0x890>
 22b:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 22f:	48 83 c3 10          	add    $0x10,%rbx
 233:	48 83 c6 10          	add    $0x10,%rsi
      { return _M_insert(__n); }
 237:	c5 e3 5a df          	vcvtsd2ss %xmm7,%xmm3,%xmm3
 23b:	c5 fa 11 5e fc       	vmovss %xmm3,-0x4(%rsi)
	__ostream_insert(__out, __s,
 240:	49 39 de             	cmp    %rbx,%r14
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
 270:	ff 4d ac             	decl   -0x54(%rbp)
   *  This manipulator simply calls the stream's @c flush() member function.
  */
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
 273:	0f 85 38 ff ff ff    	jne    1b1 <_Z17measure_sqrt_timeILy2EEvv+0x1b1>
 279:	e8 00 00 00 00       	callq  27e <_Z17measure_sqrt_timeILy2EEvv+0x27e>
	__ostream_insert(__out, __s,
 27e:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 285:	9b c4 20 
 288:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 28c:	4c 29 f8             	sub    %r15,%rax
 28f:	48 89 c1             	mov    %rax,%rcx
 292:	48 f7 ea             	imul   %rdx
    MeasureTime<std::chrono::nanoseconds> time;
    alignas(128) float floats[N * 4];
    alignas(128) float roots[N * 4];

    std::cout << LOOPS  << " iterations" << std::endl;
    std::cout << "generating " << (4 * N) << " random values..." << std::endl;
 295:	48 c1 f9 3f          	sar    $0x3f,%rcx
 299:	48 c1 fa 07          	sar    $0x7,%rdx
 29d:	48 29 ca             	sub    %rcx,%rdx
 2a0:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2a7 <_Z17measure_sqrt_timeILy2EEvv+0x2a7>
 2a7:	e8 00 00 00 00       	callq  2ac <_Z17measure_sqrt_timeILy2EEvv+0x2ac>
 2ac:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 2b2:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 2ed <_Z17measure_sqrt_timeILy2EEvv+0x2ed>
 2b9:	48 89 c6             	mov    %rax,%rsi
    { return flush(__os.put(__os.widen('\n'))); }
 2bc:	48 89 c1             	mov    %rax,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 2bf:	e8 00 00 00 00       	callq  2c4 <_Z17measure_sqrt_timeILy2EEvv+0x2c4>
 2c4:	48 8b 06             	mov    (%rsi),%rax
 2c7:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      if (!__f)
 2cb:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 2d2:	00 
 2d3:	48 85 db             	test   %rbx,%rbx
 2d6:	74 8d                	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 2d8:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 2dc:	0f 84 85 07 00 00    	je     a67 <_Z17measure_sqrt_timeILy2EEvv+0xa67>
 2e2:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 2e6:	48 89 f1             	mov    %rsi,%rcx
 2e9:	e8 00 00 00 00       	callq  2ee <_Z17measure_sqrt_timeILy2EEvv+0x2ee>
 2ee:	48 89 c1             	mov    %rax,%rcx
 2f1:	e8 00 00 00 00       	callq  2f6 <_Z17measure_sqrt_timeILy2EEvv+0x2f6>
 2f6:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2fd <_Z17measure_sqrt_timeILy2EEvv+0x2fd>
    { return __os.flush(); }
 2fd:	41 b8 37 00 00 00    	mov    $0x37,%r8d
    for (int i = 0; i < 4 * N; i++) {
       floats[i] = random_double();
 303:	48 8d 15 40 00 00 00 	lea    0x40(%rip),%rdx        # 34a <_Z17measure_sqrt_timeILy2EEvv+0x34a>
 30a:	e8 00 00 00 00       	callq  30f <_Z17measure_sqrt_timeILy2EEvv+0x30f>
 30f:	49 8b 45 00          	mov    0x0(%r13),%rax
 313:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 317:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 31e:	00 
	__ostream_insert(__out, __s,
 31f:	48 85 db             	test   %rbx,%rbx
 322:	0f 84 3d ff ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 328:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 32c:	0f 84 0f 06 00 00    	je     941 <_Z17measure_sqrt_timeILy2EEvv+0x941>
 332:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 336:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33d <_Z17measure_sqrt_timeILy2EEvv+0x33d>
    { return flush(__os.put(__os.widen('\n'))); }
 33d:	e8 00 00 00 00       	callq  342 <_Z17measure_sqrt_timeILy2EEvv+0x342>
 342:	48 89 c1             	mov    %rax,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 345:	e8 00 00 00 00       	callq  34a <_Z17measure_sqrt_timeILy2EEvv+0x34a>
 34a:	e8 00 00 00 00       	callq  34f <_Z17measure_sqrt_timeILy2EEvv+0x34f>
      if (!__f)
 34f:	ba e8 03 00 00       	mov    $0x3e8,%edx
 354:	c5 f8 28 3d 50 01 00 	vmovaps 0x150(%rip),%xmm7        # 4ac <_Z17measure_sqrt_timeILy2EEvv+0x4ac>
 35b:	00 
 35c:	c5 f8 28 35 60 01 00 	vmovaps 0x160(%rip),%xmm6        # 4c4 <_Z17measure_sqrt_timeILy2EEvv+0x4c4>
 363:	00 
 364:	48 89 c3             	mov    %rax,%rbx
 367:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 36b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 370:	31 c0                	xor    %eax,%eax
    { return __os.flush(); }
 372:	c4 c1 78 28 04 04    	vmovaps (%r12,%rax,1),%xmm0
 378:	48 83 c0 10          	add    $0x10,%rax
   DURATION time = DURATION(0);
   bool stopped = true;
public:
   void start_clock() {
     if (stopped) {
       start = steady_clock::now();
 37c:	c5 f1 72 e0 01       	vpsrad $0x1,%xmm0,%xmm1
 381:	c5 f1 fe d7          	vpaddd %xmm7,%xmm1,%xmm2
 385:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 389:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 38d:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 391:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 395:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
 399:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
 39d:	c5 f8 29 44 38 f0    	vmovaps %xmm0,-0x10(%rax,%rdi,1)
    std::cout << "math sqrt" << std::endl;
    time.start_clock();
    for (int j = 0; j < LOOP; j++) {
      for (int i = 0; i < 4 * N; i += 4) {
        for (int k = 0; k < 4; k++) {
          roots[i + k] = sqrt(floats[i + k]);
 3a3:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
 3a9:	75 c7                	jne    372 <_Z17measure_sqrt_timeILy2EEvv+0x372>
 3ab:	ff ca                	dec    %edx
 3ad:	75 c1                	jne    370 <_Z17measure_sqrt_timeILy2EEvv+0x370>
 3af:	e8 00 00 00 00       	callq  3b4 <_Z17measure_sqrt_timeILy2EEvv+0x3b4>
 3b4:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 3bb:	9b c4 20 
 3be:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 3c2:	48 29 d8             	sub    %rbx,%rax
 3c5:	48 89 c1             	mov    %rax,%rcx
 3c8:	48 f7 ea             	imul   %rdx
 3cb:	48 c1 f9 3f          	sar    $0x3f,%rcx
 3cf:	48 c1 fa 07          	sar    $0x7,%rdx
 3d3:	48 29 ca             	sub    %rcx,%rdx
 3d6:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 3dd <_Z17measure_sqrt_timeILy2EEvv+0x3dd>
 3dd:	e8 00 00 00 00       	callq  3e2 <_Z17measure_sqrt_timeILy2EEvv+0x3e2>
 3e2:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 3e8:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 423 <_Z17measure_sqrt_timeILy2EEvv+0x423>
 3ef:	48 89 c6             	mov    %rax,%rsi
 3f2:	48 89 c1             	mov    %rax,%rcx
 3f5:	e8 00 00 00 00       	callq  3fa <_Z17measure_sqrt_timeILy2EEvv+0x3fa>
 3fa:	48 8b 06             	mov    (%rsi),%rax
 3fd:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 401:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 408:	00 
 409:	48 85 db             	test   %rbx,%rbx
 40c:	0f 84 53 fe ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 412:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 416:	0f 84 e9 05 00 00    	je     a05 <_Z17measure_sqrt_timeILy2EEvv+0xa05>
 41c:	0f be 53 43          	movsbl 0x43(%rbx),%edx
      for (int i = 0; i < 4 * N; i += 4) {
 420:	48 89 f1             	mov    %rsi,%rcx
 423:	e8 00 00 00 00       	callq  428 <_Z17measure_sqrt_timeILy2EEvv+0x428>
          roots[i + k] = sqrt(floats[i + k]);
 428:	48 89 c1             	mov    %rax,%rcx
 42b:	e8 00 00 00 00       	callq  430 <_Z17measure_sqrt_timeILy2EEvv+0x430>
 430:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 437 <_Z17measure_sqrt_timeILy2EEvv+0x437>
 437:	41 b8 39 00 00 00    	mov    $0x39,%r8d
 43d:	48 8d 15 78 00 00 00 	lea    0x78(%rip),%rdx        # 4bc <_Z17measure_sqrt_timeILy2EEvv+0x4bc>
 444:	e8 00 00 00 00       	callq  449 <_Z17measure_sqrt_timeILy2EEvv+0x449>
	__throw_bad_cast();
 449:	49 8b 45 00          	mov    0x0(%r13),%rax
 44d:	48 8b 40 e8          	mov    -0x18(%rax),%rax
    for (int j = 0; j < LOOP; j++) {
 451:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 458:	00 
     }
   }

   void stop_clock() {
     if (! stopped) {
       end = steady_clock::now();
 459:	48 85 db             	test   %rbx,%rbx
 45c:	0f 84 03 fe ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
        }
      }    
    }
    time.stop_clock();
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 462:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 466:	0f 84 06 05 00 00    	je     972 <_Z17measure_sqrt_timeILy2EEvv+0x972>
		const duration<_Rep2, _Period2>& __rhs)
      {
	typedef duration<_Rep1, _Period1>			__dur1;
	typedef duration<_Rep2, _Period2>			__dur2;
	typedef typename common_type<__dur1,__dur2>::type	__cd;
	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
 46c:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 470:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 477 <_Z17measure_sqrt_timeILy2EEvv+0x477>
 477:	e8 00 00 00 00       	callq  47c <_Z17measure_sqrt_timeILy2EEvv+0x47c>
 47c:	48 89 c1             	mov    %rax,%rcx
 47f:	e8 00 00 00 00       	callq  484 <_Z17measure_sqrt_timeILy2EEvv+0x484>
      { return _M_insert(__n); }
 484:	e8 00 00 00 00       	callq  489 <_Z17measure_sqrt_timeILy2EEvv+0x489>
 489:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
	__ostream_insert(__out, __s,
 48e:	48 89 c3             	mov    %rax,%rbx
 491:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 495:	4c 89 e2             	mov    %r12,%rdx
 498:	48 89 f8             	mov    %rdi,%rax
      { return _M_insert(__n); }
 49b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
	__ostream_insert(__out, __s,
 4a0:	c5 f8 28 22          	vmovaps (%rdx),%xmm4
    { return flush(__os.put(__os.widen('\n'))); }
 4a4:	c5 f8 28 42 20       	vmovaps 0x20(%rdx),%xmm0
      { return __check_facet(_M_ctype).widen(__c); }
 4a9:	48 83 c0 40          	add    $0x40,%rax
 4ad:	48 83 c2 40          	add    $0x40,%rdx
 4b1:	c5 d8 c6 52 d0 88    	vshufps $0x88,-0x30(%rdx),%xmm4,%xmm2
      if (!__f)
 4b7:	c5 f8 c6 4a f0 88    	vshufps $0x88,-0x10(%rdx),%xmm0,%xmm1
 4bd:	c5 d8 c6 62 d0 dd    	vshufps $0xdd,-0x30(%rdx),%xmm4,%xmm4
 4c3:	c5 f8 c6 42 f0 dd    	vshufps $0xdd,-0x10(%rdx),%xmm0,%xmm0
 4c9:	c5 e8 c6 d9 88       	vshufps $0x88,%xmm1,%xmm2,%xmm3
    { return __os.flush(); }
 4ce:	c5 e8 c6 c9 dd       	vshufps $0xdd,%xmm1,%xmm2,%xmm1
 4d3:	c5 d8 c6 d0 88       	vshufps $0x88,%xmm0,%xmm4,%xmm2
	__ostream_insert(__out, __s,
 4d8:	c5 d8 c6 c0 dd       	vshufps $0xdd,%xmm0,%xmm4,%xmm0
 4dd:	c5 d9 72 e3 01       	vpsrad $0x1,%xmm3,%xmm4
 4e2:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
 4e6:	c5 e0 5e e5          	vdivps %xmm5,%xmm3,%xmm4
 4ea:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 4ee:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
    { return flush(__os.put(__os.widen('\n'))); }
 4f2:	c5 e0 5e dc          	vdivps %xmm4,%xmm3,%xmm3
      { return __check_facet(_M_ctype).widen(__c); }
 4f6:	c5 e0 58 dc          	vaddps %xmm4,%xmm3,%xmm3
 4fa:	c5 d9 72 e2 01       	vpsrad $0x1,%xmm2,%xmm4
      if (!__f)
 4ff:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
 503:	c5 e8 5e e5          	vdivps %xmm5,%xmm2,%xmm4
 507:	c5 e0 59 de          	vmulps %xmm6,%xmm3,%xmm3
 50b:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 50f:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 513:	c5 e8 5e d4          	vdivps %xmm4,%xmm2,%xmm2
 517:	c5 e8 58 d4          	vaddps %xmm4,%xmm2,%xmm2
 51b:	c5 d9 72 e1 01       	vpsrad $0x1,%xmm1,%xmm4
 520:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
    { return __os.flush(); }
 524:	c5 f0 5e e5          	vdivps %xmm5,%xmm1,%xmm4
 528:	c5 e8 59 d6          	vmulps %xmm6,%xmm2,%xmm2
       start = steady_clock::now();
 52c:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 530:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 534:	c5 f0 5e cc          	vdivps %xmm4,%xmm1,%xmm1
 538:	c5 f0 58 cc          	vaddps %xmm4,%xmm1,%xmm1
 53c:	c5 d9 72 e0 01       	vpsrad $0x1,%xmm0,%xmm4
 541:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
 545:	c5 f8 5e e5          	vdivps %xmm5,%xmm0,%xmm4
 549:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 54d:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 551:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
template <size_t LOOPS = 2>
float sqrt1(float * a) {
  float root;
  int * ai = reinterpret_cast<int *>(a);
  int * initial = reinterpret_cast<int *>(&root);
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 555:	c5 f8 5e c4          	vdivps %xmm4,%xmm0,%xmm0
 559:	c5 f8 58 c4          	vaddps %xmm4,%xmm0,%xmm0
 55d:	c5 e0 14 e1          	vunpcklps %xmm1,%xmm3,%xmm4
 561:	c5 e0 15 c9          	vunpckhps %xmm1,%xmm3,%xmm1
  root = * reinterpret_cast<float *>(initial);
  for(size_t i = 0; i < LOOPS; i++) {
    root = 0.5 * (root + (* a / root));
 565:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
 569:	c5 e8 14 d8          	vunpcklps %xmm0,%xmm2,%xmm3
 56d:	c5 e8 15 c0          	vunpckhps %xmm0,%xmm2,%xmm0
 571:	c5 d8 14 d3          	vunpcklps %xmm3,%xmm4,%xmm2
 575:	c5 d8 15 e3          	vunpckhps %xmm3,%xmm4,%xmm4
 579:	c5 f8 29 50 c0       	vmovaps %xmm2,-0x40(%rax)

    std::cout << "sqrt1 (Newton method for single float, one time a loop)" << std::endl;
    time.start_clock();
    for (int j = 0; j < LOOP; j++) {
      for (int i = 0; i < 4 * N; i++) {
        roots[i] = sqrt1<LOOPS>(floats + i);
 57e:	c5 f0 14 d0          	vunpcklps %xmm0,%xmm1,%xmm2
 582:	c5 f0 15 c8          	vunpckhps %xmm0,%xmm1,%xmm1
 586:	c5 f8 29 60 d0       	vmovaps %xmm4,-0x30(%rax)
    for (int j = 0; j < LOOP; j++) {
 58b:	c5 f8 29 50 e0       	vmovaps %xmm2,-0x20(%rax)
       end = steady_clock::now();
 590:	c5 f8 29 48 f0       	vmovaps %xmm1,-0x10(%rax)
      }
    }    
    time.stop_clock();
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 595:	4c 39 e0             	cmp    %r12,%rax
 598:	0f 85 02 ff ff ff    	jne    4a0 <_Z17measure_sqrt_timeILy2EEvv+0x4a0>
 59e:	ff c9                	dec    %ecx
 5a0:	0f 85 ef fe ff ff    	jne    495 <_Z17measure_sqrt_timeILy2EEvv+0x495>
 5a6:	e8 00 00 00 00       	callq  5ab <_Z17measure_sqrt_timeILy2EEvv+0x5ab>
 5ab:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 5b2:	9b c4 20 
 5b5:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
      { return _M_insert(__n); }
 5b9:	48 29 d8             	sub    %rbx,%rax
 5bc:	48 89 c1             	mov    %rax,%rcx
 5bf:	48 f7 ea             	imul   %rdx
	__ostream_insert(__out, __s,
 5c2:	48 c1 f9 3f          	sar    $0x3f,%rcx
 5c6:	48 c1 fa 07          	sar    $0x7,%rdx
 5ca:	48 29 ca             	sub    %rcx,%rdx
 5cd:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 5d4 <_Z17measure_sqrt_timeILy2EEvv+0x5d4>
 5d4:	e8 00 00 00 00       	callq  5d9 <_Z17measure_sqrt_timeILy2EEvv+0x5d9>
 5d9:	41 b8 05 00 00 00    	mov    $0x5,%r8d
      { return __check_facet(_M_ctype).widen(__c); }
 5df:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 61a <_Z17measure_sqrt_timeILy2EEvv+0x61a>
 5e6:	48 89 c6             	mov    %rax,%rsi
      if (!__f)
 5e9:	48 89 c1             	mov    %rax,%rcx
 5ec:	e8 00 00 00 00       	callq  5f1 <_Z17measure_sqrt_timeILy2EEvv+0x5f1>
 5f1:	48 8b 06             	mov    (%rsi),%rax
 5f4:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 5f8:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 5ff:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 600:	48 85 db             	test   %rbx,%rbx
 603:	0f 84 5c fc ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
    { return __os.flush(); }
 609:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 60d:	0f 84 23 04 00 00    	je     a36 <_Z17measure_sqrt_timeILy2EEvv+0xa36>
	__ostream_insert(__out, __s,
 613:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 617:	48 89 f1             	mov    %rsi,%rcx
 61a:	e8 00 00 00 00       	callq  61f <_Z17measure_sqrt_timeILy2EEvv+0x61f>
 61f:	48 89 c1             	mov    %rax,%rcx
 622:	e8 00 00 00 00       	callq  627 <_Z17measure_sqrt_timeILy2EEvv+0x627>
 627:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 62e <_Z17measure_sqrt_timeILy2EEvv+0x62e>
      { return __check_facet(_M_ctype).widen(__c); }
 62e:	41 b8 2e 00 00 00    	mov    $0x2e,%r8d
 634:	48 8d 15 b8 00 00 00 	lea    0xb8(%rip),%rdx        # 6f3 <_Z17measure_sqrt_timeILy2EEvv+0x6f3>
      if (!__f)
 63b:	e8 00 00 00 00       	callq  640 <_Z17measure_sqrt_timeILy2EEvv+0x640>
 640:	49 8b 45 00          	mov    0x0(%r13),%rax
 644:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 648:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 64f:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 650:	48 85 db             	test   %rbx,%rbx
 653:	0f 84 0c fc ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 659:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
    { return __os.flush(); }
 65d:	0f 84 40 03 00 00    	je     9a3 <_Z17measure_sqrt_timeILy2EEvv+0x9a3>
 663:	0f be 53 43          	movsbl 0x43(%rbx),%edx
       start = steady_clock::now();
 667:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 66e <_Z17measure_sqrt_timeILy2EEvv+0x66e>
 66e:	e8 00 00 00 00       	callq  673 <_Z17measure_sqrt_timeILy2EEvv+0x673>
 673:	48 89 c1             	mov    %rax,%rcx
 676:	e8 00 00 00 00       	callq  67b <_Z17measure_sqrt_timeILy2EEvv+0x67b>
 67b:	e8 00 00 00 00       	callq  680 <_Z17measure_sqrt_timeILy2EEvv+0x680>
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 680:	ba e8 03 00 00       	mov    $0x3e8,%edx
 685:	48 89 c3             	mov    %rax,%rbx
 688:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 68c:	31 c0                	xor    %eax,%eax
 68e:	66 90                	xchg   %ax,%ax
 690:	c4 c1 78 28 04 04    	vmovaps (%r12,%rax,1),%xmm0
 696:	48 83 c0 10          	add    $0x10,%rax
 69a:	c5 f8 5e 4c 38 f0    	vdivps -0x10(%rax,%rdi,1),%xmm0,%xmm1
 6a0:	c5 f0 58 4c 38 f0    	vaddps -0x10(%rax,%rdi,1),%xmm1,%xmm1
 6a6:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 6aa:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 6ae:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
 6b2:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
 6b6:	c5 f8 29 44 38 f0    	vmovaps %xmm0,-0x10(%rax,%rdi,1)
 6bc:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
 6c2:	75 cc                	jne    690 <_Z17measure_sqrt_timeILy2EEvv+0x690>
 6c4:	ff ca                	dec    %edx
    root = 0.5 * (root + (* a / root));
 6c6:	75 c4                	jne    68c <_Z17measure_sqrt_timeILy2EEvv+0x68c>
 6c8:	e8 00 00 00 00       	callq  6cd <_Z17measure_sqrt_timeILy2EEvv+0x6cd>
 6cd:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 6d4:	9b c4 20 
 6d7:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 6db:	48 29 d8             	sub    %rbx,%rax
 6de:	48 89 c1             	mov    %rax,%rcx
 6e1:	48 f7 ea             	imul   %rdx
    root = 0.5 * (root + (* a / root));
 6e4:	48 c1 f9 3f          	sar    $0x3f,%rcx
 6e8:	48 c1 fa 07          	sar    $0x7,%rdx
 6ec:	48 29 ca             	sub    %rcx,%rdx
 6ef:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 6f6 <_Z17measure_sqrt_timeILy2EEvv+0x6f6>
 6f6:	e8 00 00 00 00       	callq  6fb <_Z17measure_sqrt_timeILy2EEvv+0x6fb>
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 6fb:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 701:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 73c <_Z17measure_sqrt_timeILy2EEvv+0x73c>
    root = 0.5 * (root + (* a / root));
 708:	48 89 c6             	mov    %rax,%rsi
 70b:	48 89 c1             	mov    %rax,%rcx
 70e:	e8 00 00 00 00       	callq  713 <_Z17measure_sqrt_timeILy2EEvv+0x713>
 713:	48 8b 06             	mov    (%rsi),%rax
 716:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 71a:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 721:	00 
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 722:	48 85 db             	test   %rbx,%rbx
    root = 0.5 * (root + (* a / root));
 725:	0f 84 3a fb ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 72b:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 72f:	0f 84 9f 02 00 00    	je     9d4 <_Z17measure_sqrt_timeILy2EEvv+0x9d4>
 735:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 739:	48 89 f1             	mov    %rsi,%rcx
 73c:	e8 00 00 00 00       	callq  741 <_Z17measure_sqrt_timeILy2EEvv+0x741>
    std::cout << "sqrt1 (Newton method for single float, four times a loop)" << std::endl;
    time.start_clock();
    for (int j = 0; j < LOOP; j++) {
      for (int i = 0; i < 4 * N; i += 4) {
        for (int k = 0; k < 4; k++) {
          roots[i + k] = sqrt1<LOOPS>(floats + i + k);
 741:	48 89 c1             	mov    %rax,%rcx
 744:	e8 00 00 00 00       	callq  749 <_Z17measure_sqrt_timeILy2EEvv+0x749>
 749:	e8 00 00 00 00       	callq  74e <_Z17measure_sqrt_timeILy2EEvv+0x74e>
 74e:	ba e8 03 00 00       	mov    $0x3e8,%edx
 753:	48 89 c6             	mov    %rax,%rsi
 756:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 75a:	31 c0                	xor    %eax,%eax
 75c:	0f 1f 40 00          	nopl   0x0(%rax)
 760:	c4 c1 78 28 04 04    	vmovaps (%r12,%rax,1),%xmm0
 766:	48 83 c0 10          	add    $0x10,%rax
 76a:	c5 f1 72 e0 01       	vpsrad $0x1,%xmm0,%xmm1
 76f:	c5 f1 fe d7          	vpaddd %xmm7,%xmm1,%xmm2
 773:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 777:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 77b:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
    for (int j = 0; j < LOOP; j++) {
 77f:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 783:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
       end = steady_clock::now();
 787:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
        }
      }
    }    
    time.stop_clock();
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 78b:	c5 f8 29 44 38 f0    	vmovaps %xmm0,-0x10(%rax,%rdi,1)
 791:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
 797:	75 c7                	jne    760 <_Z17measure_sqrt_timeILy2EEvv+0x760>
 799:	ff ca                	dec    %edx
 79b:	75 bd                	jne    75a <_Z17measure_sqrt_timeILy2EEvv+0x75a>
 79d:	e8 00 00 00 00       	callq  7a2 <_Z17measure_sqrt_timeILy2EEvv+0x7a2>
 7a2:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 7a9 <_Z17measure_sqrt_timeILy2EEvv+0x7a9>
 7a9:	41 b8 34 00 00 00    	mov    $0x34,%r8d
      { return _M_insert(__n); }
 7af:	48 8d 15 e8 00 00 00 	lea    0xe8(%rip),%rdx        # 89e <_Z17measure_sqrt_timeILy2EEvv+0x89e>
 7b6:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
	__ostream_insert(__out, __s,
 7ba:	48 29 f0             	sub    %rsi,%rax
 7bd:	48 89 c3             	mov    %rax,%rbx
 7c0:	e8 00 00 00 00       	callq  7c5 <_Z17measure_sqrt_timeILy2EEvv+0x7c5>
 7c5:	49 8b 45 00          	mov    0x0(%r13),%rax
 7c9:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 7cd:	49 8b b4 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rsi
 7d4:	00 
      { return __check_facet(_M_ctype).widen(__c); }
 7d5:	48 85 f6             	test   %rsi,%rsi
 7d8:	0f 84 87 fa ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
 7de:	80 7e 38 00          	cmpb   $0x0,0x38(%rsi)
      if (!__f)
 7e2:	0f 84 e1 02 00 00    	je     ac9 <_Z17measure_sqrt_timeILy2EEvv+0xac9>
 7e8:	0f be 56 43          	movsbl 0x43(%rsi),%edx
 7ec:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 7f3 <_Z17measure_sqrt_timeILy2EEvv+0x7f3>
 7f3:	e8 00 00 00 00       	callq  7f8 <_Z17measure_sqrt_timeILy2EEvv+0x7f8>
    { return flush(__os.put(__os.widen('\n'))); }
 7f8:	48 89 c1             	mov    %rax,%rcx
 7fb:	e8 00 00 00 00       	callq  800 <_Z17measure_sqrt_timeILy2EEvv+0x800>
    { return __os.flush(); }
 800:	48 89 d8             	mov    %rbx,%rax
 803:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 80a:	9b c4 20 
	__ostream_insert(__out, __s,
 80d:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 814 <_Z17measure_sqrt_timeILy2EEvv+0x814>
 814:	48 c1 fb 3f          	sar    $0x3f,%rbx
 818:	48 f7 ea             	imul   %rdx
 81b:	48 c1 fa 07          	sar    $0x7,%rdx
 81f:	48 29 da             	sub    %rbx,%rdx
    { return flush(__os.put(__os.widen('\n'))); }
 822:	e8 00 00 00 00       	callq  827 <_Z17measure_sqrt_timeILy2EEvv+0x827>
      { return __check_facet(_M_ctype).widen(__c); }
 827:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 82d:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 868 <_Z17measure_sqrt_timeILy2EEvv+0x868>
      if (!__f)
 834:	48 89 c6             	mov    %rax,%rsi
 837:	48 89 c1             	mov    %rax,%rcx
 83a:	e8 00 00 00 00       	callq  83f <_Z17measure_sqrt_timeILy2EEvv+0x83f>
 83f:	48 8b 06             	mov    (%rsi),%rax
 842:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 846:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 84d:	00 
 84e:	48 85 db             	test   %rbx,%rbx
 851:	0f 84 0e fa ff ff    	je     265 <_Z17measure_sqrt_timeILy2EEvv+0x265>
    { return __os.flush(); }
 857:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
       start = steady_clock::now();
 85b:	0f 84 37 02 00 00    	je     a98 <_Z17measure_sqrt_timeILy2EEvv+0xa98>
 861:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 865:	48 89 f1             	mov    %rsi,%rcx
 868:	e8 00 00 00 00       	callq  86d <_Z17measure_sqrt_timeILy2EEvv+0x86d>
 86d:	90                   	nop
 86e:	c5 f8 28 75 d0       	vmovaps -0x30(%rbp),%xmm6
}

template <size_t LOOPS = 2>
void sqrt2(float * __restrict__ a, float * __restrict__ root) {
  for(size_t j = 0; j < LOOPS; j++) {
    root[0] = 0.5 * (root[0] + (a[0] / root[0]));
 873:	c5 f8 28 7d e0       	vmovaps -0x20(%rbp),%xmm7
 878:	48 89 c1             	mov    %rax,%rcx
 87b:	48 8d 65 f8          	lea    -0x8(%rbp),%rsp
 87f:	5b                   	pop    %rbx
 880:	5e                   	pop    %rsi
 881:	5f                   	pop    %rdi
 882:	41 5c                	pop    %r12
 884:	41 5d                	pop    %r13
 886:	41 5e                	pop    %r14
 888:	41 5f                	pop    %r15
 88a:	5d                   	pop    %rbp
 88b:	e9 00 00 00 00       	jmpq   890 <_Z17measure_sqrt_timeILy2EEvv+0x890>
 890:	e8 00 00 00 00       	callq  895 <_Z17measure_sqrt_timeILy2EEvv+0x895>
 895:	e9 91 f9 ff ff       	jmpq   22b <_Z17measure_sqrt_timeILy2EEvv+0x22b>
 89a:	e8 00 00 00 00       	callq  89f <_Z17measure_sqrt_timeILy2EEvv+0x89f>
 89f:	e9 63 f9 ff ff       	jmpq   207 <_Z17measure_sqrt_timeILy2EEvv+0x207>
    time.reset_clock();

    std::cout << "sqrt2 (Newton method for sequence of 4 floats)" << std::endl;
    time.start_clock();
    for (int j = 0; j < LOOP; j++) {
 8a4:	e8 00 00 00 00       	callq  8a9 <_Z17measure_sqrt_timeILy2EEvv+0x8a9>
       end = steady_clock::now();
 8a9:	e9 35 f9 ff ff       	jmpq   1e3 <_Z17measure_sqrt_timeILy2EEvv+0x1e3>
      for (int i = 0; i < 4 * N; i += 4) {
        sqrt2<LOOPS>(floats + i, roots + i);
      }
    }    
    time.stop_clock();
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 8ae:	48 89 d9             	mov    %rbx,%rcx
 8b1:	e8 00 00 00 00       	callq  8b6 <_Z17measure_sqrt_timeILy2EEvv+0x8b6>
 8b6:	48 8b 03             	mov    (%rbx),%rax
 8b9:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 8c0 <_Z17measure_sqrt_timeILy2EEvv+0x8c0>
 8c0:	ba 0a 00 00 00       	mov    $0xa,%edx
 8c5:	48 8b 40 30          	mov    0x30(%rax),%rax
 8c9:	48 39 c8             	cmp    %rcx,%rax
 8cc:	0f 84 30 f8 ff ff    	je     102 <_Z17measure_sqrt_timeILy2EEvv+0x102>
      { return _M_insert(__n); }
 8d2:	48 89 d9             	mov    %rbx,%rcx
 8d5:	ff d0                	callq  *%rax
 8d7:	0f be d0             	movsbl %al,%edx
 8da:	e9 23 f8 ff ff       	jmpq   102 <_Z17measure_sqrt_timeILy2EEvv+0x102>
	__ostream_insert(__out, __s,
 8df:	48 89 d9             	mov    %rbx,%rcx
 8e2:	e8 00 00 00 00       	callq  8e7 <_Z17measure_sqrt_timeILy2EEvv+0x8e7>
 8e7:	48 8b 03             	mov    (%rbx),%rax
      { return _M_insert(__n); }
 8ea:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 8f1 <_Z17measure_sqrt_timeILy2EEvv+0x8f1>
	__ostream_insert(__out, __s,
 8f1:	ba 0a 00 00 00       	mov    $0xa,%edx
      { return __check_facet(_M_ctype).widen(__c); }
 8f6:	48 8b 40 30          	mov    0x30(%rax),%rax
 8fa:	48 39 c8             	cmp    %rcx,%rax
 8fd:	0f 84 87 f7 ff ff    	je     8a <_Z17measure_sqrt_timeILy2EEvv+0x8a>
      if (!__f)
 903:	48 89 d9             	mov    %rbx,%rcx
 906:	ff d0                	callq  *%rax
 908:	0f be d0             	movsbl %al,%edx
 90b:	e9 7a f7 ff ff       	jmpq   8a <_Z17measure_sqrt_timeILy2EEvv+0x8a>
 910:	48 89 d9             	mov    %rbx,%rcx
 913:	e8 00 00 00 00       	callq  918 <_Z17measure_sqrt_timeILy2EEvv+0x918>
 918:	48 8b 03             	mov    (%rbx),%rax
    { return flush(__os.put(__os.widen('\n'))); }
 91b:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 922 <_Z17measure_sqrt_timeILy2EEvv+0x922>
    { return __os.flush(); }
 922:	ba 0a 00 00 00       	mov    $0xa,%edx
 927:	48 8b 40 30          	mov    0x30(%rax),%rax
       start = steady_clock::now();
 92b:	48 39 c8             	cmp    %rcx,%rax
 92e:	0f 84 52 f8 ff ff    	je     186 <_Z17measure_sqrt_timeILy2EEvv+0x186>
 934:	48 89 d9             	mov    %rbx,%rcx
 937:	ff d0                	callq  *%rax
 939:	0f be d0             	movsbl %al,%edx
 93c:	e9 45 f8 ff ff       	jmpq   186 <_Z17measure_sqrt_timeILy2EEvv+0x186>

template <size_t LOOPS = 2>
void v4sf_sqrt(v4sf * __restrict__ a, v4sf * __restrict__ root) {
  v4si * ai = reinterpret_cast<v4si *>(a);
  v4si * initial = reinterpret_cast<v4si *>(root);
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 941:	48 89 d9             	mov    %rbx,%rcx
 944:	e8 00 00 00 00       	callq  949 <_Z17measure_sqrt_timeILy2EEvv+0x949>
 949:	48 8b 03             	mov    (%rbx),%rax
 94c:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 953 <_Z17measure_sqrt_timeILy2EEvv+0x953>
  root = reinterpret_cast<v4sf *>(initial);
  for (size_t i = 0; i < LOOPS; i++) {
    * root = 0.5 * (* root + (* a / * root));
 953:	ba 0a 00 00 00       	mov    $0xa,%edx
 958:	48 8b 40 30          	mov    0x30(%rax),%rax
 95c:	48 39 c8             	cmp    %rcx,%rax
 95f:	0f 84 d1 f9 ff ff    	je     336 <_Z17measure_sqrt_timeILy2EEvv+0x336>
 965:	48 89 d9             	mov    %rbx,%rcx
 968:	ff d0                	callq  *%rax
 96a:	0f be d0             	movsbl %al,%edx
 96d:	e9 c4 f9 ff ff       	jmpq   336 <_Z17measure_sqrt_timeILy2EEvv+0x336>
    time.reset_clock();

    time.start_clock();
    for (int j = 0; j < LOOP; j++) {
      for (int i = 0; i < 4 * N; i += 4) {
 972:	48 89 d9             	mov    %rbx,%rcx
 975:	e8 00 00 00 00       	callq  97a <_Z17measure_sqrt_timeILy2EEvv+0x97a>
    for (int j = 0; j < LOOP; j++) {
 97a:	48 8b 03             	mov    (%rbx),%rax
       end = steady_clock::now();
 97d:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 984 <_Z17measure_sqrt_timeILy2EEvv+0x984>
	__ostream_insert(__out, __s,
 984:	ba 0a 00 00 00       	mov    $0xa,%edx
 989:	48 8b 40 30          	mov    0x30(%rax),%rax
 98d:	48 39 c8             	cmp    %rcx,%rax
 990:	0f 84 da fa ff ff    	je     470 <_Z17measure_sqrt_timeILy2EEvv+0x470>
 996:	48 89 d9             	mov    %rbx,%rcx
 999:	ff d0                	callq  *%rax
 99b:	0f be d0             	movsbl %al,%edx
 99e:	e9 cd fa ff ff       	jmpq   470 <_Z17measure_sqrt_timeILy2EEvv+0x470>
 9a3:	48 89 d9             	mov    %rbx,%rcx
    { return flush(__os.put(__os.widen('\n'))); }
 9a6:	e8 00 00 00 00       	callq  9ab <_Z17measure_sqrt_timeILy2EEvv+0x9ab>
      { return __check_facet(_M_ctype).widen(__c); }
 9ab:	48 8b 03             	mov    (%rbx),%rax
 9ae:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 9b5 <_Z17measure_sqrt_timeILy2EEvv+0x9b5>
      if (!__f)
 9b5:	ba 0a 00 00 00       	mov    $0xa,%edx
 9ba:	48 8b 40 30          	mov    0x30(%rax),%rax
 9be:	48 39 c8             	cmp    %rcx,%rax
 9c1:	0f 84 a0 fc ff ff    	je     667 <_Z17measure_sqrt_timeILy2EEvv+0x667>
 9c7:	48 89 d9             	mov    %rbx,%rcx
 9ca:	ff d0                	callq  *%rax
 9cc:	0f be d0             	movsbl %al,%edx
 9cf:	e9 93 fc ff ff       	jmpq   667 <_Z17measure_sqrt_timeILy2EEvv+0x667>
 9d4:	48 89 d9             	mov    %rbx,%rcx
 9d7:	e8 00 00 00 00       	callq  9dc <_Z17measure_sqrt_timeILy2EEvv+0x9dc>
    { return __os.flush(); }
 9dc:	48 8b 03             	mov    (%rbx),%rax
 9df:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 9e6 <_Z17measure_sqrt_timeILy2EEvv+0x9e6>
      }
    }    
    time.stop_clock();

    std::cout << "sqrt3 (Newton method for sequence of 4 floats, SIMD)" << std::endl;
    std::cout << time.time_clock().count() / LOOP  << " [ns]" << std::endl;
 9e6:	ba 0a 00 00 00       	mov    $0xa,%edx
 9eb:	48 8b 40 30          	mov    0x30(%rax),%rax
      { return _M_insert(__n); }
 9ef:	48 39 c8             	cmp    %rcx,%rax
 9f2:	0f 84 41 fd ff ff    	je     739 <_Z17measure_sqrt_timeILy2EEvv+0x739>
 9f8:	48 89 d9             	mov    %rbx,%rcx
 9fb:	ff d0                	callq  *%rax
 9fd:	0f be d0             	movsbl %al,%edx
 a00:	e9 34 fd ff ff       	jmpq   739 <_Z17measure_sqrt_timeILy2EEvv+0x739>
 a05:	48 89 d9             	mov    %rbx,%rcx
	__ostream_insert(__out, __s,
 a08:	e8 00 00 00 00       	callq  a0d <_Z17measure_sqrt_timeILy2EEvv+0xa0d>
 a0d:	48 8b 03             	mov    (%rbx),%rax
 a10:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # a17 <_Z17measure_sqrt_timeILy2EEvv+0xa17>
 a17:	ba 0a 00 00 00       	mov    $0xa,%edx
 a1c:	48 8b 40 30          	mov    0x30(%rax),%rax
    { return flush(__os.put(__os.widen('\n'))); }
 a20:	48 39 c8             	cmp    %rcx,%rax
      { return __check_facet(_M_ctype).widen(__c); }
 a23:	0f 84 f7 f9 ff ff    	je     420 <_Z17measure_sqrt_timeILy2EEvv+0x420>
 a29:	48 89 d9             	mov    %rbx,%rcx
 a2c:	ff d0                	callq  *%rax
      if (!__f)
 a2e:	0f be d0             	movsbl %al,%edx
 a31:	e9 ea f9 ff ff       	jmpq   420 <_Z17measure_sqrt_timeILy2EEvv+0x420>
 a36:	48 89 d9             	mov    %rbx,%rcx
 a39:	e8 00 00 00 00       	callq  a3e <_Z17measure_sqrt_timeILy2EEvv+0xa3e>
 a3e:	48 8b 03             	mov    (%rbx),%rax
 a41:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # a48 <_Z17measure_sqrt_timeILy2EEvv+0xa48>
 a48:	ba 0a 00 00 00       	mov    $0xa,%edx
 a4d:	48 8b 40 30          	mov    0x30(%rax),%rax
    time.reset_clock();
}
 a51:	48 39 c8             	cmp    %rcx,%rax
 a54:	0f 84 bd fb ff ff    	je     617 <_Z17measure_sqrt_timeILy2EEvv+0x617>
    { return __os.flush(); }
 a5a:	48 89 d9             	mov    %rbx,%rcx
 a5d:	ff d0                	callq  *%rax
 a5f:	0f be d0             	movsbl %al,%edx
 a62:	e9 b0 fb ff ff       	jmpq   617 <_Z17measure_sqrt_timeILy2EEvv+0x617>
 a67:	48 89 d9             	mov    %rbx,%rcx
 a6a:	e8 00 00 00 00       	callq  a6f <_Z17measure_sqrt_timeILy2EEvv+0xa6f>
 a6f:	48 8b 03             	mov    (%rbx),%rax
          roots[i + k] = sqrt(floats[i + k]);
 a72:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # a79 <_Z17measure_sqrt_timeILy2EEvv+0xa79>
 a79:	ba 0a 00 00 00       	mov    $0xa,%edx
 a7e:	48 8b 40 30          	mov    0x30(%rax),%rax
 a82:	48 39 c8             	cmp    %rcx,%rax
 a85:	0f 84 5b f8 ff ff    	je     2e6 <_Z17measure_sqrt_timeILy2EEvv+0x2e6>
 a8b:	48 89 d9             	mov    %rbx,%rcx
	  return _M_widen[static_cast<unsigned char>(__c)];
	this->_M_widen_init();
 a8e:	ff d0                	callq  *%rax
 a90:	0f be d0             	movsbl %al,%edx
 a93:	e9 4e f8 ff ff       	jmpq   2e6 <_Z17measure_sqrt_timeILy2EEvv+0x2e6>
	return this->do_widen(__c);
 a98:	48 89 d9             	mov    %rbx,%rcx
 a9b:	e8 00 00 00 00       	callq  aa0 <_Z17measure_sqrt_timeILy2EEvv+0xaa0>
 aa0:	48 8b 03             	mov    (%rbx),%rax
 aa3:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # aaa <_Z17measure_sqrt_timeILy2EEvv+0xaaa>
 aaa:	ba 0a 00 00 00       	mov    $0xa,%edx
 aaf:	48 8b 40 30          	mov    0x30(%rax),%rax
 ab3:	48 39 c8             	cmp    %rcx,%rax
 ab6:	0f 84 a9 fd ff ff    	je     865 <_Z17measure_sqrt_timeILy2EEvv+0x865>
 abc:	48 89 d9             	mov    %rbx,%rcx
	this->_M_widen_init();
 abf:	ff d0                	callq  *%rax
 ac1:	0f be d0             	movsbl %al,%edx
 ac4:	e9 9c fd ff ff       	jmpq   865 <_Z17measure_sqrt_timeILy2EEvv+0x865>
	return this->do_widen(__c);
 ac9:	48 89 f1             	mov    %rsi,%rcx
 acc:	e8 00 00 00 00       	callq  ad1 <_Z17measure_sqrt_timeILy2EEvv+0xad1>
 ad1:	48 8b 06             	mov    (%rsi),%rax
 ad4:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # adb <_Z17measure_sqrt_timeILy2EEvv+0xadb>
 adb:	ba 0a 00 00 00       	mov    $0xa,%edx
 ae0:	48 8b 40 30          	mov    0x30(%rax),%rax
 ae4:	48 39 c8             	cmp    %rcx,%rax
 ae7:	0f 84 ff fc ff ff    	je     7ec <_Z17measure_sqrt_timeILy2EEvv+0x7ec>
 aed:	48 89 f1             	mov    %rsi,%rcx
	this->_M_widen_init();
 af0:	ff d0                	callq  *%rax
 af2:	0f be d0             	movsbl %al,%edx
 af5:	e9 f2 fc ff ff       	jmpq   7ec <_Z17measure_sqrt_timeILy2EEvv+0x7ec>
	return this->do_widen(__c);
 afa:	90                   	nop
 afb:	90                   	nop
 afc:	90                   	nop
 afd:	90                   	nop
 afe:	90                   	nop
 aff:	90                   	nop

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
  4d:	48 8d bc 24 9f 00 00 	lea    0x9f(%rsp),%rdi
  54:	00 
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
  55:	48 89 c6             	mov    %rax,%rsi
  58:	48 89 c1             	mov    %rax,%rcx
  5b:	48 83 e7 80          	and    $0xffffffffffffff80,%rdi
  5f:	e8 00 00 00 00       	callq  64 <_Z17measure_sqrt_timeILy3EEvv+0x64>
  64:	48 8b 06             	mov    (%rsi),%rax
  67:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  6b:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  72:	00 
  73:	48 85 db             	test   %rbx,%rbx
  76:	0f 84 e9 01 00 00    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
  7c:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
  80:	0f 84 a9 08 00 00    	je     92f <_Z17measure_sqrt_timeILy3EEvv+0x92f>
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
  f8:	0f 84 00 08 00 00    	je     8fe <_Z17measure_sqrt_timeILy3EEvv+0x8fe>
	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
  fe:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 102:	48 89 f1             	mov    %rsi,%rcx
    { _M_init_pretr1(__token); }
 105:	4c 8d a7 00 35 0c 00 	lea    0xc3500(%rdi),%r12
      { _M_string_length = __length; }
 10c:	48 8d 9f 00 6a 18 00 	lea    0x186a00(%rdi),%rbx
	: allocator_type(__a), _M_p(__dat) { }
 113:	e8 00 00 00 00       	callq  118 <_Z17measure_sqrt_timeILy3EEvv+0x118>
 118:	4d 89 e6             	mov    %r12,%r14
 11b:	48 89 c1             	mov    %rax,%rcx
 11e:	e8 00 00 00 00       	callq  123 <_Z17measure_sqrt_timeILy3EEvv+0x123>
 123:	e8 10 00 00 00       	callq  138 <_Z17measure_sqrt_timeILy3EEvv+0x138>
 128:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
      { __c1 = __c2; }
 12c:	49 83 c6 04          	add    $0x4,%r14
 130:	c5 d3 5a e8          	vcvtsd2ss %xmm0,%xmm5,%xmm5
  static std::random_device device;
 134:	c4 c1 7a 11 6e fc    	vmovss %xmm5,-0x4(%r14)
	if (!_M_is_local())
 13a:	49 39 de             	cmp    %rbx,%r14
 13d:	75 e4                	jne    123 <_Z17measure_sqrt_timeILy3EEvv+0x123>
 13f:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 146 <_Z17measure_sqrt_timeILy3EEvv+0x146>
 146:	41 b8 09 00 00 00    	mov    $0x9,%r8d
 14c:	48 8d 15 2a 00 00 00 	lea    0x2a(%rip),%rdx        # 17d <_Z17measure_sqrt_timeILy3EEvv+0x17d>
 153:	e8 00 00 00 00       	callq  158 <_Z17measure_sqrt_timeILy3EEvv+0x158>
 158:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 15f <_Z17measure_sqrt_timeILy3EEvv+0x15f>
 15f:	49 8b 45 00          	mov    0x0(%r13),%rax
	  __ret = std::nextafter(_RealType(1), _RealType(0));
 163:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 167:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 16e:	00 
 16f:	48 85 db             	test   %rbx,%rbx
 172:	0f 84 ed 00 00 00    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 178:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 17c:	0f 84 de 07 00 00    	je     960 <_Z17measure_sqrt_timeILy3EEvv+0x960>
 182:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 186:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 18d <_Z17measure_sqrt_timeILy3EEvv+0x18d>
 18d:	e8 00 00 00 00       	callq  192 <_Z17measure_sqrt_timeILy3EEvv+0x192>
 192:	48 89 c1             	mov    %rax,%rcx
 195:	e8 00 00 00 00       	callq  19a <_Z17measure_sqrt_timeILy3EEvv+0x19a>
 19a:	e8 00 00 00 00       	callq  19f <_Z17measure_sqrt_timeILy3EEvv+0x19f>
 19f:	c7 45 ac e8 03 00 00 	movl   $0x3e8,-0x54(%rbp)
 1a6:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
 1aa:	49 89 c7             	mov    %rax,%r15
 1ad:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 1b1:	48 89 fe             	mov    %rdi,%rsi
 1b4:	4c 89 e3             	mov    %r12,%rbx
 1b7:	e9 89 00 00 00       	jmpq   245 <_Z17measure_sqrt_timeILy3EEvv+0x245>
 1bc:	0f 1f 40 00          	nopl   0x0(%rax)
 1c0:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1c4:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 1c8:	c5 fa 5a 43 04       	vcvtss2sd 0x4(%rbx),%xmm0,%xmm0
 1cd:	c5 e3 5a df          	vcvtsd2ss %xmm7,%xmm3,%xmm3
 1d1:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1d5:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1d9:	c5 fa 11 1e          	vmovss %xmm3,(%rsi)
 1dd:	0f 87 11 07 00 00    	ja     8f4 <_Z17measure_sqrt_timeILy3EEvv+0x8f4>
void measure_sqrt_time(void) {
 1e3:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1e7:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 1eb:	c5 fa 5a 43 08       	vcvtss2sd 0x8(%rbx),%xmm0,%xmm0
 1f0:	c5 e3 5a df          	vcvtsd2ss %xmm7,%xmm3,%xmm3
 1f4:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1f8:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1fc:	c5 fa 11 5e 04       	vmovss %xmm3,0x4(%rsi)
 201:	0f 87 e3 06 00 00    	ja     8ea <_Z17measure_sqrt_timeILy3EEvv+0x8ea>
 207:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 20b:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
      { return _M_insert(__n); }
 20f:	c5 fa 5a 43 0c       	vcvtss2sd 0xc(%rbx),%xmm0,%xmm0
 214:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 218:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 21c:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
	__ostream_insert(__out, __s,
 220:	c5 fa 11 6e 08       	vmovss %xmm5,0x8(%rsi)
 225:	0f 87 b5 06 00 00    	ja     8e0 <_Z17measure_sqrt_timeILy3EEvv+0x8e0>
 22b:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 22f:	48 83 c3 10          	add    $0x10,%rbx
 233:	48 83 c6 10          	add    $0x10,%rsi
      { return _M_insert(__n); }
 237:	c5 e3 5a df          	vcvtsd2ss %xmm7,%xmm3,%xmm3
 23b:	c5 fa 11 5e fc       	vmovss %xmm3,-0x4(%rsi)
	__ostream_insert(__out, __s,
 240:	4c 39 f3             	cmp    %r14,%rbx
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
 270:	ff 4d ac             	decl   -0x54(%rbp)
    { return __os.flush(); }
 273:	0f 85 38 ff ff ff    	jne    1b1 <_Z17measure_sqrt_timeILy3EEvv+0x1b1>
 279:	e8 00 00 00 00       	callq  27e <_Z17measure_sqrt_timeILy3EEvv+0x27e>
	__ostream_insert(__out, __s,
 27e:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 285:	9b c4 20 
 288:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 28c:	4c 29 f8             	sub    %r15,%rax
 28f:	48 89 c1             	mov    %rax,%rcx
 292:	48 f7 ea             	imul   %rdx
    std::cout << "generating " << (4 * N) << " random values..." << std::endl;
 295:	48 c1 f9 3f          	sar    $0x3f,%rcx
 299:	48 c1 fa 07          	sar    $0x7,%rdx
 29d:	48 29 ca             	sub    %rcx,%rdx
 2a0:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2a7 <_Z17measure_sqrt_timeILy3EEvv+0x2a7>
 2a7:	e8 00 00 00 00       	callq  2ac <_Z17measure_sqrt_timeILy3EEvv+0x2ac>
 2ac:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 2b2:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 2ed <_Z17measure_sqrt_timeILy3EEvv+0x2ed>
 2b9:	48 89 c6             	mov    %rax,%rsi
    { return flush(__os.put(__os.widen('\n'))); }
 2bc:	48 89 c1             	mov    %rax,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 2bf:	e8 00 00 00 00       	callq  2c4 <_Z17measure_sqrt_timeILy3EEvv+0x2c4>
 2c4:	48 8b 06             	mov    (%rsi),%rax
 2c7:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      if (!__f)
 2cb:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 2d2:	00 
 2d3:	48 85 db             	test   %rbx,%rbx
 2d6:	74 8d                	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 2d8:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 2dc:	0f 84 d5 07 00 00    	je     ab7 <_Z17measure_sqrt_timeILy3EEvv+0xab7>
 2e2:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 2e6:	48 89 f1             	mov    %rsi,%rcx
 2e9:	e8 00 00 00 00       	callq  2ee <_Z17measure_sqrt_timeILy3EEvv+0x2ee>
 2ee:	48 89 c1             	mov    %rax,%rcx
 2f1:	e8 00 00 00 00       	callq  2f6 <_Z17measure_sqrt_timeILy3EEvv+0x2f6>
 2f6:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2fd <_Z17measure_sqrt_timeILy3EEvv+0x2fd>
    { return __os.flush(); }
 2fd:	41 b8 37 00 00 00    	mov    $0x37,%r8d
       floats[i] = random_double();
 303:	48 8d 15 40 00 00 00 	lea    0x40(%rip),%rdx        # 34a <_Z17measure_sqrt_timeILy3EEvv+0x34a>
 30a:	e8 00 00 00 00       	callq  30f <_Z17measure_sqrt_timeILy3EEvv+0x30f>
 30f:	49 8b 45 00          	mov    0x0(%r13),%rax
 313:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 317:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 31e:	00 
	__ostream_insert(__out, __s,
 31f:	48 85 db             	test   %rbx,%rbx
 322:	0f 84 3d ff ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 328:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 32c:	0f 84 5f 06 00 00    	je     991 <_Z17measure_sqrt_timeILy3EEvv+0x991>
 332:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 336:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33d <_Z17measure_sqrt_timeILy3EEvv+0x33d>
    { return flush(__os.put(__os.widen('\n'))); }
 33d:	e8 00 00 00 00       	callq  342 <_Z17measure_sqrt_timeILy3EEvv+0x342>
 342:	48 89 c1             	mov    %rax,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 345:	e8 00 00 00 00       	callq  34a <_Z17measure_sqrt_timeILy3EEvv+0x34a>
 34a:	e8 00 00 00 00       	callq  34f <_Z17measure_sqrt_timeILy3EEvv+0x34f>
      if (!__f)
 34f:	ba e8 03 00 00       	mov    $0x3e8,%edx
 354:	c5 f8 28 3d 50 01 00 	vmovaps 0x150(%rip),%xmm7        # 4ac <_Z17measure_sqrt_timeILy3EEvv+0x4ac>
 35b:	00 
 35c:	c5 f8 28 35 60 01 00 	vmovaps 0x160(%rip),%xmm6        # 4c4 <_Z17measure_sqrt_timeILy3EEvv+0x4c4>
 363:	00 
 364:	48 89 c3             	mov    %rax,%rbx
 367:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 36b:	31 c0                	xor    %eax,%eax
 36d:	0f 1f 00             	nopl   (%rax)
 370:	c4 c1 78 28 04 04    	vmovaps (%r12,%rax,1),%xmm0
    { return __os.flush(); }
 376:	48 83 c0 10          	add    $0x10,%rax
       start = steady_clock::now();
 37a:	c5 f1 72 e0 01       	vpsrad $0x1,%xmm0,%xmm1
 37f:	c5 f1 fe d7          	vpaddd %xmm7,%xmm1,%xmm2
 383:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 387:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 38b:	c5 f0 59 d6          	vmulps %xmm6,%xmm1,%xmm2
 38f:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 393:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 397:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 39b:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 39f:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
          roots[i + k] = sqrt(floats[i + k]);
 3a3:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
 3a7:	c5 f8 29 44 38 f0    	vmovaps %xmm0,-0x10(%rax,%rdi,1)
 3ad:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
 3b3:	75 bb                	jne    370 <_Z17measure_sqrt_timeILy3EEvv+0x370>
 3b5:	ff ca                	dec    %edx
 3b7:	75 b2                	jne    36b <_Z17measure_sqrt_timeILy3EEvv+0x36b>
 3b9:	e8 00 00 00 00       	callq  3be <_Z17measure_sqrt_timeILy3EEvv+0x3be>
 3be:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 3c5:	9b c4 20 
 3c8:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 3cc:	48 29 d8             	sub    %rbx,%rax
 3cf:	48 89 c1             	mov    %rax,%rcx
 3d2:	48 f7 ea             	imul   %rdx
 3d5:	48 c1 f9 3f          	sar    $0x3f,%rcx
 3d9:	48 c1 fa 07          	sar    $0x7,%rdx
 3dd:	48 29 ca             	sub    %rcx,%rdx
 3e0:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 3e7 <_Z17measure_sqrt_timeILy3EEvv+0x3e7>
 3e7:	e8 00 00 00 00       	callq  3ec <_Z17measure_sqrt_timeILy3EEvv+0x3ec>
 3ec:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 3f2:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 42d <_Z17measure_sqrt_timeILy3EEvv+0x42d>
 3f9:	48 89 c6             	mov    %rax,%rsi
 3fc:	48 89 c1             	mov    %rax,%rcx
 3ff:	e8 00 00 00 00       	callq  404 <_Z17measure_sqrt_timeILy3EEvv+0x404>
 404:	48 8b 06             	mov    (%rsi),%rax
 407:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 40b:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 412:	00 
 413:	48 85 db             	test   %rbx,%rbx
 416:	0f 84 49 fe ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 41c:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
      for (int i = 0; i < 4 * N; i += 4) {
 420:	0f 84 2f 06 00 00    	je     a55 <_Z17measure_sqrt_timeILy3EEvv+0xa55>
          roots[i + k] = sqrt(floats[i + k]);
 426:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 42a:	48 89 f1             	mov    %rsi,%rcx
 42d:	e8 00 00 00 00       	callq  432 <_Z17measure_sqrt_timeILy3EEvv+0x432>
 432:	48 89 c1             	mov    %rax,%rcx
 435:	e8 00 00 00 00       	callq  43a <_Z17measure_sqrt_timeILy3EEvv+0x43a>
 43a:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 441 <_Z17measure_sqrt_timeILy3EEvv+0x441>
 441:	41 b8 39 00 00 00    	mov    $0x39,%r8d
	__throw_bad_cast();
 447:	48 8d 15 78 00 00 00 	lea    0x78(%rip),%rdx        # 4c6 <_Z17measure_sqrt_timeILy3EEvv+0x4c6>
 44e:	e8 00 00 00 00       	callq  453 <_Z17measure_sqrt_timeILy3EEvv+0x453>
    for (int j = 0; j < LOOP; j++) {
 453:	49 8b 45 00          	mov    0x0(%r13),%rax
 457:	48 8b 40 e8          	mov    -0x18(%rax),%rax
       end = steady_clock::now();
 45b:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 462:	00 
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 463:	48 85 db             	test   %rbx,%rbx
 466:	0f 84 f9 fd ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 46c:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 470:	0f 84 4c 05 00 00    	je     9c2 <_Z17measure_sqrt_timeILy3EEvv+0x9c2>
 476:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 47a:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 481 <_Z17measure_sqrt_timeILy3EEvv+0x481>
      { return _M_insert(__n); }
 481:	e8 00 00 00 00       	callq  486 <_Z17measure_sqrt_timeILy3EEvv+0x486>
 486:	48 89 c1             	mov    %rax,%rcx
 489:	e8 00 00 00 00       	callq  48e <_Z17measure_sqrt_timeILy3EEvv+0x48e>
	__ostream_insert(__out, __s,
 48e:	e8 00 00 00 00       	callq  493 <_Z17measure_sqrt_timeILy3EEvv+0x493>
 493:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
 498:	48 89 c3             	mov    %rax,%rbx
      { return _M_insert(__n); }
 49b:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
	__ostream_insert(__out, __s,
 49f:	4c 89 e2             	mov    %r12,%rdx
 4a2:	48 89 f8             	mov    %rdi,%rax
    { return flush(__os.put(__os.widen('\n'))); }
 4a5:	c5 f8 28 22          	vmovaps (%rdx),%xmm4
      { return __check_facet(_M_ctype).widen(__c); }
 4a9:	c5 f8 28 42 20       	vmovaps 0x20(%rdx),%xmm0
 4ae:	48 83 c0 40          	add    $0x40,%rax
 4b2:	48 83 c2 40          	add    $0x40,%rdx
      if (!__f)
 4b6:	c5 d8 c6 52 d0 88    	vshufps $0x88,-0x30(%rdx),%xmm4,%xmm2
 4bc:	c5 f8 c6 4a f0 88    	vshufps $0x88,-0x10(%rdx),%xmm0,%xmm1
 4c2:	c5 d8 c6 62 d0 dd    	vshufps $0xdd,-0x30(%rdx),%xmm4,%xmm4
 4c8:	c5 f8 c6 42 f0 dd    	vshufps $0xdd,-0x10(%rdx),%xmm0,%xmm0
    { return __os.flush(); }
 4ce:	c5 e8 c6 d9 88       	vshufps $0x88,%xmm1,%xmm2,%xmm3
 4d3:	c5 e8 c6 c9 dd       	vshufps $0xdd,%xmm1,%xmm2,%xmm1
	__ostream_insert(__out, __s,
 4d8:	c5 d8 c6 d0 88       	vshufps $0x88,%xmm0,%xmm4,%xmm2
 4dd:	c5 d8 c6 c0 dd       	vshufps $0xdd,%xmm0,%xmm4,%xmm0
 4e2:	c5 d9 72 e3 01       	vpsrad $0x1,%xmm3,%xmm4
 4e7:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
 4eb:	c5 e0 5e e5          	vdivps %xmm5,%xmm3,%xmm4
    { return flush(__os.put(__os.widen('\n'))); }
 4ef:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
      { return __check_facet(_M_ctype).widen(__c); }
 4f3:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 4f7:	c5 e0 5e e5          	vdivps %xmm5,%xmm3,%xmm4
 4fb:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
      if (!__f)
 4ff:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 503:	c5 e0 5e dc          	vdivps %xmm4,%xmm3,%xmm3
 507:	c5 e0 58 dc          	vaddps %xmm4,%xmm3,%xmm3
 50b:	c5 d9 72 e2 01       	vpsrad $0x1,%xmm2,%xmm4
 510:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
 514:	c5 e8 5e e5          	vdivps %xmm5,%xmm2,%xmm4
 518:	c5 e0 59 de          	vmulps %xmm6,%xmm3,%xmm3
 51c:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 520:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
    { return __os.flush(); }
 524:	c5 e8 5e e5          	vdivps %xmm5,%xmm2,%xmm4
 528:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
       start = steady_clock::now();
 52c:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 530:	c5 e8 5e d4          	vdivps %xmm4,%xmm2,%xmm2
 534:	c5 e8 58 d4          	vaddps %xmm4,%xmm2,%xmm2
 538:	c5 d9 72 e1 01       	vpsrad $0x1,%xmm1,%xmm4
 53d:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
 541:	c5 f0 5e e5          	vdivps %xmm5,%xmm1,%xmm4
 545:	c5 e8 59 d6          	vmulps %xmm6,%xmm2,%xmm2
 549:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 54d:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 551:	c5 f0 5e e5          	vdivps %xmm5,%xmm1,%xmm4
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 555:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 559:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 55d:	c5 f0 5e cc          	vdivps %xmm4,%xmm1,%xmm1
 561:	c5 f0 58 cc          	vaddps %xmm4,%xmm1,%xmm1
    root = 0.5 * (root + (* a / root));
 565:	c5 d9 72 e0 01       	vpsrad $0x1,%xmm0,%xmm4
 56a:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
 56e:	c5 f8 5e e5          	vdivps %xmm5,%xmm0,%xmm4
 572:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 576:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 57a:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
        roots[i] = sqrt1<LOOPS>(floats + i);
 57e:	c5 f8 5e e5          	vdivps %xmm5,%xmm0,%xmm4
 582:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 586:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 58a:	c5 f8 5e c4          	vdivps %xmm4,%xmm0,%xmm0
    for (int j = 0; j < LOOP; j++) {
 58e:	c5 f8 58 c4          	vaddps %xmm4,%xmm0,%xmm0
       end = steady_clock::now();
 592:	c5 e0 14 e1          	vunpcklps %xmm1,%xmm3,%xmm4
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 596:	c5 e0 15 c9          	vunpckhps %xmm1,%xmm3,%xmm1
 59a:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
 59e:	c5 e8 14 d8          	vunpcklps %xmm0,%xmm2,%xmm3
 5a2:	c5 e8 15 c0          	vunpckhps %xmm0,%xmm2,%xmm0
 5a6:	c5 d8 14 d3          	vunpcklps %xmm3,%xmm4,%xmm2
 5aa:	c5 d8 15 e3          	vunpckhps %xmm3,%xmm4,%xmm4
 5ae:	c5 f8 29 50 c0       	vmovaps %xmm2,-0x40(%rax)
 5b3:	c5 f0 14 d0          	vunpcklps %xmm0,%xmm1,%xmm2
      { return _M_insert(__n); }
 5b7:	c5 f0 15 c8          	vunpckhps %xmm0,%xmm1,%xmm1
 5bb:	c5 f8 29 60 d0       	vmovaps %xmm4,-0x30(%rax)
 5c0:	c5 f8 29 50 e0       	vmovaps %xmm2,-0x20(%rax)
	__ostream_insert(__out, __s,
 5c5:	c5 f8 29 48 f0       	vmovaps %xmm1,-0x10(%rax)
 5ca:	4c 39 e0             	cmp    %r12,%rax
 5cd:	0f 85 d2 fe ff ff    	jne    4a5 <_Z17measure_sqrt_timeILy3EEvv+0x4a5>
 5d3:	ff c9                	dec    %ecx
 5d5:	0f 85 c4 fe ff ff    	jne    49f <_Z17measure_sqrt_timeILy3EEvv+0x49f>
    { return flush(__os.put(__os.widen('\n'))); }
 5db:	e8 00 00 00 00       	callq  5e0 <_Z17measure_sqrt_timeILy3EEvv+0x5e0>
      { return __check_facet(_M_ctype).widen(__c); }
 5e0:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 5e7:	9b c4 20 
      if (!__f)
 5ea:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 5ee:	48 29 d8             	sub    %rbx,%rax
 5f1:	48 89 c1             	mov    %rax,%rcx
 5f4:	48 f7 ea             	imul   %rdx
 5f7:	48 c1 f9 3f          	sar    $0x3f,%rcx
 5fb:	48 c1 fa 07          	sar    $0x7,%rdx
 5ff:	48 29 ca             	sub    %rcx,%rdx
 602:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 609 <_Z17measure_sqrt_timeILy3EEvv+0x609>
    { return __os.flush(); }
 609:	e8 00 00 00 00       	callq  60e <_Z17measure_sqrt_timeILy3EEvv+0x60e>
 60e:	41 b8 05 00 00 00    	mov    $0x5,%r8d
	__ostream_insert(__out, __s,
 614:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 64f <_Z17measure_sqrt_timeILy3EEvv+0x64f>
 61b:	48 89 c6             	mov    %rax,%rsi
 61e:	48 89 c1             	mov    %rax,%rcx
 621:	e8 00 00 00 00       	callq  626 <_Z17measure_sqrt_timeILy3EEvv+0x626>
 626:	48 8b 06             	mov    (%rsi),%rax
    { return flush(__os.put(__os.widen('\n'))); }
 629:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      { return __check_facet(_M_ctype).widen(__c); }
 62d:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 634:	00 
 635:	48 85 db             	test   %rbx,%rbx
 638:	0f 84 27 fc ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
      if (!__f)
 63e:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 642:	0f 84 3e 04 00 00    	je     a86 <_Z17measure_sqrt_timeILy3EEvv+0xa86>
 648:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 64c:	48 89 f1             	mov    %rsi,%rcx
 64f:	e8 00 00 00 00       	callq  654 <_Z17measure_sqrt_timeILy3EEvv+0x654>
 654:	48 89 c1             	mov    %rax,%rcx
 657:	e8 00 00 00 00       	callq  65c <_Z17measure_sqrt_timeILy3EEvv+0x65c>
    { return __os.flush(); }
 65c:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 663 <_Z17measure_sqrt_timeILy3EEvv+0x663>
 663:	41 b8 2e 00 00 00    	mov    $0x2e,%r8d
       start = steady_clock::now();
 669:	48 8d 15 b8 00 00 00 	lea    0xb8(%rip),%rdx        # 728 <_Z17measure_sqrt_timeILy3EEvv+0x728>
 670:	e8 00 00 00 00       	callq  675 <_Z17measure_sqrt_timeILy3EEvv+0x675>
 675:	49 8b 45 00          	mov    0x0(%r13),%rax
 679:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 67d:	49 8b 9c 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rbx
 684:	00 
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 685:	48 85 db             	test   %rbx,%rbx
 688:	0f 84 d7 fb ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 68e:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 692:	0f 84 5b 03 00 00    	je     9f3 <_Z17measure_sqrt_timeILy3EEvv+0x9f3>
 698:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 69c:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 6a3 <_Z17measure_sqrt_timeILy3EEvv+0x6a3>
 6a3:	e8 00 00 00 00       	callq  6a8 <_Z17measure_sqrt_timeILy3EEvv+0x6a8>
 6a8:	48 89 c1             	mov    %rax,%rcx
 6ab:	e8 00 00 00 00       	callq  6b0 <_Z17measure_sqrt_timeILy3EEvv+0x6b0>
 6b0:	e8 00 00 00 00       	callq  6b5 <_Z17measure_sqrt_timeILy3EEvv+0x6b5>
 6b5:	ba e8 03 00 00       	mov    $0x3e8,%edx
 6ba:	48 89 c3             	mov    %rax,%rbx
 6bd:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 6c1:	31 c0                	xor    %eax,%eax
 6c3:	c4 c1 78 28 04 04    	vmovaps (%r12,%rax,1),%xmm0
    root = 0.5 * (root + (* a / root));
 6c9:	48 83 c0 10          	add    $0x10,%rax
 6cd:	c5 f8 5e 4c 38 f0    	vdivps -0x10(%rax,%rdi,1),%xmm0,%xmm1
 6d3:	c5 f0 58 4c 38 f0    	vaddps -0x10(%rax,%rdi,1),%xmm1,%xmm1
 6d9:	c5 f0 59 d6          	vmulps %xmm6,%xmm1,%xmm2
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 6dd:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 6e1:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
    root = 0.5 * (root + (* a / root));
 6e5:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 6e9:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 6ed:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
 6f1:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
 6f5:	c5 f8 29 44 38 f0    	vmovaps %xmm0,-0x10(%rax,%rdi,1)
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 6fb:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
 701:	75 c0                	jne    6c3 <_Z17measure_sqrt_timeILy3EEvv+0x6c3>
 703:	ff ca                	dec    %edx
    root = 0.5 * (root + (* a / root));
 705:	75 ba                	jne    6c1 <_Z17measure_sqrt_timeILy3EEvv+0x6c1>
 707:	e8 00 00 00 00       	callq  70c <_Z17measure_sqrt_timeILy3EEvv+0x70c>
 70c:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 713:	9b c4 20 
 716:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 71a:	48 29 d8             	sub    %rbx,%rax
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 71d:	48 89 c1             	mov    %rax,%rcx
 720:	48 f7 ea             	imul   %rdx
 723:	48 c1 f9 3f          	sar    $0x3f,%rcx
    root = 0.5 * (root + (* a / root));
 727:	48 c1 fa 07          	sar    $0x7,%rdx
 72b:	48 29 ca             	sub    %rcx,%rdx
 72e:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 735 <_Z17measure_sqrt_timeILy3EEvv+0x735>
 735:	e8 00 00 00 00       	callq  73a <_Z17measure_sqrt_timeILy3EEvv+0x73a>
 73a:	41 b8 05 00 00 00    	mov    $0x5,%r8d
          roots[i + k] = sqrt1<LOOPS>(floats + i + k);
 740:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 77b <_Z17measure_sqrt_timeILy3EEvv+0x77b>
 747:	48 89 c6             	mov    %rax,%rsi
 74a:	48 89 c1             	mov    %rax,%rcx
 74d:	e8 00 00 00 00       	callq  752 <_Z17measure_sqrt_timeILy3EEvv+0x752>
 752:	48 8b 06             	mov    (%rsi),%rax
 755:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 759:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 760:	00 
 761:	48 85 db             	test   %rbx,%rbx
 764:	0f 84 fb fa ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 76a:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 76e:	0f 84 b0 02 00 00    	je     a24 <_Z17measure_sqrt_timeILy3EEvv+0xa24>
 774:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 778:	48 89 f1             	mov    %rsi,%rcx
 77b:	e8 00 00 00 00       	callq  780 <_Z17measure_sqrt_timeILy3EEvv+0x780>
    for (int j = 0; j < LOOP; j++) {
 780:	48 89 c1             	mov    %rax,%rcx
 783:	e8 00 00 00 00       	callq  788 <_Z17measure_sqrt_timeILy3EEvv+0x788>
       end = steady_clock::now();
 788:	e8 00 00 00 00       	callq  78d <_Z17measure_sqrt_timeILy3EEvv+0x78d>
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 78d:	ba e8 03 00 00       	mov    $0x3e8,%edx
 792:	48 89 c6             	mov    %rax,%rsi
 795:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 799:	31 c0                	xor    %eax,%eax
 79b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 7a0:	c4 c1 78 28 04 04    	vmovaps (%r12,%rax,1),%xmm0
 7a6:	48 83 c0 10          	add    $0x10,%rax
 7aa:	c5 e9 72 e0 01       	vpsrad $0x1,%xmm0,%xmm2
      { return _M_insert(__n); }
 7af:	c5 e9 fe d7          	vpaddd %xmm7,%xmm2,%xmm2
 7b3:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 7b7:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
	__ostream_insert(__out, __s,
 7bb:	c5 f0 59 d6          	vmulps %xmm6,%xmm1,%xmm2
 7bf:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 7c3:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
      { return _M_insert(__n); }
 7c7:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
	__ostream_insert(__out, __s,
 7cb:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 7cf:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
    { return flush(__os.put(__os.widen('\n'))); }
 7d3:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
      { return __check_facet(_M_ctype).widen(__c); }
 7d7:	c5 f8 29 44 38 f0    	vmovaps %xmm0,-0x10(%rax,%rdi,1)
 7dd:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
      if (!__f)
 7e3:	75 bb                	jne    7a0 <_Z17measure_sqrt_timeILy3EEvv+0x7a0>
 7e5:	ff ca                	dec    %edx
 7e7:	75 b0                	jne    799 <_Z17measure_sqrt_timeILy3EEvv+0x799>
 7e9:	e8 00 00 00 00       	callq  7ee <_Z17measure_sqrt_timeILy3EEvv+0x7ee>
 7ee:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 7f5 <_Z17measure_sqrt_timeILy3EEvv+0x7f5>
 7f5:	41 b8 34 00 00 00    	mov    $0x34,%r8d
 7fb:	48 8d 15 e8 00 00 00 	lea    0xe8(%rip),%rdx        # 8ea <_Z17measure_sqrt_timeILy3EEvv+0x8ea>
    { return __os.flush(); }
 802:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 806:	48 29 f0             	sub    %rsi,%rax
	__ostream_insert(__out, __s,
 809:	48 89 c3             	mov    %rax,%rbx
 80c:	e8 00 00 00 00       	callq  811 <_Z17measure_sqrt_timeILy3EEvv+0x811>
 811:	49 8b 45 00          	mov    0x0(%r13),%rax
 815:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 819:	49 8b b4 05 f0 00 00 	mov    0xf0(%r13,%rax,1),%rsi
 820:	00 
    { return flush(__os.put(__os.widen('\n'))); }
 821:	48 85 f6             	test   %rsi,%rsi
      { return __check_facet(_M_ctype).widen(__c); }
 824:	0f 84 3b fa ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 82a:	80 7e 38 00          	cmpb   $0x0,0x38(%rsi)
 82e:	0f 84 e5 02 00 00    	je     b19 <_Z17measure_sqrt_timeILy3EEvv+0xb19>
      if (!__f)
 834:	0f be 56 43          	movsbl 0x43(%rsi),%edx
 838:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 83f <_Z17measure_sqrt_timeILy3EEvv+0x83f>
 83f:	e8 00 00 00 00       	callq  844 <_Z17measure_sqrt_timeILy3EEvv+0x844>
 844:	48 89 c1             	mov    %rax,%rcx
 847:	e8 00 00 00 00       	callq  84c <_Z17measure_sqrt_timeILy3EEvv+0x84c>
 84c:	48 89 d8             	mov    %rbx,%rax
 84f:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 856:	9b c4 20 
    { return __os.flush(); }
 859:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 860 <_Z17measure_sqrt_timeILy3EEvv+0x860>
       start = steady_clock::now();
 860:	48 c1 fb 3f          	sar    $0x3f,%rbx
 864:	48 f7 ea             	imul   %rdx
 867:	48 c1 fa 07          	sar    $0x7,%rdx
 86b:	48 29 da             	sub    %rbx,%rdx
 86e:	e8 00 00 00 00       	callq  873 <_Z17measure_sqrt_timeILy3EEvv+0x873>
    root[0] = 0.5 * (root[0] + (a[0] / root[0]));
 873:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 879:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 8b4 <_Z17measure_sqrt_timeILy3EEvv+0x8b4>
 880:	48 89 c6             	mov    %rax,%rsi
 883:	48 89 c1             	mov    %rax,%rcx
 886:	e8 00 00 00 00       	callq  88b <_Z17measure_sqrt_timeILy3EEvv+0x88b>
 88b:	48 8b 06             	mov    (%rsi),%rax
 88e:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 892:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 899:	00 
 89a:	48 85 db             	test   %rbx,%rbx
 89d:	0f 84 c2 f9 ff ff    	je     265 <_Z17measure_sqrt_timeILy3EEvv+0x265>
 8a3:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
    for (int j = 0; j < LOOP; j++) {
 8a7:	0f 84 3b 02 00 00    	je     ae8 <_Z17measure_sqrt_timeILy3EEvv+0xae8>
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 8ad:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 8b1:	48 89 f1             	mov    %rsi,%rcx
 8b4:	e8 00 00 00 00       	callq  8b9 <_Z17measure_sqrt_timeILy3EEvv+0x8b9>
       end = steady_clock::now();
 8b9:	90                   	nop
 8ba:	c5 f8 28 75 d0       	vmovaps -0x30(%rbp),%xmm6
 8bf:	c5 f8 28 7d e0       	vmovaps -0x20(%rbp),%xmm7
 8c4:	48 89 c1             	mov    %rax,%rcx
 8c7:	48 8d 65 f8          	lea    -0x8(%rbp),%rsp
 8cb:	5b                   	pop    %rbx
 8cc:	5e                   	pop    %rsi
 8cd:	5f                   	pop    %rdi
 8ce:	41 5c                	pop    %r12
      { return _M_insert(__n); }
 8d0:	41 5d                	pop    %r13
 8d2:	41 5e                	pop    %r14
 8d4:	41 5f                	pop    %r15
 8d6:	5d                   	pop    %rbp
 8d7:	e9 00 00 00 00       	jmpq   8dc <_Z17measure_sqrt_timeILy3EEvv+0x8dc>
	__ostream_insert(__out, __s,
 8dc:	0f 1f 40 00          	nopl   0x0(%rax)
 8e0:	e8 00 00 00 00       	callq  8e5 <_Z17measure_sqrt_timeILy3EEvv+0x8e5>
 8e5:	e9 41 f9 ff ff       	jmpq   22b <_Z17measure_sqrt_timeILy3EEvv+0x22b>
      { return _M_insert(__n); }
 8ea:	e8 00 00 00 00       	callq  8ef <_Z17measure_sqrt_timeILy3EEvv+0x8ef>
	__ostream_insert(__out, __s,
 8ef:	e9 13 f9 ff ff       	jmpq   207 <_Z17measure_sqrt_timeILy3EEvv+0x207>
    { return flush(__os.put(__os.widen('\n'))); }
 8f4:	e8 00 00 00 00       	callq  8f9 <_Z17measure_sqrt_timeILy3EEvv+0x8f9>
      { return __check_facet(_M_ctype).widen(__c); }
 8f9:	e9 e5 f8 ff ff       	jmpq   1e3 <_Z17measure_sqrt_timeILy3EEvv+0x1e3>
 8fe:	48 89 d9             	mov    %rbx,%rcx
 901:	e8 00 00 00 00       	callq  906 <_Z17measure_sqrt_timeILy3EEvv+0x906>
      if (!__f)
 906:	48 8b 03             	mov    (%rbx),%rax
 909:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 910 <_Z17measure_sqrt_timeILy3EEvv+0x910>
 910:	ba 0a 00 00 00       	mov    $0xa,%edx
 915:	48 8b 40 30          	mov    0x30(%rax),%rax
 919:	48 39 c8             	cmp    %rcx,%rax
 91c:	0f 84 e0 f7 ff ff    	je     102 <_Z17measure_sqrt_timeILy3EEvv+0x102>
    { return __os.flush(); }
 922:	48 89 d9             	mov    %rbx,%rcx
 925:	ff d0                	callq  *%rax
 927:	0f be d0             	movsbl %al,%edx
       start = steady_clock::now();
 92a:	e9 d3 f7 ff ff       	jmpq   102 <_Z17measure_sqrt_timeILy3EEvv+0x102>
 92f:	48 89 d9             	mov    %rbx,%rcx
 932:	e8 00 00 00 00       	callq  937 <_Z17measure_sqrt_timeILy3EEvv+0x937>
 937:	48 8b 03             	mov    (%rbx),%rax
 93a:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 941 <_Z17measure_sqrt_timeILy3EEvv+0x941>
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 941:	ba 0a 00 00 00       	mov    $0xa,%edx
 946:	48 8b 40 30          	mov    0x30(%rax),%rax
 94a:	48 39 c8             	cmp    %rcx,%rax
 94d:	0f 84 37 f7 ff ff    	je     8a <_Z17measure_sqrt_timeILy3EEvv+0x8a>
    * root = 0.5 * (* root + (* a / * root));
 953:	48 89 d9             	mov    %rbx,%rcx
 956:	ff d0                	callq  *%rax
 958:	0f be d0             	movsbl %al,%edx
 95b:	e9 2a f7 ff ff       	jmpq   8a <_Z17measure_sqrt_timeILy3EEvv+0x8a>
 960:	48 89 d9             	mov    %rbx,%rcx
 963:	e8 00 00 00 00       	callq  968 <_Z17measure_sqrt_timeILy3EEvv+0x968>
 968:	48 8b 03             	mov    (%rbx),%rax
 96b:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 972 <_Z17measure_sqrt_timeILy3EEvv+0x972>
      for (int i = 0; i < 4 * N; i += 4) {
 972:	ba 0a 00 00 00       	mov    $0xa,%edx
 977:	48 8b 40 30          	mov    0x30(%rax),%rax
    for (int j = 0; j < LOOP; j++) {
 97b:	48 39 c8             	cmp    %rcx,%rax
       end = steady_clock::now();
 97e:	0f 84 02 f8 ff ff    	je     186 <_Z17measure_sqrt_timeILy3EEvv+0x186>
	__ostream_insert(__out, __s,
 984:	48 89 d9             	mov    %rbx,%rcx
 987:	ff d0                	callq  *%rax
 989:	0f be d0             	movsbl %al,%edx
 98c:	e9 f5 f7 ff ff       	jmpq   186 <_Z17measure_sqrt_timeILy3EEvv+0x186>
 991:	48 89 d9             	mov    %rbx,%rcx
 994:	e8 00 00 00 00       	callq  999 <_Z17measure_sqrt_timeILy3EEvv+0x999>
 999:	48 8b 03             	mov    (%rbx),%rax
 99c:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 9a3 <_Z17measure_sqrt_timeILy3EEvv+0x9a3>
 9a3:	ba 0a 00 00 00       	mov    $0xa,%edx
    { return flush(__os.put(__os.widen('\n'))); }
 9a8:	48 8b 40 30          	mov    0x30(%rax),%rax
      { return __check_facet(_M_ctype).widen(__c); }
 9ac:	48 39 c8             	cmp    %rcx,%rax
 9af:	0f 84 81 f9 ff ff    	je     336 <_Z17measure_sqrt_timeILy3EEvv+0x336>
      if (!__f)
 9b5:	48 89 d9             	mov    %rbx,%rcx
 9b8:	ff d0                	callq  *%rax
 9ba:	0f be d0             	movsbl %al,%edx
 9bd:	e9 74 f9 ff ff       	jmpq   336 <_Z17measure_sqrt_timeILy3EEvv+0x336>
 9c2:	48 89 d9             	mov    %rbx,%rcx
 9c5:	e8 00 00 00 00       	callq  9ca <_Z17measure_sqrt_timeILy3EEvv+0x9ca>
 9ca:	48 8b 03             	mov    (%rbx),%rax
 9cd:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 9d4 <_Z17measure_sqrt_timeILy3EEvv+0x9d4>
 9d4:	ba 0a 00 00 00       	mov    $0xa,%edx
    { return __os.flush(); }
 9d9:	48 8b 40 30          	mov    0x30(%rax),%rax
 9dd:	48 39 c8             	cmp    %rcx,%rax
    std::cout << time.time_clock().count() / LOOP  << " [ns]" << std::endl;
 9e0:	0f 84 94 fa ff ff    	je     47a <_Z17measure_sqrt_timeILy3EEvv+0x47a>
 9e6:	48 89 d9             	mov    %rbx,%rcx
 9e9:	ff d0                	callq  *%rax
 9eb:	0f be d0             	movsbl %al,%edx
      { return _M_insert(__n); }
 9ee:	e9 87 fa ff ff       	jmpq   47a <_Z17measure_sqrt_timeILy3EEvv+0x47a>
 9f3:	48 89 d9             	mov    %rbx,%rcx
 9f6:	e8 00 00 00 00       	callq  9fb <_Z17measure_sqrt_timeILy3EEvv+0x9fb>
 9fb:	48 8b 03             	mov    (%rbx),%rax
 9fe:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # a05 <_Z17measure_sqrt_timeILy3EEvv+0xa05>
 a05:	ba 0a 00 00 00       	mov    $0xa,%edx
	__ostream_insert(__out, __s,
 a0a:	48 8b 40 30          	mov    0x30(%rax),%rax
 a0e:	48 39 c8             	cmp    %rcx,%rax
 a11:	0f 84 85 fc ff ff    	je     69c <_Z17measure_sqrt_timeILy3EEvv+0x69c>
 a17:	48 89 d9             	mov    %rbx,%rcx
 a1a:	ff d0                	callq  *%rax
 a1c:	0f be d0             	movsbl %al,%edx
    { return flush(__os.put(__os.widen('\n'))); }
 a1f:	e9 78 fc ff ff       	jmpq   69c <_Z17measure_sqrt_timeILy3EEvv+0x69c>
      { return __check_facet(_M_ctype).widen(__c); }
 a24:	48 89 d9             	mov    %rbx,%rcx
 a27:	e8 00 00 00 00       	callq  a2c <_Z17measure_sqrt_timeILy3EEvv+0xa2c>
 a2c:	48 8b 03             	mov    (%rbx),%rax
      if (!__f)
 a2f:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # a36 <_Z17measure_sqrt_timeILy3EEvv+0xa36>
 a36:	ba 0a 00 00 00       	mov    $0xa,%edx
 a3b:	48 8b 40 30          	mov    0x30(%rax),%rax
 a3f:	48 39 c8             	cmp    %rcx,%rax
 a42:	0f 84 30 fd ff ff    	je     778 <_Z17measure_sqrt_timeILy3EEvv+0x778>
 a48:	48 89 d9             	mov    %rbx,%rcx
 a4b:	ff d0                	callq  *%rax
 a4d:	0f be d0             	movsbl %al,%edx
}
 a50:	e9 23 fd ff ff       	jmpq   778 <_Z17measure_sqrt_timeILy3EEvv+0x778>
 a55:	48 89 d9             	mov    %rbx,%rcx
    { return __os.flush(); }
 a58:	e8 00 00 00 00       	callq  a5d <_Z17measure_sqrt_timeILy3EEvv+0xa5d>
 a5d:	48 8b 03             	mov    (%rbx),%rax
 a60:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # a67 <_Z17measure_sqrt_timeILy3EEvv+0xa67>
 a67:	ba 0a 00 00 00       	mov    $0xa,%edx
 a6c:	48 8b 40 30          	mov    0x30(%rax),%rax
          roots[i + k] = sqrt(floats[i + k]);
 a70:	48 39 c8             	cmp    %rcx,%rax
 a73:	0f 84 b1 f9 ff ff    	je     42a <_Z17measure_sqrt_timeILy3EEvv+0x42a>
 a79:	48 89 d9             	mov    %rbx,%rcx
 a7c:	ff d0                	callq  *%rax
 a7e:	0f be d0             	movsbl %al,%edx
 a81:	e9 a4 f9 ff ff       	jmpq   42a <_Z17measure_sqrt_timeILy3EEvv+0x42a>
 a86:	48 89 d9             	mov    %rbx,%rcx
 a89:	e8 00 00 00 00       	callq  a8e <_Z17measure_sqrt_timeILy3EEvv+0xa8e>
	this->_M_widen_init();
 a8e:	48 8b 03             	mov    (%rbx),%rax
 a91:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # a98 <_Z17measure_sqrt_timeILy3EEvv+0xa98>
	return this->do_widen(__c);
 a98:	ba 0a 00 00 00       	mov    $0xa,%edx
 a9d:	48 8b 40 30          	mov    0x30(%rax),%rax
 aa1:	48 39 c8             	cmp    %rcx,%rax
 aa4:	0f 84 a2 fb ff ff    	je     64c <_Z17measure_sqrt_timeILy3EEvv+0x64c>
 aaa:	48 89 d9             	mov    %rbx,%rcx
 aad:	ff d0                	callq  *%rax
 aaf:	0f be d0             	movsbl %al,%edx
 ab2:	e9 95 fb ff ff       	jmpq   64c <_Z17measure_sqrt_timeILy3EEvv+0x64c>
 ab7:	48 89 d9             	mov    %rbx,%rcx
 aba:	e8 00 00 00 00       	callq  abf <_Z17measure_sqrt_timeILy3EEvv+0xabf>
	this->_M_widen_init();
 abf:	48 8b 03             	mov    (%rbx),%rax
 ac2:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # ac9 <_Z17measure_sqrt_timeILy3EEvv+0xac9>
	return this->do_widen(__c);
 ac9:	ba 0a 00 00 00       	mov    $0xa,%edx
 ace:	48 8b 40 30          	mov    0x30(%rax),%rax
 ad2:	48 39 c8             	cmp    %rcx,%rax
 ad5:	0f 84 0b f8 ff ff    	je     2e6 <_Z17measure_sqrt_timeILy3EEvv+0x2e6>
 adb:	48 89 d9             	mov    %rbx,%rcx
 ade:	ff d0                	callq  *%rax
 ae0:	0f be d0             	movsbl %al,%edx
 ae3:	e9 fe f7 ff ff       	jmpq   2e6 <_Z17measure_sqrt_timeILy3EEvv+0x2e6>
 ae8:	48 89 d9             	mov    %rbx,%rcx
 aeb:	e8 00 00 00 00       	callq  af0 <_Z17measure_sqrt_timeILy3EEvv+0xaf0>
	this->_M_widen_init();
 af0:	48 8b 03             	mov    (%rbx),%rax
 af3:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # afa <_Z17measure_sqrt_timeILy3EEvv+0xafa>
	return this->do_widen(__c);
 afa:	ba 0a 00 00 00       	mov    $0xa,%edx
 aff:	48 8b 40 30          	mov    0x30(%rax),%rax
 b03:	48 39 c8             	cmp    %rcx,%rax
 b06:	0f 84 a5 fd ff ff    	je     8b1 <_Z17measure_sqrt_timeILy3EEvv+0x8b1>
 b0c:	48 89 d9             	mov    %rbx,%rcx
 b0f:	ff d0                	callq  *%rax
 b11:	0f be d0             	movsbl %al,%edx
 b14:	e9 98 fd ff ff       	jmpq   8b1 <_Z17measure_sqrt_timeILy3EEvv+0x8b1>
 b19:	48 89 f1             	mov    %rsi,%rcx
 b1c:	e8 00 00 00 00       	callq  b21 <_Z17measure_sqrt_timeILy3EEvv+0xb21>
	this->_M_widen_init();
 b21:	48 8b 06             	mov    (%rsi),%rax
 b24:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # b2b <_Z17measure_sqrt_timeILy3EEvv+0xb2b>
	return this->do_widen(__c);
 b2b:	ba 0a 00 00 00       	mov    $0xa,%edx
 b30:	48 8b 40 30          	mov    0x30(%rax),%rax
 b34:	48 39 c8             	cmp    %rcx,%rax
 b37:	0f 84 fb fc ff ff    	je     838 <_Z17measure_sqrt_timeILy3EEvv+0x838>
 b3d:	48 89 f1             	mov    %rsi,%rcx
 b40:	ff d0                	callq  *%rax
 b42:	0f be d0             	movsbl %al,%edx
 b45:	e9 ee fc ff ff       	jmpq   838 <_Z17measure_sqrt_timeILy3EEvv+0x838>
 b4a:	90                   	nop
 b4b:	90                   	nop
 b4c:	90                   	nop
 b4d:	90                   	nop
 b4e:	90                   	nop
 b4f:	90                   	nop

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
   c:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
{
  13:	48 8d ac 24 80 00 00 	lea    0x80(%rsp),%rbp
  1a:	00 
  1b:	c5 f8 29 75 d0       	vmovaps %xmm6,-0x30(%rbp)
  static std::random_device device;
  20:	c5 f8 29 7d e0       	vmovaps %xmm7,-0x20(%rbp)
  25:	c5 78 29 45 f0       	vmovaps %xmm8,-0x10(%rbp)
  2a:	c5 78 29 4d 00       	vmovaps %xmm9,0x0(%rbp)
  2f:	c5 78 29 55 10       	vmovaps %xmm10,0x10(%rbp)
  34:	b8 80 6a 18 00       	mov    $0x186a80,%eax
  39:	e8 00 00 00 00       	callq  3e <_Z17measure_sqrt_timeILy4EEvv+0x3e>
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  3e:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 45 <_Z17measure_sqrt_timeILy4EEvv+0x45>
  45:	ba 04 00 00 00       	mov    $0x4,%edx
      return this->_M_getval_pretr1();
  4a:	48 29 c4             	sub    %rax,%rsp
  4d:	e8 00 00 00 00       	callq  52 <_Z17measure_sqrt_timeILy4EEvv+0x52>
	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
  52:	41 b8 0b 00 00 00    	mov    $0xb,%r8d
  58:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 5f <_Z17measure_sqrt_timeILy4EEvv+0x5f>
  5f:	48 8d bc 24 9f 00 00 	lea    0x9f(%rsp),%rdi
  66:	00 
  67:	48 89 c6             	mov    %rax,%rsi
  6a:	48 89 c1             	mov    %rax,%rcx
  6d:	48 83 e7 80          	and    $0xffffffffffffff80,%rdi
  71:	e8 00 00 00 00       	callq  76 <_Z17measure_sqrt_timeILy4EEvv+0x76>
  76:	48 8b 06             	mov    (%rsi),%rax
  79:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  7d:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  84:	00 
      __ret = __sum / __tmp;
  85:	48 85 db             	test   %rbx,%rbx
  88:	0f 84 df 01 00 00    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
      if (__builtin_expect(__ret >= _RealType(1), 0))
  8e:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
  92:	0f 84 37 0a 00 00    	je     acf <_Z17measure_sqrt_timeILy4EEvv+0xacf>
  98:	0f be 53 43          	movsbl 0x43(%rbx),%edx
  9c:	48 89 f1             	mov    %rsi,%rcx
  9f:	e8 00 00 00 00       	callq  a4 <_Z17measure_sqrt_timeILy4EEvv+0xa4>
	  return (__aurng() * (__p.b() - __p.a())) + __p.a();
  a4:	48 89 c1             	mov    %rax,%rcx
  a7:	e8 00 00 00 00       	callq  ac <_Z17measure_sqrt_timeILy4EEvv+0xac>
}
  ac:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # b3 <_Z17measure_sqrt_timeILy4EEvv+0xb3>
  b3:	41 b8 0b 00 00 00    	mov    $0xb,%r8d
  b9:	48 8d 15 0c 00 00 00 	lea    0xc(%rip),%rdx        # cc <_Z17measure_sqrt_timeILy4EEvv+0xcc>
  c0:	e8 00 00 00 00       	callq  c5 <_Z17measure_sqrt_timeILy4EEvv+0xc5>
  static std::uniform_real_distribution<double> dist(0.0, 10000.0);
  c5:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # cc <_Z17measure_sqrt_timeILy4EEvv+0xcc>
  cc:	ba 40 0d 03 00       	mov    $0x30d40,%edx
  d1:	e8 00 00 00 00       	callq  d6 <_Z17measure_sqrt_timeILy4EEvv+0xd6>
	: _M_a(__a), _M_b(__b)
  d6:	41 b8 11 00 00 00    	mov    $0x11,%r8d
  dc:	48 8d 15 18 00 00 00 	lea    0x18(%rip),%rdx        # fb <_Z17measure_sqrt_timeILy4EEvv+0xfb>
  e3:	48 89 c6             	mov    %rax,%rsi
  e6:	48 89 c1             	mov    %rax,%rcx
  e9:	e8 00 00 00 00       	callq  ee <_Z17measure_sqrt_timeILy4EEvv+0xee>
  ee:	48 8b 06             	mov    (%rsi),%rax
  f1:	48 8b 40 e8          	mov    -0x18(%rax),%rax
  f5:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
  fc:	00 
	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
  fd:	48 85 db             	test   %rbx,%rbx
 100:	0f 84 67 01 00 00    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
    { _M_init_pretr1(__token); }
 106:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
      { _M_string_length = __length; }
 10a:	0f 84 8e 09 00 00    	je     a9e <_Z17measure_sqrt_timeILy4EEvv+0xa9e>
 110:	0f be 53 43          	movsbl 0x43(%rbx),%edx
	: allocator_type(__a), _M_p(__dat) { }
 114:	48 89 f1             	mov    %rsi,%rcx
 117:	4c 8d af 00 35 0c 00 	lea    0xc3500(%rdi),%r13
 11e:	48 8d 9f 00 6a 18 00 	lea    0x186a00(%rdi),%rbx
 125:	e8 00 00 00 00       	callq  12a <_Z17measure_sqrt_timeILy4EEvv+0x12a>
      { __c1 = __c2; }
 12a:	4d 89 ee             	mov    %r13,%r14
 12d:	48 89 c1             	mov    %rax,%rcx
 130:	e8 00 00 00 00       	callq  135 <_Z17measure_sqrt_timeILy4EEvv+0x135>
  static std::random_device device;
 135:	e8 10 00 00 00       	callq  14a <_Z17measure_sqrt_timeILy4EEvv+0x14a>
	if (!_M_is_local())
 13a:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
 13e:	49 83 c6 04          	add    $0x4,%r14
 142:	c5 d3 5a e8          	vcvtsd2ss %xmm0,%xmm5,%xmm5
 146:	c4 c1 7a 11 6e fc    	vmovss %xmm5,-0x4(%r14)
 14c:	49 39 de             	cmp    %rbx,%r14
 14f:	75 e4                	jne    135 <_Z17measure_sqrt_timeILy4EEvv+0x135>
 151:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 158 <_Z17measure_sqrt_timeILy4EEvv+0x158>
 158:	41 b8 09 00 00 00    	mov    $0x9,%r8d
 15e:	48 8d 15 2a 00 00 00 	lea    0x2a(%rip),%rdx        # 18f <_Z17measure_sqrt_timeILy4EEvv+0x18f>
	  __ret = std::nextafter(_RealType(1), _RealType(0));
 165:	e8 00 00 00 00       	callq  16a <_Z17measure_sqrt_timeILy4EEvv+0x16a>
 16a:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 171 <_Z17measure_sqrt_timeILy4EEvv+0x171>
 171:	49 8b 04 24          	mov    (%r12),%rax
 175:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 179:	49 8b 9c 04 f0 00 00 	mov    0xf0(%r12,%rax,1),%rbx
 180:	00 
 181:	48 85 db             	test   %rbx,%rbx
 184:	0f 84 e3 00 00 00    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
 18a:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 18e:	0f 84 6c 09 00 00    	je     b00 <_Z17measure_sqrt_timeILy4EEvv+0xb00>
 194:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 198:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 19f <_Z17measure_sqrt_timeILy4EEvv+0x19f>
 19f:	e8 00 00 00 00       	callq  1a4 <_Z17measure_sqrt_timeILy4EEvv+0x1a4>
 1a4:	48 89 c1             	mov    %rax,%rcx
 1a7:	e8 00 00 00 00       	callq  1ac <_Z17measure_sqrt_timeILy4EEvv+0x1ac>
 1ac:	e8 00 00 00 00       	callq  1b1 <_Z17measure_sqrt_timeILy4EEvv+0x1b1>
 1b1:	c7 45 ac e8 03 00 00 	movl   $0x3e8,-0x54(%rbp)
 1b8:	c5 c9 57 f6          	vxorpd %xmm6,%xmm6,%xmm6
 1bc:	49 89 c7             	mov    %rax,%r15
 1bf:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 1c3:	48 89 fe             	mov    %rdi,%rsi
 1c6:	4c 89 eb             	mov    %r13,%rbx
 1c9:	e9 7f 00 00 00       	jmpq   24d <_Z17measure_sqrt_timeILy4EEvv+0x24d>
 1ce:	66 90                	xchg   %ax,%ax
 1d0:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1d4:	c5 c3 5a ff          	vcvtsd2ss %xmm7,%xmm7,%xmm7
 1d8:	c5 fa 5a 43 04       	vcvtss2sd 0x4(%rbx),%xmm0,%xmm0
 1dd:	c5 fa 11 3e          	vmovss %xmm7,(%rsi)
void measure_sqrt_time(void) {
 1e1:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 1e5:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 1e9:	0f 87 a5 08 00 00    	ja     a94 <_Z17measure_sqrt_timeILy4EEvv+0xa94>
 1ef:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 1f3:	c5 d0 57 ed          	vxorps %xmm5,%xmm5,%xmm5
 1f7:	c5 fa 5a 43 08       	vcvtss2sd 0x8(%rbx),%xmm0,%xmm0
 1fc:	c5 d3 5a ef          	vcvtsd2ss %xmm7,%xmm5,%xmm5
 200:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 204:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 208:	c5 fa 11 6e 04       	vmovss %xmm5,0x4(%rsi)
      { return _M_insert(__n); }
 20d:	0f 87 77 08 00 00    	ja     a8a <_Z17measure_sqrt_timeILy4EEvv+0xa8a>
 213:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 217:	c5 e0 57 db          	vxorps %xmm3,%xmm3,%xmm3
 21b:	c5 fa 5a 43 0c       	vcvtss2sd 0xc(%rbx),%xmm0,%xmm0
	__ostream_insert(__out, __s,
 220:	c5 e3 5a df          	vcvtsd2ss %xmm7,%xmm3,%xmm3
 224:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 228:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
 22c:	c5 fa 11 5e 08       	vmovss %xmm3,0x8(%rsi)
 231:	0f 87 49 08 00 00    	ja     a80 <_Z17measure_sqrt_timeILy4EEvv+0xa80>
      { return _M_insert(__n); }
 237:	c5 c3 5a ff          	vcvtsd2ss %xmm7,%xmm7,%xmm7
 23b:	48 83 c3 10          	add    $0x10,%rbx
	__ostream_insert(__out, __s,
 23f:	48 83 c6 10          	add    $0x10,%rsi
 243:	c5 fa 11 7e fc       	vmovss %xmm7,-0x4(%rsi)
      { return __check_facet(_M_ctype).widen(__c); }
 248:	4c 39 f3             	cmp    %r14,%rbx
 24b:	74 25                	je     272 <_Z17measure_sqrt_timeILy4EEvv+0x272>
 24d:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
 251:	c5 fa 5a 03          	vcvtss2sd (%rbx),%xmm0,%xmm0
      if (!__f)
 255:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
 259:	c5 c3 51 f8          	vsqrtsd %xmm0,%xmm7,%xmm7
	if (_M_widen_ok)
 25d:	0f 86 6d ff ff ff    	jbe    1d0 <_Z17measure_sqrt_timeILy4EEvv+0x1d0>
 263:	e8 00 00 00 00       	callq  268 <_Z17measure_sqrt_timeILy4EEvv+0x268>
 268:	e9 63 ff ff ff       	jmpq   1d0 <_Z17measure_sqrt_timeILy4EEvv+0x1d0>
    { return flush(__os.put(__os.widen('\n'))); }
 26d:	e8 00 00 00 00       	callq  272 <_Z17measure_sqrt_timeILy4EEvv+0x272>
    { return __os.flush(); }
 272:	ff 4d ac             	decl   -0x54(%rbp)
 275:	0f 85 48 ff ff ff    	jne    1c3 <_Z17measure_sqrt_timeILy4EEvv+0x1c3>
	__ostream_insert(__out, __s,
 27b:	e8 00 00 00 00       	callq  280 <_Z17measure_sqrt_timeILy4EEvv+0x280>
 280:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 287:	9b c4 20 
 28a:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 28e:	4c 29 f8             	sub    %r15,%rax
 291:	48 89 c1             	mov    %rax,%rcx
    std::cout << "generating " << (4 * N) << " random values..." << std::endl;
 294:	48 f7 ea             	imul   %rdx
 297:	48 c1 f9 3f          	sar    $0x3f,%rcx
 29b:	48 c1 fa 07          	sar    $0x7,%rdx
 29f:	48 29 ca             	sub    %rcx,%rdx
 2a2:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2a9 <_Z17measure_sqrt_timeILy4EEvv+0x2a9>
 2a9:	e8 00 00 00 00       	callq  2ae <_Z17measure_sqrt_timeILy4EEvv+0x2ae>
 2ae:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 2b4:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 2ef <_Z17measure_sqrt_timeILy4EEvv+0x2ef>
 2bb:	48 89 c6             	mov    %rax,%rsi
    { return flush(__os.put(__os.widen('\n'))); }
 2be:	48 89 c1             	mov    %rax,%rcx
      { return __check_facet(_M_ctype).widen(__c); }
 2c1:	e8 00 00 00 00       	callq  2c6 <_Z17measure_sqrt_timeILy4EEvv+0x2c6>
 2c6:	48 8b 06             	mov    (%rsi),%rax
 2c9:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      if (!__f)
 2cd:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 2d4:	00 
 2d5:	48 85 db             	test   %rbx,%rbx
 2d8:	74 93                	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
 2da:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 2de:	0f 84 73 09 00 00    	je     c57 <_Z17measure_sqrt_timeILy4EEvv+0xc57>
 2e4:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 2e8:	48 89 f1             	mov    %rsi,%rcx
 2eb:	e8 00 00 00 00       	callq  2f0 <_Z17measure_sqrt_timeILy4EEvv+0x2f0>
 2f0:	48 89 c1             	mov    %rax,%rcx
 2f3:	e8 00 00 00 00       	callq  2f8 <_Z17measure_sqrt_timeILy4EEvv+0x2f8>
    { return __os.flush(); }
 2f8:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 2ff <_Z17measure_sqrt_timeILy4EEvv+0x2ff>
 2ff:	41 b8 37 00 00 00    	mov    $0x37,%r8d
       floats[i] = random_double();
 305:	48 8d 15 40 00 00 00 	lea    0x40(%rip),%rdx        # 34c <_Z17measure_sqrt_timeILy4EEvv+0x34c>
 30c:	e8 00 00 00 00       	callq  311 <_Z17measure_sqrt_timeILy4EEvv+0x311>
 311:	49 8b 04 24          	mov    (%r12),%rax
 315:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 319:	49 8b 9c 04 f0 00 00 	mov    0xf0(%r12,%rax,1),%rbx
 320:	00 
	__ostream_insert(__out, __s,
 321:	48 85 db             	test   %rbx,%rbx
 324:	0f 84 43 ff ff ff    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
 32a:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 32e:	0f 84 fd 07 00 00    	je     b31 <_Z17measure_sqrt_timeILy4EEvv+0xb31>
 334:	0f be 53 43          	movsbl 0x43(%rbx),%edx
    { return flush(__os.put(__os.widen('\n'))); }
 338:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 33f <_Z17measure_sqrt_timeILy4EEvv+0x33f>
 33f:	e8 00 00 00 00       	callq  344 <_Z17measure_sqrt_timeILy4EEvv+0x344>
      { return __check_facet(_M_ctype).widen(__c); }
 344:	48 89 c1             	mov    %rax,%rcx
 347:	e8 00 00 00 00       	callq  34c <_Z17measure_sqrt_timeILy4EEvv+0x34c>
 34c:	e8 00 00 00 00       	callq  351 <_Z17measure_sqrt_timeILy4EEvv+0x351>
      if (!__f)
 351:	ba e8 03 00 00       	mov    $0x3e8,%edx
 356:	c5 f8 28 3d 50 01 00 	vmovaps 0x150(%rip),%xmm7        # 4ae <_Z17measure_sqrt_timeILy4EEvv+0x4ae>
 35d:	00 
 35e:	c5 f8 28 35 60 01 00 	vmovaps 0x160(%rip),%xmm6        # 4c6 <_Z17measure_sqrt_timeILy4EEvv+0x4c6>
 365:	00 
 366:	48 89 c3             	mov    %rax,%rbx
 369:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 36d:	31 c0                	xor    %eax,%eax
 36f:	90                   	nop
 370:	c4 c1 78 28 44 05 00 	vmovaps 0x0(%r13,%rax,1),%xmm0
    { return __os.flush(); }
 377:	48 83 c0 10          	add    $0x10,%rax
       start = steady_clock::now();
 37b:	c5 f1 72 e0 01       	vpsrad $0x1,%xmm0,%xmm1
 380:	c5 f1 fe d7          	vpaddd %xmm7,%xmm1,%xmm2
 384:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 388:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 38c:	c5 f0 59 d6          	vmulps %xmm6,%xmm1,%xmm2
 390:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 394:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 398:	c5 f0 59 d6          	vmulps %xmm6,%xmm1,%xmm2
 39c:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
          roots[i + k] = sqrt(floats[i + k]);
 3a0:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 3a4:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 3a8:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 3ac:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
 3b0:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
 3b4:	c5 f8 29 44 38 f0    	vmovaps %xmm0,-0x10(%rax,%rdi,1)
 3ba:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
 3c0:	75 ae                	jne    370 <_Z17measure_sqrt_timeILy4EEvv+0x370>
 3c2:	ff ca                	dec    %edx
 3c4:	75 a7                	jne    36d <_Z17measure_sqrt_timeILy4EEvv+0x36d>
 3c6:	e8 00 00 00 00       	callq  3cb <_Z17measure_sqrt_timeILy4EEvv+0x3cb>
 3cb:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 3d2:	9b c4 20 
 3d5:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 3d9:	48 29 d8             	sub    %rbx,%rax
 3dc:	48 89 c1             	mov    %rax,%rcx
 3df:	48 f7 ea             	imul   %rdx
 3e2:	48 c1 f9 3f          	sar    $0x3f,%rcx
 3e6:	48 c1 fa 07          	sar    $0x7,%rdx
 3ea:	48 29 ca             	sub    %rcx,%rdx
 3ed:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 3f4 <_Z17measure_sqrt_timeILy4EEvv+0x3f4>
 3f4:	e8 00 00 00 00       	callq  3f9 <_Z17measure_sqrt_timeILy4EEvv+0x3f9>
 3f9:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 3ff:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 43a <_Z17measure_sqrt_timeILy4EEvv+0x43a>
 406:	48 89 c6             	mov    %rax,%rsi
 409:	48 89 c1             	mov    %rax,%rcx
 40c:	e8 00 00 00 00       	callq  411 <_Z17measure_sqrt_timeILy4EEvv+0x411>
 411:	48 8b 06             	mov    (%rsi),%rax
 414:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 418:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 41f:	00 
      for (int i = 0; i < 4 * N; i += 4) {
 420:	48 85 db             	test   %rbx,%rbx
 423:	0f 84 44 fe ff ff    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
          roots[i + k] = sqrt(floats[i + k]);
 429:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 42d:	0f 84 c2 07 00 00    	je     bf5 <_Z17measure_sqrt_timeILy4EEvv+0xbf5>
 433:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 437:	48 89 f1             	mov    %rsi,%rcx
 43a:	e8 00 00 00 00       	callq  43f <_Z17measure_sqrt_timeILy4EEvv+0x43f>
 43f:	48 89 c1             	mov    %rax,%rcx
 442:	e8 00 00 00 00       	callq  447 <_Z17measure_sqrt_timeILy4EEvv+0x447>
	__throw_bad_cast();
 447:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 44e <_Z17measure_sqrt_timeILy4EEvv+0x44e>
 44e:	41 b8 39 00 00 00    	mov    $0x39,%r8d
    for (int j = 0; j < LOOP; j++) {
 454:	48 8d 15 78 00 00 00 	lea    0x78(%rip),%rdx        # 4d3 <_Z17measure_sqrt_timeILy4EEvv+0x4d3>
       end = steady_clock::now();
 45b:	e8 00 00 00 00       	callq  460 <_Z17measure_sqrt_timeILy4EEvv+0x460>
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 460:	49 8b 04 24          	mov    (%r12),%rax
 464:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 468:	49 8b 9c 04 f0 00 00 	mov    0xf0(%r12,%rax,1),%rbx
 46f:	00 
 470:	48 85 db             	test   %rbx,%rbx
 473:	0f 84 f4 fd ff ff    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
 479:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 47d:	0f 84 df 06 00 00    	je     b62 <_Z17measure_sqrt_timeILy4EEvv+0xb62>
      { return _M_insert(__n); }
 483:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 487:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 48e <_Z17measure_sqrt_timeILy4EEvv+0x48e>
	__ostream_insert(__out, __s,
 48e:	e8 00 00 00 00       	callq  493 <_Z17measure_sqrt_timeILy4EEvv+0x493>
 493:	48 89 c1             	mov    %rax,%rcx
 496:	e8 00 00 00 00       	callq  49b <_Z17measure_sqrt_timeILy4EEvv+0x49b>
      { return _M_insert(__n); }
 49b:	e8 00 00 00 00       	callq  4a0 <_Z17measure_sqrt_timeILy4EEvv+0x4a0>
	__ostream_insert(__out, __s,
 4a0:	ba e8 03 00 00       	mov    $0x3e8,%edx
    { return flush(__os.put(__os.widen('\n'))); }
 4a5:	48 89 c6             	mov    %rax,%rsi
      { return __check_facet(_M_ctype).widen(__c); }
 4a8:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 4ac:	4c 89 e8             	mov    %r13,%rax
 4af:	48 89 fb             	mov    %rdi,%rbx
 4b2:	c5 f8 28 20          	vmovaps (%rax),%xmm4
      if (!__f)
 4b6:	c5 f8 28 40 20       	vmovaps 0x20(%rax),%xmm0
 4bb:	48 83 c3 40          	add    $0x40,%rbx
 4bf:	48 83 c0 40          	add    $0x40,%rax
 4c3:	c5 d8 c6 50 d0 88    	vshufps $0x88,-0x30(%rax),%xmm4,%xmm2
 4c9:	c5 f8 c6 48 f0 88    	vshufps $0x88,-0x10(%rax),%xmm0,%xmm1
    { return __os.flush(); }
 4cf:	c5 d8 c6 60 d0 dd    	vshufps $0xdd,-0x30(%rax),%xmm4,%xmm4
 4d5:	c5 f8 c6 40 f0 dd    	vshufps $0xdd,-0x10(%rax),%xmm0,%xmm0
	__ostream_insert(__out, __s,
 4db:	c5 e8 c6 d9 88       	vshufps $0x88,%xmm1,%xmm2,%xmm3
 4e0:	c5 e8 c6 c9 dd       	vshufps $0xdd,%xmm1,%xmm2,%xmm1
 4e5:	c5 d8 c6 d0 88       	vshufps $0x88,%xmm0,%xmm4,%xmm2
 4ea:	c5 d8 c6 c0 dd       	vshufps $0xdd,%xmm0,%xmm4,%xmm0
    { return flush(__os.put(__os.widen('\n'))); }
 4ef:	c5 d9 72 e3 01       	vpsrad $0x1,%xmm3,%xmm4
      { return __check_facet(_M_ctype).widen(__c); }
 4f4:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
 4f8:	c5 e0 5e e5          	vdivps %xmm5,%xmm3,%xmm4
 4fc:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
      if (!__f)
 500:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 504:	c5 e0 5e e5          	vdivps %xmm5,%xmm3,%xmm4
 508:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 50c:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 510:	c5 e0 5e e5          	vdivps %xmm5,%xmm3,%xmm4
 514:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 518:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 51c:	c5 e0 5e dc          	vdivps %xmm4,%xmm3,%xmm3
 520:	c5 e0 58 dc          	vaddps %xmm4,%xmm3,%xmm3
    { return __os.flush(); }
 524:	c5 d9 72 e2 01       	vpsrad $0x1,%xmm2,%xmm4
 529:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
       start = steady_clock::now();
 52d:	c5 e8 5e e5          	vdivps %xmm5,%xmm2,%xmm4
 531:	c5 e0 59 de          	vmulps %xmm6,%xmm3,%xmm3
 535:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 539:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 53d:	c5 e8 5e e5          	vdivps %xmm5,%xmm2,%xmm4
 541:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 545:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 549:	c5 e8 5e e5          	vdivps %xmm5,%xmm2,%xmm4
 54d:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 551:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 555:	c5 e8 5e d4          	vdivps %xmm4,%xmm2,%xmm2
 559:	c5 e8 58 d4          	vaddps %xmm4,%xmm2,%xmm2
 55d:	c5 d9 72 e1 01       	vpsrad $0x1,%xmm1,%xmm4
 562:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
    root = 0.5 * (root + (* a / root));
 566:	c5 f0 5e e5          	vdivps %xmm5,%xmm1,%xmm4
 56a:	c5 e8 59 d6          	vmulps %xmm6,%xmm2,%xmm2
 56e:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 572:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 576:	c5 f0 5e e5          	vdivps %xmm5,%xmm1,%xmm4
 57a:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
        roots[i] = sqrt1<LOOPS>(floats + i);
 57e:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 582:	c5 f0 5e e5          	vdivps %xmm5,%xmm1,%xmm4
 586:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 58a:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
    for (int j = 0; j < LOOP; j++) {
 58e:	c5 f0 5e cc          	vdivps %xmm4,%xmm1,%xmm1
       end = steady_clock::now();
 592:	c5 f0 58 cc          	vaddps %xmm4,%xmm1,%xmm1
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 596:	c5 d9 72 e0 01       	vpsrad $0x1,%xmm0,%xmm4
 59b:	c5 d9 fe ef          	vpaddd %xmm7,%xmm4,%xmm5
 59f:	c5 f8 5e e5          	vdivps %xmm5,%xmm0,%xmm4
 5a3:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 5a7:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
 5ab:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 5af:	c5 f8 5e e5          	vdivps %xmm5,%xmm0,%xmm4
 5b3:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
      { return _M_insert(__n); }
 5b7:	c5 d8 59 ee          	vmulps %xmm6,%xmm4,%xmm5
 5bb:	c5 f8 5e e5          	vdivps %xmm5,%xmm0,%xmm4
 5bf:	c5 d8 58 e5          	vaddps %xmm5,%xmm4,%xmm4
	__ostream_insert(__out, __s,
 5c3:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 5c7:	c5 f8 5e c4          	vdivps %xmm4,%xmm0,%xmm0
 5cb:	c5 f8 58 c4          	vaddps %xmm4,%xmm0,%xmm0
      { return _M_insert(__n); }
 5cf:	c5 e0 14 e1          	vunpcklps %xmm1,%xmm3,%xmm4
	__ostream_insert(__out, __s,
 5d3:	c5 e0 15 c9          	vunpckhps %xmm1,%xmm3,%xmm1
 5d7:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
    { return flush(__os.put(__os.widen('\n'))); }
 5db:	c5 e8 14 d8          	vunpcklps %xmm0,%xmm2,%xmm3
      { return __check_facet(_M_ctype).widen(__c); }
 5df:	c5 e8 15 d0          	vunpckhps %xmm0,%xmm2,%xmm2
 5e3:	c5 d8 14 c3          	vunpcklps %xmm3,%xmm4,%xmm0
 5e7:	c5 d8 15 e3          	vunpckhps %xmm3,%xmm4,%xmm4
      if (!__f)
 5eb:	c5 f8 29 43 c0       	vmovaps %xmm0,-0x40(%rbx)
 5f0:	c5 f0 14 c2          	vunpcklps %xmm2,%xmm1,%xmm0
 5f4:	c5 f0 15 ca          	vunpckhps %xmm2,%xmm1,%xmm1
 5f8:	c5 f8 29 63 d0       	vmovaps %xmm4,-0x30(%rbx)
 5fd:	c5 f8 29 43 e0       	vmovaps %xmm0,-0x20(%rbx)
 602:	c5 f8 29 4b f0       	vmovaps %xmm1,-0x10(%rbx)
 607:	4c 39 eb             	cmp    %r13,%rbx
    { return __os.flush(); }
 60a:	0f 85 a2 fe ff ff    	jne    4b2 <_Z17measure_sqrt_timeILy4EEvv+0x4b2>
	__ostream_insert(__out, __s,
 610:	ff ca                	dec    %edx
 612:	0f 85 94 fe ff ff    	jne    4ac <_Z17measure_sqrt_timeILy4EEvv+0x4ac>
 618:	e8 00 00 00 00       	callq  61d <_Z17measure_sqrt_timeILy4EEvv+0x61d>
 61d:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 624:	9b c4 20 
 627:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    { return flush(__os.put(__os.widen('\n'))); }
 62b:	48 29 f0             	sub    %rsi,%rax
      { return __check_facet(_M_ctype).widen(__c); }
 62e:	48 89 c1             	mov    %rax,%rcx
 631:	48 f7 ea             	imul   %rdx
 634:	48 c1 f9 3f          	sar    $0x3f,%rcx
 638:	48 c1 fa 07          	sar    $0x7,%rdx
      if (!__f)
 63c:	48 29 ca             	sub    %rcx,%rdx
 63f:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 646 <_Z17measure_sqrt_timeILy4EEvv+0x646>
 646:	e8 00 00 00 00       	callq  64b <_Z17measure_sqrt_timeILy4EEvv+0x64b>
 64b:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 651:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 68c <_Z17measure_sqrt_timeILy4EEvv+0x68c>
 658:	49 89 c6             	mov    %rax,%r14
 65b:	48 89 c1             	mov    %rax,%rcx
    { return __os.flush(); }
 65e:	e8 00 00 00 00       	callq  663 <_Z17measure_sqrt_timeILy4EEvv+0x663>
 663:	49 8b 06             	mov    (%r14),%rax
       start = steady_clock::now();
 666:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 66a:	49 8b b4 06 f0 00 00 	mov    0xf0(%r14,%rax,1),%rsi
 671:	00 
 672:	48 85 f6             	test   %rsi,%rsi
 675:	0f 84 f2 fb ff ff    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
 67b:	80 7e 38 00          	cmpb   $0x0,0x38(%rsi)
 67f:	0f 84 a1 05 00 00    	je     c26 <_Z17measure_sqrt_timeILy4EEvv+0xc26>
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 685:	0f be 56 43          	movsbl 0x43(%rsi),%edx
 689:	4c 89 f1             	mov    %r14,%rcx
 68c:	e8 00 00 00 00       	callq  691 <_Z17measure_sqrt_timeILy4EEvv+0x691>
 691:	48 89 c1             	mov    %rax,%rcx
 694:	e8 00 00 00 00       	callq  699 <_Z17measure_sqrt_timeILy4EEvv+0x699>
 699:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 6a0 <_Z17measure_sqrt_timeILy4EEvv+0x6a0>
 6a0:	41 b8 2e 00 00 00    	mov    $0x2e,%r8d
 6a6:	48 8d 15 b8 00 00 00 	lea    0xb8(%rip),%rdx        # 765 <_Z17measure_sqrt_timeILy4EEvv+0x765>
 6ad:	e8 00 00 00 00       	callq  6b2 <_Z17measure_sqrt_timeILy4EEvv+0x6b2>
 6b2:	49 8b 04 24          	mov    (%r12),%rax
 6b6:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 6ba:	49 8b b4 04 f0 00 00 	mov    0xf0(%r12,%rax,1),%rsi
 6c1:	00 
 6c2:	48 85 f6             	test   %rsi,%rsi
 6c5:	0f 84 a2 fb ff ff    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
    root = 0.5 * (root + (* a / root));
 6cb:	80 7e 38 00          	cmpb   $0x0,0x38(%rsi)
 6cf:	0f 84 be 04 00 00    	je     b93 <_Z17measure_sqrt_timeILy4EEvv+0xb93>
 6d5:	0f be 56 43          	movsbl 0x43(%rsi),%edx
 6d9:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 6e0 <_Z17measure_sqrt_timeILy4EEvv+0x6e0>
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 6e0:	e8 00 00 00 00       	callq  6e5 <_Z17measure_sqrt_timeILy4EEvv+0x6e5>
    root = 0.5 * (root + (* a / root));
 6e5:	48 89 c1             	mov    %rax,%rcx
 6e8:	e8 00 00 00 00       	callq  6ed <_Z17measure_sqrt_timeILy4EEvv+0x6ed>
 6ed:	e8 00 00 00 00       	callq  6f2 <_Z17measure_sqrt_timeILy4EEvv+0x6f2>
 6f2:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
 6f7:	48 89 c6             	mov    %rax,%rsi
 6fa:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 6fe:	4c 89 ea             	mov    %r13,%rdx
 701:	48 89 f8             	mov    %rdi,%rax
    root = 0.5 * (root + (* a / root));
 704:	c5 f8 28 18          	vmovaps (%rax),%xmm3
 708:	c5 f8 28 40 20       	vmovaps 0x20(%rax),%xmm0
 70d:	48 83 c0 40          	add    $0x40,%rax
 711:	48 83 c2 40          	add    $0x40,%rdx
 715:	c5 f8 28 62 c0       	vmovaps -0x40(%rdx),%xmm4
 71a:	c5 f8 c6 48 f0 88    	vshufps $0x88,-0x10(%rax),%xmm0,%xmm1
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 720:	c5 60 c6 40 d0 88    	vshufps $0x88,-0x30(%rax),%xmm3,%xmm8
    root = 0.5 * (root + (* a / root));
 726:	c5 f8 c6 40 f0 dd    	vshufps $0xdd,-0x10(%rax),%xmm0,%xmm0
 72c:	c5 e0 c6 58 d0 dd    	vshufps $0xdd,-0x30(%rax),%xmm3,%xmm3
 732:	c5 d8 c6 6a d0 88    	vshufps $0x88,-0x30(%rdx),%xmm4,%xmm5
 738:	c5 d8 c6 62 d0 dd    	vshufps $0xdd,-0x30(%rdx),%xmm4,%xmm4
          roots[i + k] = sqrt1<LOOPS>(floats + i + k);
 73e:	c5 38 c6 d1 88       	vshufps $0x88,%xmm1,%xmm8,%xmm10
 743:	c5 38 c6 c1 dd       	vshufps $0xdd,%xmm1,%xmm8,%xmm8
 748:	c5 60 c6 c8 88       	vshufps $0x88,%xmm0,%xmm3,%xmm9
 74d:	c5 e0 c6 d8 dd       	vshufps $0xdd,%xmm0,%xmm3,%xmm3
 752:	c5 f8 28 42 e0       	vmovaps -0x20(%rdx),%xmm0
 757:	c5 f8 c6 4a f0 88    	vshufps $0x88,-0x10(%rdx),%xmm0,%xmm1
 75d:	c5 f8 c6 42 f0 dd    	vshufps $0xdd,-0x10(%rdx),%xmm0,%xmm0
 763:	c5 d0 c6 d1 88       	vshufps $0x88,%xmm1,%xmm5,%xmm2
 768:	c5 d0 c6 e9 dd       	vshufps $0xdd,%xmm1,%xmm5,%xmm5
 76d:	c5 d8 c6 c8 88       	vshufps $0x88,%xmm0,%xmm4,%xmm1
 772:	c5 d8 c6 c0 dd       	vshufps $0xdd,%xmm0,%xmm4,%xmm0
 777:	c4 c1 68 5e e2       	vdivps %xmm10,%xmm2,%xmm4
 77c:	c4 c1 58 58 e2       	vaddps %xmm10,%xmm4,%xmm4
    for (int j = 0; j < LOOP; j++) {
 781:	c4 41 70 5e d1       	vdivps %xmm9,%xmm1,%xmm10
       end = steady_clock::now();
 786:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 78a:	c4 41 28 58 c9       	vaddps %xmm9,%xmm10,%xmm9
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 78f:	c4 41 50 5e d0       	vdivps %xmm8,%xmm5,%xmm10
 794:	c5 30 59 ce          	vmulps %xmm6,%xmm9,%xmm9
 798:	c4 41 28 58 c0       	vaddps %xmm8,%xmm10,%xmm8
 79d:	c5 78 5e d3          	vdivps %xmm3,%xmm0,%xmm10
 7a1:	c5 38 59 c6          	vmulps %xmm6,%xmm8,%xmm8
 7a5:	c5 a8 58 db          	vaddps %xmm3,%xmm10,%xmm3
 7a9:	c5 60 59 d6          	vmulps %xmm6,%xmm3,%xmm10
      { return _M_insert(__n); }
 7ad:	c5 e8 5e dc          	vdivps %xmm4,%xmm2,%xmm3
 7b1:	c5 e0 58 dc          	vaddps %xmm4,%xmm3,%xmm3
 7b5:	c4 c1 70 5e e1       	vdivps %xmm9,%xmm1,%xmm4
	__ostream_insert(__out, __s,
 7ba:	c5 e0 59 de          	vmulps %xmm6,%xmm3,%xmm3
 7be:	c4 41 58 58 c9       	vaddps %xmm9,%xmm4,%xmm9
 7c3:	c4 c1 50 5e e0       	vdivps %xmm8,%xmm5,%xmm4
      { return _M_insert(__n); }
 7c8:	c5 30 59 ce          	vmulps %xmm6,%xmm9,%xmm9
	__ostream_insert(__out, __s,
 7cc:	c4 41 58 58 c0       	vaddps %xmm8,%xmm4,%xmm8
    { return flush(__os.put(__os.widen('\n'))); }
 7d1:	c4 c1 78 5e e2       	vdivps %xmm10,%xmm0,%xmm4
      { return __check_facet(_M_ctype).widen(__c); }
 7d6:	c5 38 59 c6          	vmulps %xmm6,%xmm8,%xmm8
 7da:	c4 c1 58 58 e2       	vaddps %xmm10,%xmm4,%xmm4
 7df:	c5 68 5e d3          	vdivps %xmm3,%xmm2,%xmm10
      if (!__f)
 7e3:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 7e7:	c5 a8 58 db          	vaddps %xmm3,%xmm10,%xmm3
 7eb:	c4 41 70 5e d1       	vdivps %xmm9,%xmm1,%xmm10
 7f0:	c5 e0 59 de          	vmulps %xmm6,%xmm3,%xmm3
 7f4:	c4 41 28 58 c9       	vaddps %xmm9,%xmm10,%xmm9
 7f9:	c4 41 50 5e d0       	vdivps %xmm8,%xmm5,%xmm10
 7fe:	c5 30 59 ce          	vmulps %xmm6,%xmm9,%xmm9
    { return __os.flush(); }
 802:	c4 41 28 58 c0       	vaddps %xmm8,%xmm10,%xmm8
	__ostream_insert(__out, __s,
 807:	c5 78 5e d4          	vdivps %xmm4,%xmm0,%xmm10
 80b:	c5 38 59 c6          	vmulps %xmm6,%xmm8,%xmm8
 80f:	c5 e8 5e d3          	vdivps %xmm3,%xmm2,%xmm2
 813:	c5 a8 58 e4          	vaddps %xmm4,%xmm10,%xmm4
 817:	c5 d8 59 e6          	vmulps %xmm6,%xmm4,%xmm4
 81b:	c5 e8 58 d3          	vaddps %xmm3,%xmm2,%xmm2
 81f:	c5 f8 5e c4          	vdivps %xmm4,%xmm0,%xmm0
    { return flush(__os.put(__os.widen('\n'))); }
 823:	c5 e8 59 de          	vmulps %xmm6,%xmm2,%xmm3
      { return __check_facet(_M_ctype).widen(__c); }
 827:	c4 c1 70 5e d1       	vdivps %xmm9,%xmm1,%xmm2
 82c:	c5 f8 58 c4          	vaddps %xmm4,%xmm0,%xmm0
      if (!__f)
 830:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
 834:	c4 c1 50 5e c8       	vdivps %xmm8,%xmm5,%xmm1
 839:	c4 c1 68 58 d1       	vaddps %xmm9,%xmm2,%xmm2
 83e:	c5 e8 59 d6          	vmulps %xmm6,%xmm2,%xmm2
 842:	c4 c1 70 58 c8       	vaddps %xmm8,%xmm1,%xmm1
 847:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 84b:	c5 e0 14 e1          	vunpcklps %xmm1,%xmm3,%xmm4
 84f:	c5 e0 15 c9          	vunpckhps %xmm1,%xmm3,%xmm1
    { return __os.flush(); }
 853:	c5 e8 14 d8          	vunpcklps %xmm0,%xmm2,%xmm3
 857:	c5 e8 15 c0          	vunpckhps %xmm0,%xmm2,%xmm0
       start = steady_clock::now();
 85b:	c5 d8 14 d3          	vunpcklps %xmm3,%xmm4,%xmm2
 85f:	c5 d8 15 e3          	vunpckhps %xmm3,%xmm4,%xmm4
 863:	c5 f8 29 50 c0       	vmovaps %xmm2,-0x40(%rax)
 868:	c5 f0 14 d0          	vunpcklps %xmm0,%xmm1,%xmm2
 86c:	c5 f0 15 c8          	vunpckhps %xmm0,%xmm1,%xmm1
    root[0] = 0.5 * (root[0] + (a[0] / root[0]));
 870:	c5 f8 29 60 d0       	vmovaps %xmm4,-0x30(%rax)
 875:	c5 f8 29 50 e0       	vmovaps %xmm2,-0x20(%rax)
 87a:	c5 f8 29 48 f0       	vmovaps %xmm1,-0x10(%rax)
 87f:	48 39 d8             	cmp    %rbx,%rax
 882:	0f 85 7c fe ff ff    	jne    704 <_Z17measure_sqrt_timeILy4EEvv+0x704>
 888:	ff c9                	dec    %ecx
 88a:	0f 85 6e fe ff ff    	jne    6fe <_Z17measure_sqrt_timeILy4EEvv+0x6fe>
 890:	e8 00 00 00 00       	callq  895 <_Z17measure_sqrt_timeILy4EEvv+0x895>
 895:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 89c:	9b c4 20 
 89f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 8a3:	48 29 f0             	sub    %rsi,%rax
    for (int j = 0; j < LOOP; j++) {
 8a6:	48 89 c1             	mov    %rax,%rcx
       end = steady_clock::now();
 8a9:	48 f7 ea             	imul   %rdx
 8ac:	48 c1 f9 3f          	sar    $0x3f,%rcx
    std::cout << time.time_clock().count() / LOOP << " [ns]" << std::endl;
 8b0:	48 c1 fa 07          	sar    $0x7,%rdx
 8b4:	48 29 ca             	sub    %rcx,%rdx
 8b7:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 8be <_Z17measure_sqrt_timeILy4EEvv+0x8be>
 8be:	e8 00 00 00 00       	callq  8c3 <_Z17measure_sqrt_timeILy4EEvv+0x8c3>
 8c3:	41 b8 05 00 00 00    	mov    $0x5,%r8d
 8c9:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # 904 <_Z17measure_sqrt_timeILy4EEvv+0x904>
      { return _M_insert(__n); }
 8d0:	48 89 c6             	mov    %rax,%rsi
 8d3:	48 89 c1             	mov    %rax,%rcx
 8d6:	e8 00 00 00 00       	callq  8db <_Z17measure_sqrt_timeILy4EEvv+0x8db>
	__ostream_insert(__out, __s,
 8db:	48 8b 06             	mov    (%rsi),%rax
 8de:	48 8b 40 e8          	mov    -0x18(%rax),%rax
 8e2:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 8e9:	00 
      { return _M_insert(__n); }
 8ea:	48 85 db             	test   %rbx,%rbx
	__ostream_insert(__out, __s,
 8ed:	0f 84 7a f9 ff ff    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
    { return flush(__os.put(__os.widen('\n'))); }
 8f3:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
      { return __check_facet(_M_ctype).widen(__c); }
 8f7:	0f 84 c7 02 00 00    	je     bc4 <_Z17measure_sqrt_timeILy4EEvv+0xbc4>
 8fd:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 901:	48 89 f1             	mov    %rsi,%rcx
      if (!__f)
 904:	e8 00 00 00 00       	callq  909 <_Z17measure_sqrt_timeILy4EEvv+0x909>
 909:	48 89 c1             	mov    %rax,%rcx
 90c:	e8 00 00 00 00       	callq  911 <_Z17measure_sqrt_timeILy4EEvv+0x911>
 911:	e8 00 00 00 00       	callq  916 <_Z17measure_sqrt_timeILy4EEvv+0x916>
 916:	ba e8 03 00 00       	mov    $0x3e8,%edx
 91b:	48 89 c6             	mov    %rax,%rsi
 91e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    { return __os.flush(); }
 922:	31 c0                	xor    %eax,%eax
 924:	c4 c1 78 28 44 05 00 	vmovaps 0x0(%r13,%rax,1),%xmm0
       start = steady_clock::now();
 92b:	48 83 c0 10          	add    $0x10,%rax
 92f:	c5 e9 72 e0 01       	vpsrad $0x1,%xmm0,%xmm2
 934:	c5 e9 fe cf          	vpaddd %xmm7,%xmm2,%xmm1
 938:	c5 f8 5e d1          	vdivps %xmm1,%xmm0,%xmm2
 93c:	c5 e8 58 d1          	vaddps %xmm1,%xmm2,%xmm2
  * initial = (1 << 29) + (* ai >> 1) - (1 << 22) - 0x4C000;
 940:	c5 e8 59 d6          	vmulps %xmm6,%xmm2,%xmm2
 944:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
 948:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 94c:	c5 f0 59 d6          	vmulps %xmm6,%xmm1,%xmm2
 950:	c5 f8 5e ca          	vdivps %xmm2,%xmm0,%xmm1
    * root = 0.5 * (* root + (* a / * root));
 954:	c5 f0 58 ca          	vaddps %xmm2,%xmm1,%xmm1
 958:	c5 f0 59 ce          	vmulps %xmm6,%xmm1,%xmm1
 95c:	c5 f8 5e c1          	vdivps %xmm1,%xmm0,%xmm0
 960:	c5 f8 58 c1          	vaddps %xmm1,%xmm0,%xmm0
 964:	c5 f8 59 c6          	vmulps %xmm6,%xmm0,%xmm0
 968:	c5 f8 29 44 38 f0    	vmovaps %xmm0,-0x10(%rax,%rdi,1)
 96e:	48 3d 00 35 0c 00    	cmp    $0xc3500,%rax
      for (int i = 0; i < 4 * N; i += 4) {
 974:	75 ae                	jne    924 <_Z17measure_sqrt_timeILy4EEvv+0x924>
 976:	ff ca                	dec    %edx
 978:	75 a8                	jne    922 <_Z17measure_sqrt_timeILy4EEvv+0x922>
    for (int j = 0; j < LOOP; j++) {
 97a:	e8 00 00 00 00       	callq  97f <_Z17measure_sqrt_timeILy4EEvv+0x97f>
       end = steady_clock::now();
 97f:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 986 <_Z17measure_sqrt_timeILy4EEvv+0x986>
	__ostream_insert(__out, __s,
 986:	41 b8 34 00 00 00    	mov    $0x34,%r8d
 98c:	48 8d 15 e8 00 00 00 	lea    0xe8(%rip),%rdx        # a7b <_Z17measure_sqrt_timeILy4EEvv+0xa7b>
 993:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 997:	48 29 f0             	sub    %rsi,%rax
 99a:	48 89 c3             	mov    %rax,%rbx
 99d:	e8 00 00 00 00       	callq  9a2 <_Z17measure_sqrt_timeILy4EEvv+0x9a2>
 9a2:	49 8b 04 24          	mov    (%r12),%rax
    { return flush(__os.put(__os.widen('\n'))); }
 9a6:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      { return __check_facet(_M_ctype).widen(__c); }
 9aa:	49 8b b4 04 f0 00 00 	mov    0xf0(%r12,%rax,1),%rsi
 9b1:	00 
 9b2:	48 85 f6             	test   %rsi,%rsi
      if (!__f)
 9b5:	0f 84 b2 f8 ff ff    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
 9bb:	80 7e 38 00          	cmpb   $0x0,0x38(%rsi)
 9bf:	0f 84 f4 02 00 00    	je     cb9 <_Z17measure_sqrt_timeILy4EEvv+0xcb9>
 9c5:	0f be 56 43          	movsbl 0x43(%rsi),%edx
 9c9:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 9d0 <_Z17measure_sqrt_timeILy4EEvv+0x9d0>
 9d0:	e8 00 00 00 00       	callq  9d5 <_Z17measure_sqrt_timeILy4EEvv+0x9d5>
 9d5:	48 89 c1             	mov    %rax,%rcx
    { return __os.flush(); }
 9d8:	e8 00 00 00 00       	callq  9dd <_Z17measure_sqrt_timeILy4EEvv+0x9dd>
 9dd:	48 89 d8             	mov    %rbx,%rax
    std::cout << time.time_clock().count() / LOOP  << " [ns]" << std::endl;
 9e0:	48 ba cf f7 53 e3 a5 	movabs $0x20c49ba5e353f7cf,%rdx
 9e7:	9b c4 20 
 9ea:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 9f1 <_Z17measure_sqrt_timeILy4EEvv+0x9f1>
      { return _M_insert(__n); }
 9f1:	48 c1 fb 3f          	sar    $0x3f,%rbx
 9f5:	48 f7 ea             	imul   %rdx
 9f8:	48 c1 fa 07          	sar    $0x7,%rdx
 9fc:	48 29 da             	sub    %rbx,%rdx
 9ff:	e8 00 00 00 00       	callq  a04 <_Z17measure_sqrt_timeILy4EEvv+0xa04>
 a04:	41 b8 05 00 00 00    	mov    $0x5,%r8d
	__ostream_insert(__out, __s,
 a0a:	48 8d 15 34 00 00 00 	lea    0x34(%rip),%rdx        # a45 <_Z17measure_sqrt_timeILy4EEvv+0xa45>
 a11:	48 89 c6             	mov    %rax,%rsi
      { return _M_insert(__n); }
 a14:	48 89 c1             	mov    %rax,%rcx
	__ostream_insert(__out, __s,
 a17:	e8 00 00 00 00       	callq  a1c <_Z17measure_sqrt_timeILy4EEvv+0xa1c>
 a1c:	48 8b 06             	mov    (%rsi),%rax
    { return flush(__os.put(__os.widen('\n'))); }
 a1f:	48 8b 40 e8          	mov    -0x18(%rax),%rax
      { return __check_facet(_M_ctype).widen(__c); }
 a23:	48 8b 9c 06 f0 00 00 	mov    0xf0(%rsi,%rax,1),%rbx
 a2a:	00 
 a2b:	48 85 db             	test   %rbx,%rbx
      if (!__f)
 a2e:	0f 84 39 f8 ff ff    	je     26d <_Z17measure_sqrt_timeILy4EEvv+0x26d>
 a34:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
 a38:	0f 84 4a 02 00 00    	je     c88 <_Z17measure_sqrt_timeILy4EEvv+0xc88>
 a3e:	0f be 53 43          	movsbl 0x43(%rbx),%edx
 a42:	48 89 f1             	mov    %rsi,%rcx
 a45:	e8 00 00 00 00       	callq  a4a <_Z17measure_sqrt_timeILy4EEvv+0xa4a>
 a4a:	90                   	nop
 a4b:	c5 f8 28 75 d0       	vmovaps -0x30(%rbp),%xmm6
}
 a50:	c5 f8 28 7d e0       	vmovaps -0x20(%rbp),%xmm7
 a55:	c5 78 28 45 f0       	vmovaps -0x10(%rbp),%xmm8
    { return __os.flush(); }
 a5a:	48 89 c1             	mov    %rax,%rcx
 a5d:	c5 78 28 4d 00       	vmovaps 0x0(%rbp),%xmm9
 a62:	c5 78 28 55 10       	vmovaps 0x10(%rbp),%xmm10
 a67:	48 8d 65 28          	lea    0x28(%rbp),%rsp
 a6b:	5b                   	pop    %rbx
 a6c:	5e                   	pop    %rsi
 a6d:	5f                   	pop    %rdi
 a6e:	41 5c                	pop    %r12
          roots[i + k] = sqrt(floats[i + k]);
 a70:	41 5d                	pop    %r13
 a72:	41 5e                	pop    %r14
 a74:	41 5f                	pop    %r15
 a76:	5d                   	pop    %rbp
 a77:	e9 00 00 00 00       	jmpq   a7c <_Z17measure_sqrt_timeILy4EEvv+0xa7c>
 a7c:	0f 1f 40 00          	nopl   0x0(%rax)
 a80:	e8 00 00 00 00       	callq  a85 <_Z17measure_sqrt_timeILy4EEvv+0xa85>
 a85:	e9 ad f7 ff ff       	jmpq   237 <_Z17measure_sqrt_timeILy4EEvv+0x237>
 a8a:	e8 00 00 00 00       	callq  a8f <_Z17measure_sqrt_timeILy4EEvv+0xa8f>
	this->_M_widen_init();
 a8f:	e9 7f f7 ff ff       	jmpq   213 <_Z17measure_sqrt_timeILy4EEvv+0x213>
 a94:	e8 00 00 00 00       	callq  a99 <_Z17measure_sqrt_timeILy4EEvv+0xa99>
	return this->do_widen(__c);
 a99:	e9 51 f7 ff ff       	jmpq   1ef <_Z17measure_sqrt_timeILy4EEvv+0x1ef>
 a9e:	48 89 d9             	mov    %rbx,%rcx
 aa1:	e8 00 00 00 00       	callq  aa6 <_Z17measure_sqrt_timeILy4EEvv+0xaa6>
 aa6:	48 8b 03             	mov    (%rbx),%rax
 aa9:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # ab0 <_Z17measure_sqrt_timeILy4EEvv+0xab0>
 ab0:	ba 0a 00 00 00       	mov    $0xa,%edx
 ab5:	48 8b 40 30          	mov    0x30(%rax),%rax
 ab9:	48 39 c8             	cmp    %rcx,%rax
 abc:	0f 84 52 f6 ff ff    	je     114 <_Z17measure_sqrt_timeILy4EEvv+0x114>
	this->_M_widen_init();
 ac2:	48 89 d9             	mov    %rbx,%rcx
 ac5:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 ac7:	0f be d0             	movsbl %al,%edx
 aca:	e9 45 f6 ff ff       	jmpq   114 <_Z17measure_sqrt_timeILy4EEvv+0x114>
 acf:	48 89 d9             	mov    %rbx,%rcx
 ad2:	e8 00 00 00 00       	callq  ad7 <_Z17measure_sqrt_timeILy4EEvv+0xad7>
 ad7:	48 8b 03             	mov    (%rbx),%rax
 ada:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # ae1 <_Z17measure_sqrt_timeILy4EEvv+0xae1>
 ae1:	ba 0a 00 00 00       	mov    $0xa,%edx
 ae6:	48 8b 40 30          	mov    0x30(%rax),%rax
 aea:	48 39 c8             	cmp    %rcx,%rax
 aed:	0f 84 a9 f5 ff ff    	je     9c <_Z17measure_sqrt_timeILy4EEvv+0x9c>
	this->_M_widen_init();
 af3:	48 89 d9             	mov    %rbx,%rcx
 af6:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 af8:	0f be d0             	movsbl %al,%edx
 afb:	e9 9c f5 ff ff       	jmpq   9c <_Z17measure_sqrt_timeILy4EEvv+0x9c>
 b00:	48 89 d9             	mov    %rbx,%rcx
 b03:	e8 00 00 00 00       	callq  b08 <_Z17measure_sqrt_timeILy4EEvv+0xb08>
 b08:	48 8b 03             	mov    (%rbx),%rax
 b0b:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # b12 <_Z17measure_sqrt_timeILy4EEvv+0xb12>
 b12:	ba 0a 00 00 00       	mov    $0xa,%edx
 b17:	48 8b 40 30          	mov    0x30(%rax),%rax
 b1b:	48 39 c8             	cmp    %rcx,%rax
 b1e:	0f 84 74 f6 ff ff    	je     198 <_Z17measure_sqrt_timeILy4EEvv+0x198>
	this->_M_widen_init();
 b24:	48 89 d9             	mov    %rbx,%rcx
 b27:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 b29:	0f be d0             	movsbl %al,%edx
 b2c:	e9 67 f6 ff ff       	jmpq   198 <_Z17measure_sqrt_timeILy4EEvv+0x198>
 b31:	48 89 d9             	mov    %rbx,%rcx
 b34:	e8 00 00 00 00       	callq  b39 <_Z17measure_sqrt_timeILy4EEvv+0xb39>
 b39:	48 8b 03             	mov    (%rbx),%rax
 b3c:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # b43 <_Z17measure_sqrt_timeILy4EEvv+0xb43>
 b43:	ba 0a 00 00 00       	mov    $0xa,%edx
 b48:	48 8b 40 30          	mov    0x30(%rax),%rax
 b4c:	48 39 c8             	cmp    %rcx,%rax
 b4f:	0f 84 e3 f7 ff ff    	je     338 <_Z17measure_sqrt_timeILy4EEvv+0x338>
	this->_M_widen_init();
 b55:	48 89 d9             	mov    %rbx,%rcx
 b58:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 b5a:	0f be d0             	movsbl %al,%edx
 b5d:	e9 d6 f7 ff ff       	jmpq   338 <_Z17measure_sqrt_timeILy4EEvv+0x338>
 b62:	48 89 d9             	mov    %rbx,%rcx
 b65:	e8 00 00 00 00       	callq  b6a <_Z17measure_sqrt_timeILy4EEvv+0xb6a>
 b6a:	48 8b 03             	mov    (%rbx),%rax
 b6d:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # b74 <_Z17measure_sqrt_timeILy4EEvv+0xb74>
 b74:	ba 0a 00 00 00       	mov    $0xa,%edx
 b79:	48 8b 40 30          	mov    0x30(%rax),%rax
 b7d:	48 39 c8             	cmp    %rcx,%rax
 b80:	0f 84 01 f9 ff ff    	je     487 <_Z17measure_sqrt_timeILy4EEvv+0x487>
	this->_M_widen_init();
 b86:	48 89 d9             	mov    %rbx,%rcx
 b89:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 b8b:	0f be d0             	movsbl %al,%edx
 b8e:	e9 f4 f8 ff ff       	jmpq   487 <_Z17measure_sqrt_timeILy4EEvv+0x487>
 b93:	48 89 f1             	mov    %rsi,%rcx
 b96:	e8 00 00 00 00       	callq  b9b <_Z17measure_sqrt_timeILy4EEvv+0xb9b>
 b9b:	48 8b 06             	mov    (%rsi),%rax
 b9e:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # ba5 <_Z17measure_sqrt_timeILy4EEvv+0xba5>
 ba5:	ba 0a 00 00 00       	mov    $0xa,%edx
 baa:	48 8b 40 30          	mov    0x30(%rax),%rax
 bae:	48 39 c8             	cmp    %rcx,%rax
 bb1:	0f 84 22 fb ff ff    	je     6d9 <_Z17measure_sqrt_timeILy4EEvv+0x6d9>
	this->_M_widen_init();
 bb7:	48 89 f1             	mov    %rsi,%rcx
 bba:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 bbc:	0f be d0             	movsbl %al,%edx
 bbf:	e9 15 fb ff ff       	jmpq   6d9 <_Z17measure_sqrt_timeILy4EEvv+0x6d9>
 bc4:	48 89 d9             	mov    %rbx,%rcx
 bc7:	e8 00 00 00 00       	callq  bcc <_Z17measure_sqrt_timeILy4EEvv+0xbcc>
 bcc:	48 8b 03             	mov    (%rbx),%rax
 bcf:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # bd6 <_Z17measure_sqrt_timeILy4EEvv+0xbd6>
 bd6:	ba 0a 00 00 00       	mov    $0xa,%edx
 bdb:	48 8b 40 30          	mov    0x30(%rax),%rax
 bdf:	48 39 c8             	cmp    %rcx,%rax
       *  @param __c  The char to convert.
       *  @return  The converted character.
      */
      virtual char_type
      do_widen(char __c) const
      { return __c; }
 be2:	0f 84 19 fd ff ff    	je     901 <_Z17measure_sqrt_timeILy4EEvv+0x901>
	this->_M_widen_init();
 be8:	48 89 d9             	mov    %rbx,%rcx
 beb:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 bed:	0f be d0             	movsbl %al,%edx
 bf0:	e9 0c fd ff ff       	jmpq   901 <_Z17measure_sqrt_timeILy4EEvv+0x901>
 bf5:	48 89 d9             	mov    %rbx,%rcx
 bf8:	e8 00 00 00 00       	callq  bfd <_Z17measure_sqrt_timeILy4EEvv+0xbfd>
 bfd:	48 8b 03             	mov    (%rbx),%rax
 c00:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # c07 <_Z17measure_sqrt_timeILy4EEvv+0xc07>
 c07:	ba 0a 00 00 00       	mov    $0xa,%edx
 c0c:	48 8b 40 30          	mov    0x30(%rax),%rax
 c10:	48 39 c8             	cmp    %rcx,%rax
 c13:	0f 84 1e f8 ff ff    	je     437 <_Z17measure_sqrt_timeILy4EEvv+0x437>
	this->_M_widen_init();
 c19:	48 89 d9             	mov    %rbx,%rcx
 c1c:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 c1e:	0f be d0             	movsbl %al,%edx
 c21:	e9 11 f8 ff ff       	jmpq   437 <_Z17measure_sqrt_timeILy4EEvv+0x437>
 c26:	48 89 f1             	mov    %rsi,%rcx
 c29:	e8 00 00 00 00       	callq  c2e <_Z17measure_sqrt_timeILy4EEvv+0xc2e>
 c2e:	48 8b 06             	mov    (%rsi),%rax
 c31:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # c38 <_Z17measure_sqrt_timeILy4EEvv+0xc38>
 c38:	ba 0a 00 00 00       	mov    $0xa,%edx
 c3d:	48 8b 40 30          	mov    0x30(%rax),%rax
 c41:	48 39 c8             	cmp    %rcx,%rax
 c44:	0f 84 3f fa ff ff    	je     689 <_Z17measure_sqrt_timeILy4EEvv+0x689>
	this->_M_widen_init();
 c4a:	48 89 f1             	mov    %rsi,%rcx
 c4d:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 c4f:	0f be d0             	movsbl %al,%edx
 c52:	e9 32 fa ff ff       	jmpq   689 <_Z17measure_sqrt_timeILy4EEvv+0x689>
 c57:	48 89 d9             	mov    %rbx,%rcx
 c5a:	e8 00 00 00 00       	callq  c5f <_Z17measure_sqrt_timeILy4EEvv+0xc5f>
 c5f:	48 8b 03             	mov    (%rbx),%rax
 c62:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # c69 <_Z17measure_sqrt_timeILy4EEvv+0xc69>
 c69:	ba 0a 00 00 00       	mov    $0xa,%edx
 c6e:	48 8b 40 30          	mov    0x30(%rax),%rax
 c72:	48 39 c8             	cmp    %rcx,%rax
 c75:	0f 84 6d f6 ff ff    	je     2e8 <_Z17measure_sqrt_timeILy4EEvv+0x2e8>
	this->_M_widen_init();
 c7b:	48 89 d9             	mov    %rbx,%rcx
 c7e:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 c80:	0f be d0             	movsbl %al,%edx
 c83:	e9 60 f6 ff ff       	jmpq   2e8 <_Z17measure_sqrt_timeILy4EEvv+0x2e8>
 c88:	48 89 d9             	mov    %rbx,%rcx
 c8b:	e8 00 00 00 00       	callq  c90 <_Z17measure_sqrt_timeILy4EEvv+0xc90>
 c90:	48 8b 03             	mov    (%rbx),%rax
 c93:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # c9a <_Z17measure_sqrt_timeILy4EEvv+0xc9a>
 c9a:	ba 0a 00 00 00       	mov    $0xa,%edx
 c9f:	48 8b 40 30          	mov    0x30(%rax),%rax
 ca3:	48 39 c8             	cmp    %rcx,%rax
 ca6:	0f 84 96 fd ff ff    	je     a42 <_Z17measure_sqrt_timeILy4EEvv+0xa42>
	this->_M_widen_init();
 cac:	48 89 d9             	mov    %rbx,%rcx
 caf:	ff d0                	callq  *%rax
	return this->do_widen(__c);
 cb1:	0f be d0             	movsbl %al,%edx
 cb4:	e9 89 fd ff ff       	jmpq   a42 <_Z17measure_sqrt_timeILy4EEvv+0xa42>
 cb9:	48 89 f1             	mov    %rsi,%rcx
 cbc:	e8 00 00 00 00       	callq  cc1 <_Z17measure_sqrt_timeILy4EEvv+0xcc1>
 cc1:	48 8b 06             	mov    (%rsi),%rax
 cc4:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # ccb <_Z17measure_sqrt_timeILy4EEvv+0xccb>
 ccb:	ba 0a 00 00 00       	mov    $0xa,%edx
 cd0:	48 8b 40 30          	mov    0x30(%rax),%rax
 cd4:	48 39 c8             	cmp    %rcx,%rax
 cd7:	0f 84 ec fc ff ff    	je     9c9 <_Z17measure_sqrt_timeILy4EEvv+0x9c9>
 cdd:	48 89 f1             	mov    %rsi,%rcx
 ce0:	ff d0                	callq  *%rax
 ce2:	0f be d0             	movsbl %al,%edx
 ce5:	e9 df fc ff ff       	jmpq   9c9 <_Z17measure_sqrt_timeILy4EEvv+0x9c9>
 cea:	90                   	nop
 ceb:	90                   	nop
 cec:	90                   	nop
 ced:	90                   	nop
 cee:	90                   	nop
 cef:	90                   	nop

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
