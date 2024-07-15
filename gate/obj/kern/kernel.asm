
obj/kern/kernel:     file format elf64-x86-64


Disassembly of section .text:

ffffffffc0200000 <_start-0xc>:
ffffffffc0200000:	02 b0 ad 1b 00 00    	add    0x1bad(%rax),%dh
ffffffffc0200006:	00 00                	add    %al,(%rax)
ffffffffc0200008:	fe 4f 52             	decb   0x52(%rdi)
ffffffffc020000b:	e4                   	.byte 0xe4

ffffffffc020000c <_start>:
ffffffffc020000c:	66 c7 04 25 72 04 00 	movw   $0x1234,0x472
ffffffffc0200013:	00 34 12 
ffffffffc0200016:	48 c7 c5 00 00 00 00 	mov    $0x0,%rbp
ffffffffc020001d:	48 bc 00 a0 20 c0 ff 	movabs $0xffffffffc020a000,%rsp
ffffffffc0200024:	ff ff ff 
ffffffffc0200027:	e8 02 00 00 00       	call   ffffffffc020002e <x86_init>

ffffffffc020002c <spin>:
ffffffffc020002c:	eb fe                	jmp    ffffffffc020002c <spin>

ffffffffc020002e <x86_init>:
ffffffffc020002e:	f3 0f 1e fa          	endbr64 
ffffffffc0200032:	55                   	push   %rbp
ffffffffc0200033:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200036:	48 8d 3d 1b a3 00 00 	lea    0xa31b(%rip),%rdi        # ffffffffc020a358 <edata>
ffffffffc020003d:	48 8d 15 7c a9 00 00 	lea    0xa97c(%rip),%rdx        # ffffffffc020a9c0 <end>
ffffffffc0200044:	29 fa                	sub    %edi,%edx
ffffffffc0200046:	be 00 00 00 00       	mov    $0x0,%esi
ffffffffc020004b:	e8 98 12 00 00       	call   ffffffffc02012e8 <memset>
ffffffffc0200050:	e8 87 05 00 00       	call   ffffffffc02005dc <cons_init>
ffffffffc0200055:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc020005a:	e8 e9 07 00 00       	call   ffffffffc0200848 <sysgate>
ffffffffc020005f:	5d                   	pop    %rbp
ffffffffc0200060:	c3                   	ret    

ffffffffc0200061 <_panic>:
ffffffffc0200061:	f3 0f 1e fa          	endbr64 
ffffffffc0200065:	55                   	push   %rbp
ffffffffc0200066:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200069:	53                   	push   %rbx
ffffffffc020006a:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
ffffffffc0200071:	48 89 d3             	mov    %rdx,%rbx
ffffffffc0200074:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
ffffffffc020007b:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
ffffffffc0200082:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
ffffffffc0200089:	84 c0                	test   %al,%al
ffffffffc020008b:	74 23                	je     ffffffffc02000b0 <_panic+0x4f>
ffffffffc020008d:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
ffffffffc0200094:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
ffffffffc0200098:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
ffffffffc020009c:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
ffffffffc02000a0:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
ffffffffc02000a4:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
ffffffffc02000a8:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
ffffffffc02000ac:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
ffffffffc02000b0:	48 83 3d a8 a2 00 00 	cmpq   $0x0,0xa2a8(%rip)        # ffffffffc020a360 <panicstr>
ffffffffc02000b7:	00 
ffffffffc02000b8:	74 02                	je     ffffffffc02000bc <_panic+0x5b>
ffffffffc02000ba:	eb fe                	jmp    ffffffffc02000ba <_panic+0x59>
ffffffffc02000bc:	48 89 1d 9d a2 00 00 	mov    %rbx,0xa29d(%rip)        # ffffffffc020a360 <panicstr>
ffffffffc02000c3:	fa                   	cli    
ffffffffc02000c4:	fc                   	cld    
ffffffffc02000c5:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
ffffffffc02000cc:	00 00 00 
ffffffffc02000cf:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
ffffffffc02000d6:	00 00 00 
ffffffffc02000d9:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffffffffc02000dd:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
ffffffffc02000e4:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffffffffc02000eb:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
ffffffffc02000f2:	89 f2                	mov    %esi,%edx
ffffffffc02000f4:	48 89 fe             	mov    %rdi,%rsi
ffffffffc02000f7:	48 8d 3d e2 13 00 00 	lea    0x13e2(%rip),%rdi        # ffffffffc02014e0 <strtol+0xfb>
ffffffffc02000fe:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc0200103:	e8 47 06 00 00       	call   ffffffffc020074f <cprintf>
ffffffffc0200108:	48 8d b5 28 ff ff ff 	lea    -0xd8(%rbp),%rsi
ffffffffc020010f:	48 89 df             	mov    %rbx,%rdi
ffffffffc0200112:	e8 0a 06 00 00       	call   ffffffffc0200721 <vcprintf>
ffffffffc0200117:	48 8d 3d fe 13 00 00 	lea    0x13fe(%rip),%rdi        # ffffffffc020151c <strtol+0x137>
ffffffffc020011e:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc0200123:	e8 27 06 00 00       	call   ffffffffc020074f <cprintf>
ffffffffc0200128:	eb 90                	jmp    ffffffffc02000ba <_panic+0x59>

ffffffffc020012a <_warn>:
ffffffffc020012a:	f3 0f 1e fa          	endbr64 
ffffffffc020012e:	55                   	push   %rbp
ffffffffc020012f:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200132:	53                   	push   %rbx
ffffffffc0200133:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
ffffffffc020013a:	48 89 d3             	mov    %rdx,%rbx
ffffffffc020013d:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
ffffffffc0200144:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
ffffffffc020014b:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
ffffffffc0200152:	84 c0                	test   %al,%al
ffffffffc0200154:	74 23                	je     ffffffffc0200179 <_warn+0x4f>
ffffffffc0200156:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
ffffffffc020015d:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
ffffffffc0200161:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
ffffffffc0200165:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
ffffffffc0200169:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
ffffffffc020016d:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
ffffffffc0200171:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
ffffffffc0200175:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
ffffffffc0200179:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
ffffffffc0200180:	00 00 00 
ffffffffc0200183:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
ffffffffc020018a:	00 00 00 
ffffffffc020018d:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffffffffc0200191:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
ffffffffc0200198:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffffffffc020019f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
ffffffffc02001a6:	89 f2                	mov    %esi,%edx
ffffffffc02001a8:	48 89 fe             	mov    %rdi,%rsi
ffffffffc02001ab:	48 8d 3d 46 13 00 00 	lea    0x1346(%rip),%rdi        # ffffffffc02014f8 <strtol+0x113>
ffffffffc02001b2:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02001b7:	e8 93 05 00 00       	call   ffffffffc020074f <cprintf>
ffffffffc02001bc:	48 8d b5 28 ff ff ff 	lea    -0xd8(%rbp),%rsi
ffffffffc02001c3:	48 89 df             	mov    %rbx,%rdi
ffffffffc02001c6:	e8 56 05 00 00       	call   ffffffffc0200721 <vcprintf>
ffffffffc02001cb:	48 8d 3d 4a 13 00 00 	lea    0x134a(%rip),%rdi        # ffffffffc020151c <strtol+0x137>
ffffffffc02001d2:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02001d7:	e8 73 05 00 00       	call   ffffffffc020074f <cprintf>
ffffffffc02001dc:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffffffffc02001e0:	c9                   	leave  
ffffffffc02001e1:	c3                   	ret    

ffffffffc02001e2 <serial_proc_data>:
ffffffffc02001e2:	f3 0f 1e fa          	endbr64 
ffffffffc02001e6:	ba fd 03 00 00       	mov    $0x3fd,%edx
ffffffffc02001eb:	ec                   	in     (%dx),%al
ffffffffc02001ec:	a8 01                	test   $0x1,%al
ffffffffc02001ee:	74 0a                	je     ffffffffc02001fa <serial_proc_data+0x18>
ffffffffc02001f0:	ba f8 03 00 00       	mov    $0x3f8,%edx
ffffffffc02001f5:	ec                   	in     (%dx),%al
ffffffffc02001f6:	0f b6 c0             	movzbl %al,%eax
ffffffffc02001f9:	c3                   	ret    
ffffffffc02001fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
ffffffffc02001ff:	c3                   	ret    

ffffffffc0200200 <cons_intr>:
ffffffffc0200200:	55                   	push   %rbp
ffffffffc0200201:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200204:	41 54                	push   %r12
ffffffffc0200206:	53                   	push   %rbx
ffffffffc0200207:	49 89 fc             	mov    %rdi,%r12
ffffffffc020020a:	48 8d 1d 8f a1 00 00 	lea    0xa18f(%rip),%rbx        # ffffffffc020a3a0 <cons>
ffffffffc0200211:	eb 22                	jmp    ffffffffc0200235 <cons_intr+0x35>
ffffffffc0200213:	8b 8b 04 02 00 00    	mov    0x204(%rbx),%ecx
ffffffffc0200219:	8d 51 01             	lea    0x1(%rcx),%edx
ffffffffc020021c:	89 c9                	mov    %ecx,%ecx
ffffffffc020021e:	88 04 0b             	mov    %al,(%rbx,%rcx,1)
ffffffffc0200221:	81 fa 00 02 00 00    	cmp    $0x200,%edx
ffffffffc0200227:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc020022c:	0f 44 d0             	cmove  %eax,%edx
ffffffffc020022f:	89 93 04 02 00 00    	mov    %edx,0x204(%rbx)
ffffffffc0200235:	41 ff d4             	call   *%r12
ffffffffc0200238:	83 f8 ff             	cmp    $0xffffffff,%eax
ffffffffc020023b:	74 06                	je     ffffffffc0200243 <cons_intr+0x43>
ffffffffc020023d:	85 c0                	test   %eax,%eax
ffffffffc020023f:	75 d2                	jne    ffffffffc0200213 <cons_intr+0x13>
ffffffffc0200241:	eb f2                	jmp    ffffffffc0200235 <cons_intr+0x35>
ffffffffc0200243:	5b                   	pop    %rbx
ffffffffc0200244:	41 5c                	pop    %r12
ffffffffc0200246:	5d                   	pop    %rbp
ffffffffc0200247:	c3                   	ret    

ffffffffc0200248 <kbd_proc_data>:
ffffffffc0200248:	f3 0f 1e fa          	endbr64 
ffffffffc020024c:	55                   	push   %rbp
ffffffffc020024d:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200250:	53                   	push   %rbx
ffffffffc0200251:	48 83 ec 08          	sub    $0x8,%rsp
ffffffffc0200255:	ba 64 00 00 00       	mov    $0x64,%edx
ffffffffc020025a:	ec                   	in     (%dx),%al
ffffffffc020025b:	a8 01                	test   $0x1,%al
ffffffffc020025d:	0f 84 09 01 00 00    	je     ffffffffc020036c <kbd_proc_data+0x124>
ffffffffc0200263:	a8 20                	test   $0x20,%al
ffffffffc0200265:	0f 85 08 01 00 00    	jne    ffffffffc0200373 <kbd_proc_data+0x12b>
ffffffffc020026b:	ba 60 00 00 00       	mov    $0x60,%edx
ffffffffc0200270:	ec                   	in     (%dx),%al
ffffffffc0200271:	89 c2                	mov    %eax,%edx
ffffffffc0200273:	3c e0                	cmp    $0xe0,%al
ffffffffc0200275:	74 75                	je     ffffffffc02002ec <kbd_proc_data+0xa4>
ffffffffc0200277:	84 c0                	test   %al,%al
ffffffffc0200279:	0f 88 81 00 00 00    	js     ffffffffc0200300 <kbd_proc_data+0xb8>
ffffffffc020027f:	8b 0d fb a0 00 00    	mov    0xa0fb(%rip),%ecx        # ffffffffc020a380 <shift.0>
ffffffffc0200285:	f6 c1 40             	test   $0x40,%cl
ffffffffc0200288:	74 0e                	je     ffffffffc0200298 <kbd_proc_data+0x50>
ffffffffc020028a:	83 c8 80             	or     $0xffffff80,%eax
ffffffffc020028d:	89 c2                	mov    %eax,%edx
ffffffffc020028f:	83 e1 bf             	and    $0xffffffbf,%ecx
ffffffffc0200292:	89 0d e8 a0 00 00    	mov    %ecx,0xa0e8(%rip)        # ffffffffc020a380 <shift.0>
ffffffffc0200298:	0f b6 ca             	movzbl %dl,%ecx
ffffffffc020029b:	48 8d 05 9e 13 00 00 	lea    0x139e(%rip),%rax        # ffffffffc0201640 <shiftcode>
ffffffffc02002a2:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
ffffffffc02002a6:	0b 05 d4 a0 00 00    	or     0xa0d4(%rip),%eax        # ffffffffc020a380 <shift.0>
ffffffffc02002ac:	48 8d 35 8d 12 00 00 	lea    0x128d(%rip),%rsi        # ffffffffc0201540 <togglecode>
ffffffffc02002b3:	0f b6 0c 0e          	movzbl (%rsi,%rcx,1),%ecx
ffffffffc02002b7:	31 c8                	xor    %ecx,%eax
ffffffffc02002b9:	89 05 c1 a0 00 00    	mov    %eax,0xa0c1(%rip)        # ffffffffc020a380 <shift.0>
ffffffffc02002bf:	89 c6                	mov    %eax,%esi
ffffffffc02002c1:	83 e6 03             	and    $0x3,%esi
ffffffffc02002c4:	0f b6 d2             	movzbl %dl,%edx
ffffffffc02002c7:	48 8d 0d 32 a0 00 00 	lea    0xa032(%rip),%rcx        # ffffffffc020a300 <charcode>
ffffffffc02002ce:	48 8b 0c f1          	mov    (%rcx,%rsi,8),%rcx
ffffffffc02002d2:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
ffffffffc02002d6:	0f b6 da             	movzbl %dl,%ebx
ffffffffc02002d9:	a8 08                	test   $0x8,%al
ffffffffc02002db:	74 63                	je     ffffffffc0200340 <kbd_proc_data+0xf8>
ffffffffc02002dd:	89 da                	mov    %ebx,%edx
ffffffffc02002df:	8d 4b 9f             	lea    -0x61(%rbx),%ecx
ffffffffc02002e2:	83 f9 19             	cmp    $0x19,%ecx
ffffffffc02002e5:	77 4d                	ja     ffffffffc0200334 <kbd_proc_data+0xec>
ffffffffc02002e7:	83 eb 20             	sub    $0x20,%ebx
ffffffffc02002ea:	eb 0c                	jmp    ffffffffc02002f8 <kbd_proc_data+0xb0>
ffffffffc02002ec:	83 0d 8d a0 00 00 40 	orl    $0x40,0xa08d(%rip)        # ffffffffc020a380 <shift.0>
ffffffffc02002f3:	bb 00 00 00 00       	mov    $0x0,%ebx
ffffffffc02002f8:	89 d8                	mov    %ebx,%eax
ffffffffc02002fa:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffffffffc02002fe:	c9                   	leave  
ffffffffc02002ff:	c3                   	ret    
ffffffffc0200300:	8b 0d 7a a0 00 00    	mov    0xa07a(%rip),%ecx        # ffffffffc020a380 <shift.0>
ffffffffc0200306:	83 e0 7f             	and    $0x7f,%eax
ffffffffc0200309:	f6 c1 40             	test   $0x40,%cl
ffffffffc020030c:	0f 44 d0             	cmove  %eax,%edx
ffffffffc020030f:	0f b6 d2             	movzbl %dl,%edx
ffffffffc0200312:	48 8d 05 27 13 00 00 	lea    0x1327(%rip),%rax        # ffffffffc0201640 <shiftcode>
ffffffffc0200319:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
ffffffffc020031d:	83 c8 40             	or     $0x40,%eax
ffffffffc0200320:	0f b6 c0             	movzbl %al,%eax
ffffffffc0200323:	f7 d0                	not    %eax
ffffffffc0200325:	21 c8                	and    %ecx,%eax
ffffffffc0200327:	89 05 53 a0 00 00    	mov    %eax,0xa053(%rip)        # ffffffffc020a380 <shift.0>
ffffffffc020032d:	bb 00 00 00 00       	mov    $0x0,%ebx
ffffffffc0200332:	eb c4                	jmp    ffffffffc02002f8 <kbd_proc_data+0xb0>
ffffffffc0200334:	83 ea 41             	sub    $0x41,%edx
ffffffffc0200337:	8d 4b 20             	lea    0x20(%rbx),%ecx
ffffffffc020033a:	83 fa 1a             	cmp    $0x1a,%edx
ffffffffc020033d:	0f 42 d9             	cmovb  %ecx,%ebx
ffffffffc0200340:	f7 d0                	not    %eax
ffffffffc0200342:	a8 06                	test   $0x6,%al
ffffffffc0200344:	75 b2                	jne    ffffffffc02002f8 <kbd_proc_data+0xb0>
ffffffffc0200346:	81 fb e9 00 00 00    	cmp    $0xe9,%ebx
ffffffffc020034c:	75 aa                	jne    ffffffffc02002f8 <kbd_proc_data+0xb0>
ffffffffc020034e:	48 8d 3d bd 11 00 00 	lea    0x11bd(%rip),%rdi        # ffffffffc0201512 <strtol+0x12d>
ffffffffc0200355:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc020035a:	e8 f0 03 00 00       	call   ffffffffc020074f <cprintf>
ffffffffc020035f:	b8 03 00 00 00       	mov    $0x3,%eax
ffffffffc0200364:	ba 92 00 00 00       	mov    $0x92,%edx
ffffffffc0200369:	ee                   	out    %al,(%dx)
ffffffffc020036a:	eb 8c                	jmp    ffffffffc02002f8 <kbd_proc_data+0xb0>
ffffffffc020036c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
ffffffffc0200371:	eb 85                	jmp    ffffffffc02002f8 <kbd_proc_data+0xb0>
ffffffffc0200373:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
ffffffffc0200378:	e9 7b ff ff ff       	jmp    ffffffffc02002f8 <kbd_proc_data+0xb0>

