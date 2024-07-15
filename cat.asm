
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7f 26                	jg     4f <main+0x4f>
  29:	eb 52                	jmp    7d <main+0x7d>
  2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  2f:	90                   	nop
  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  30:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  33:	83 c6 01             	add    $0x1,%esi
  36:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  39:	50                   	push   %eax
  3a:	e8 51 00 00 00       	call   90 <cat>
    close(fd);
  3f:	89 3c 24             	mov    %edi,(%esp)
  42:	e8 34 03 00 00       	call   37b <close>
  for(i = 1; i < argc; i++){
  47:	83 c4 10             	add    $0x10,%esp
  4a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  4d:	74 29                	je     78 <main+0x78>
    if((fd = open(argv[i], 0)) < 0){
  4f:	83 ec 08             	sub    $0x8,%esp
  52:	6a 00                	push   $0x0
  54:	ff 33                	push   (%ebx)
  56:	e8 38 03 00 00       	call   393 <open>
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	89 c7                	mov    %eax,%edi
  60:	85 c0                	test   %eax,%eax
  62:	79 cc                	jns    30 <main+0x30>
      printf(1, "cat: cannot open %s\n", argv[i]);
  64:	50                   	push   %eax
  65:	ff 33                	push   (%ebx)
  67:	68 2b 09 00 00       	push   $0x92b
  6c:	6a 01                	push   $0x1
  6e:	e8 dd 04 00 00       	call   550 <printf>
      exit();
  73:	e8 db 02 00 00       	call   353 <exit>
  }
  exit();
  78:	e8 d6 02 00 00       	call   353 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 c7 02 00 00       	call   353 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 c0 0c 00 00       	push   $0xcc0
  a9:	6a 01                	push   $0x1
  ab:	e8 c3 02 00 00       	call   373 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 c0 0c 00 00       	push   $0xcc0
  c4:	56                   	push   %esi
  c5:	e8 a1 02 00 00       	call   36b <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 08 09 00 00       	push   $0x908
  e4:	6a 01                	push   $0x1
  e6:	e8 65 04 00 00       	call   550 <printf>
      exit();
  eb:	e8 63 02 00 00       	call   353 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 1a 09 00 00       	push   $0x91a
  f7:	6a 01                	push   $0x1
  f9:	e8 52 04 00 00       	call   550 <printf>
    exit();
  fe:	e8 50 02 00 00       	call   353 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 111:	31 c0                	xor    %eax,%eax
{
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	8b 4d 08             	mov    0x8(%ebp),%ecx
 119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 131:	89 c8                	mov    %ecx,%eax
 133:	c9                   	leave  
 134:	c3                   	ret    
 135:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 55 08             	mov    0x8(%ebp),%edx
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 14a:	0f b6 02             	movzbl (%edx),%eax
 14d:	84 c0                	test   %al,%al
 14f:	75 17                	jne    168 <strcmp+0x28>
 151:	eb 3a                	jmp    18d <strcmp+0x4d>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 15c:	83 c2 01             	add    $0x1,%edx
 15f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 162:	84 c0                	test   %al,%al
 164:	74 1a                	je     180 <strcmp+0x40>
 166:	89 d9                	mov    %ebx,%ecx
 168:	0f b6 19             	movzbl (%ecx),%ebx
 16b:	38 c3                	cmp    %al,%bl
 16d:	74 e9                	je     158 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 16f:	29 d8                	sub    %ebx,%eax
}
 171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 174:	c9                   	leave  
 175:	c3                   	ret    
 176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 180:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 184:	31 c0                	xor    %eax,%eax
 186:	29 d8                	sub    %ebx,%eax
}
 188:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 18b:	c9                   	leave  
 18c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 18d:	0f b6 19             	movzbl (%ecx),%ebx
 190:	31 c0                	xor    %eax,%eax
 192:	eb db                	jmp    16f <strcmp+0x2f>
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <strlen>:

uint
strlen(char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 3a 00             	cmpb   $0x0,(%edx)
 1a9:	74 15                	je     1c0 <strlen+0x20>
 1ab:	31 c0                	xor    %eax,%eax
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c0 01             	add    $0x1,%eax
 1b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1b7:	89 c1                	mov    %eax,%ecx
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	89 c8                	mov    %ecx,%eax
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    
 1bf:	90                   	nop
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 12                	jne    213 <strchr+0x23>
 201:	eb 1d                	jmp    220 <strchr+0x30>
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 20c:	83 c0 01             	add    $0x1,%eax
 20f:	84 d2                	test   %dl,%dl
 211:	74 0d                	je     220 <strchr+0x30>
    if(*s == c)
 213:	38 d1                	cmp    %dl,%cl
 215:	75 f1                	jne    208 <strchr+0x18>
      return (char*)s;
  return 0;
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 235:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 238:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 239:	31 db                	xor    %ebx,%ebx
{
 23b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 23e:	eb 27                	jmp    267 <gets+0x37>
    cc = read(0, &c, 1);
 240:	83 ec 04             	sub    $0x4,%esp
 243:	6a 01                	push   $0x1
 245:	56                   	push   %esi
 246:	6a 00                	push   $0x0
 248:	e8 1e 01 00 00       	call   36b <read>
    if(cc < 1)
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	7e 1d                	jle    271 <gets+0x41>
      break;
    buf[i++] = c;
 254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 258:	8b 55 08             	mov    0x8(%ebp),%edx
 25b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 25f:	3c 0a                	cmp    $0xa,%al
 261:	74 10                	je     273 <gets+0x43>
 263:	3c 0d                	cmp    $0xd,%al
 265:	74 0c                	je     273 <gets+0x43>
  for(i=0; i+1 < max; ){
 267:	89 df                	mov    %ebx,%edi
 269:	83 c3 01             	add    $0x1,%ebx
 26c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 26f:	7c cf                	jl     240 <gets+0x10>
 271:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 27a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27d:	5b                   	pop    %ebx
 27e:	5e                   	pop    %esi
 27f:	5f                   	pop    %edi
 280:	5d                   	pop    %ebp
 281:	c3                   	ret    
 282:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <stat>:

int
stat(char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 295:	83 ec 08             	sub    $0x8,%esp
 298:	6a 00                	push   $0x0
 29a:	ff 75 08             	push   0x8(%ebp)
 29d:	e8 f1 00 00 00       	call   393 <open>
  if(fd < 0)
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	85 c0                	test   %eax,%eax
 2a7:	78 27                	js     2d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	ff 75 0c             	push   0xc(%ebp)
 2af:	89 c3                	mov    %eax,%ebx
 2b1:	50                   	push   %eax
 2b2:	e8 f4 00 00 00       	call   3ab <fstat>
  close(fd);
 2b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ba:	89 c6                	mov    %eax,%esi
  close(fd);
 2bc:	e8 ba 00 00 00       	call   37b <close>
  return r;
 2c1:	83 c4 10             	add    $0x10,%esp
}
 2c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2c7:	89 f0                	mov    %esi,%eax
 2c9:	5b                   	pop    %ebx
 2ca:	5e                   	pop    %esi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2d5:	eb ed                	jmp    2c4 <stat+0x34>
 2d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2de:	66 90                	xchg   %ax,%ax

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e7:	0f be 02             	movsbl (%edx),%eax
 2ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2ed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2f5:	77 1e                	ja     315 <atoi+0x35>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 300:	83 c2 01             	add    $0x1,%edx
 303:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 306:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 30a:	0f be 02             	movsbl (%edx),%eax
 30d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 318:	89 c8                	mov    %ecx,%eax
 31a:	c9                   	leave  
 31b:	c3                   	ret    
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000320 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	8b 45 10             	mov    0x10(%ebp),%eax
 327:	8b 55 08             	mov    0x8(%ebp),%edx
 32a:	56                   	push   %esi
 32b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32e:	85 c0                	test   %eax,%eax
 330:	7e 13                	jle    345 <memmove+0x25>
 332:	01 d0                	add    %edx,%eax
  dst = vdst;
 334:	89 d7                	mov    %edx,%edi
 336:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 340:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 341:	39 f8                	cmp    %edi,%eax
 343:	75 fb                	jne    340 <memmove+0x20>
  return vdst;
}
 345:	5e                   	pop    %esi
 346:	89 d0                	mov    %edx,%eax
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    

0000034b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34b:	b8 01 00 00 00       	mov    $0x1,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <exit>:
SYSCALL(exit)
 353:	b8 02 00 00 00       	mov    $0x2,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <wait>:
SYSCALL(wait)
 35b:	b8 03 00 00 00       	mov    $0x3,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <pipe>:
SYSCALL(pipe)
 363:	b8 04 00 00 00       	mov    $0x4,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <read>:
SYSCALL(read)
 36b:	b8 05 00 00 00       	mov    $0x5,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <write>:
SYSCALL(write)
 373:	b8 10 00 00 00       	mov    $0x10,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <close>:
SYSCALL(close)
 37b:	b8 15 00 00 00       	mov    $0x15,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <kill>:
SYSCALL(kill)
 383:	b8 06 00 00 00       	mov    $0x6,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <exec>:
SYSCALL(exec)
 38b:	b8 07 00 00 00       	mov    $0x7,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <open>:
SYSCALL(open)
 393:	b8 0f 00 00 00       	mov    $0xf,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <mknod>:
SYSCALL(mknod)
 39b:	b8 11 00 00 00       	mov    $0x11,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <unlink>:
SYSCALL(unlink)
 3a3:	b8 12 00 00 00       	mov    $0x12,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <fstat>:
SYSCALL(fstat)
 3ab:	b8 08 00 00 00       	mov    $0x8,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <link>:
SYSCALL(link)
 3b3:	b8 13 00 00 00       	mov    $0x13,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <mkdir>:
SYSCALL(mkdir)
 3bb:	b8 14 00 00 00       	mov    $0x14,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <chdir>:
SYSCALL(chdir)
 3c3:	b8 09 00 00 00       	mov    $0x9,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <dup>:
SYSCALL(dup)
 3cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <getpid>:
SYSCALL(getpid)
 3d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <sbrk>:
SYSCALL(sbrk)
 3db:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <sleep>:
SYSCALL(sleep)
 3e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <uptime>:
SYSCALL(uptime)
 3eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <date>:
SYSCALL(date)
 3f3:	b8 16 00 00 00       	mov    $0x16,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    
 3fb:	66 90                	xchg   %ax,%ax
 3fd:	66 90                	xchg   %ax,%ax
 3ff:	90                   	nop

00000400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn, int len)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	89 ce                	mov    %ecx,%esi
 407:	53                   	push   %ebx
 408:	89 d3                	mov    %edx,%ebx
 40a:	83 ec 3c             	sub    $0x3c,%esp
 40d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 410:	85 d2                	test   %edx,%edx
 412:	0f 89 c8 00 00 00    	jns    4e0 <printint+0xe0>
 418:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 41c:	0f 84 be 00 00 00    	je     4e0 <printint+0xe0>
    neg = 1;
    x = -xx;
 422:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 426:	f7 db                	neg    %ebx
    neg = 1;
 428:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 42f:	31 c9                	xor    %ecx,%ecx
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 438:	89 d8                	mov    %ebx,%eax
 43a:	31 d2                	xor    %edx,%edx
 43c:	89 cf                	mov    %ecx,%edi
 43e:	83 c1 01             	add    $0x1,%ecx
 441:	f7 f6                	div    %esi
 443:	0f b6 92 a0 09 00 00 	movzbl 0x9a0(%edx),%edx
 44a:	88 54 0d d7          	mov    %dl,-0x29(%ebp,%ecx,1)
  }while((x /= base) != 0);
 44e:	89 da                	mov    %ebx,%edx
 450:	89 c3                	mov    %eax,%ebx
 452:	39 f2                	cmp    %esi,%edx
 454:	73 e2                	jae    438 <printint+0x38>
  while (i < len - neg) {
 456:	39 4d 0c             	cmp    %ecx,0xc(%ebp)
 459:	0f 8e 91 00 00 00    	jle    4f0 <printint+0xf0>
 45f:	8d 45 d8             	lea    -0x28(%ebp),%eax
 462:	01 c1                	add    %eax,%ecx
 464:	03 45 0c             	add    0xc(%ebp),%eax
 467:	89 c2                	mov    %eax,%edx
 469:	29 ca                	sub    %ecx,%edx
 46b:	83 e2 01             	and    $0x1,%edx
 46e:	74 10                	je     480 <printint+0x80>
    buf[i++] = '0';
 470:	c6 01 30             	movb   $0x30,(%ecx)
  while (i < len - neg) {
 473:	83 c1 01             	add    $0x1,%ecx
 476:	39 c1                	cmp    %eax,%ecx
 478:	74 14                	je     48e <printint+0x8e>
 47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    buf[i++] = '0';
 480:	c6 01 30             	movb   $0x30,(%ecx)
  while (i < len - neg) {
 483:	83 c1 02             	add    $0x2,%ecx
    buf[i++] = '0';
 486:	c6 41 ff 30          	movb   $0x30,-0x1(%ecx)
  while (i < len - neg) {
 48a:	39 c1                	cmp    %eax,%ecx
 48c:	75 f2                	jne    480 <printint+0x80>
 48e:	8b 45 0c             	mov    0xc(%ebp),%eax
 491:	8d 78 ff             	lea    -0x1(%eax),%edi
  }
  if(neg)
 494:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 497:	85 c0                	test   %eax,%eax
 499:	74 0a                	je     4a5 <printint+0xa5>
    buf[i++] = '-';
 49b:	8b 45 0c             	mov    0xc(%ebp),%eax
 49e:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 4a3:	89 c7                	mov    %eax,%edi
 4a5:	8d 45 d8             	lea    -0x28(%ebp),%eax
 4a8:	8b 5d c0             	mov    -0x40(%ebp),%ebx
 4ab:	01 c7                	add    %eax,%edi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
    putc(fd, buf[i]);
 4b0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4b3:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 4b6:	8d 75 d8             	lea    -0x28(%ebp),%esi
 4b9:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
 4bc:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4bf:	6a 01                	push   $0x1
 4c1:	50                   	push   %eax
 4c2:	53                   	push   %ebx
 4c3:	e8 ab fe ff ff       	call   373 <write>
  while(--i >= 0)
 4c8:	89 f8                	mov    %edi,%eax
 4ca:	83 c4 10             	add    $0x10,%esp
 4cd:	83 ef 01             	sub    $0x1,%edi
 4d0:	39 f0                	cmp    %esi,%eax
 4d2:	75 dc                	jne    4b0 <printint+0xb0>
}
 4d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d7:	5b                   	pop    %ebx
 4d8:	5e                   	pop    %esi
 4d9:	5f                   	pop    %edi
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4e0:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4e7:	e9 43 ff ff ff       	jmp    42f <printint+0x2f>
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while (i < len - neg) {
 4f0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 4f3:	eb 9f                	jmp    494 <printint+0x94>
 4f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000500 <readint>:

int readint(char *fmt, int *l)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	8b 75 08             	mov    0x8(%ebp),%esi
 508:	53                   	push   %ebx
 509:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 50c:	0f be 06             	movsbl (%esi),%eax
 50f:	8d 50 d0             	lea    -0x30(%eax),%edx
 512:	80 fa 09             	cmp    $0x9,%dl
 515:	77 29                	ja     540 <readint+0x40>
    *l = *l*10 + fmt[i] - '0';
 517:	8b 17                	mov    (%edi),%edx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 519:	31 c9                	xor    %ecx,%ecx
 51b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop
    *l = *l*10 + fmt[i] - '0';
 520:	8d 14 92             	lea    (%edx,%edx,4),%edx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 523:	83 c1 01             	add    $0x1,%ecx
    *l = *l*10 + fmt[i] - '0';
 526:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
 52a:	89 17                	mov    %edx,(%edi)
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 52c:	0f be 04 0e          	movsbl (%esi,%ecx,1),%eax
 530:	8d 58 d0             	lea    -0x30(%eax),%ebx
 533:	80 fb 09             	cmp    $0x9,%bl
 536:	76 e8                	jbe    520 <readint+0x20>
  }
  return i;
}
 538:	5b                   	pop    %ebx
 539:	89 c8                	mov    %ecx,%eax
 53b:	5e                   	pop    %esi
 53c:	5f                   	pop    %edi
 53d:	5d                   	pop    %ebp
 53e:	c3                   	ret    
 53f:	90                   	nop
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 540:	31 c9                	xor    %ecx,%ecx
}
 542:	5b                   	pop    %ebx
 543:	5e                   	pop    %esi
 544:	89 c8                	mov    %ecx,%eax
 546:	5f                   	pop    %edi
 547:	5d                   	pop    %ebp
 548:	c3                   	ret    
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000550 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state, len;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 559:	8b 7d 0c             	mov    0xc(%ebp),%edi
 55c:	0f b6 17             	movzbl (%edi),%edx
 55f:	84 d2                	test   %dl,%dl
 561:	0f 84 82 00 00 00    	je     5e9 <printf+0x99>
  ap = (uint*)(void*)&fmt + 1;
 567:	8d 45 10             	lea    0x10(%ebp),%eax
  state = 0;
 56a:	31 f6                	xor    %esi,%esi
  for(i = 0; fmt[i]; i++){
 56c:	31 db                	xor    %ebx,%ebx
 56e:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 570:	89 45 d0             	mov    %eax,-0x30(%ebp)
 573:	eb 2c                	jmp    5a1 <printf+0x51>
 575:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 578:	83 f8 25             	cmp    $0x25,%eax
 57b:	74 53                	je     5d0 <printf+0x80>
  write(fd, &c, 1);
 57d:	83 ec 04             	sub    $0x4,%esp
 580:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 583:	88 55 e7             	mov    %dl,-0x19(%ebp)
 586:	6a 01                	push   $0x1
 588:	51                   	push   %ecx
 589:	ff 75 08             	push   0x8(%ebp)
 58c:	e8 e2 fd ff ff       	call   373 <write>
        state = '%';
        len = 0;
      } else {
        putc(fd, c);
 591:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 594:	83 c3 01             	add    $0x1,%ebx
 597:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 59b:	89 d9                	mov    %ebx,%ecx
 59d:	84 d2                	test   %dl,%dl
 59f:	74 48                	je     5e9 <printf+0x99>
    c = fmt[i] & 0xff;
 5a1:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5a4:	85 f6                	test   %esi,%esi
 5a6:	74 d0                	je     578 <printf+0x28>
      }
    } else if(state == '%'){
 5a8:	83 fe 25             	cmp    $0x25,%esi
 5ab:	75 e7                	jne    594 <printf+0x44>
      if(c == '0'){
 5ad:	83 f8 78             	cmp    $0x78,%eax
 5b0:	0f 8f aa 00 00 00    	jg     660 <printf+0x110>
 5b6:	83 f8 62             	cmp    $0x62,%eax
 5b9:	7e 3d                	jle    5f8 <printf+0xa8>
 5bb:	83 e8 63             	sub    $0x63,%eax
 5be:	83 f8 15             	cmp    $0x15,%eax
 5c1:	0f 87 99 00 00 00    	ja     660 <printf+0x110>
 5c7:	ff 24 85 48 09 00 00 	jmp    *0x948(,%eax,4)
 5ce:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
 5d0:	83 c3 01             	add    $0x1,%ebx
        len = 0;
 5d3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
        state = '%';
 5da:	be 25 00 00 00       	mov    $0x25,%esi
  for(i = 0; fmt[i]; i++){
 5df:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 5e3:	89 d9                	mov    %ebx,%ecx
 5e5:	84 d2                	test   %dl,%dl
 5e7:	75 b8                	jne    5a1 <printf+0x51>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ec:	5b                   	pop    %ebx
 5ed:	5e                   	pop    %esi
 5ee:	5f                   	pop    %edi
 5ef:	5d                   	pop    %ebp
 5f0:	c3                   	ret    
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f8:	83 f8 25             	cmp    $0x25,%eax
 5fb:	0f 84 6f 01 00 00    	je     770 <printf+0x220>
 601:	83 f8 30             	cmp    $0x30,%eax
 604:	75 5a                	jne    660 <printf+0x110>
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 606:	0f be 44 0f 01       	movsbl 0x1(%edi,%ecx,1),%eax
 60b:	8d 50 d0             	lea    -0x30(%eax),%edx
 60e:	80 fa 09             	cmp    $0x9,%dl
 611:	77 81                	ja     594 <printf+0x44>
 613:	01 f9                	add    %edi,%ecx
 615:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
 618:	31 d2                	xor    %edx,%edx
 61a:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 61d:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 620:	89 75 c8             	mov    %esi,-0x38(%ebp)
 623:	8b 75 cc             	mov    -0x34(%ebp),%esi
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
    *l = *l*10 + fmt[i] - '0';
 630:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 633:	83 c2 01             	add    $0x1,%edx
    *l = *l*10 + fmt[i] - '0';
 636:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 63a:	0f be 44 16 01       	movsbl 0x1(%esi,%edx,1),%eax
 63f:	8d 58 d0             	lea    -0x30(%eax),%ebx
 642:	80 fb 09             	cmp    $0x9,%bl
 645:	76 e9                	jbe    630 <printf+0xe0>
        i += readint(&fmt[i+1], &len);
 647:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
 64a:	8b 75 c8             	mov    -0x38(%ebp),%esi
 64d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 650:	01 d3                	add    %edx,%ebx
        continue;
 652:	e9 3d ff ff ff       	jmp    594 <printf+0x44>
 657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
 663:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 666:	88 55 c8             	mov    %dl,-0x38(%ebp)
        putc(fd, '%');
 669:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 66d:	6a 01                	push   $0x1
 66f:	51                   	push   %ecx
 670:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 673:	ff 75 08             	push   0x8(%ebp)
 676:	e8 f8 fc ff ff       	call   373 <write>
        putc(fd, c);
 67b:	0f b6 55 c8          	movzbl -0x38(%ebp),%edx
  write(fd, &c, 1);
 67f:	83 c4 0c             	add    $0xc,%esp
 682:	88 55 e7             	mov    %dl,-0x19(%ebp)
 685:	6a 01                	push   $0x1
 687:	8b 4d cc             	mov    -0x34(%ebp),%ecx
 68a:	51                   	push   %ecx
      state = 0;
 68b:	31 f6                	xor    %esi,%esi
  write(fd, &c, 1);
 68d:	ff 75 08             	push   0x8(%ebp)
 690:	e8 de fc ff ff       	call   373 <write>
        putc(fd, c);
 695:	83 c4 10             	add    $0x10,%esp
 698:	e9 f7 fe ff ff       	jmp    594 <printf+0x44>
        printint(fd, *ap, 16, 0, len);
 69d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6a0:	83 ec 08             	sub    $0x8,%esp
 6a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a8:	8b 16                	mov    (%esi),%edx
 6aa:	ff 75 d4             	push   -0x2c(%ebp)
 6ad:	6a 00                	push   $0x0
 6af:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
 6b2:	83 c6 04             	add    $0x4,%esi
        printint(fd, *ap, 16, 0, len);
 6b5:	e8 46 fd ff ff       	call   400 <printint>
        ap++;
 6ba:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6bd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6c0:	31 f6                	xor    %esi,%esi
 6c2:	e9 cd fe ff ff       	jmp    594 <printf+0x44>
        s = (char*)*ap;
 6c7:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6ca:	8b 10                	mov    (%eax),%edx
        ap++;
 6cc:	83 c0 04             	add    $0x4,%eax
 6cf:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6d2:	85 d2                	test   %edx,%edx
 6d4:	0f 84 a6 00 00 00    	je     780 <printf+0x230>
        while(*s != 0){
 6da:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6dd:	31 f6                	xor    %esi,%esi
        while(*s != 0){
 6df:	84 c0                	test   %al,%al
 6e1:	0f 84 ad fe ff ff    	je     594 <printf+0x44>
 6e7:	89 5d cc             	mov    %ebx,-0x34(%ebp)
 6ea:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 6ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6f0:	89 7d c8             	mov    %edi,-0x38(%ebp)
 6f3:	89 ce                	mov    %ecx,%esi
 6f5:	89 d7                	mov    %edx,%edi
 6f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fe:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 700:	83 ec 04             	sub    $0x4,%esp
 703:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 706:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 709:	6a 01                	push   $0x1
 70b:	56                   	push   %esi
 70c:	53                   	push   %ebx
 70d:	e8 61 fc ff ff       	call   373 <write>
        while(*s != 0){
 712:	0f b6 07             	movzbl (%edi),%eax
 715:	83 c4 10             	add    $0x10,%esp
 718:	84 c0                	test   %al,%al
 71a:	75 e4                	jne    700 <printf+0x1b0>
      state = 0;
 71c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
 71f:	8b 7d c8             	mov    -0x38(%ebp),%edi
 722:	31 f6                	xor    %esi,%esi
 724:	e9 6b fe ff ff       	jmp    594 <printf+0x44>
        printint(fd, *ap, 10, 1, len);
 729:	8b 75 d0             	mov    -0x30(%ebp),%esi
 72c:	83 ec 08             	sub    $0x8,%esp
 72f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 734:	8b 16                	mov    (%esi),%edx
 736:	ff 75 d4             	push   -0x2c(%ebp)
 739:	6a 01                	push   $0x1
 73b:	e9 6f ff ff ff       	jmp    6af <printf+0x15f>
        putc(fd, *ap);
 740:	8b 75 d0             	mov    -0x30(%ebp),%esi
  write(fd, &c, 1);
 743:	83 ec 04             	sub    $0x4,%esp
 746:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
 749:	8b 06                	mov    (%esi),%eax
        ap++;
 74b:	83 c6 04             	add    $0x4,%esi
        putc(fd, *ap);
 74e:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 751:	6a 01                	push   $0x1
 753:	51                   	push   %ecx
 754:	ff 75 08             	push   0x8(%ebp)
 757:	e8 17 fc ff ff       	call   373 <write>
        ap++;
 75c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 75f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 762:	31 f6                	xor    %esi,%esi
 764:	e9 2b fe ff ff       	jmp    594 <printf+0x44>
 769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 770:	83 ec 04             	sub    $0x4,%esp
 773:	88 55 e7             	mov    %dl,-0x19(%ebp)
 776:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 779:	6a 01                	push   $0x1
 77b:	e9 0a ff ff ff       	jmp    68a <printf+0x13a>
 780:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 785:	ba 40 09 00 00       	mov    $0x940,%edx
 78a:	e9 58 ff ff ff       	jmp    6e7 <printf+0x197>
 78f:	90                   	nop

00000790 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 790:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	a1 c0 0e 00 00       	mov    0xec0,%eax
{
 796:	89 e5                	mov    %esp,%ebp
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 79e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7aa:	39 c8                	cmp    %ecx,%eax
 7ac:	73 32                	jae    7e0 <free+0x50>
 7ae:	39 d1                	cmp    %edx,%ecx
 7b0:	72 04                	jb     7b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b2:	39 d0                	cmp    %edx,%eax
 7b4:	72 32                	jb     7e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7bc:	39 fa                	cmp    %edi,%edx
 7be:	74 30                	je     7f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7c3:	8b 50 04             	mov    0x4(%eax),%edx
 7c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c9:	39 f1                	cmp    %esi,%ecx
 7cb:	74 3a                	je     807 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7cd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7cf:	5b                   	pop    %ebx
  freep = p;
 7d0:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 7d5:	5e                   	pop    %esi
 7d6:	5f                   	pop    %edi
 7d7:	5d                   	pop    %ebp
 7d8:	c3                   	ret    
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e0:	39 d0                	cmp    %edx,%eax
 7e2:	72 04                	jb     7e8 <free+0x58>
 7e4:	39 d1                	cmp    %edx,%ecx
 7e6:	72 ce                	jb     7b6 <free+0x26>
{
 7e8:	89 d0                	mov    %edx,%eax
 7ea:	eb bc                	jmp    7a8 <free+0x18>
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7f0:	03 72 04             	add    0x4(%edx),%esi
 7f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f6:	8b 10                	mov    (%eax),%edx
 7f8:	8b 12                	mov    (%edx),%edx
 7fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fd:	8b 50 04             	mov    0x4(%eax),%edx
 800:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 803:	39 f1                	cmp    %esi,%ecx
 805:	75 c6                	jne    7cd <free+0x3d>
    p->s.size += bp->s.size;
 807:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 80a:	a3 c0 0e 00 00       	mov    %eax,0xec0
    p->s.size += bp->s.size;
 80f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 812:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 815:	89 08                	mov    %ecx,(%eax)
}
 817:	5b                   	pop    %ebx
 818:	5e                   	pop    %esi
 819:	5f                   	pop    %edi
 81a:	5d                   	pop    %ebp
 81b:	c3                   	ret    
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000820 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 829:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 82c:	8b 15 c0 0e 00 00    	mov    0xec0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 832:	8d 78 07             	lea    0x7(%eax),%edi
 835:	c1 ef 03             	shr    $0x3,%edi
 838:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 83b:	85 d2                	test   %edx,%edx
 83d:	0f 84 8d 00 00 00    	je     8d0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 843:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 845:	8b 48 04             	mov    0x4(%eax),%ecx
 848:	39 f9                	cmp    %edi,%ecx
 84a:	73 64                	jae    8b0 <malloc+0x90>
  if(nu < 4096)
 84c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 851:	39 df                	cmp    %ebx,%edi
 853:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 856:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 85d:	eb 0a                	jmp    869 <malloc+0x49>
 85f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 860:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 862:	8b 48 04             	mov    0x4(%eax),%ecx
 865:	39 f9                	cmp    %edi,%ecx
 867:	73 47                	jae    8b0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 869:	89 c2                	mov    %eax,%edx
 86b:	3b 05 c0 0e 00 00    	cmp    0xec0,%eax
 871:	75 ed                	jne    860 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 873:	83 ec 0c             	sub    $0xc,%esp
 876:	56                   	push   %esi
 877:	e8 5f fb ff ff       	call   3db <sbrk>
  if(p == (char*)-1)
 87c:	83 c4 10             	add    $0x10,%esp
 87f:	83 f8 ff             	cmp    $0xffffffff,%eax
 882:	74 1c                	je     8a0 <malloc+0x80>
  hp->s.size = nu;
 884:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 887:	83 ec 0c             	sub    $0xc,%esp
 88a:	83 c0 08             	add    $0x8,%eax
 88d:	50                   	push   %eax
 88e:	e8 fd fe ff ff       	call   790 <free>
  return freep;
 893:	8b 15 c0 0e 00 00    	mov    0xec0,%edx
      if((p = morecore(nunits)) == 0)
 899:	83 c4 10             	add    $0x10,%esp
 89c:	85 d2                	test   %edx,%edx
 89e:	75 c0                	jne    860 <malloc+0x40>
        return 0;
  }
}
 8a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8a3:	31 c0                	xor    %eax,%eax
}
 8a5:	5b                   	pop    %ebx
 8a6:	5e                   	pop    %esi
 8a7:	5f                   	pop    %edi
 8a8:	5d                   	pop    %ebp
 8a9:	c3                   	ret    
 8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8b0:	39 cf                	cmp    %ecx,%edi
 8b2:	74 4c                	je     900 <malloc+0xe0>
        p->s.size -= nunits;
 8b4:	29 f9                	sub    %edi,%ecx
 8b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8bc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 8bf:	89 15 c0 0e 00 00    	mov    %edx,0xec0
}
 8c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8c8:	83 c0 08             	add    $0x8,%eax
}
 8cb:	5b                   	pop    %ebx
 8cc:	5e                   	pop    %esi
 8cd:	5f                   	pop    %edi
 8ce:	5d                   	pop    %ebp
 8cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8d0:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 8d7:	0e 00 00 
    base.s.size = 0;
 8da:	b8 c4 0e 00 00       	mov    $0xec4,%eax
    base.s.ptr = freep = prevp = &base;
 8df:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 8e6:	0e 00 00 
    base.s.size = 0;
 8e9:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 8f0:	00 00 00 
    if(p->s.size >= nunits){
 8f3:	e9 54 ff ff ff       	jmp    84c <malloc+0x2c>
 8f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ff:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 900:	8b 08                	mov    (%eax),%ecx
 902:	89 0a                	mov    %ecx,(%edx)
 904:	eb b9                	jmp    8bf <malloc+0x9f>