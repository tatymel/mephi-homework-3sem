
obj/boot/boot.out:     file format elf64-x86-64


Disassembly of section .text:

0000000000007c00 <start>:
    7c00:	fa                   	cli    
    7c01:	fc                   	cld    
    7c02:	31 c0                	xor    %eax,%eax
    7c04:	8e d8                	mov    %eax,%ds
    7c06:	8e c0                	mov    %eax,%es
    7c08:	8e d0                	mov    %eax,%ss
    7c0a:	e4 92                	in     $0x92,%al
    7c0c:	0c 02                	or     $0x2,%al
    7c0e:	e6 92                	out    %al,$0x92
    7c10:	0f 01 16             	lgdt   (%rsi)
    7c13:	b4 7c                	mov    $0x7c,%ah
    7c15:	0f 20 c0             	mov    %cr0,%rax
    7c18:	66 83 c8 01          	or     $0x1,%ax
    7c1c:	0f 22 c0             	mov    %rax,%cr0
    7c1f:	ea                   	(bad)  
    7c20:	24 7c                	and    $0x7c,%al
    7c22:	08 00                	or     %al,(%rax)

0000000000007c24 <protcseg>:
    7c24:	66 b8 10 00          	mov    $0x10,%ax
    7c28:	8e d8                	mov    %eax,%ds
    7c2a:	8e c0                	mov    %eax,%es
    7c2c:	8e e0                	mov    %eax,%fs
    7c2e:	8e e8                	mov    %eax,%gs
    7c30:	8e d0                	mov    %eax,%ss
    7c32:	0f 20 e0             	mov    %cr4,%rax
    7c35:	83 c8 20             	or     $0x20,%eax
    7c38:	0f 22 e0             	mov    %rax,%cr4
    7c3b:	b8 87 00 00 00       	mov    $0x87,%eax
    7c40:	c7 05 00 80 00 00 01 	movl   $0x9001,0x8000(%rip)        # fc4a <PDPT_ADDR2+0x5c4a>
    7c47:	90 00 00 
    7c4a:	a3 00 90 00 00 c7 05 	movabs %eax,0x8ff805c700009000
    7c51:	f8 8f 
    7c53:	00 00                	add    %al,(%rax)
    7c55:	07                   	(bad)  
    7c56:	a0 00 00 a3 f8 af 00 	movabs 0xb80000aff8a30000,%al
    7c5d:	00 b8 
    7c5f:	00 80 00 00 0f 22    	add    %al,0x220f0000(%rax)
    7c65:	d8 b9 80 00 00 c0    	fdivrs -0x3fffff80(%rcx)
    7c6b:	0f 32                	rdmsr  
    7c6d:	0d 00 01 00 00       	or     $0x100,%eax
    7c72:	0f 30                	wrmsr  
    7c74:	0f 20 c0             	mov    %cr0,%rax
    7c77:	0d 00 00 00 80       	or     $0x80000000,%eax
    7c7c:	0f 22 c0             	mov    %rax,%cr0
    7c7f:	ea                   	(bad)  
    7c80:	86 7c 00 00          	xchg   %bh,0x0(%rax,%rax,1)
    7c84:	18 00                	sbb    %al,(%rax)

0000000000007c86 <seg64>:
    7c86:	48 c7 c4 00 7c 00 00 	mov    $0x7c00,%rsp
    7c8d:	e8 d8 00 00 00       	call   7d6a <bootmain>
    7c92:	66 90                	xchg   %ax,%ax

0000000000007c94 <gdt>:
	...
    7c9c:	ff                   	(bad)  
    7c9d:	ff 00                	incl   (%rax)
    7c9f:	00 00                	add    %al,(%rax)
    7ca1:	9a                   	(bad)  
    7ca2:	cf                   	iret   
    7ca3:	00 ff                	add    %bh,%bh
    7ca5:	ff 00                	incl   (%rax)
    7ca7:	00 00                	add    %al,(%rax)
    7ca9:	92                   	xchg   %eax,%edx
    7caa:	cf                   	iret   
    7cab:	00 ff                	add    %bh,%bh
    7cad:	ff 00                	incl   (%rax)
    7caf:	00 00                	add    %al,(%rax)
    7cb1:	9a                   	(bad)  
    7cb2:	af                   	scas   %es:(%rdi),%eax
	...

0000000000007cb4 <gdtdesc>:
    7cb4:	1f                   	(bad)  
    7cb5:	00                   	.byte 0x0
    7cb6:	94                   	xchg   %eax,%esp
    7cb7:	7c 00                	jl     7cb9 <gdtdesc+0x5>
	...

0000000000007cba <waitdisk>:
    7cba:	f3 0f 1e fa          	endbr64 
    7cbe:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7cc3:	ec                   	in     (%dx),%al
    7cc4:	83 e0 c0             	and    $0xffffffc0,%eax
    7cc7:	3c 40                	cmp    $0x40,%al
    7cc9:	75 f8                	jne    7cc3 <waitdisk+0x9>
    7ccb:	c3                   	ret    