ffffffffc020037d <cons_putc>:
ffffffffc020037d:	55                   	push   %rbp
ffffffffc020037e:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200381:	41 89 f8             	mov    %edi,%r8d
ffffffffc0200384:	be 00 00 00 00       	mov    $0x0,%esi
ffffffffc0200389:	bf fd 03 00 00       	mov    $0x3fd,%edi
ffffffffc020038e:	b9 84 00 00 00       	mov    $0x84,%ecx
ffffffffc0200393:	89 fa                	mov    %edi,%edx
ffffffffc0200395:	ec                   	in     (%dx),%al
ffffffffc0200396:	a8 20                	test   $0x20,%al
ffffffffc0200398:	75 13                	jne    ffffffffc02003ad <cons_putc+0x30>
ffffffffc020039a:	81 fe ff 31 00 00    	cmp    $0x31ff,%esi
ffffffffc02003a0:	7f 0b                	jg     ffffffffc02003ad <cons_putc+0x30>
ffffffffc02003a2:	89 ca                	mov    %ecx,%edx
ffffffffc02003a4:	ec                   	in     (%dx),%al
ffffffffc02003a5:	ec                   	in     (%dx),%al
ffffffffc02003a6:	ec                   	in     (%dx),%al
ffffffffc02003a7:	ec                   	in     (%dx),%al
ffffffffc02003a8:	83 c6 01             	add    $0x1,%esi
ffffffffc02003ab:	eb e6                	jmp    ffffffffc0200393 <cons_putc+0x16>
ffffffffc02003ad:	45 89 c1             	mov    %r8d,%r9d
ffffffffc02003b0:	ba f8 03 00 00       	mov    $0x3f8,%edx
ffffffffc02003b5:	44 89 c0             	mov    %r8d,%eax
ffffffffc02003b8:	ee                   	out    %al,(%dx)
ffffffffc02003b9:	be 00 00 00 00       	mov    $0x0,%esi
ffffffffc02003be:	bf 79 03 00 00       	mov    $0x379,%edi
ffffffffc02003c3:	b9 84 00 00 00       	mov    $0x84,%ecx
ffffffffc02003c8:	89 fa                	mov    %edi,%edx
ffffffffc02003ca:	ec                   	in     (%dx),%al
ffffffffc02003cb:	81 fe ff 31 00 00    	cmp    $0x31ff,%esi
ffffffffc02003d1:	7f 0f                	jg     ffffffffc02003e2 <cons_putc+0x65>
ffffffffc02003d3:	84 c0                	test   %al,%al
ffffffffc02003d5:	78 0b                	js     ffffffffc02003e2 <cons_putc+0x65>
ffffffffc02003d7:	89 ca                	mov    %ecx,%edx
ffffffffc02003d9:	ec                   	in     (%dx),%al
ffffffffc02003da:	ec                   	in     (%dx),%al
ffffffffc02003db:	ec                   	in     (%dx),%al
ffffffffc02003dc:	ec                   	in     (%dx),%al
ffffffffc02003dd:	83 c6 01             	add    $0x1,%esi
ffffffffc02003e0:	eb e6                	jmp    ffffffffc02003c8 <cons_putc+0x4b>
ffffffffc02003e2:	ba 78 03 00 00       	mov    $0x378,%edx
ffffffffc02003e7:	44 89 c8             	mov    %r9d,%eax
ffffffffc02003ea:	ee                   	out    %al,(%dx)
ffffffffc02003eb:	ba 7a 03 00 00       	mov    $0x37a,%edx
ffffffffc02003f0:	b8 0d 00 00 00       	mov    $0xd,%eax
ffffffffc02003f5:	ee                   	out    %al,(%dx)
ffffffffc02003f6:	b8 08 00 00 00       	mov    $0x8,%eax
ffffffffc02003fb:	ee                   	out    %al,(%dx)
ffffffffc02003fc:	44 89 c0             	mov    %r8d,%eax
ffffffffc02003ff:	80 cc 07             	or     $0x7,%ah
ffffffffc0200402:	41 81 f8 00 01 00 00 	cmp    $0x100,%r8d
ffffffffc0200409:	44 0f 42 c0          	cmovb  %eax,%r8d
ffffffffc020040d:	41 0f b6 c0          	movzbl %r8b,%eax
ffffffffc0200411:	41 80 f8 0a          	cmp    $0xa,%r8b
ffffffffc0200415:	0f 84 98 00 00 00    	je     ffffffffc02004b3 <cons_putc+0x136>
ffffffffc020041b:	83 f8 0a             	cmp    $0xa,%eax
ffffffffc020041e:	7f 3e                	jg     ffffffffc020045e <cons_putc+0xe1>
ffffffffc0200420:	83 f8 08             	cmp    $0x8,%eax
ffffffffc0200423:	74 60                	je     ffffffffc0200485 <cons_putc+0x108>
ffffffffc0200425:	83 f8 09             	cmp    $0x9,%eax
ffffffffc0200428:	75 39                	jne    ffffffffc0200463 <cons_putc+0xe6>
ffffffffc020042a:	bf 20 00 00 00       	mov    $0x20,%edi
ffffffffc020042f:	e8 49 ff ff ff       	call   ffffffffc020037d <cons_putc>
ffffffffc0200434:	bf 20 00 00 00       	mov    $0x20,%edi
ffffffffc0200439:	e8 3f ff ff ff       	call   ffffffffc020037d <cons_putc>
ffffffffc020043e:	bf 20 00 00 00       	mov    $0x20,%edi
ffffffffc0200443:	e8 35 ff ff ff       	call   ffffffffc020037d <cons_putc>
ffffffffc0200448:	bf 20 00 00 00       	mov    $0x20,%edi
ffffffffc020044d:	e8 2b ff ff ff       	call   ffffffffc020037d <cons_putc>
ffffffffc0200452:	bf 20 00 00 00       	mov    $0x20,%edi
ffffffffc0200457:	e8 21 ff ff ff       	call   ffffffffc020037d <cons_putc>
ffffffffc020045c:	eb 7a                	jmp    ffffffffc02004d8 <cons_putc+0x15b>
ffffffffc020045e:	83 f8 0d             	cmp    $0xd,%eax
ffffffffc0200461:	74 58                	je     ffffffffc02004bb <cons_putc+0x13e>
ffffffffc0200463:	0f b7 05 3e a1 00 00 	movzwl 0xa13e(%rip),%eax        # ffffffffc020a5a8 <crt_pos>
ffffffffc020046a:	8d 50 01             	lea    0x1(%rax),%edx
ffffffffc020046d:	66 89 15 34 a1 00 00 	mov    %dx,0xa134(%rip)        # ffffffffc020a5a8 <crt_pos>
ffffffffc0200474:	0f b7 c0             	movzwl %ax,%eax
ffffffffc0200477:	48 8b 15 32 a1 00 00 	mov    0xa132(%rip),%rdx        # ffffffffc020a5b0 <crt_buf>
ffffffffc020047e:	66 44 89 04 42       	mov    %r8w,(%rdx,%rax,2)
ffffffffc0200483:	eb 53                	jmp    ffffffffc02004d8 <cons_putc+0x15b>
ffffffffc0200485:	0f b7 05 1c a1 00 00 	movzwl 0xa11c(%rip),%eax        # ffffffffc020a5a8 <crt_pos>
ffffffffc020048c:	66 85 c0             	test   %ax,%ax
ffffffffc020048f:	74 52                	je     ffffffffc02004e3 <cons_putc+0x166>
ffffffffc0200491:	83 e8 01             	sub    $0x1,%eax
ffffffffc0200494:	66 89 05 0d a1 00 00 	mov    %ax,0xa10d(%rip)        # ffffffffc020a5a8 <crt_pos>
ffffffffc020049b:	0f b7 c0             	movzwl %ax,%eax
ffffffffc020049e:	41 b0 00             	mov    $0x0,%r8b
ffffffffc02004a1:	41 83 c8 20          	or     $0x20,%r8d
ffffffffc02004a5:	48 8b 15 04 a1 00 00 	mov    0xa104(%rip),%rdx        # ffffffffc020a5b0 <crt_buf>
ffffffffc02004ac:	66 44 89 04 42       	mov    %r8w,(%rdx,%rax,2)
ffffffffc02004b1:	eb 25                	jmp    ffffffffc02004d8 <cons_putc+0x15b>
ffffffffc02004b3:	66 83 05 ed a0 00 00 	addw   $0x50,0xa0ed(%rip)        # ffffffffc020a5a8 <crt_pos>
ffffffffc02004ba:	50 
ffffffffc02004bb:	0f b7 05 e6 a0 00 00 	movzwl 0xa0e6(%rip),%eax        # ffffffffc020a5a8 <crt_pos>
ffffffffc02004c2:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
ffffffffc02004c8:	c1 e8 16             	shr    $0x16,%eax
ffffffffc02004cb:	8d 04 80             	lea    (%rax,%rax,4),%eax
ffffffffc02004ce:	c1 e0 04             	shl    $0x4,%eax
ffffffffc02004d1:	66 89 05 d0 a0 00 00 	mov    %ax,0xa0d0(%rip)        # ffffffffc020a5a8 <crt_pos>
ffffffffc02004d8:	66 81 3d c7 a0 00 00 	cmpw   $0x7cf,0xa0c7(%rip)        # ffffffffc020a5a8 <crt_pos>
ffffffffc02004df:	cf 07 
ffffffffc02004e1:	77 30                	ja     ffffffffc0200513 <cons_putc+0x196>
ffffffffc02004e3:	8b 0d cf a0 00 00    	mov    0xa0cf(%rip),%ecx        # ffffffffc020a5b8 <addr_6845>
ffffffffc02004e9:	b8 0e 00 00 00       	mov    $0xe,%eax
ffffffffc02004ee:	89 ca                	mov    %ecx,%edx
ffffffffc02004f0:	ee                   	out    %al,(%dx)
ffffffffc02004f1:	0f b7 35 b0 a0 00 00 	movzwl 0xa0b0(%rip),%esi        # ffffffffc020a5a8 <crt_pos>
ffffffffc02004f8:	8d 79 01             	lea    0x1(%rcx),%edi
ffffffffc02004fb:	89 f0                	mov    %esi,%eax
ffffffffc02004fd:	66 c1 e8 08          	shr    $0x8,%ax
ffffffffc0200501:	89 fa                	mov    %edi,%edx
ffffffffc0200503:	ee                   	out    %al,(%dx)
ffffffffc0200504:	b8 0f 00 00 00       	mov    $0xf,%eax
ffffffffc0200509:	89 ca                	mov    %ecx,%edx
ffffffffc020050b:	ee                   	out    %al,(%dx)
ffffffffc020050c:	89 f0                	mov    %esi,%eax
ffffffffc020050e:	89 fa                	mov    %edi,%edx
ffffffffc0200510:	ee                   	out    %al,(%dx)
ffffffffc0200511:	5d                   	pop    %rbp
ffffffffc0200512:	c3                   	ret    
ffffffffc0200513:	48 8b 3d 96 a0 00 00 	mov    0xa096(%rip),%rdi        # ffffffffc020a5b0 <crt_buf>
ffffffffc020051a:	48 8d b7 a0 00 00 00 	lea    0xa0(%rdi),%rsi
ffffffffc0200521:	ba 00 0f 00 00       	mov    $0xf00,%edx
ffffffffc0200526:	e8 ef 0d 00 00       	call   ffffffffc020131a <memmove>
ffffffffc020052b:	48 8b 15 7e a0 00 00 	mov    0xa07e(%rip),%rdx        # ffffffffc020a5b0 <crt_buf>
ffffffffc0200532:	48 8d 82 00 0f 00 00 	lea    0xf00(%rdx),%rax
ffffffffc0200539:	48 81 c2 a0 0f 00 00 	add    $0xfa0,%rdx
ffffffffc0200540:	eb 09                	jmp    ffffffffc020054b <cons_putc+0x1ce>
ffffffffc0200542:	66 c7 00 20 07       	movw   $0x720,(%rax)
ffffffffc0200547:	48 83 c0 02          	add    $0x2,%rax
ffffffffc020054b:	48 39 d0             	cmp    %rdx,%rax
ffffffffc020054e:	75 f2                	jne    ffffffffc0200542 <cons_putc+0x1c5>
ffffffffc0200550:	66 83 2d 50 a0 00 00 	subw   $0x50,0xa050(%rip)        # ffffffffc020a5a8 <crt_pos>
ffffffffc0200557:	50 
ffffffffc0200558:	eb 89                	jmp    ffffffffc02004e3 <cons_putc+0x166>

ffffffffc020055a <serial_intr>:
ffffffffc020055a:	f3 0f 1e fa          	endbr64 
ffffffffc020055e:	80 3d 57 a0 00 00 00 	cmpb   $0x0,0xa057(%rip)        # ffffffffc020a5bc <serial_exists>
ffffffffc0200565:	75 01                	jne    ffffffffc0200568 <serial_intr+0xe>
ffffffffc0200567:	c3                   	ret    
ffffffffc0200568:	55                   	push   %rbp
ffffffffc0200569:	48 89 e5             	mov    %rsp,%rbp
ffffffffc020056c:	48 8d 3d 6f fc ff ff 	lea    -0x391(%rip),%rdi        # ffffffffc02001e2 <serial_proc_data>
ffffffffc0200573:	e8 88 fc ff ff       	call   ffffffffc0200200 <cons_intr>
ffffffffc0200578:	5d                   	pop    %rbp
ffffffffc0200579:	c3                   	ret    

