
test1.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <_Z3addii>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	89 7d ec             	mov    %edi,-0x14(%rbp) // 第一个参数 压栈
   7:	89 75 e8             	mov    %esi,-0x18(%rbp) // 第二个参数 压栈
   a:	8b 55 ec             	mov    -0x14(%rbp),%edx
   d:	8b 45 e8             	mov    -0x18(%rbp),%eax
  10:	01 d0                	add    %edx,%eax
  12:	89 45 fc             	mov    %eax,-0x4(%rbp) // 结果压栈
  15:	8b 45 fc             	mov    -0x4(%rbp),%eax // 结果放到%eax
  18:	5d                   	pop    %rbp //
  19:	c3                   	retq   

000000000000001a <main>:
  1a:	55                   	push   %rbp
  1b:	48 89 e5             	mov    %rsp,%rbp
  1e:	48 83 ec 10          	sub    $0x10,%rsp  //移动栈顶，分配栈帧空间
  22:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp) // 变量a 压栈
  29:	c7 45 f8 02 00 00 00 	movl   $0x2,-0x8(%rbp) // 变量b 压栈
  30:	8b 55 f8             	mov    -0x8(%rbp),%edx 
  33:	8b 45 f4             	mov    -0xc(%rbp),%eax
  36:	89 d6                	mov    %edx,%esi // %esi 第二变量
  38:	89 c7                	mov    %eax,%edi // %edi 第一变量
  3a:	e8 00 00 00 00       	callq  3f <main+0x25> // 调用 add函数 callq压栈将要运行的下一条指令
  3f:	89 45 fc             	mov    %eax,-0x4(%rbp) // 返回值在%eax里 赋值给c变量
  42:	8b 45 fc             	mov    -0x4(%rbp),%eax 
  45:	89 c6                	mov    %eax,%esi // 第二参数
  47:	bf 00 00 00 00       	mov    $0x0,%edi // 第一个参数
  4c:	b8 00 00 00 00       	mov    $0x0,%eax // 清空%eax 
  51:	e8 00 00 00 00       	callq  56 <main+0x3c> //调用printf函数
  56:	b8 00 00 00 00       	mov    $0x0,%eax
  5b:	c9                   	leaveq 
  5c:	c3                   	retq   