0000000000007ccc <readsect>:
    7ccc:	f3 0f 1e fa          	endbr64 
    7cd0:	55                   	push   %rbp
    7cd1:	48 89 e5             	mov    %rsp,%rbp
    7cd4:	e8 e1 ff ff ff       	call   7cba <waitdisk>
    7cd9:	b0 01                	mov    $0x1,%al
    7cdb:	ba f2 01 00 00       	mov    $0x1f2,%edx
    7ce0:	ee                   	out    %al,(%dx)
    7ce1:	ba f3 01 00 00       	mov    $0x1f3,%edx
    7ce6:	89 f0                	mov    %esi,%eax
    7ce8:	ee                   	out    %al,(%dx)
    7ce9:	89 f0                	mov    %esi,%eax
    7ceb:	ba f4 01 00 00       	mov    $0x1f4,%edx
    7cf0:	c1 e8 08             	shr    $0x8,%eax
    7cf3:	ee                   	out    %al,(%dx)
    7cf4:	89 f0                	mov    %esi,%eax
    7cf6:	ba f5 01 00 00       	mov    $0x1f5,%edx
    7cfb:	c1 e8 10             	shr    $0x10,%eax
    7cfe:	ee                   	out    %al,(%dx)
    7cff:	c1 ee 18             	shr    $0x18,%esi
    7d02:	ba f6 01 00 00       	mov    $0x1f6,%edx
    7d07:	89 f0                	mov    %esi,%eax
    7d09:	83 c8 e0             	or     $0xffffffe0,%eax
    7d0c:	ee                   	out    %al,(%dx)
    7d0d:	b0 20                	mov    $0x20,%al
    7d0f:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7d14:	ee                   	out    %al,(%dx)
    7d15:	e8 a0 ff ff ff       	call   7cba <waitdisk>
    7d1a:	b9 80 00 00 00       	mov    $0x80,%ecx
    7d1f:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7d24:	fc                   	cld    
    7d25:	f2 6d                	repnz insl (%dx),%es:(%rdi)
    7d27:	5d                   	pop    %rbp
    7d28:	c3                   	ret    

0000000000007d29 <readseg>:
    7d29:	f3 0f 1e fa          	endbr64 
    7d2d:	49 89 f8             	mov    %rdi,%r8
    7d30:	89 f6                	mov    %esi,%esi
    7d32:	c1 ea 09             	shr    $0x9,%edx
    7d35:	4c 8d 14 3e          	lea    (%rsi,%rdi,1),%r10
    7d39:	49 81 e0 00 fe ff ff 	and    $0xfffffffffffffe00,%r8
    7d40:	44 8d 4a 01          	lea    0x1(%rdx),%r9d
    7d44:	4d 39 d0             	cmp    %r10,%r8
    7d47:	72 01                	jb     7d4a <readseg+0x21>
    7d49:	c3                   	ret    
    7d4a:	55                   	push   %rbp
    7d4b:	48 89 e5             	mov    %rsp,%rbp
    7d4e:	44 89 ce             	mov    %r9d,%esi
    7d51:	4c 89 c7             	mov    %r8,%rdi
    7d54:	49 81 c0 00 02 00 00 	add    $0x200,%r8
    7d5b:	41 ff c1             	inc    %r9d
    7d5e:	e8 69 ff ff ff       	call   7ccc <readsect>
    7d63:	4d 39 d0             	cmp    %r10,%r8
    7d66:	72 e6                	jb     7d4e <readseg+0x25>
    7d68:	5d                   	pop    %rbp
    7d69:	c3                   	ret    

0000000000007d6a <bootmain>:
    7d6a:	f3 0f 1e fa          	endbr64 
    7d6e:	55                   	push   %rbp
    7d6f:	31 d2                	xor    %edx,%edx
    7d71:	be 00 10 00 00       	mov    $0x1000,%esi
    7d76:	bf 00 00 01 00       	mov    $0x10000,%edi
    7d7b:	48 89 e5             	mov    %rsp,%rbp
    7d7e:	53                   	push   %rbx
    7d7f:	50                   	push   %rax
    7d80:	e8 a4 ff ff ff       	call   7d29 <readseg>
    7d85:	81 3c 25 00 00 01 00 	cmpl   $0x464c457f,0x10000
    7d8c:	7f 45 4c 46 
    7d90:	75 4b                	jne    7ddd <bootmain+0x73>
    7d92:	80 3c 25 04 00 01 00 	cmpb   $0x2,0x10004
    7d99:	02 
    7d9a:	75 41                	jne    7ddd <bootmain+0x73>
    7d9c:	0f b7 1c 25 38 00 01 	movzwl 0x10038,%ebx
    7da3:	00 
    7da4:	48 8b 04 25 20 00 01 	mov    0x10020,%rax
    7dab:	00 
    7dac:	48 6b db 38          	imul   $0x38,%rbx,%rbx
    7db0:	4c 8d 98 00 00 01 00 	lea    0x10000(%rax),%r11
    7db7:	4c 01 db             	add    %r11,%rbx
    7dba:	49 39 db             	cmp    %rbx,%r11
    7dbd:	73 17                	jae    7dd6 <bootmain+0x6c>
    7dbf:	49 8b 7b 18          	mov    0x18(%r11),%rdi
    7dc3:	41 8b 53 08          	mov    0x8(%r11),%edx
    7dc7:	49 83 c3 38          	add    $0x38,%r11
    7dcb:	41 8b 73 f0          	mov    -0x10(%r11),%esi
    7dcf:	e8 55 ff ff ff       	call   7d29 <readseg>
    7dd4:	eb e4                	jmp    7dba <bootmain+0x50>
    7dd6:	ff 14 25 18 00 01 00 	call   *0x10018
    7ddd:	ba 00 8a 00 00       	mov    $0x8a00,%edx
    7de2:	b8 00 8a ff ff       	mov    $0xffff8a00,%eax
    7de7:	66 ef                	out    %ax,(%dx)
    7de9:	b8 00 8e ff ff       	mov    $0xffff8e00,%eax
    7dee:	66 ef                	out    %ax,(%dx)
    7df0:	eb fe                	jmp    7df0 <bootmain+0x86>