ffffffffc020057a <kbd_intr>:
ffffffffc020057a:	f3 0f 1e fa          	endbr64 
ffffffffc020057e:	55                   	push   %rbp
ffffffffc020057f:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200582:	48 8d 3d bf fc ff ff 	lea    -0x341(%rip),%rdi        # ffffffffc0200248 <kbd_proc_data>
ffffffffc0200589:	e8 72 fc ff ff       	call   ffffffffc0200200 <cons_intr>
ffffffffc020058e:	5d                   	pop    %rbp
ffffffffc020058f:	c3                   	ret    

ffffffffc0200590 <cons_getc>:
ffffffffc0200590:	f3 0f 1e fa          	endbr64 
ffffffffc0200594:	55                   	push   %rbp
ffffffffc0200595:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200598:	e8 bd ff ff ff       	call   ffffffffc020055a <serial_intr>
ffffffffc020059d:	e8 d8 ff ff ff       	call   ffffffffc020057a <kbd_intr>
ffffffffc02005a2:	8b 05 f8 9f 00 00    	mov    0x9ff8(%rip),%eax        # ffffffffc020a5a0 <cons+0x200>
ffffffffc02005a8:	ba 00 00 00 00       	mov    $0x0,%edx
ffffffffc02005ad:	3b 05 f1 9f 00 00    	cmp    0x9ff1(%rip),%eax        # ffffffffc020a5a4 <cons+0x204>
ffffffffc02005b3:	74 23                	je     ffffffffc02005d8 <cons_getc+0x48>
ffffffffc02005b5:	8d 48 01             	lea    0x1(%rax),%ecx
ffffffffc02005b8:	89 c2                	mov    %eax,%edx
ffffffffc02005ba:	48 8d 35 df 9d 00 00 	lea    0x9ddf(%rip),%rsi        # ffffffffc020a3a0 <cons>
ffffffffc02005c1:	0f b6 14 16          	movzbl (%rsi,%rdx,1),%edx
ffffffffc02005c5:	3d ff 01 00 00       	cmp    $0x1ff,%eax
ffffffffc02005ca:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02005cf:	0f 45 c1             	cmovne %ecx,%eax
ffffffffc02005d2:	89 05 c8 9f 00 00    	mov    %eax,0x9fc8(%rip)        # ffffffffc020a5a0 <cons+0x200>
ffffffffc02005d8:	89 d0                	mov    %edx,%eax
ffffffffc02005da:	5d                   	pop    %rbp
ffffffffc02005db:	c3                   	ret    

ffffffffc02005dc <cons_init>:
ffffffffc02005dc:	f3 0f 1e fa          	endbr64 
ffffffffc02005e0:	0f b7 14 25 00 80 0b 	movzwl 0xffffffffc00b8000,%edx
ffffffffc02005e7:	c0 
ffffffffc02005e8:	66 c7 04 25 00 80 0b 	movw   $0xa55a,0xffffffffc00b8000
ffffffffc02005ef:	c0 5a a5 
ffffffffc02005f2:	0f b7 04 25 00 80 0b 	movzwl 0xffffffffc00b8000,%eax
ffffffffc02005f9:	c0 
ffffffffc02005fa:	be b4 03 00 00       	mov    $0x3b4,%esi
ffffffffc02005ff:	49 c7 c0 00 00 0b c0 	mov    $0xffffffffc00b0000,%r8
ffffffffc0200606:	66 3d 5a a5          	cmp    $0xa55a,%ax
ffffffffc020060a:	0f 84 a6 00 00 00    	je     ffffffffc02006b6 <cons_init+0xda>
ffffffffc0200610:	89 35 a2 9f 00 00    	mov    %esi,0x9fa2(%rip)        # ffffffffc020a5b8 <addr_6845>
ffffffffc0200616:	b8 0e 00 00 00       	mov    $0xe,%eax
ffffffffc020061b:	89 f2                	mov    %esi,%edx
ffffffffc020061d:	ee                   	out    %al,(%dx)
ffffffffc020061e:	8d 7e 01             	lea    0x1(%rsi),%edi
ffffffffc0200621:	89 fa                	mov    %edi,%edx
ffffffffc0200623:	ec                   	in     (%dx),%al
ffffffffc0200624:	0f b6 c8             	movzbl %al,%ecx
ffffffffc0200627:	c1 e1 08             	shl    $0x8,%ecx
ffffffffc020062a:	b8 0f 00 00 00       	mov    $0xf,%eax
ffffffffc020062f:	89 f2                	mov    %esi,%edx
ffffffffc0200631:	ee                   	out    %al,(%dx)
ffffffffc0200632:	89 fa                	mov    %edi,%edx
ffffffffc0200634:	ec                   	in     (%dx),%al
ffffffffc0200635:	4c 89 05 74 9f 00 00 	mov    %r8,0x9f74(%rip)        # ffffffffc020a5b0 <crt_buf>
ffffffffc020063c:	0f b6 c0             	movzbl %al,%eax
ffffffffc020063f:	09 c8                	or     %ecx,%eax
ffffffffc0200641:	66 89 05 60 9f 00 00 	mov    %ax,0x9f60(%rip)        # ffffffffc020a5a8 <crt_pos>
ffffffffc0200648:	b9 00 00 00 00       	mov    $0x0,%ecx
ffffffffc020064d:	bf fa 03 00 00       	mov    $0x3fa,%edi
ffffffffc0200652:	89 c8                	mov    %ecx,%eax
ffffffffc0200654:	89 fa                	mov    %edi,%edx
ffffffffc0200656:	ee                   	out    %al,(%dx)
ffffffffc0200657:	41 b9 fb 03 00 00    	mov    $0x3fb,%r9d
ffffffffc020065d:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
ffffffffc0200662:	44 89 ca             	mov    %r9d,%edx
ffffffffc0200665:	ee                   	out    %al,(%dx)
ffffffffc0200666:	be f8 03 00 00       	mov    $0x3f8,%esi
ffffffffc020066b:	b8 0c 00 00 00       	mov    $0xc,%eax
ffffffffc0200670:	89 f2                	mov    %esi,%edx
ffffffffc0200672:	ee                   	out    %al,(%dx)
ffffffffc0200673:	41 b8 f9 03 00 00    	mov    $0x3f9,%r8d
ffffffffc0200679:	89 c8                	mov    %ecx,%eax
ffffffffc020067b:	44 89 c2             	mov    %r8d,%edx
ffffffffc020067e:	ee                   	out    %al,(%dx)
ffffffffc020067f:	b8 03 00 00 00       	mov    $0x3,%eax
ffffffffc0200684:	44 89 ca             	mov    %r9d,%edx
ffffffffc0200687:	ee                   	out    %al,(%dx)
ffffffffc0200688:	ba fc 03 00 00       	mov    $0x3fc,%edx
ffffffffc020068d:	89 c8                	mov    %ecx,%eax
ffffffffc020068f:	ee                   	out    %al,(%dx)
ffffffffc0200690:	b8 01 00 00 00       	mov    $0x1,%eax
ffffffffc0200695:	44 89 c2             	mov    %r8d,%edx
ffffffffc0200698:	ee                   	out    %al,(%dx)
ffffffffc0200699:	ba fd 03 00 00       	mov    $0x3fd,%edx
ffffffffc020069e:	ec                   	in     (%dx),%al
ffffffffc020069f:	89 c1                	mov    %eax,%ecx
ffffffffc02006a1:	3c ff                	cmp    $0xff,%al
ffffffffc02006a3:	0f 95 05 12 9f 00 00 	setne  0x9f12(%rip)        # ffffffffc020a5bc <serial_exists>
ffffffffc02006aa:	89 fa                	mov    %edi,%edx
ffffffffc02006ac:	ec                   	in     (%dx),%al
ffffffffc02006ad:	89 f2                	mov    %esi,%edx
ffffffffc02006af:	ec                   	in     (%dx),%al
ffffffffc02006b0:	80 f9 ff             	cmp    $0xff,%cl
ffffffffc02006b3:	74 1a                	je     ffffffffc02006cf <cons_init+0xf3>
ffffffffc02006b5:	c3                   	ret    
ffffffffc02006b6:	66 89 14 25 00 80 0b 	mov    %dx,0xffffffffc00b8000
ffffffffc02006bd:	c0 
ffffffffc02006be:	be d4 03 00 00       	mov    $0x3d4,%esi
ffffffffc02006c3:	49 c7 c0 00 80 0b c0 	mov    $0xffffffffc00b8000,%r8
ffffffffc02006ca:	e9 41 ff ff ff       	jmp    ffffffffc0200610 <cons_init+0x34>
ffffffffc02006cf:	55                   	push   %rbp
ffffffffc02006d0:	48 89 e5             	mov    %rsp,%rbp
ffffffffc02006d3:	48 8d 3d 44 0e 00 00 	lea    0xe44(%rip),%rdi        # ffffffffc020151e <strtol+0x139>
ffffffffc02006da:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02006df:	e8 6b 00 00 00       	call   ffffffffc020074f <cprintf>
ffffffffc02006e4:	5d                   	pop    %rbp
ffffffffc02006e5:	c3                   	ret    

ffffffffc02006e6 <cputchar>:
ffffffffc02006e6:	f3 0f 1e fa          	endbr64 
ffffffffc02006ea:	55                   	push   %rbp
ffffffffc02006eb:	48 89 e5             	mov    %rsp,%rbp
ffffffffc02006ee:	e8 8a fc ff ff       	call   ffffffffc020037d <cons_putc>
ffffffffc02006f3:	5d                   	pop    %rbp
ffffffffc02006f4:	c3                   	ret    

ffffffffc02006f5 <getchar>:
ffffffffc02006f5:	f3 0f 1e fa          	endbr64 
ffffffffc02006f9:	55                   	push   %rbp
ffffffffc02006fa:	48 89 e5             	mov    %rsp,%rbp
ffffffffc02006fd:	e8 8e fe ff ff       	call   ffffffffc0200590 <cons_getc>
ffffffffc0200702:	85 c0                	test   %eax,%eax
ffffffffc0200704:	74 f7                	je     ffffffffc02006fd <getchar+0x8>
ffffffffc0200706:	5d                   	pop    %rbp
ffffffffc0200707:	c3                   	ret    

ffffffffc0200708 <iscons>:
ffffffffc0200708:	f3 0f 1e fa          	endbr64 
ffffffffc020070c:	b8 01 00 00 00       	mov    $0x1,%eax
ffffffffc0200711:	c3                   	ret    

ffffffffc0200712 <putch>:
ffffffffc0200712:	f3 0f 1e fa          	endbr64 
ffffffffc0200716:	55                   	push   %rbp
ffffffffc0200717:	48 89 e5             	mov    %rsp,%rbp
ffffffffc020071a:	e8 c7 ff ff ff       	call   ffffffffc02006e6 <cputchar>
ffffffffc020071f:	5d                   	pop    %rbp
ffffffffc0200720:	c3                   	ret    

ffffffffc0200721 <vcprintf>:
ffffffffc0200721:	f3 0f 1e fa          	endbr64 
ffffffffc0200725:	55                   	push   %rbp
ffffffffc0200726:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200729:	48 83 ec 10          	sub    $0x10,%rsp
ffffffffc020072d:	48 89 fa             	mov    %rdi,%rdx
ffffffffc0200730:	48 89 f1             	mov    %rsi,%rcx
ffffffffc0200733:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffffffffc020073a:	48 8d 75 fc          	lea    -0x4(%rbp),%rsi
ffffffffc020073e:	48 8d 3d cd ff ff ff 	lea    -0x33(%rip),%rdi        # ffffffffc0200712 <putch>
ffffffffc0200745:	e8 d0 02 00 00       	call   ffffffffc0200a1a <vprintfmt>
ffffffffc020074a:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffffffffc020074d:	c9                   	leave  
ffffffffc020074e:	c3                   	ret    

ffffffffc020074f <cprintf>:
ffffffffc020074f:	f3 0f 1e fa          	endbr64 
ffffffffc0200753:	55                   	push   %rbp
ffffffffc0200754:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200757:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
ffffffffc020075e:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
ffffffffc0200765:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
ffffffffc020076c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
ffffffffc0200773:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
ffffffffc020077a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
ffffffffc0200781:	84 c0                	test   %al,%al
ffffffffc0200783:	74 20                	je     ffffffffc02007a5 <cprintf+0x56>
ffffffffc0200785:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
ffffffffc0200789:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
ffffffffc020078d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
ffffffffc0200791:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
ffffffffc0200795:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
ffffffffc0200799:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
ffffffffc020079d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
ffffffffc02007a1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
ffffffffc02007a5:	c7 85 38 ff ff ff 08 	movl   $0x8,-0xc8(%rbp)
ffffffffc02007ac:	00 00 00 
ffffffffc02007af:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
ffffffffc02007b6:	00 00 00 
ffffffffc02007b9:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffffffffc02007bd:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
ffffffffc02007c4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
ffffffffc02007cb:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
ffffffffc02007d2:	48 8d b5 38 ff ff ff 	lea    -0xc8(%rbp),%rsi
ffffffffc02007d9:	e8 43 ff ff ff       	call   ffffffffc0200721 <vcprintf>
ffffffffc02007de:	c9                   	leave  
ffffffffc02007df:	c3                   	ret    

ffffffffc02007e0 <_start_user>:
ffffffffc02007e0:	66 8c c8             	mov    %cs,%ax
ffffffffc02007e3:	66 83 e0 03          	and    $0x3,%ax
ffffffffc02007e7:	66 83 f8 03          	cmp    $0x3,%ax
ffffffffc02007eb:	75 1e                	jne    ffffffffc020080b <epicfail>
ffffffffc02007ed:	bf 01 00 00 00       	mov    $0x1,%edi
ffffffffc02007f2:	48 be 40 17 20 c0 ff 	movabs $0xffffffffc0201740,%rsi
ffffffffc02007f9:	ff ff ff 
ffffffffc02007fc:	0f 05                	syscall 
ffffffffc02007fe:	48 83 f8 05          	cmp    $0x5,%rax
ffffffffc0200802:	75 07                	jne    ffffffffc020080b <epicfail>
ffffffffc0200804:	bf 02 00 00 00       	mov    $0x2,%edi
ffffffffc0200809:	0f 05                	syscall 

ffffffffc020080b <epicfail>:
ffffffffc020080b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
ffffffffc0200810:	67 ff 20             	jmp    *(%eax)

ffffffffc0200813 <read_msr>:
ffffffffc0200813:	f3 0f 1e fa          	endbr64 
ffffffffc0200817:	89 f9                	mov    %edi,%ecx
ffffffffc0200819:	31 d2                	xor    %edx,%edx
ffffffffc020081b:	31 c0                	xor    %eax,%eax
ffffffffc020081d:	0f 32                	rdmsr  
ffffffffc020081f:	48 c1 e2 20          	shl    $0x20,%rdx
ffffffffc0200823:	48 09 d0             	or     %rdx,%rax
ffffffffc0200826:	48 89 c7             	mov    %rax,%rdi
ffffffffc0200829:	48 89 f8             	mov    %rdi,%rax
ffffffffc020082c:	c3                   	ret    

ffffffffc020082d <write_msr>:
ffffffffc020082d:	f3 0f 1e fa          	endbr64 
ffffffffc0200831:	89 f9                	mov    %edi,%ecx
ffffffffc0200833:	48 89 f0             	mov    %rsi,%rax
ffffffffc0200836:	48 89 f2             	mov    %rsi,%rdx
ffffffffc0200839:	48 c1 e0 20          	shl    $0x20,%rax
ffffffffc020083d:	48 c1 e8 20          	shr    $0x20,%rax
ffffffffc0200841:	48 c1 ea 20          	shr    $0x20,%rdx
ffffffffc0200845:	0f 30                	wrmsr  
ffffffffc0200847:	c3                   	ret    

ffffffffc0200848 <sysgate>:
ffffffffc0200848:	f3 0f 1e fa          	endbr64 
ffffffffc020084c:	55                   	push   %rbp
ffffffffc020084d:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200850:	bf 80 00 00 c0       	mov    $0xc0000080,%edi
ffffffffc0200855:	e8 b9 ff ff ff       	call   ffffffffc0200813 <read_msr>
ffffffffc020085a:	48 83 c8 01          	or     $0x1,%rax
ffffffffc020085e:	48 89 c6             	mov    %rax,%rsi
ffffffffc0200861:	bf 80 00 00 c0       	mov    $0xc0000080,%edi
ffffffffc0200866:	e8 c2 ff ff ff       	call   ffffffffc020082d <write_msr>
ffffffffc020086b:	48 c7 c6 9c 08 20 c0 	mov    $0xffffffffc020089c,%rsi
ffffffffc0200872:	bf 82 00 00 c0       	mov    $0xc0000082,%edi
ffffffffc0200877:	e8 b1 ff ff ff       	call   ffffffffc020082d <write_msr>
ffffffffc020087c:	48 c7 c0 e0 07 20 c0 	mov    $0xffffffffc02007e0,%rax
ffffffffc0200883:	48 89 c1             	mov    %rax,%rcx
ffffffffc0200886:	48 0f 07             	sysretq 
ffffffffc0200889:	5d                   	pop    %rbp
ffffffffc020088a:	c3                   	ret    

ffffffffc020088b <func_sys_work>:
ffffffffc020088b:	48 89 f7             	mov    %rsi,%rdi
ffffffffc020088e:	e8 28 00 00 00       	call   ffffffffc02008bb <sys_work>
ffffffffc0200893:	eb 18                	jmp    ffffffffc02008ad <_syscall_ret>

ffffffffc0200895 <func_sys_retire>:
ffffffffc0200895:	e8 5d 00 00 00       	call   ffffffffc02008f7 <sys_retire>
ffffffffc020089a:	eb 11                	jmp    ffffffffc02008ad <_syscall_ret>

ffffffffc020089c <_syscall_enter>:
ffffffffc020089c:	55                   	push   %rbp
ffffffffc020089d:	48 89 e5             	mov    %rsp,%rbp
ffffffffc02008a0:	51                   	push   %rcx
ffffffffc02008a1:	41 53                	push   %r11
ffffffffc02008a3:	83 ff 01             	cmp    $0x1,%edi
ffffffffc02008a6:	74 e3                	je     ffffffffc020088b <func_sys_work>
ffffffffc02008a8:	83 ff 01             	cmp    $0x1,%edi
ffffffffc02008ab:	75 e8                	jne    ffffffffc0200895 <func_sys_retire>

ffffffffc02008ad <_syscall_ret>:
ffffffffc02008ad:	48 c7 c0 05 00 00 00 	mov    $0x5,%rax
ffffffffc02008b4:	41 5b                	pop    %r11
ffffffffc02008b6:	59                   	pop    %rcx
ffffffffc02008b7:	5d                   	pop    %rbp
ffffffffc02008b8:	48 0f 07             	sysretq 

ffffffffc02008bb <sys_work>:
ffffffffc02008bb:	f3 0f 1e fa          	endbr64 
ffffffffc02008bf:	55                   	push   %rbp
ffffffffc02008c0:	48 89 e5             	mov    %rsp,%rbp
ffffffffc02008c3:	41 54                	push   %r12
ffffffffc02008c5:	53                   	push   %rbx
ffffffffc02008c6:	48 89 fb             	mov    %rdi,%rbx
ffffffffc02008c9:	4c 8d 25 7e 0e 00 00 	lea    0xe7e(%rip),%r12        # ffffffffc020174e <user_data+0xe>
ffffffffc02008d0:	eb 18                	jmp    ffffffffc02008ea <sys_work+0x2f>
ffffffffc02008d2:	83 f6 5a             	xor    $0x5a,%esi
ffffffffc02008d5:	40 0f be f6          	movsbl %sil,%esi
ffffffffc02008d9:	4c 89 e7             	mov    %r12,%rdi
ffffffffc02008dc:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02008e1:	e8 69 fe ff ff       	call   ffffffffc020074f <cprintf>
ffffffffc02008e6:	48 83 c3 01          	add    $0x1,%rbx
ffffffffc02008ea:	0f b6 33             	movzbl (%rbx),%esi
ffffffffc02008ed:	40 84 f6             	test   %sil,%sil
ffffffffc02008f0:	75 e0                	jne    ffffffffc02008d2 <sys_work+0x17>
ffffffffc02008f2:	5b                   	pop    %rbx
ffffffffc02008f3:	41 5c                	pop    %r12
ffffffffc02008f5:	5d                   	pop    %rbp
ffffffffc02008f6:	c3                   	ret    

ffffffffc02008f7 <sys_retire>:
ffffffffc02008f7:	f3 0f 1e fa          	endbr64 
ffffffffc02008fb:	eb fe                	jmp    ffffffffc02008fb <sys_retire+0x4>

ffffffffc02008fd <printnum>:
ffffffffc02008fd:	55                   	push   %rbp
ffffffffc02008fe:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200901:	41 57                	push   %r15
ffffffffc0200903:	41 56                	push   %r14
ffffffffc0200905:	41 55                	push   %r13
ffffffffc0200907:	41 54                	push   %r12
ffffffffc0200909:	53                   	push   %rbx
ffffffffc020090a:	48 83 ec 18          	sub    $0x18,%rsp
ffffffffc020090e:	49 89 fc             	mov    %rdi,%r12
ffffffffc0200911:	49 89 f5             	mov    %rsi,%r13
ffffffffc0200914:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
ffffffffc0200918:	44 89 c3             	mov    %r8d,%ebx
ffffffffc020091b:	45 89 ce             	mov    %r9d,%r14d
ffffffffc020091e:	41 89 cf             	mov    %ecx,%r15d
ffffffffc0200921:	4c 39 fa             	cmp    %r15,%rdx
ffffffffc0200924:	72 22                	jb     ffffffffc0200948 <printnum+0x4b>
ffffffffc0200926:	48 89 d0             	mov    %rdx,%rax
ffffffffc0200929:	ba 00 00 00 00       	mov    $0x0,%edx
ffffffffc020092e:	49 f7 f7             	div    %r15
ffffffffc0200931:	45 8d 40 ff          	lea    -0x1(%r8),%r8d
ffffffffc0200935:	48 89 c2             	mov    %rax,%rdx
ffffffffc0200938:	e8 c0 ff ff ff       	call   ffffffffc02008fd <printnum>
ffffffffc020093d:	eb 10                	jmp    ffffffffc020094f <printnum+0x52>
ffffffffc020093f:	4c 89 ee             	mov    %r13,%rsi
ffffffffc0200942:	44 89 f7             	mov    %r14d,%edi
ffffffffc0200945:	41 ff d4             	call   *%r12
ffffffffc0200948:	83 eb 01             	sub    $0x1,%ebx
ffffffffc020094b:	85 db                	test   %ebx,%ebx
ffffffffc020094d:	7f f0                	jg     ffffffffc020093f <printnum+0x42>
ffffffffc020094f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffffffffc0200953:	ba 00 00 00 00       	mov    $0x0,%edx
ffffffffc0200958:	49 f7 f7             	div    %r15
ffffffffc020095b:	48 8d 05 ef 0d 00 00 	lea    0xdef(%rip),%rax        # ffffffffc0201751 <user_data+0x11>
ffffffffc0200962:	0f be 3c 10          	movsbl (%rax,%rdx,1),%edi
ffffffffc0200966:	4c 89 ee             	mov    %r13,%rsi
ffffffffc0200969:	41 ff d4             	call   *%r12
ffffffffc020096c:	48 83 c4 18          	add    $0x18,%rsp
ffffffffc0200970:	5b                   	pop    %rbx
ffffffffc0200971:	41 5c                	pop    %r12
ffffffffc0200973:	41 5d                	pop    %r13
ffffffffc0200975:	41 5e                	pop    %r14
ffffffffc0200977:	41 5f                	pop    %r15
ffffffffc0200979:	5d                   	pop    %rbp
ffffffffc020097a:	c3                   	ret    

ffffffffc020097b <sprintputch>:
ffffffffc020097b:	f3 0f 1e fa          	endbr64 
ffffffffc020097f:	83 46 10 01          	addl   $0x1,0x10(%rsi)
ffffffffc0200983:	48 8b 06             	mov    (%rsi),%rax
ffffffffc0200986:	48 3b 46 08          	cmp    0x8(%rsi),%rax
ffffffffc020098a:	73 0a                	jae    ffffffffc0200996 <sprintputch+0x1b>
ffffffffc020098c:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffffffffc0200990:	48 89 16             	mov    %rdx,(%rsi)
ffffffffc0200993:	40 88 38             	mov    %dil,(%rax)
ffffffffc0200996:	c3                   	ret    

ffffffffc0200997 <printfmt>:
ffffffffc0200997:	f3 0f 1e fa          	endbr64 
ffffffffc020099b:	55                   	push   %rbp
ffffffffc020099c:	48 89 e5             	mov    %rsp,%rbp
ffffffffc020099f:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
ffffffffc02009a6:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
ffffffffc02009ad:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
ffffffffc02009b4:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
ffffffffc02009bb:	84 c0                	test   %al,%al
ffffffffc02009bd:	74 20                	je     ffffffffc02009df <printfmt+0x48>
ffffffffc02009bf:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
ffffffffc02009c3:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
ffffffffc02009c7:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
ffffffffc02009cb:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
ffffffffc02009cf:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
ffffffffc02009d3:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
ffffffffc02009d7:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
ffffffffc02009db:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
ffffffffc02009df:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
ffffffffc02009e6:	00 00 00 
ffffffffc02009e9:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
ffffffffc02009f0:	00 00 00 
ffffffffc02009f3:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffffffffc02009f7:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
ffffffffc02009fe:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
ffffffffc0200a05:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
ffffffffc0200a0c:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
ffffffffc0200a13:	e8 02 00 00 00       	call   ffffffffc0200a1a <vprintfmt>
ffffffffc0200a18:	c9                   	leave  
ffffffffc0200a19:	c3                   	ret    

ffffffffc0200a1a <vprintfmt>:
ffffffffc0200a1a:	f3 0f 1e fa          	endbr64 
ffffffffc0200a1e:	55                   	push   %rbp
ffffffffc0200a1f:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200a22:	41 57                	push   %r15
ffffffffc0200a24:	41 56                	push   %r14
ffffffffc0200a26:	41 55                	push   %r13
ffffffffc0200a28:	41 54                	push   %r12
ffffffffc0200a2a:	53                   	push   %rbx
ffffffffc0200a2b:	48 83 ec 28          	sub    $0x28,%rsp
ffffffffc0200a2f:	49 89 fd             	mov    %rdi,%r13
ffffffffc0200a32:	49 89 f4             	mov    %rsi,%r12
ffffffffc0200a35:	48 89 d3             	mov    %rdx,%rbx
ffffffffc0200a38:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
ffffffffc0200a3c:	eb 06                	jmp    ffffffffc0200a44 <vprintfmt+0x2a>
ffffffffc0200a3e:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200a41:	41 ff d5             	call   *%r13
ffffffffc0200a44:	48 83 c3 01          	add    $0x1,%rbx
ffffffffc0200a48:	0f b6 7b ff          	movzbl -0x1(%rbx),%edi
ffffffffc0200a4c:	83 ff 25             	cmp    $0x25,%edi
ffffffffc0200a4f:	74 13                	je     ffffffffc0200a64 <vprintfmt+0x4a>
ffffffffc0200a51:	85 ff                	test   %edi,%edi
ffffffffc0200a53:	75 e9                	jne    ffffffffc0200a3e <vprintfmt+0x24>
ffffffffc0200a55:	48 83 c4 28          	add    $0x28,%rsp
ffffffffc0200a59:	5b                   	pop    %rbx
ffffffffc0200a5a:	41 5c                	pop    %r12
ffffffffc0200a5c:	41 5d                	pop    %r13
ffffffffc0200a5e:	41 5e                	pop    %r14
ffffffffc0200a60:	41 5f                	pop    %r15
ffffffffc0200a62:	5d                   	pop    %rbp
ffffffffc0200a63:	c3                   	ret    
ffffffffc0200a64:	c6 45 bf 20          	movb   $0x20,-0x41(%rbp)
ffffffffc0200a68:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
ffffffffc0200a6f:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
ffffffffc0200a75:	c7 45 c8 ff ff ff ff 	movl   $0xffffffff,-0x38(%rbp)
ffffffffc0200a7c:	b9 00 00 00 00       	mov    $0x0,%ecx
ffffffffc0200a81:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
ffffffffc0200a85:	0f b6 13             	movzbl (%rbx),%edx
ffffffffc0200a88:	8d 42 dd             	lea    -0x23(%rdx),%eax
ffffffffc0200a8b:	3c 55                	cmp    $0x55,%al
ffffffffc0200a8d:	0f 87 05 05 00 00    	ja     ffffffffc0200f98 <vprintfmt+0x57e>
ffffffffc0200a93:	0f b6 c0             	movzbl %al,%eax
ffffffffc0200a96:	48 8d 35 43 0d 00 00 	lea    0xd43(%rip),%rsi        # ffffffffc02017e0 <user_data+0xa0>
ffffffffc0200a9d:	48 63 04 86          	movslq (%rsi,%rax,4),%rax
ffffffffc0200aa1:	48 01 f0             	add    %rsi,%rax
ffffffffc0200aa4:	3e ff e0             	notrack jmp *%rax
ffffffffc0200aa7:	4c 89 fb             	mov    %r15,%rbx
ffffffffc0200aaa:	c6 45 bf 2d          	movb   $0x2d,-0x41(%rbp)
ffffffffc0200aae:	eb d1                	jmp    ffffffffc0200a81 <vprintfmt+0x67>
ffffffffc0200ab0:	4c 89 fb             	mov    %r15,%rbx
ffffffffc0200ab3:	c6 45 bf 30          	movb   $0x30,-0x41(%rbp)
ffffffffc0200ab7:	eb c8                	jmp    ffffffffc0200a81 <vprintfmt+0x67>
ffffffffc0200ab9:	0f b6 d2             	movzbl %dl,%edx
ffffffffc0200abc:	4c 89 fb             	mov    %r15,%rbx
ffffffffc0200abf:	41 be 00 00 00 00    	mov    $0x0,%r14d
ffffffffc0200ac5:	43 8d 04 b6          	lea    (%r14,%r14,4),%eax
ffffffffc0200ac9:	44 8d 74 42 d0       	lea    -0x30(%rdx,%rax,2),%r14d
ffffffffc0200ace:	0f be 13             	movsbl (%rbx),%edx
ffffffffc0200ad1:	8d 42 d0             	lea    -0x30(%rdx),%eax
ffffffffc0200ad4:	83 f8 09             	cmp    $0x9,%eax
ffffffffc0200ad7:	77 22                	ja     ffffffffc0200afb <vprintfmt+0xe1>
ffffffffc0200ad9:	48 83 c3 01          	add    $0x1,%rbx
ffffffffc0200add:	eb e6                	jmp    ffffffffc0200ac5 <vprintfmt+0xab>
ffffffffc0200adf:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
ffffffffc0200ae3:	8b 06                	mov    (%rsi),%eax
ffffffffc0200ae5:	83 f8 2f             	cmp    $0x2f,%eax
ffffffffc0200ae8:	77 26                	ja     ffffffffc0200b10 <vprintfmt+0xf6>
ffffffffc0200aea:	89 c2                	mov    %eax,%edx
ffffffffc0200aec:	48 03 56 10          	add    0x10(%rsi),%rdx
ffffffffc0200af0:	83 c0 08             	add    $0x8,%eax
ffffffffc0200af3:	89 06                	mov    %eax,(%rsi)
ffffffffc0200af5:	44 8b 32             	mov    (%rdx),%r14d
ffffffffc0200af8:	4c 89 fb             	mov    %r15,%rbx
ffffffffc0200afb:	83 7d c8 00          	cmpl   $0x0,-0x38(%rbp)
ffffffffc0200aff:	79 80                	jns    ffffffffc0200a81 <vprintfmt+0x67>
ffffffffc0200b01:	44 89 75 c8          	mov    %r14d,-0x38(%rbp)
ffffffffc0200b05:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
ffffffffc0200b0b:	e9 71 ff ff ff       	jmp    ffffffffc0200a81 <vprintfmt+0x67>
ffffffffc0200b10:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
ffffffffc0200b14:	48 8b 56 08          	mov    0x8(%rsi),%rdx
ffffffffc0200b18:	48 8d 42 08          	lea    0x8(%rdx),%rax
ffffffffc0200b1c:	48 89 46 08          	mov    %rax,0x8(%rsi)
ffffffffc0200b20:	eb d3                	jmp    ffffffffc0200af5 <vprintfmt+0xdb>
ffffffffc0200b22:	8b 55 c8             	mov    -0x38(%rbp),%edx
ffffffffc0200b25:	85 d2                	test   %edx,%edx
ffffffffc0200b27:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc0200b2c:	0f 49 c2             	cmovns %edx,%eax
ffffffffc0200b2f:	89 45 c8             	mov    %eax,-0x38(%rbp)
ffffffffc0200b32:	4c 89 fb             	mov    %r15,%rbx
ffffffffc0200b35:	e9 47 ff ff ff       	jmp    ffffffffc0200a81 <vprintfmt+0x67>
ffffffffc0200b3a:	4c 89 fb             	mov    %r15,%rbx
ffffffffc0200b3d:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%rbp)
ffffffffc0200b44:	e9 38 ff ff ff       	jmp    ffffffffc0200a81 <vprintfmt+0x67>
ffffffffc0200b49:	83 c1 01             	add    $0x1,%ecx
ffffffffc0200b4c:	4c 89 fb             	mov    %r15,%rbx
ffffffffc0200b4f:	e9 2d ff ff ff       	jmp    ffffffffc0200a81 <vprintfmt+0x67>
ffffffffc0200b54:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200b58:	8b 01                	mov    (%rcx),%eax
ffffffffc0200b5a:	83 f8 2f             	cmp    $0x2f,%eax
ffffffffc0200b5d:	77 18                	ja     ffffffffc0200b77 <vprintfmt+0x15d>
ffffffffc0200b5f:	89 c2                	mov    %eax,%edx
ffffffffc0200b61:	48 03 51 10          	add    0x10(%rcx),%rdx
ffffffffc0200b65:	83 c0 08             	add    $0x8,%eax
ffffffffc0200b68:	89 01                	mov    %eax,(%rcx)
ffffffffc0200b6a:	8b 3a                	mov    (%rdx),%edi
ffffffffc0200b6c:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200b6f:	41 ff d5             	call   *%r13
ffffffffc0200b72:	e9 56 03 00 00       	jmp    ffffffffc0200ecd <vprintfmt+0x4b3>
ffffffffc0200b77:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200b7b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
ffffffffc0200b7f:	48 8d 42 08          	lea    0x8(%rdx),%rax
ffffffffc0200b83:	48 89 41 08          	mov    %rax,0x8(%rcx)
ffffffffc0200b87:	eb e1                	jmp    ffffffffc0200b6a <vprintfmt+0x150>
ffffffffc0200b89:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200b8d:	8b 01                	mov    (%rcx),%eax
ffffffffc0200b8f:	83 f8 2f             	cmp    $0x2f,%eax
ffffffffc0200b92:	77 4b                	ja     ffffffffc0200bdf <vprintfmt+0x1c5>
ffffffffc0200b94:	89 c2                	mov    %eax,%edx
ffffffffc0200b96:	48 03 51 10          	add    0x10(%rcx),%rdx
ffffffffc0200b9a:	83 c0 08             	add    $0x8,%eax
ffffffffc0200b9d:	89 01                	mov    %eax,(%rcx)
ffffffffc0200b9f:	8b 02                	mov    (%rdx),%eax
ffffffffc0200ba1:	89 c1                	mov    %eax,%ecx
ffffffffc0200ba3:	f7 d9                	neg    %ecx
ffffffffc0200ba5:	0f 48 c8             	cmovs  %eax,%ecx
ffffffffc0200ba8:	83 f9 06             	cmp    $0x6,%ecx
ffffffffc0200bab:	7f 44                	jg     ffffffffc0200bf1 <vprintfmt+0x1d7>
ffffffffc0200bad:	48 63 c1             	movslq %ecx,%rax
ffffffffc0200bb0:	48 8d 15 69 97 00 00 	lea    0x9769(%rip),%rdx        # ffffffffc020a320 <error_string>
ffffffffc0200bb7:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
ffffffffc0200bbb:	48 85 c0             	test   %rax,%rax
ffffffffc0200bbe:	74 31                	je     ffffffffc0200bf1 <vprintfmt+0x1d7>
ffffffffc0200bc0:	48 89 c1             	mov    %rax,%rcx
ffffffffc0200bc3:	48 8d 15 a8 0b 00 00 	lea    0xba8(%rip),%rdx        # ffffffffc0201772 <user_data+0x32>
ffffffffc0200bca:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200bcd:	4c 89 ef             	mov    %r13,%rdi
ffffffffc0200bd0:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc0200bd5:	e8 bd fd ff ff       	call   ffffffffc0200997 <printfmt>
ffffffffc0200bda:	e9 ee 02 00 00       	jmp    ffffffffc0200ecd <vprintfmt+0x4b3>
ffffffffc0200bdf:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200be3:	48 8b 51 08          	mov    0x8(%rcx),%rdx
ffffffffc0200be7:	48 8d 42 08          	lea    0x8(%rdx),%rax
ffffffffc0200beb:	48 89 41 08          	mov    %rax,0x8(%rcx)
ffffffffc0200bef:	eb ae                	jmp    ffffffffc0200b9f <vprintfmt+0x185>
ffffffffc0200bf1:	48 8d 15 71 0b 00 00 	lea    0xb71(%rip),%rdx        # ffffffffc0201769 <user_data+0x29>
ffffffffc0200bf8:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200bfb:	4c 89 ef             	mov    %r13,%rdi
ffffffffc0200bfe:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc0200c03:	e8 8f fd ff ff       	call   ffffffffc0200997 <printfmt>
ffffffffc0200c08:	e9 c0 02 00 00       	jmp    ffffffffc0200ecd <vprintfmt+0x4b3>
ffffffffc0200c0d:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200c11:	8b 01                	mov    (%rcx),%eax
ffffffffc0200c13:	83 f8 2f             	cmp    $0x2f,%eax
ffffffffc0200c16:	77 32                	ja     ffffffffc0200c4a <vprintfmt+0x230>
ffffffffc0200c18:	89 c2                	mov    %eax,%edx
ffffffffc0200c1a:	48 03 51 10          	add    0x10(%rcx),%rdx
ffffffffc0200c1e:	83 c0 08             	add    $0x8,%eax
ffffffffc0200c21:	89 01                	mov    %eax,(%rcx)
ffffffffc0200c23:	48 8b 0a             	mov    (%rdx),%rcx
ffffffffc0200c26:	48 85 c9             	test   %rcx,%rcx
ffffffffc0200c29:	48 8d 05 32 0b 00 00 	lea    0xb32(%rip),%rax        # ffffffffc0201762 <user_data+0x22>
ffffffffc0200c30:	48 0f 45 c1          	cmovne %rcx,%rax
ffffffffc0200c34:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffffffffc0200c38:	83 7d c8 00          	cmpl   $0x0,-0x38(%rbp)
ffffffffc0200c3c:	7e 06                	jle    ffffffffc0200c44 <vprintfmt+0x22a>
ffffffffc0200c3e:	80 7d bf 2d          	cmpb   $0x2d,-0x41(%rbp)
ffffffffc0200c42:	75 18                	jne    ffffffffc0200c5c <vprintfmt+0x242>
ffffffffc0200c44:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
ffffffffc0200c48:	eb 5e                	jmp    ffffffffc0200ca8 <vprintfmt+0x28e>
ffffffffc0200c4a:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200c4e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
ffffffffc0200c52:	48 8d 42 08          	lea    0x8(%rdx),%rax
ffffffffc0200c56:	48 89 41 08          	mov    %rax,0x8(%rcx)
ffffffffc0200c5a:	eb c7                	jmp    ffffffffc0200c23 <vprintfmt+0x209>
ffffffffc0200c5c:	44 89 f6             	mov    %r14d,%esi
ffffffffc0200c5f:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
ffffffffc0200c63:	e8 2c 05 00 00       	call   ffffffffc0201194 <strnlen>
ffffffffc0200c68:	8b 4d c8             	mov    -0x38(%rbp),%ecx
ffffffffc0200c6b:	29 c1                	sub    %eax,%ecx
ffffffffc0200c6d:	89 4d b8             	mov    %ecx,-0x48(%rbp)
ffffffffc0200c70:	89 cb                	mov    %ecx,%ebx
ffffffffc0200c72:	0f be 45 bf          	movsbl -0x41(%rbp),%eax
ffffffffc0200c76:	89 45 c8             	mov    %eax,-0x38(%rbp)
ffffffffc0200c79:	eb 0c                	jmp    ffffffffc0200c87 <vprintfmt+0x26d>
ffffffffc0200c7b:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200c7e:	8b 7d c8             	mov    -0x38(%rbp),%edi
ffffffffc0200c81:	41 ff d5             	call   *%r13
ffffffffc0200c84:	83 eb 01             	sub    $0x1,%ebx
ffffffffc0200c87:	85 db                	test   %ebx,%ebx
ffffffffc0200c89:	7f f0                	jg     ffffffffc0200c7b <vprintfmt+0x261>
ffffffffc0200c8b:	8b 4d b8             	mov    -0x48(%rbp),%ecx
ffffffffc0200c8e:	85 c9                	test   %ecx,%ecx
ffffffffc0200c90:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc0200c95:	0f 49 c1             	cmovns %ecx,%eax
ffffffffc0200c98:	29 c1                	sub    %eax,%ecx
ffffffffc0200c9a:	89 4d c8             	mov    %ecx,-0x38(%rbp)
ffffffffc0200c9d:	eb a5                	jmp    ffffffffc0200c44 <vprintfmt+0x22a>
ffffffffc0200c9f:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200ca2:	41 ff d5             	call   *%r13
ffffffffc0200ca5:	48 89 da             	mov    %rbx,%rdx
ffffffffc0200ca8:	48 8d 5a 01          	lea    0x1(%rdx),%rbx
ffffffffc0200cac:	0f b6 43 ff          	movzbl -0x1(%rbx),%eax
ffffffffc0200cb0:	0f be f8             	movsbl %al,%edi
ffffffffc0200cb3:	85 ff                	test   %edi,%edi
ffffffffc0200cb5:	74 29                	je     ffffffffc0200ce0 <vprintfmt+0x2c6>
ffffffffc0200cb7:	45 85 f6             	test   %r14d,%r14d
ffffffffc0200cba:	78 06                	js     ffffffffc0200cc2 <vprintfmt+0x2a8>
ffffffffc0200cbc:	41 83 ee 01          	sub    $0x1,%r14d
ffffffffc0200cc0:	78 1e                	js     ffffffffc0200ce0 <vprintfmt+0x2c6>
ffffffffc0200cc2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
ffffffffc0200cc6:	74 d7                	je     ffffffffc0200c9f <vprintfmt+0x285>
ffffffffc0200cc8:	0f be c0             	movsbl %al,%eax
ffffffffc0200ccb:	83 e8 20             	sub    $0x20,%eax
ffffffffc0200cce:	83 f8 5e             	cmp    $0x5e,%eax
ffffffffc0200cd1:	76 cc                	jbe    ffffffffc0200c9f <vprintfmt+0x285>
ffffffffc0200cd3:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200cd6:	bf 3f 00 00 00       	mov    $0x3f,%edi
ffffffffc0200cdb:	41 ff d5             	call   *%r13
ffffffffc0200cde:	eb c5                	jmp    ffffffffc0200ca5 <vprintfmt+0x28b>
ffffffffc0200ce0:	8b 5d c8             	mov    -0x38(%rbp),%ebx
ffffffffc0200ce3:	8b 45 b0             	mov    -0x50(%rbp),%eax
ffffffffc0200ce6:	01 c3                	add    %eax,%ebx
ffffffffc0200ce8:	29 d3                	sub    %edx,%ebx
ffffffffc0200cea:	eb 0e                	jmp    ffffffffc0200cfa <vprintfmt+0x2e0>
ffffffffc0200cec:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200cef:	bf 20 00 00 00       	mov    $0x20,%edi
ffffffffc0200cf4:	41 ff d5             	call   *%r13
ffffffffc0200cf7:	83 eb 01             	sub    $0x1,%ebx
ffffffffc0200cfa:	85 db                	test   %ebx,%ebx
ffffffffc0200cfc:	7f ee                	jg     ffffffffc0200cec <vprintfmt+0x2d2>
ffffffffc0200cfe:	e9 ca 01 00 00       	jmp    ffffffffc0200ecd <vprintfmt+0x4b3>
ffffffffc0200d03:	83 f9 01             	cmp    $0x1,%ecx
ffffffffc0200d06:	7f 1f                	jg     ffffffffc0200d27 <vprintfmt+0x30d>
ffffffffc0200d08:	85 c9                	test   %ecx,%ecx
ffffffffc0200d0a:	74 6a                	je     ffffffffc0200d76 <vprintfmt+0x35c>
ffffffffc0200d0c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200d10:	8b 11                	mov    (%rcx),%edx
ffffffffc0200d12:	83 fa 2f             	cmp    $0x2f,%edx
ffffffffc0200d15:	77 4d                	ja     ffffffffc0200d64 <vprintfmt+0x34a>
ffffffffc0200d17:	89 d0                	mov    %edx,%eax
ffffffffc0200d19:	48 03 41 10          	add    0x10(%rcx),%rax
ffffffffc0200d1d:	83 c2 08             	add    $0x8,%edx
ffffffffc0200d20:	89 11                	mov    %edx,(%rcx)
ffffffffc0200d22:	48 8b 18             	mov    (%rax),%rbx
ffffffffc0200d25:	eb 19                	jmp    ffffffffc0200d40 <vprintfmt+0x326>
ffffffffc0200d27:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200d2b:	8b 01                	mov    (%rcx),%eax
ffffffffc0200d2d:	83 f8 2f             	cmp    $0x2f,%eax
ffffffffc0200d30:	77 20                	ja     ffffffffc0200d52 <vprintfmt+0x338>
ffffffffc0200d32:	89 c2                	mov    %eax,%edx
ffffffffc0200d34:	48 03 51 10          	add    0x10(%rcx),%rdx
ffffffffc0200d38:	83 c0 08             	add    $0x8,%eax
ffffffffc0200d3b:	89 01                	mov    %eax,(%rcx)
ffffffffc0200d3d:	48 8b 1a             	mov    (%rdx),%rbx
ffffffffc0200d40:	48 85 db             	test   %rbx,%rbx
ffffffffc0200d43:	78 5e                	js     ffffffffc0200da3 <vprintfmt+0x389>
ffffffffc0200d45:	48 89 da             	mov    %rbx,%rdx
ffffffffc0200d48:	b9 0a 00 00 00       	mov    $0xa,%ecx
ffffffffc0200d4d:	e9 67 01 00 00       	jmp    ffffffffc0200eb9 <vprintfmt+0x49f>
ffffffffc0200d52:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200d56:	48 8b 51 08          	mov    0x8(%rcx),%rdx
ffffffffc0200d5a:	48 8d 42 08          	lea    0x8(%rdx),%rax
ffffffffc0200d5e:	48 89 41 08          	mov    %rax,0x8(%rcx)
ffffffffc0200d62:	eb d9                	jmp    ffffffffc0200d3d <vprintfmt+0x323>
ffffffffc0200d64:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200d68:	48 8b 41 08          	mov    0x8(%rcx),%rax
ffffffffc0200d6c:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffffffc0200d70:	48 89 51 08          	mov    %rdx,0x8(%rcx)
ffffffffc0200d74:	eb ac                	jmp    ffffffffc0200d22 <vprintfmt+0x308>
ffffffffc0200d76:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200d7a:	8b 11                	mov    (%rcx),%edx
ffffffffc0200d7c:	83 fa 2f             	cmp    $0x2f,%edx
ffffffffc0200d7f:	77 10                	ja     ffffffffc0200d91 <vprintfmt+0x377>
ffffffffc0200d81:	89 d0                	mov    %edx,%eax
ffffffffc0200d83:	48 03 41 10          	add    0x10(%rcx),%rax
ffffffffc0200d87:	83 c2 08             	add    $0x8,%edx
ffffffffc0200d8a:	89 11                	mov    %edx,(%rcx)
ffffffffc0200d8c:	48 63 18             	movslq (%rax),%rbx
ffffffffc0200d8f:	eb af                	jmp    ffffffffc0200d40 <vprintfmt+0x326>
ffffffffc0200d91:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200d95:	48 8b 41 08          	mov    0x8(%rcx),%rax
ffffffffc0200d99:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffffffc0200d9d:	48 89 51 08          	mov    %rdx,0x8(%rcx)
ffffffffc0200da1:	eb e9                	jmp    ffffffffc0200d8c <vprintfmt+0x372>
ffffffffc0200da3:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200da6:	bf 2d 00 00 00       	mov    $0x2d,%edi
ffffffffc0200dab:	41 ff d5             	call   *%r13
ffffffffc0200dae:	48 89 da             	mov    %rbx,%rdx
ffffffffc0200db1:	48 f7 da             	neg    %rdx
ffffffffc0200db4:	b9 0a 00 00 00       	mov    $0xa,%ecx
ffffffffc0200db9:	e9 fb 00 00 00       	jmp    ffffffffc0200eb9 <vprintfmt+0x49f>
ffffffffc0200dbe:	83 f9 01             	cmp    $0x1,%ecx
ffffffffc0200dc1:	7f 27                	jg     ffffffffc0200dea <vprintfmt+0x3d0>
ffffffffc0200dc3:	85 c9                	test   %ecx,%ecx
ffffffffc0200dc5:	74 6a                	je     ffffffffc0200e31 <vprintfmt+0x417>
ffffffffc0200dc7:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200dcb:	8b 11                	mov    (%rcx),%edx
ffffffffc0200dcd:	83 fa 2f             	cmp    $0x2f,%edx
ffffffffc0200dd0:	77 4d                	ja     ffffffffc0200e1f <vprintfmt+0x405>
ffffffffc0200dd2:	89 d0                	mov    %edx,%eax
ffffffffc0200dd4:	48 03 41 10          	add    0x10(%rcx),%rax
ffffffffc0200dd8:	83 c2 08             	add    $0x8,%edx
ffffffffc0200ddb:	89 11                	mov    %edx,(%rcx)
ffffffffc0200ddd:	48 8b 10             	mov    (%rax),%rdx
ffffffffc0200de0:	b9 0a 00 00 00       	mov    $0xa,%ecx
ffffffffc0200de5:	e9 cf 00 00 00       	jmp    ffffffffc0200eb9 <vprintfmt+0x49f>
ffffffffc0200dea:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200dee:	8b 01                	mov    (%rcx),%eax
ffffffffc0200df0:	83 f8 2f             	cmp    $0x2f,%eax
ffffffffc0200df3:	77 18                	ja     ffffffffc0200e0d <vprintfmt+0x3f3>
ffffffffc0200df5:	89 c2                	mov    %eax,%edx
ffffffffc0200df7:	48 03 51 10          	add    0x10(%rcx),%rdx
ffffffffc0200dfb:	83 c0 08             	add    $0x8,%eax
ffffffffc0200dfe:	89 01                	mov    %eax,(%rcx)
ffffffffc0200e00:	48 8b 12             	mov    (%rdx),%rdx
ffffffffc0200e03:	b9 0a 00 00 00       	mov    $0xa,%ecx
ffffffffc0200e08:	e9 ac 00 00 00       	jmp    ffffffffc0200eb9 <vprintfmt+0x49f>
ffffffffc0200e0d:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200e11:	48 8b 51 08          	mov    0x8(%rcx),%rdx
ffffffffc0200e15:	48 8d 42 08          	lea    0x8(%rdx),%rax
ffffffffc0200e19:	48 89 41 08          	mov    %rax,0x8(%rcx)
ffffffffc0200e1d:	eb e1                	jmp    ffffffffc0200e00 <vprintfmt+0x3e6>
ffffffffc0200e1f:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200e23:	48 8b 41 08          	mov    0x8(%rcx),%rax
ffffffffc0200e27:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffffffc0200e2b:	48 89 51 08          	mov    %rdx,0x8(%rcx)
ffffffffc0200e2f:	eb ac                	jmp    ffffffffc0200ddd <vprintfmt+0x3c3>
ffffffffc0200e31:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200e35:	8b 11                	mov    (%rcx),%edx
ffffffffc0200e37:	83 fa 2f             	cmp    $0x2f,%edx
ffffffffc0200e3a:	77 14                	ja     ffffffffc0200e50 <vprintfmt+0x436>
ffffffffc0200e3c:	89 d0                	mov    %edx,%eax
ffffffffc0200e3e:	48 03 41 10          	add    0x10(%rcx),%rax
ffffffffc0200e42:	83 c2 08             	add    $0x8,%edx
ffffffffc0200e45:	89 11                	mov    %edx,(%rcx)
ffffffffc0200e47:	8b 10                	mov    (%rax),%edx
ffffffffc0200e49:	b9 0a 00 00 00       	mov    $0xa,%ecx
ffffffffc0200e4e:	eb 69                	jmp    ffffffffc0200eb9 <vprintfmt+0x49f>
ffffffffc0200e50:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200e54:	48 8b 41 08          	mov    0x8(%rcx),%rax
ffffffffc0200e58:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffffffc0200e5c:	48 89 51 08          	mov    %rdx,0x8(%rcx)
ffffffffc0200e60:	eb e5                	jmp    ffffffffc0200e47 <vprintfmt+0x42d>
ffffffffc0200e62:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200e65:	bf 58 00 00 00       	mov    $0x58,%edi
ffffffffc0200e6a:	41 ff d5             	call   *%r13
ffffffffc0200e6d:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200e70:	bf 58 00 00 00       	mov    $0x58,%edi
ffffffffc0200e75:	41 ff d5             	call   *%r13
ffffffffc0200e78:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200e7b:	bf 58 00 00 00       	mov    $0x58,%edi
ffffffffc0200e80:	41 ff d5             	call   *%r13
ffffffffc0200e83:	eb 48                	jmp    ffffffffc0200ecd <vprintfmt+0x4b3>
ffffffffc0200e85:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200e88:	bf 30 00 00 00       	mov    $0x30,%edi
ffffffffc0200e8d:	41 ff d5             	call   *%r13
ffffffffc0200e90:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200e93:	bf 78 00 00 00       	mov    $0x78,%edi
ffffffffc0200e98:	41 ff d5             	call   *%r13
ffffffffc0200e9b:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200e9f:	8b 01                	mov    (%rcx),%eax
ffffffffc0200ea1:	83 f8 2f             	cmp    $0x2f,%eax
ffffffffc0200ea4:	77 2f                	ja     ffffffffc0200ed5 <vprintfmt+0x4bb>
ffffffffc0200ea6:	89 c2                	mov    %eax,%edx
ffffffffc0200ea8:	48 03 51 10          	add    0x10(%rcx),%rdx
ffffffffc0200eac:	83 c0 08             	add    $0x8,%eax
ffffffffc0200eaf:	89 01                	mov    %eax,(%rcx)
ffffffffc0200eb1:	48 8b 12             	mov    (%rdx),%rdx
ffffffffc0200eb4:	b9 10 00 00 00       	mov    $0x10,%ecx
ffffffffc0200eb9:	44 0f be 4d bf       	movsbl -0x41(%rbp),%r9d
ffffffffc0200ebe:	44 8b 45 c8          	mov    -0x38(%rbp),%r8d
ffffffffc0200ec2:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200ec5:	4c 89 ef             	mov    %r13,%rdi
ffffffffc0200ec8:	e8 30 fa ff ff       	call   ffffffffc02008fd <printnum>
ffffffffc0200ecd:	4c 89 fb             	mov    %r15,%rbx
ffffffffc0200ed0:	e9 6f fb ff ff       	jmp    ffffffffc0200a44 <vprintfmt+0x2a>
ffffffffc0200ed5:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200ed9:	48 8b 51 08          	mov    0x8(%rcx),%rdx
ffffffffc0200edd:	48 8d 42 08          	lea    0x8(%rdx),%rax
ffffffffc0200ee1:	48 89 41 08          	mov    %rax,0x8(%rcx)
ffffffffc0200ee5:	eb ca                	jmp    ffffffffc0200eb1 <vprintfmt+0x497>
ffffffffc0200ee7:	83 f9 01             	cmp    $0x1,%ecx
ffffffffc0200eea:	7f 24                	jg     ffffffffc0200f10 <vprintfmt+0x4f6>
ffffffffc0200eec:	85 c9                	test   %ecx,%ecx
ffffffffc0200eee:	74 64                	je     ffffffffc0200f54 <vprintfmt+0x53a>
ffffffffc0200ef0:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200ef4:	8b 11                	mov    (%rcx),%edx
ffffffffc0200ef6:	83 fa 2f             	cmp    $0x2f,%edx
ffffffffc0200ef9:	77 47                	ja     ffffffffc0200f42 <vprintfmt+0x528>
ffffffffc0200efb:	89 d0                	mov    %edx,%eax
ffffffffc0200efd:	48 03 41 10          	add    0x10(%rcx),%rax
ffffffffc0200f01:	83 c2 08             	add    $0x8,%edx
ffffffffc0200f04:	89 11                	mov    %edx,(%rcx)
ffffffffc0200f06:	48 8b 10             	mov    (%rax),%rdx
ffffffffc0200f09:	b9 10 00 00 00       	mov    $0x10,%ecx
ffffffffc0200f0e:	eb a9                	jmp    ffffffffc0200eb9 <vprintfmt+0x49f>
ffffffffc0200f10:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200f14:	8b 01                	mov    (%rcx),%eax
ffffffffc0200f16:	83 f8 2f             	cmp    $0x2f,%eax
ffffffffc0200f19:	77 15                	ja     ffffffffc0200f30 <vprintfmt+0x516>
ffffffffc0200f1b:	89 c2                	mov    %eax,%edx
ffffffffc0200f1d:	48 03 51 10          	add    0x10(%rcx),%rdx
ffffffffc0200f21:	83 c0 08             	add    $0x8,%eax
ffffffffc0200f24:	89 01                	mov    %eax,(%rcx)
ffffffffc0200f26:	48 8b 12             	mov    (%rdx),%rdx
ffffffffc0200f29:	b9 10 00 00 00       	mov    $0x10,%ecx
ffffffffc0200f2e:	eb 89                	jmp    ffffffffc0200eb9 <vprintfmt+0x49f>
ffffffffc0200f30:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200f34:	48 8b 51 08          	mov    0x8(%rcx),%rdx
ffffffffc0200f38:	48 8d 42 08          	lea    0x8(%rdx),%rax
ffffffffc0200f3c:	48 89 41 08          	mov    %rax,0x8(%rcx)
ffffffffc0200f40:	eb e4                	jmp    ffffffffc0200f26 <vprintfmt+0x50c>
ffffffffc0200f42:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200f46:	48 8b 41 08          	mov    0x8(%rcx),%rax
ffffffffc0200f4a:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffffffc0200f4e:	48 89 51 08          	mov    %rdx,0x8(%rcx)
ffffffffc0200f52:	eb b2                	jmp    ffffffffc0200f06 <vprintfmt+0x4ec>
ffffffffc0200f54:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200f58:	8b 11                	mov    (%rcx),%edx
ffffffffc0200f5a:	83 fa 2f             	cmp    $0x2f,%edx
ffffffffc0200f5d:	77 17                	ja     ffffffffc0200f76 <vprintfmt+0x55c>
ffffffffc0200f5f:	89 d0                	mov    %edx,%eax
ffffffffc0200f61:	48 03 41 10          	add    0x10(%rcx),%rax
ffffffffc0200f65:	83 c2 08             	add    $0x8,%edx
ffffffffc0200f68:	89 11                	mov    %edx,(%rcx)
ffffffffc0200f6a:	8b 10                	mov    (%rax),%edx
ffffffffc0200f6c:	b9 10 00 00 00       	mov    $0x10,%ecx
ffffffffc0200f71:	e9 43 ff ff ff       	jmp    ffffffffc0200eb9 <vprintfmt+0x49f>
ffffffffc0200f76:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
ffffffffc0200f7a:	48 8b 41 08          	mov    0x8(%rcx),%rax
ffffffffc0200f7e:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffffffc0200f82:	48 89 51 08          	mov    %rdx,0x8(%rcx)
ffffffffc0200f86:	eb e2                	jmp    ffffffffc0200f6a <vprintfmt+0x550>
ffffffffc0200f88:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200f8b:	bf 25 00 00 00       	mov    $0x25,%edi
ffffffffc0200f90:	41 ff d5             	call   *%r13
ffffffffc0200f93:	e9 35 ff ff ff       	jmp    ffffffffc0200ecd <vprintfmt+0x4b3>
ffffffffc0200f98:	4c 89 e6             	mov    %r12,%rsi
ffffffffc0200f9b:	bf 25 00 00 00       	mov    $0x25,%edi
ffffffffc0200fa0:	41 ff d5             	call   *%r13
ffffffffc0200fa3:	49 89 df             	mov    %rbx,%r15
ffffffffc0200fa6:	41 80 7f ff 25       	cmpb   $0x25,-0x1(%r15)
ffffffffc0200fab:	0f 84 1c ff ff ff    	je     ffffffffc0200ecd <vprintfmt+0x4b3>
ffffffffc0200fb1:	49 83 ef 01          	sub    $0x1,%r15
ffffffffc0200fb5:	eb ef                	jmp    ffffffffc0200fa6 <vprintfmt+0x58c>

ffffffffc0200fb7 <vsnprintf>:
ffffffffc0200fb7:	f3 0f 1e fa          	endbr64 
ffffffffc0200fbb:	55                   	push   %rbp
ffffffffc0200fbc:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0200fbf:	48 83 ec 20          	sub    $0x20,%rsp
ffffffffc0200fc3:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
ffffffffc0200fc7:	48 63 c6             	movslq %esi,%rax
ffffffffc0200fca:	48 8d 44 07 ff       	lea    -0x1(%rdi,%rax,1),%rax
ffffffffc0200fcf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffffffffc0200fd3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
ffffffffc0200fda:	48 85 ff             	test   %rdi,%rdi
ffffffffc0200fdd:	74 20                	je     ffffffffc0200fff <vsnprintf+0x48>
ffffffffc0200fdf:	85 f6                	test   %esi,%esi
ffffffffc0200fe1:	7e 1c                	jle    ffffffffc0200fff <vsnprintf+0x48>
ffffffffc0200fe3:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
ffffffffc0200fe7:	48 8d 3d 8d f9 ff ff 	lea    -0x673(%rip),%rdi        # ffffffffc020097b <sprintputch>
ffffffffc0200fee:	e8 27 fa ff ff       	call   ffffffffc0200a1a <vprintfmt>
ffffffffc0200ff3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffffffffc0200ff7:	c6 00 00             	movb   $0x0,(%rax)
ffffffffc0200ffa:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffffffffc0200ffd:	c9                   	leave  
ffffffffc0200ffe:	c3                   	ret    
ffffffffc0200fff:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
ffffffffc0201004:	eb f7                	jmp    ffffffffc0200ffd <vsnprintf+0x46>

ffffffffc0201006 <snprintf>:
ffffffffc0201006:	f3 0f 1e fa          	endbr64 
ffffffffc020100a:	55                   	push   %rbp
ffffffffc020100b:	48 89 e5             	mov    %rsp,%rbp
ffffffffc020100e:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
ffffffffc0201015:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
ffffffffc020101c:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
ffffffffc0201023:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
ffffffffc020102a:	84 c0                	test   %al,%al
ffffffffc020102c:	74 20                	je     ffffffffc020104e <snprintf+0x48>
ffffffffc020102e:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
ffffffffc0201032:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
ffffffffc0201036:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
ffffffffc020103a:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
ffffffffc020103e:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
ffffffffc0201042:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
ffffffffc0201046:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
ffffffffc020104a:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
ffffffffc020104e:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
ffffffffc0201055:	00 00 00 
ffffffffc0201058:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
ffffffffc020105f:	00 00 00 
ffffffffc0201062:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffffffffc0201066:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
ffffffffc020106d:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
ffffffffc0201074:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
ffffffffc020107b:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
ffffffffc0201082:	e8 30 ff ff ff       	call   ffffffffc0200fb7 <vsnprintf>
ffffffffc0201087:	c9                   	leave  
ffffffffc0201088:	c3                   	ret    

ffffffffc0201089 <readline>:
ffffffffc0201089:	f3 0f 1e fa          	endbr64 
ffffffffc020108d:	55                   	push   %rbp
ffffffffc020108e:	48 89 e5             	mov    %rsp,%rbp
ffffffffc0201091:	41 56                	push   %r14
ffffffffc0201093:	41 55                	push   %r13
ffffffffc0201095:	41 54                	push   %r12
ffffffffc0201097:	53                   	push   %rbx
ffffffffc0201098:	48 85 ff             	test   %rdi,%rdi
ffffffffc020109b:	74 14                	je     ffffffffc02010b1 <readline+0x28>
ffffffffc020109d:	48 89 fe             	mov    %rdi,%rsi
ffffffffc02010a0:	48 8d 3d cb 06 00 00 	lea    0x6cb(%rip),%rdi        # ffffffffc0201772 <user_data+0x32>
ffffffffc02010a7:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02010ac:	e8 9e f6 ff ff       	call   ffffffffc020074f <cprintf>
ffffffffc02010b1:	bf 00 00 00 00       	mov    $0x0,%edi
ffffffffc02010b6:	e8 4d f6 ff ff       	call   ffffffffc0200708 <iscons>
ffffffffc02010bb:	41 89 c5             	mov    %eax,%r13d
ffffffffc02010be:	41 bc 00 00 00 00    	mov    $0x0,%r12d
ffffffffc02010c4:	4c 8d 35 f5 94 00 00 	lea    0x94f5(%rip),%r14        # ffffffffc020a5c0 <buf>
ffffffffc02010cb:	eb 44                	jmp    ffffffffc0201111 <readline+0x88>
ffffffffc02010cd:	89 c6                	mov    %eax,%esi
ffffffffc02010cf:	48 8d 3d 62 08 00 00 	lea    0x862(%rip),%rdi        # ffffffffc0201938 <user_data+0x1f8>
ffffffffc02010d6:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02010db:	e8 6f f6 ff ff       	call   ffffffffc020074f <cprintf>
ffffffffc02010e0:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02010e5:	5b                   	pop    %rbx
ffffffffc02010e6:	41 5c                	pop    %r12
ffffffffc02010e8:	41 5d                	pop    %r13
ffffffffc02010ea:	41 5e                	pop    %r14
ffffffffc02010ec:	5d                   	pop    %rbp
ffffffffc02010ed:	c3                   	ret    
ffffffffc02010ee:	45 85 ed             	test   %r13d,%r13d
ffffffffc02010f1:	75 06                	jne    ffffffffc02010f9 <readline+0x70>
ffffffffc02010f3:	41 83 ec 01          	sub    $0x1,%r12d
ffffffffc02010f7:	eb 18                	jmp    ffffffffc0201111 <readline+0x88>
ffffffffc02010f9:	bf 08 00 00 00       	mov    $0x8,%edi
ffffffffc02010fe:	e8 e3 f5 ff ff       	call   ffffffffc02006e6 <cputchar>
ffffffffc0201103:	eb ee                	jmp    ffffffffc02010f3 <readline+0x6a>
ffffffffc0201105:	49 63 c4             	movslq %r12d,%rax
ffffffffc0201108:	41 88 1c 06          	mov    %bl,(%r14,%rax,1)
ffffffffc020110c:	45 8d 64 24 01       	lea    0x1(%r12),%r12d
ffffffffc0201111:	e8 df f5 ff ff       	call   ffffffffc02006f5 <getchar>
ffffffffc0201116:	89 c3                	mov    %eax,%ebx
ffffffffc0201118:	85 c0                	test   %eax,%eax
ffffffffc020111a:	78 b1                	js     ffffffffc02010cd <readline+0x44>
ffffffffc020111c:	83 f8 08             	cmp    $0x8,%eax
ffffffffc020111f:	0f 94 c0             	sete   %al
ffffffffc0201122:	83 fb 7f             	cmp    $0x7f,%ebx
ffffffffc0201125:	0f 94 c2             	sete   %dl
ffffffffc0201128:	08 d0                	or     %dl,%al
ffffffffc020112a:	74 05                	je     ffffffffc0201131 <readline+0xa8>
ffffffffc020112c:	45 85 e4             	test   %r12d,%r12d
ffffffffc020112f:	7f bd                	jg     ffffffffc02010ee <readline+0x65>
ffffffffc0201131:	83 fb 1f             	cmp    $0x1f,%ebx
ffffffffc0201134:	7e 17                	jle    ffffffffc020114d <readline+0xc4>
ffffffffc0201136:	41 81 fc fe 03 00 00 	cmp    $0x3fe,%r12d
ffffffffc020113d:	7f 0e                	jg     ffffffffc020114d <readline+0xc4>
ffffffffc020113f:	45 85 ed             	test   %r13d,%r13d
ffffffffc0201142:	74 c1                	je     ffffffffc0201105 <readline+0x7c>
ffffffffc0201144:	89 df                	mov    %ebx,%edi
ffffffffc0201146:	e8 9b f5 ff ff       	call   ffffffffc02006e6 <cputchar>
ffffffffc020114b:	eb b8                	jmp    ffffffffc0201105 <readline+0x7c>
ffffffffc020114d:	83 fb 0a             	cmp    $0xa,%ebx
ffffffffc0201150:	74 05                	je     ffffffffc0201157 <readline+0xce>
ffffffffc0201152:	83 fb 0d             	cmp    $0xd,%ebx
ffffffffc0201155:	75 ba                	jne    ffffffffc0201111 <readline+0x88>
ffffffffc0201157:	45 85 ed             	test   %r13d,%r13d
ffffffffc020115a:	75 14                	jne    ffffffffc0201170 <readline+0xe7>
ffffffffc020115c:	48 8d 05 5d 94 00 00 	lea    0x945d(%rip),%rax        # ffffffffc020a5c0 <buf>
ffffffffc0201163:	4d 63 e4             	movslq %r12d,%r12
ffffffffc0201166:	42 c6 04 20 00       	movb   $0x0,(%rax,%r12,1)
ffffffffc020116b:	e9 75 ff ff ff       	jmp    ffffffffc02010e5 <readline+0x5c>
ffffffffc0201170:	bf 0a 00 00 00       	mov    $0xa,%edi
ffffffffc0201175:	e8 6c f5 ff ff       	call   ffffffffc02006e6 <cputchar>
ffffffffc020117a:	eb e0                	jmp    ffffffffc020115c <readline+0xd3>

ffffffffc020117c <strlen>:
ffffffffc020117c:	f3 0f 1e fa          	endbr64 
ffffffffc0201180:	ba 00 00 00 00       	mov    $0x0,%edx
ffffffffc0201185:	48 89 d0             	mov    %rdx,%rax
ffffffffc0201188:	48 83 c2 01          	add    $0x1,%rdx
ffffffffc020118c:	80 7c 17 ff 00       	cmpb   $0x0,-0x1(%rdi,%rdx,1)
ffffffffc0201191:	75 f2                	jne    ffffffffc0201185 <strlen+0x9>
ffffffffc0201193:	c3                   	ret    

ffffffffc0201194 <strnlen>:
ffffffffc0201194:	f3 0f 1e fa          	endbr64 
ffffffffc0201198:	89 f6                	mov    %esi,%esi
ffffffffc020119a:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc020119f:	eb 03                	jmp    ffffffffc02011a4 <strnlen+0x10>
ffffffffc02011a1:	48 89 d0             	mov    %rdx,%rax
ffffffffc02011a4:	48 39 f0             	cmp    %rsi,%rax
ffffffffc02011a7:	74 0a                	je     ffffffffc02011b3 <strnlen+0x1f>
ffffffffc02011a9:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffffffffc02011ad:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
ffffffffc02011b1:	75 ee                	jne    ffffffffc02011a1 <strnlen+0xd>
ffffffffc02011b3:	c3                   	ret    

ffffffffc02011b4 <strcpy>:
ffffffffc02011b4:	f3 0f 1e fa          	endbr64 
ffffffffc02011b8:	48 89 f8             	mov    %rdi,%rax
ffffffffc02011bb:	ba 00 00 00 00       	mov    $0x0,%edx
ffffffffc02011c0:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
ffffffffc02011c4:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
ffffffffc02011c7:	48 83 c2 01          	add    $0x1,%rdx
ffffffffc02011cb:	84 c9                	test   %cl,%cl
ffffffffc02011cd:	75 f1                	jne    ffffffffc02011c0 <strcpy+0xc>
ffffffffc02011cf:	c3                   	ret    

ffffffffc02011d0 <strcat>:
ffffffffc02011d0:	f3 0f 1e fa          	endbr64 
ffffffffc02011d4:	55                   	push   %rbp
ffffffffc02011d5:	48 89 e5             	mov    %rsp,%rbp
ffffffffc02011d8:	41 54                	push   %r12
ffffffffc02011da:	53                   	push   %rbx
ffffffffc02011db:	48 89 fb             	mov    %rdi,%rbx
ffffffffc02011de:	49 89 f4             	mov    %rsi,%r12
ffffffffc02011e1:	e8 96 ff ff ff       	call   ffffffffc020117c <strlen>
ffffffffc02011e6:	48 63 f8             	movslq %eax,%rdi
ffffffffc02011e9:	48 01 df             	add    %rbx,%rdi
ffffffffc02011ec:	4c 89 e6             	mov    %r12,%rsi
ffffffffc02011ef:	e8 c0 ff ff ff       	call   ffffffffc02011b4 <strcpy>
ffffffffc02011f4:	48 89 d8             	mov    %rbx,%rax
ffffffffc02011f7:	5b                   	pop    %rbx
ffffffffc02011f8:	41 5c                	pop    %r12
ffffffffc02011fa:	5d                   	pop    %rbp
ffffffffc02011fb:	c3                   	ret    

ffffffffc02011fc <strncpy>:
ffffffffc02011fc:	f3 0f 1e fa          	endbr64 
ffffffffc0201200:	48 89 f8             	mov    %rdi,%rax
ffffffffc0201203:	89 d2                	mov    %edx,%edx
ffffffffc0201205:	48 01 fa             	add    %rdi,%rdx
ffffffffc0201208:	48 89 f9             	mov    %rdi,%rcx
ffffffffc020120b:	eb 14                	jmp    ffffffffc0201221 <strncpy+0x25>
ffffffffc020120d:	48 83 c1 01          	add    $0x1,%rcx
ffffffffc0201211:	44 0f b6 06          	movzbl (%rsi),%r8d
ffffffffc0201215:	44 88 41 ff          	mov    %r8b,-0x1(%rcx)
ffffffffc0201219:	41 80 f8 01          	cmp    $0x1,%r8b
ffffffffc020121d:	48 83 de ff          	sbb    $0xffffffffffffffff,%rsi
ffffffffc0201221:	48 39 d1             	cmp    %rdx,%rcx
ffffffffc0201224:	75 e7                	jne    ffffffffc020120d <strncpy+0x11>
ffffffffc0201226:	c3                   	ret    

ffffffffc0201227 <strlcpy>:
ffffffffc0201227:	f3 0f 1e fa          	endbr64 
ffffffffc020122b:	48 89 f8             	mov    %rdi,%rax
ffffffffc020122e:	85 d2                	test   %edx,%edx
ffffffffc0201230:	74 28                	je     ffffffffc020125a <strlcpy+0x33>
ffffffffc0201232:	8d 42 ff             	lea    -0x1(%rdx),%eax
ffffffffc0201235:	48 01 f8             	add    %rdi,%rax
ffffffffc0201238:	48 89 fa             	mov    %rdi,%rdx
ffffffffc020123b:	eb 0b                	jmp    ffffffffc0201248 <strlcpy+0x21>
ffffffffc020123d:	48 83 c6 01          	add    $0x1,%rsi
ffffffffc0201241:	48 83 c2 01          	add    $0x1,%rdx
ffffffffc0201245:	88 4a ff             	mov    %cl,-0x1(%rdx)
ffffffffc0201248:	48 39 c2             	cmp    %rax,%rdx
ffffffffc020124b:	74 0a                	je     ffffffffc0201257 <strlcpy+0x30>
ffffffffc020124d:	0f b6 0e             	movzbl (%rsi),%ecx
ffffffffc0201250:	84 c9                	test   %cl,%cl
ffffffffc0201252:	75 e9                	jne    ffffffffc020123d <strlcpy+0x16>
ffffffffc0201254:	48 89 d0             	mov    %rdx,%rax
ffffffffc0201257:	c6 00 00             	movb   $0x0,(%rax)
ffffffffc020125a:	29 f8                	sub    %edi,%eax
ffffffffc020125c:	c3                   	ret    

ffffffffc020125d <strcmp>:
ffffffffc020125d:	f3 0f 1e fa          	endbr64 
ffffffffc0201261:	eb 08                	jmp    ffffffffc020126b <strcmp+0xe>
ffffffffc0201263:	48 83 c7 01          	add    $0x1,%rdi
ffffffffc0201267:	48 83 c6 01          	add    $0x1,%rsi
ffffffffc020126b:	0f b6 07             	movzbl (%rdi),%eax
ffffffffc020126e:	84 c0                	test   %al,%al
ffffffffc0201270:	74 04                	je     ffffffffc0201276 <strcmp+0x19>
ffffffffc0201272:	3a 06                	cmp    (%rsi),%al
ffffffffc0201274:	74 ed                	je     ffffffffc0201263 <strcmp+0x6>
ffffffffc0201276:	0f b6 c0             	movzbl %al,%eax
ffffffffc0201279:	0f b6 16             	movzbl (%rsi),%edx
ffffffffc020127c:	29 d0                	sub    %edx,%eax
ffffffffc020127e:	c3                   	ret    

ffffffffc020127f <strncmp>:
ffffffffc020127f:	f3 0f 1e fa          	endbr64 
ffffffffc0201283:	eb 0b                	jmp    ffffffffc0201290 <strncmp+0x11>
ffffffffc0201285:	83 ea 01             	sub    $0x1,%edx
ffffffffc0201288:	48 83 c7 01          	add    $0x1,%rdi
ffffffffc020128c:	48 83 c6 01          	add    $0x1,%rsi
ffffffffc0201290:	85 d2                	test   %edx,%edx
ffffffffc0201292:	74 14                	je     ffffffffc02012a8 <strncmp+0x29>
ffffffffc0201294:	0f b6 07             	movzbl (%rdi),%eax
ffffffffc0201297:	84 c0                	test   %al,%al
ffffffffc0201299:	74 04                	je     ffffffffc020129f <strncmp+0x20>
ffffffffc020129b:	3a 06                	cmp    (%rsi),%al
ffffffffc020129d:	74 e6                	je     ffffffffc0201285 <strncmp+0x6>
ffffffffc020129f:	0f b6 07             	movzbl (%rdi),%eax
ffffffffc02012a2:	0f b6 16             	movzbl (%rsi),%edx
ffffffffc02012a5:	29 d0                	sub    %edx,%eax
ffffffffc02012a7:	c3                   	ret    
ffffffffc02012a8:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02012ad:	c3                   	ret    

ffffffffc02012ae <strchr>:
ffffffffc02012ae:	f3 0f 1e fa          	endbr64 
ffffffffc02012b2:	eb 04                	jmp    ffffffffc02012b8 <strchr+0xa>
ffffffffc02012b4:	48 83 c7 01          	add    $0x1,%rdi
ffffffffc02012b8:	0f b6 07             	movzbl (%rdi),%eax
ffffffffc02012bb:	84 c0                	test   %al,%al
ffffffffc02012bd:	74 09                	je     ffffffffc02012c8 <strchr+0x1a>
ffffffffc02012bf:	40 38 f0             	cmp    %sil,%al
ffffffffc02012c2:	75 f0                	jne    ffffffffc02012b4 <strchr+0x6>
ffffffffc02012c4:	48 89 f8             	mov    %rdi,%rax
ffffffffc02012c7:	c3                   	ret    
ffffffffc02012c8:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02012cd:	c3                   	ret    

ffffffffc02012ce <strfind>:
ffffffffc02012ce:	f3 0f 1e fa          	endbr64 
ffffffffc02012d2:	48 89 f8             	mov    %rdi,%rax
ffffffffc02012d5:	0f b6 10             	movzbl (%rax),%edx
ffffffffc02012d8:	40 38 f2             	cmp    %sil,%dl
ffffffffc02012db:	74 0a                	je     ffffffffc02012e7 <strfind+0x19>
ffffffffc02012dd:	84 d2                	test   %dl,%dl
ffffffffc02012df:	74 06                	je     ffffffffc02012e7 <strfind+0x19>
ffffffffc02012e1:	48 83 c0 01          	add    $0x1,%rax
ffffffffc02012e5:	eb ee                	jmp    ffffffffc02012d5 <strfind+0x7>
ffffffffc02012e7:	c3                   	ret    

ffffffffc02012e8 <memset>:
ffffffffc02012e8:	f3 0f 1e fa          	endbr64 
ffffffffc02012ec:	85 d2                	test   %edx,%edx
ffffffffc02012ee:	74 26                	je     ffffffffc0201316 <memset+0x2e>
ffffffffc02012f0:	40 f6 c7 03          	test   $0x3,%dil
ffffffffc02012f4:	75 19                	jne    ffffffffc020130f <memset+0x27>
ffffffffc02012f6:	f6 c2 03             	test   $0x3,%dl
ffffffffc02012f9:	75 14                	jne    ffffffffc020130f <memset+0x27>
ffffffffc02012fb:	40 0f b6 f6          	movzbl %sil,%esi
ffffffffc02012ff:	69 c6 01 01 01 01    	imul   $0x1010101,%esi,%eax
ffffffffc0201305:	89 d1                	mov    %edx,%ecx
ffffffffc0201307:	c1 e9 02             	shr    $0x2,%ecx
ffffffffc020130a:	fc                   	cld    
ffffffffc020130b:	f3 ab                	rep stos %eax,%es:(%rdi)
ffffffffc020130d:	eb 07                	jmp    ffffffffc0201316 <memset+0x2e>
ffffffffc020130f:	89 f0                	mov    %esi,%eax
ffffffffc0201311:	89 d1                	mov    %edx,%ecx
ffffffffc0201313:	fc                   	cld    
ffffffffc0201314:	f3 aa                	rep stos %al,%es:(%rdi)
ffffffffc0201316:	48 89 f8             	mov    %rdi,%rax
ffffffffc0201319:	c3                   	ret    

ffffffffc020131a <memmove>:
ffffffffc020131a:	f3 0f 1e fa          	endbr64 
ffffffffc020131e:	48 89 f8             	mov    %rdi,%rax
ffffffffc0201321:	89 d1                	mov    %edx,%ecx
ffffffffc0201323:	48 39 fe             	cmp    %rdi,%rsi
ffffffffc0201326:	73 3c                	jae    ffffffffc0201364 <memmove+0x4a>
ffffffffc0201328:	89 d7                	mov    %edx,%edi
ffffffffc020132a:	48 8d 14 3e          	lea    (%rsi,%rdi,1),%rdx
ffffffffc020132e:	48 39 d0             	cmp    %rdx,%rax
ffffffffc0201331:	73 31                	jae    ffffffffc0201364 <memmove+0x4a>
ffffffffc0201333:	48 01 c7             	add    %rax,%rdi
ffffffffc0201336:	48 89 d6             	mov    %rdx,%rsi
ffffffffc0201339:	48 09 fe             	or     %rdi,%rsi
ffffffffc020133c:	40 f6 c6 03          	test   $0x3,%sil
ffffffffc0201340:	74 0d                	je     ffffffffc020134f <memmove+0x35>
ffffffffc0201342:	48 83 ef 01          	sub    $0x1,%rdi
ffffffffc0201346:	48 8d 72 ff          	lea    -0x1(%rdx),%rsi
ffffffffc020134a:	fd                   	std    
ffffffffc020134b:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
ffffffffc020134d:	fc                   	cld    
ffffffffc020134e:	c3                   	ret    
ffffffffc020134f:	f6 c1 03             	test   $0x3,%cl
ffffffffc0201352:	75 ee                	jne    ffffffffc0201342 <memmove+0x28>
ffffffffc0201354:	48 83 ef 04          	sub    $0x4,%rdi
ffffffffc0201358:	48 8d 72 fc          	lea    -0x4(%rdx),%rsi
ffffffffc020135c:	c1 e9 02             	shr    $0x2,%ecx
ffffffffc020135f:	fd                   	std    
ffffffffc0201360:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
ffffffffc0201362:	eb e9                	jmp    ffffffffc020134d <memmove+0x33>
ffffffffc0201364:	48 89 f2             	mov    %rsi,%rdx
ffffffffc0201367:	48 09 c2             	or     %rax,%rdx
ffffffffc020136a:	f6 c2 03             	test   $0x3,%dl
ffffffffc020136d:	74 07                	je     ffffffffc0201376 <memmove+0x5c>
ffffffffc020136f:	48 89 c7             	mov    %rax,%rdi
ffffffffc0201372:	fc                   	cld    
ffffffffc0201373:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
ffffffffc0201375:	c3                   	ret    
ffffffffc0201376:	f6 c1 03             	test   $0x3,%cl
ffffffffc0201379:	75 f4                	jne    ffffffffc020136f <memmove+0x55>
ffffffffc020137b:	c1 e9 02             	shr    $0x2,%ecx
ffffffffc020137e:	48 89 c7             	mov    %rax,%rdi
ffffffffc0201381:	fc                   	cld    
ffffffffc0201382:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
ffffffffc0201384:	c3                   	ret    

ffffffffc0201385 <memcpy>:
ffffffffc0201385:	f3 0f 1e fa          	endbr64 
ffffffffc0201389:	55                   	push   %rbp
ffffffffc020138a:	48 89 e5             	mov    %rsp,%rbp
ffffffffc020138d:	e8 88 ff ff ff       	call   ffffffffc020131a <memmove>
ffffffffc0201392:	5d                   	pop    %rbp
ffffffffc0201393:	c3                   	ret    

ffffffffc0201394 <memcmp>:
ffffffffc0201394:	f3 0f 1e fa          	endbr64 
ffffffffc0201398:	89 d2                	mov    %edx,%edx
ffffffffc020139a:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc020139f:	48 39 d0             	cmp    %rdx,%rax
ffffffffc02013a2:	74 1e                	je     ffffffffc02013c2 <memcmp+0x2e>
ffffffffc02013a4:	0f b6 0c 07          	movzbl (%rdi,%rax,1),%ecx
ffffffffc02013a8:	48 83 c0 01          	add    $0x1,%rax
ffffffffc02013ac:	44 0f b6 44 06 ff    	movzbl -0x1(%rsi,%rax,1),%r8d
ffffffffc02013b2:	44 38 c1             	cmp    %r8b,%cl
ffffffffc02013b5:	74 e8                	je     ffffffffc020139f <memcmp+0xb>
ffffffffc02013b7:	0f b6 c1             	movzbl %cl,%eax
ffffffffc02013ba:	45 0f b6 c0          	movzbl %r8b,%r8d
ffffffffc02013be:	44 29 c0             	sub    %r8d,%eax
ffffffffc02013c1:	c3                   	ret    
ffffffffc02013c2:	b8 00 00 00 00       	mov    $0x0,%eax
ffffffffc02013c7:	c3                   	ret    

ffffffffc02013c8 <memfind>:
ffffffffc02013c8:	f3 0f 1e fa          	endbr64 
ffffffffc02013cc:	48 89 f8             	mov    %rdi,%rax
ffffffffc02013cf:	89 d2                	mov    %edx,%edx
ffffffffc02013d1:	48 01 fa             	add    %rdi,%rdx
ffffffffc02013d4:	eb 04                	jmp    ffffffffc02013da <memfind+0x12>
ffffffffc02013d6:	48 83 c0 01          	add    $0x1,%rax
ffffffffc02013da:	48 39 d0             	cmp    %rdx,%rax
ffffffffc02013dd:	73 05                	jae    ffffffffc02013e4 <memfind+0x1c>
ffffffffc02013df:	40 38 30             	cmp    %sil,(%rax)
ffffffffc02013e2:	75 f2                	jne    ffffffffc02013d6 <memfind+0xe>
ffffffffc02013e4:	c3                   	ret    

ffffffffc02013e5 <strtol>:
ffffffffc02013e5:	f3 0f 1e fa          	endbr64 
ffffffffc02013e9:	48 89 f9             	mov    %rdi,%rcx
ffffffffc02013ec:	49 89 f0             	mov    %rsi,%r8
ffffffffc02013ef:	89 d7                	mov    %edx,%edi
ffffffffc02013f1:	eb 04                	jmp    ffffffffc02013f7 <strtol+0x12>
ffffffffc02013f3:	48 83 c1 01          	add    $0x1,%rcx
ffffffffc02013f7:	0f b6 01             	movzbl (%rcx),%eax
ffffffffc02013fa:	3c 20                	cmp    $0x20,%al
ffffffffc02013fc:	74 f5                	je     ffffffffc02013f3 <strtol+0xe>
ffffffffc02013fe:	3c 09                	cmp    $0x9,%al
ffffffffc0201400:	74 f1                	je     ffffffffc02013f3 <strtol+0xe>
ffffffffc0201402:	3c 2b                	cmp    $0x2b,%al
ffffffffc0201404:	74 2b                	je     ffffffffc0201431 <strtol+0x4c>
ffffffffc0201406:	41 b9 00 00 00 00    	mov    $0x0,%r9d
ffffffffc020140c:	3c 2d                	cmp    $0x2d,%al
ffffffffc020140e:	74 2d                	je     ffffffffc020143d <strtol+0x58>
ffffffffc0201410:	f7 c7 ef ff ff ff    	test   $0xffffffef,%edi
ffffffffc0201416:	75 0f                	jne    ffffffffc0201427 <strtol+0x42>
ffffffffc0201418:	80 39 30             	cmpb   $0x30,(%rcx)
ffffffffc020141b:	74 2c                	je     ffffffffc0201449 <strtol+0x64>
ffffffffc020141d:	85 ff                	test   %edi,%edi
ffffffffc020141f:	b8 0a 00 00 00       	mov    $0xa,%eax
ffffffffc0201424:	0f 44 f8             	cmove  %eax,%edi
ffffffffc0201427:	ba 00 00 00 00       	mov    $0x0,%edx
ffffffffc020142c:	4c 63 d7             	movslq %edi,%r10
ffffffffc020142f:	eb 4f                	jmp    ffffffffc0201480 <strtol+0x9b>
ffffffffc0201431:	48 83 c1 01          	add    $0x1,%rcx
ffffffffc0201435:	41 b9 00 00 00 00    	mov    $0x0,%r9d
ffffffffc020143b:	eb d3                	jmp    ffffffffc0201410 <strtol+0x2b>
ffffffffc020143d:	48 83 c1 01          	add    $0x1,%rcx
ffffffffc0201441:	41 b9 01 00 00 00    	mov    $0x1,%r9d
ffffffffc0201447:	eb c7                	jmp    ffffffffc0201410 <strtol+0x2b>
ffffffffc0201449:	80 79 01 78          	cmpb   $0x78,0x1(%rcx)
ffffffffc020144d:	74 0f                	je     ffffffffc020145e <strtol+0x79>
ffffffffc020144f:	85 ff                	test   %edi,%edi
ffffffffc0201451:	75 d4                	jne    ffffffffc0201427 <strtol+0x42>
ffffffffc0201453:	48 83 c1 01          	add    $0x1,%rcx
ffffffffc0201457:	bf 08 00 00 00       	mov    $0x8,%edi
ffffffffc020145c:	eb c9                	jmp    ffffffffc0201427 <strtol+0x42>
ffffffffc020145e:	48 83 c1 02          	add    $0x2,%rcx
ffffffffc0201462:	bf 10 00 00 00       	mov    $0x10,%edi
ffffffffc0201467:	eb be                	jmp    ffffffffc0201427 <strtol+0x42>
ffffffffc0201469:	0f be c0             	movsbl %al,%eax
ffffffffc020146c:	83 e8 30             	sub    $0x30,%eax
ffffffffc020146f:	39 f8                	cmp    %edi,%eax
ffffffffc0201471:	7d 3b                	jge    ffffffffc02014ae <strtol+0xc9>
ffffffffc0201473:	48 83 c1 01          	add    $0x1,%rcx
ffffffffc0201477:	49 0f af d2          	imul   %r10,%rdx
ffffffffc020147b:	48 98                	cltq   
ffffffffc020147d:	48 01 c2             	add    %rax,%rdx
ffffffffc0201480:	0f b6 01             	movzbl (%rcx),%eax
ffffffffc0201483:	8d 70 d0             	lea    -0x30(%rax),%esi
ffffffffc0201486:	40 80 fe 09          	cmp    $0x9,%sil
ffffffffc020148a:	76 dd                	jbe    ffffffffc0201469 <strtol+0x84>
ffffffffc020148c:	8d 70 9f             	lea    -0x61(%rax),%esi
ffffffffc020148f:	40 80 fe 19          	cmp    $0x19,%sil
ffffffffc0201493:	77 08                	ja     ffffffffc020149d <strtol+0xb8>
ffffffffc0201495:	0f be c0             	movsbl %al,%eax
ffffffffc0201498:	83 e8 57             	sub    $0x57,%eax
ffffffffc020149b:	eb d2                	jmp    ffffffffc020146f <strtol+0x8a>
ffffffffc020149d:	8d 70 bf             	lea    -0x41(%rax),%esi
ffffffffc02014a0:	40 80 fe 19          	cmp    $0x19,%sil
ffffffffc02014a4:	77 08                	ja     ffffffffc02014ae <strtol+0xc9>
ffffffffc02014a6:	0f be c0             	movsbl %al,%eax
ffffffffc02014a9:	83 e8 37             	sub    $0x37,%eax
ffffffffc02014ac:	eb c1                	jmp    ffffffffc020146f <strtol+0x8a>
ffffffffc02014ae:	4d 85 c0             	test   %r8,%r8
ffffffffc02014b1:	74 03                	je     ffffffffc02014b6 <strtol+0xd1>
ffffffffc02014b3:	49 89 08             	mov    %rcx,(%r8)
ffffffffc02014b6:	48 89 d0             	mov    %rdx,%rax
ffffffffc02014b9:	48 f7 d8             	neg    %rax
ffffffffc02014bc:	45 85 c9             	test   %r9d,%r9d
ffffffffc02014bf:	48 0f 45 d0          	cmovne %rax,%rdx
ffffffffc02014c3:	48 89 d0             	mov    %rdx,%rax
ffffffffc02014c6:	c3                   	ret    
