
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 47                	jle    65 <main+0x65>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  1e:	8b 47 04             	mov    0x4(%edi),%eax
  21:	83 fe 02             	cmp    $0x2,%esi
  24:	74 2a                	je     50 <main+0x50>
  26:	bb 02 00 00 00       	mov    $0x2,%ebx
  2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  2f:	90                   	nop
  30:	68 68 08 00 00       	push   $0x868
  35:	83 c3 01             	add    $0x1,%ebx
  38:	50                   	push   %eax
  39:	68 6a 08 00 00       	push   $0x86a
  3e:	6a 01                	push   $0x1
  40:	e8 6b 04 00 00       	call   4b0 <printf>
  45:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 de                	cmp    %ebx,%esi
  4e:	75 e0                	jne    30 <main+0x30>
  50:	68 6f 08 00 00       	push   $0x86f
  55:	50                   	push   %eax
  56:	68 6a 08 00 00       	push   $0x86a
  5b:	6a 01                	push   $0x1
  5d:	e8 4e 04 00 00       	call   4b0 <printf>
  62:	83 c4 10             	add    $0x10,%esp
  exit();
  65:	e8 49 02 00 00       	call   2b3 <exit>
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  71:	31 c0                	xor    %eax,%eax
{
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  91:	89 c8                	mov    %ecx,%eax
  93:	c9                   	leave  
  94:	c3                   	ret    
  95:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 55 08             	mov    0x8(%ebp),%edx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	75 17                	jne    c8 <strcmp+0x28>
  b1:	eb 3a                	jmp    ed <strcmp+0x4d>
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
  b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  c2:	84 c0                	test   %al,%al
  c4:	74 1a                	je     e0 <strcmp+0x40>
  c6:	89 d9                	mov    %ebx,%ecx
  c8:	0f b6 19             	movzbl (%ecx),%ebx
  cb:	38 c3                	cmp    %al,%bl
  cd:	74 e9                	je     b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  cf:	29 d8                	sub    %ebx,%eax
}
  d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d4:	c9                   	leave  
  d5:	c3                   	ret    
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave  
  ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb db                	jmp    cf <strcmp+0x2f>
  f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop

00000100 <strlen>:

uint
strlen(char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	8b 7d fc             	mov    -0x4(%ebp),%edi
 145:	89 d0                	mov    %edx,%eax
 147:	c9                   	leave  
 148:	c3                   	ret    
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 12                	jne    173 <strchr+0x23>
 161:	eb 1d                	jmp    180 <strchr+0x30>
 163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 167:	90                   	nop
 168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 16c:	83 c0 01             	add    $0x1,%eax
 16f:	84 d2                	test   %dl,%dl
 171:	74 0d                	je     180 <strchr+0x30>
    if(*s == c)
 173:	38 d1                	cmp    %dl,%cl
 175:	75 f1                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 18f:	90                   	nop

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 195:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 199:	31 db                	xor    %ebx,%ebx
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 19e:	eb 27                	jmp    1c7 <gets+0x37>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	56                   	push   %esi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 1e 01 00 00       	call   2cb <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bf:	3c 0a                	cmp    $0xa,%al
 1c1:	74 10                	je     1d3 <gets+0x43>
 1c3:	3c 0d                	cmp    $0xd,%al
 1c5:	74 0c                	je     1d3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1c7:	89 df                	mov    %ebx,%edi
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
 1d1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dd:	5b                   	pop    %ebx
 1de:	5e                   	pop    %esi
 1df:	5f                   	pop    %edi
 1e0:	5d                   	pop    %ebp
 1e1:	c3                   	ret    
 1e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <stat>:

int
stat(char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 f1 00 00 00       	call   2f3 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f4 00 00 00       	call   30b <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 ba 00 00 00       	call   2db <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave  
 27b:	c3                   	ret    
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    

000002ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ab:	b8 01 00 00 00       	mov    $0x1,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <exit>:
SYSCALL(exit)
 2b3:	b8 02 00 00 00       	mov    $0x2,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <wait>:
SYSCALL(wait)
 2bb:	b8 03 00 00 00       	mov    $0x3,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <pipe>:
SYSCALL(pipe)
 2c3:	b8 04 00 00 00       	mov    $0x4,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <read>:
SYSCALL(read)
 2cb:	b8 05 00 00 00       	mov    $0x5,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <write>:
SYSCALL(write)
 2d3:	b8 10 00 00 00       	mov    $0x10,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <close>:
SYSCALL(close)
 2db:	b8 15 00 00 00       	mov    $0x15,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <kill>:
SYSCALL(kill)
 2e3:	b8 06 00 00 00       	mov    $0x6,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <exec>:
SYSCALL(exec)
 2eb:	b8 07 00 00 00       	mov    $0x7,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <open>:
SYSCALL(open)
 2f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <mknod>:
SYSCALL(mknod)
 2fb:	b8 11 00 00 00       	mov    $0x11,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <unlink>:
SYSCALL(unlink)
 303:	b8 12 00 00 00       	mov    $0x12,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <fstat>:
SYSCALL(fstat)
 30b:	b8 08 00 00 00       	mov    $0x8,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <link>:
SYSCALL(link)
 313:	b8 13 00 00 00       	mov    $0x13,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mkdir>:
SYSCALL(mkdir)
 31b:	b8 14 00 00 00       	mov    $0x14,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <chdir>:
SYSCALL(chdir)
 323:	b8 09 00 00 00       	mov    $0x9,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <dup>:
SYSCALL(dup)
 32b:	b8 0a 00 00 00       	mov    $0xa,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <getpid>:
SYSCALL(getpid)
 333:	b8 0b 00 00 00       	mov    $0xb,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <sbrk>:
SYSCALL(sbrk)
 33b:	b8 0c 00 00 00       	mov    $0xc,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <sleep>:
SYSCALL(sleep)
 343:	b8 0d 00 00 00       	mov    $0xd,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <uptime>:
SYSCALL(uptime)
 34b:	b8 0e 00 00 00       	mov    $0xe,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <date>:
SYSCALL(date)
 353:	b8 16 00 00 00       	mov    $0x16,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn, int len)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	89 ce                	mov    %ecx,%esi
 367:	53                   	push   %ebx
 368:	89 d3                	mov    %edx,%ebx
 36a:	83 ec 3c             	sub    $0x3c,%esp
 36d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 370:	85 d2                	test   %edx,%edx
 372:	0f 89 c8 00 00 00    	jns    440 <printint+0xe0>
 378:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 37c:	0f 84 be 00 00 00    	je     440 <printint+0xe0>
    neg = 1;
    x = -xx;
 382:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 386:	f7 db                	neg    %ebx
    neg = 1;
 388:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 38f:	31 c9                	xor    %ecx,%ecx
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 398:	89 d8                	mov    %ebx,%eax
 39a:	31 d2                	xor    %edx,%edx
 39c:	89 cf                	mov    %ecx,%edi
 39e:	83 c1 01             	add    $0x1,%ecx
 3a1:	f7 f6                	div    %esi
 3a3:	0f b6 92 d0 08 00 00 	movzbl 0x8d0(%edx),%edx
 3aa:	88 54 0d d7          	mov    %dl,-0x29(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3ae:	89 da                	mov    %ebx,%edx
 3b0:	89 c3                	mov    %eax,%ebx
 3b2:	39 f2                	cmp    %esi,%edx
 3b4:	73 e2                	jae    398 <printint+0x38>
  while (i < len - neg) {
 3b6:	39 4d 0c             	cmp    %ecx,0xc(%ebp)
 3b9:	0f 8e 91 00 00 00    	jle    450 <printint+0xf0>
 3bf:	8d 45 d8             	lea    -0x28(%ebp),%eax
 3c2:	01 c1                	add    %eax,%ecx
 3c4:	03 45 0c             	add    0xc(%ebp),%eax
 3c7:	89 c2                	mov    %eax,%edx
 3c9:	29 ca                	sub    %ecx,%edx
 3cb:	83 e2 01             	and    $0x1,%edx
 3ce:	74 10                	je     3e0 <printint+0x80>
    buf[i++] = '0';
 3d0:	c6 01 30             	movb   $0x30,(%ecx)
  while (i < len - neg) {
 3d3:	83 c1 01             	add    $0x1,%ecx
 3d6:	39 c1                	cmp    %eax,%ecx
 3d8:	74 14                	je     3ee <printint+0x8e>
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    buf[i++] = '0';
 3e0:	c6 01 30             	movb   $0x30,(%ecx)
  while (i < len - neg) {
 3e3:	83 c1 02             	add    $0x2,%ecx
    buf[i++] = '0';
 3e6:	c6 41 ff 30          	movb   $0x30,-0x1(%ecx)
  while (i < len - neg) {
 3ea:	39 c1                	cmp    %eax,%ecx
 3ec:	75 f2                	jne    3e0 <printint+0x80>
 3ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f1:	8d 78 ff             	lea    -0x1(%eax),%edi
  }
  if(neg)
 3f4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3f7:	85 c0                	test   %eax,%eax
 3f9:	74 0a                	je     405 <printint+0xa5>
    buf[i++] = '-';
 3fb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fe:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 403:	89 c7                	mov    %eax,%edi
 405:	8d 45 d8             	lea    -0x28(%ebp),%eax
 408:	8b 5d c0             	mov    -0x40(%ebp),%ebx
 40b:	01 c7                	add    %eax,%edi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
    putc(fd, buf[i]);
 410:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 413:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 416:	8d 75 d8             	lea    -0x28(%ebp),%esi
 419:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
 41c:	8d 45 d7             	lea    -0x29(%ebp),%eax
 41f:	6a 01                	push   $0x1
 421:	50                   	push   %eax
 422:	53                   	push   %ebx
 423:	e8 ab fe ff ff       	call   2d3 <write>
  while(--i >= 0)
 428:	89 f8                	mov    %edi,%eax
 42a:	83 c4 10             	add    $0x10,%esp
 42d:	83 ef 01             	sub    $0x1,%edi
 430:	39 f0                	cmp    %esi,%eax
 432:	75 dc                	jne    410 <printint+0xb0>
}
 434:	8d 65 f4             	lea    -0xc(%ebp),%esp
 437:	5b                   	pop    %ebx
 438:	5e                   	pop    %esi
 439:	5f                   	pop    %edi
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 440:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 447:	e9 43 ff ff ff       	jmp    38f <printint+0x2f>
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while (i < len - neg) {
 450:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 453:	eb 9f                	jmp    3f4 <printint+0x94>
 455:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <readint>:

int readint(char *fmt, int *l)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	8b 75 08             	mov    0x8(%ebp),%esi
 468:	53                   	push   %ebx
 469:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 46c:	0f be 06             	movsbl (%esi),%eax
 46f:	8d 50 d0             	lea    -0x30(%eax),%edx
 472:	80 fa 09             	cmp    $0x9,%dl
 475:	77 29                	ja     4a0 <readint+0x40>
    *l = *l*10 + fmt[i] - '0';
 477:	8b 17                	mov    (%edi),%edx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 479:	31 c9                	xor    %ecx,%ecx
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop
    *l = *l*10 + fmt[i] - '0';
 480:	8d 14 92             	lea    (%edx,%edx,4),%edx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 483:	83 c1 01             	add    $0x1,%ecx
    *l = *l*10 + fmt[i] - '0';
 486:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
 48a:	89 17                	mov    %edx,(%edi)
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 48c:	0f be 04 0e          	movsbl (%esi,%ecx,1),%eax
 490:	8d 58 d0             	lea    -0x30(%eax),%ebx
 493:	80 fb 09             	cmp    $0x9,%bl
 496:	76 e8                	jbe    480 <readint+0x20>
  }
  return i;
}
 498:	5b                   	pop    %ebx
 499:	89 c8                	mov    %ecx,%eax
 49b:	5e                   	pop    %esi
 49c:	5f                   	pop    %edi
 49d:	5d                   	pop    %ebp
 49e:	c3                   	ret    
 49f:	90                   	nop
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 4a0:	31 c9                	xor    %ecx,%ecx
}
 4a2:	5b                   	pop    %ebx
 4a3:	5e                   	pop    %esi
 4a4:	89 c8                	mov    %ecx,%eax
 4a6:	5f                   	pop    %edi
 4a7:	5d                   	pop    %ebp
 4a8:	c3                   	ret    
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state, len;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b9:	8b 7d 0c             	mov    0xc(%ebp),%edi
 4bc:	0f b6 17             	movzbl (%edi),%edx
 4bf:	84 d2                	test   %dl,%dl
 4c1:	0f 84 82 00 00 00    	je     549 <printf+0x99>
  ap = (uint*)(void*)&fmt + 1;
 4c7:	8d 45 10             	lea    0x10(%ebp),%eax
  state = 0;
 4ca:	31 f6                	xor    %esi,%esi
  for(i = 0; fmt[i]; i++){
 4cc:	31 db                	xor    %ebx,%ebx
 4ce:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4d3:	eb 2c                	jmp    501 <printf+0x51>
 4d5:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	74 53                	je     530 <printf+0x80>
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 4e3:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4e6:	6a 01                	push   $0x1
 4e8:	51                   	push   %ecx
 4e9:	ff 75 08             	push   0x8(%ebp)
 4ec:	e8 e2 fd ff ff       	call   2d3 <write>
        state = '%';
        len = 0;
      } else {
        putc(fd, c);
 4f1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4f4:	83 c3 01             	add    $0x1,%ebx
 4f7:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 4fb:	89 d9                	mov    %ebx,%ecx
 4fd:	84 d2                	test   %dl,%dl
 4ff:	74 48                	je     549 <printf+0x99>
    c = fmt[i] & 0xff;
 501:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 504:	85 f6                	test   %esi,%esi
 506:	74 d0                	je     4d8 <printf+0x28>
      }
    } else if(state == '%'){
 508:	83 fe 25             	cmp    $0x25,%esi
 50b:	75 e7                	jne    4f4 <printf+0x44>
      if(c == '0'){
 50d:	83 f8 78             	cmp    $0x78,%eax
 510:	0f 8f aa 00 00 00    	jg     5c0 <printf+0x110>
 516:	83 f8 62             	cmp    $0x62,%eax
 519:	7e 3d                	jle    558 <printf+0xa8>
 51b:	83 e8 63             	sub    $0x63,%eax
 51e:	83 f8 15             	cmp    $0x15,%eax
 521:	0f 87 99 00 00 00    	ja     5c0 <printf+0x110>
 527:	ff 24 85 78 08 00 00 	jmp    *0x878(,%eax,4)
 52e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
 530:	83 c3 01             	add    $0x1,%ebx
        len = 0;
 533:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
        state = '%';
 53a:	be 25 00 00 00       	mov    $0x25,%esi
  for(i = 0; fmt[i]; i++){
 53f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 543:	89 d9                	mov    %ebx,%ecx
 545:	84 d2                	test   %dl,%dl
 547:	75 b8                	jne    501 <printf+0x51>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 549:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54c:	5b                   	pop    %ebx
 54d:	5e                   	pop    %esi
 54e:	5f                   	pop    %edi
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret    
 551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 558:	83 f8 25             	cmp    $0x25,%eax
 55b:	0f 84 6f 01 00 00    	je     6d0 <printf+0x220>
 561:	83 f8 30             	cmp    $0x30,%eax
 564:	75 5a                	jne    5c0 <printf+0x110>
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 566:	0f be 44 0f 01       	movsbl 0x1(%edi,%ecx,1),%eax
 56b:	8d 50 d0             	lea    -0x30(%eax),%edx
 56e:	80 fa 09             	cmp    $0x9,%dl
 571:	77 81                	ja     4f4 <printf+0x44>
 573:	01 f9                	add    %edi,%ecx
 575:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
 578:	31 d2                	xor    %edx,%edx
 57a:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 57d:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 580:	89 75 c8             	mov    %esi,-0x38(%ebp)
 583:	8b 75 cc             	mov    -0x34(%ebp),%esi
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
    *l = *l*10 + fmt[i] - '0';
 590:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 593:	83 c2 01             	add    $0x1,%edx
    *l = *l*10 + fmt[i] - '0';
 596:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 59a:	0f be 44 16 01       	movsbl 0x1(%esi,%edx,1),%eax
 59f:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5a2:	80 fb 09             	cmp    $0x9,%bl
 5a5:	76 e9                	jbe    590 <printf+0xe0>
        i += readint(&fmt[i+1], &len);
 5a7:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
 5aa:	8b 75 c8             	mov    -0x38(%ebp),%esi
 5ad:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 5b0:	01 d3                	add    %edx,%ebx
        continue;
 5b2:	e9 3d ff ff ff       	jmp    4f4 <printf+0x44>
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 5c6:	88 55 c8             	mov    %dl,-0x38(%ebp)
        putc(fd, '%');
 5c9:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 5cd:	6a 01                	push   $0x1
 5cf:	51                   	push   %ecx
 5d0:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 5d3:	ff 75 08             	push   0x8(%ebp)
 5d6:	e8 f8 fc ff ff       	call   2d3 <write>
        putc(fd, c);
 5db:	0f b6 55 c8          	movzbl -0x38(%ebp),%edx
  write(fd, &c, 1);
 5df:	83 c4 0c             	add    $0xc,%esp
 5e2:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5e5:	6a 01                	push   $0x1
 5e7:	8b 4d cc             	mov    -0x34(%ebp),%ecx
 5ea:	51                   	push   %ecx
      state = 0;
 5eb:	31 f6                	xor    %esi,%esi
  write(fd, &c, 1);
 5ed:	ff 75 08             	push   0x8(%ebp)
 5f0:	e8 de fc ff ff       	call   2d3 <write>
        putc(fd, c);
 5f5:	83 c4 10             	add    $0x10,%esp
 5f8:	e9 f7 fe ff ff       	jmp    4f4 <printf+0x44>
        printint(fd, *ap, 16, 0, len);
 5fd:	8b 75 d0             	mov    -0x30(%ebp),%esi
 600:	83 ec 08             	sub    $0x8,%esp
 603:	b9 10 00 00 00       	mov    $0x10,%ecx
 608:	8b 16                	mov    (%esi),%edx
 60a:	ff 75 d4             	push   -0x2c(%ebp)
 60d:	6a 00                	push   $0x0
 60f:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
 612:	83 c6 04             	add    $0x4,%esi
        printint(fd, *ap, 16, 0, len);
 615:	e8 46 fd ff ff       	call   360 <printint>
        ap++;
 61a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 61d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 620:	31 f6                	xor    %esi,%esi
 622:	e9 cd fe ff ff       	jmp    4f4 <printf+0x44>
        s = (char*)*ap;
 627:	8b 45 d0             	mov    -0x30(%ebp),%eax
 62a:	8b 10                	mov    (%eax),%edx
        ap++;
 62c:	83 c0 04             	add    $0x4,%eax
 62f:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 632:	85 d2                	test   %edx,%edx
 634:	0f 84 a6 00 00 00    	je     6e0 <printf+0x230>
        while(*s != 0){
 63a:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 63d:	31 f6                	xor    %esi,%esi
        while(*s != 0){
 63f:	84 c0                	test   %al,%al
 641:	0f 84 ad fe ff ff    	je     4f4 <printf+0x44>
 647:	89 5d cc             	mov    %ebx,-0x34(%ebp)
 64a:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 64d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 650:	89 7d c8             	mov    %edi,-0x38(%ebp)
 653:	89 ce                	mov    %ecx,%esi
 655:	89 d7                	mov    %edx,%edi
 657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
 663:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 666:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 669:	6a 01                	push   $0x1
 66b:	56                   	push   %esi
 66c:	53                   	push   %ebx
 66d:	e8 61 fc ff ff       	call   2d3 <write>
        while(*s != 0){
 672:	0f b6 07             	movzbl (%edi),%eax
 675:	83 c4 10             	add    $0x10,%esp
 678:	84 c0                	test   %al,%al
 67a:	75 e4                	jne    660 <printf+0x1b0>
      state = 0;
 67c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
 67f:	8b 7d c8             	mov    -0x38(%ebp),%edi
 682:	31 f6                	xor    %esi,%esi
 684:	e9 6b fe ff ff       	jmp    4f4 <printf+0x44>
        printint(fd, *ap, 10, 1, len);
 689:	8b 75 d0             	mov    -0x30(%ebp),%esi
 68c:	83 ec 08             	sub    $0x8,%esp
 68f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 694:	8b 16                	mov    (%esi),%edx
 696:	ff 75 d4             	push   -0x2c(%ebp)
 699:	6a 01                	push   $0x1
 69b:	e9 6f ff ff ff       	jmp    60f <printf+0x15f>
        putc(fd, *ap);
 6a0:	8b 75 d0             	mov    -0x30(%ebp),%esi
  write(fd, &c, 1);
 6a3:	83 ec 04             	sub    $0x4,%esp
 6a6:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
 6a9:	8b 06                	mov    (%esi),%eax
        ap++;
 6ab:	83 c6 04             	add    $0x4,%esi
        putc(fd, *ap);
 6ae:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b1:	6a 01                	push   $0x1
 6b3:	51                   	push   %ecx
 6b4:	ff 75 08             	push   0x8(%ebp)
 6b7:	e8 17 fc ff ff       	call   2d3 <write>
        ap++;
 6bc:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6bf:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6c2:	31 f6                	xor    %esi,%esi
 6c4:	e9 2b fe ff ff       	jmp    4f4 <printf+0x44>
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
 6d3:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6d6:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 6d9:	6a 01                	push   $0x1
 6db:	e9 0a ff ff ff       	jmp    5ea <printf+0x13a>
 6e0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6e5:	ba 71 08 00 00       	mov    $0x871,%edx
 6ea:	e9 58 ff ff ff       	jmp    647 <printf+0x197>
 6ef:	90                   	nop

000006f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	a1 b4 0b 00 00       	mov    0xbb4,%eax
{
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 708:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70a:	39 c8                	cmp    %ecx,%eax
 70c:	73 32                	jae    740 <free+0x50>
 70e:	39 d1                	cmp    %edx,%ecx
 710:	72 04                	jb     716 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 712:	39 d0                	cmp    %edx,%eax
 714:	72 32                	jb     748 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 716:	8b 73 fc             	mov    -0x4(%ebx),%esi
 719:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71c:	39 fa                	cmp    %edi,%edx
 71e:	74 30                	je     750 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 720:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 723:	8b 50 04             	mov    0x4(%eax),%edx
 726:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 729:	39 f1                	cmp    %esi,%ecx
 72b:	74 3a                	je     767 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 72d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 72f:	5b                   	pop    %ebx
  freep = p;
 730:	a3 b4 0b 00 00       	mov    %eax,0xbb4
}
 735:	5e                   	pop    %esi
 736:	5f                   	pop    %edi
 737:	5d                   	pop    %ebp
 738:	c3                   	ret    
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 740:	39 d0                	cmp    %edx,%eax
 742:	72 04                	jb     748 <free+0x58>
 744:	39 d1                	cmp    %edx,%ecx
 746:	72 ce                	jb     716 <free+0x26>
{
 748:	89 d0                	mov    %edx,%eax
 74a:	eb bc                	jmp    708 <free+0x18>
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 750:	03 72 04             	add    0x4(%edx),%esi
 753:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 756:	8b 10                	mov    (%eax),%edx
 758:	8b 12                	mov    (%edx),%edx
 75a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 50 04             	mov    0x4(%eax),%edx
 760:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 763:	39 f1                	cmp    %esi,%ecx
 765:	75 c6                	jne    72d <free+0x3d>
    p->s.size += bp->s.size;
 767:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 76a:	a3 b4 0b 00 00       	mov    %eax,0xbb4
    p->s.size += bp->s.size;
 76f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 772:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 775:	89 08                	mov    %ecx,(%eax)
}
 777:	5b                   	pop    %ebx
 778:	5e                   	pop    %esi
 779:	5f                   	pop    %edi
 77a:	5d                   	pop    %ebp
 77b:	c3                   	ret    
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 789:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 78c:	8b 15 b4 0b 00 00    	mov    0xbb4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 79b:	85 d2                	test   %edx,%edx
 79d:	0f 84 8d 00 00 00    	je     830 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7a5:	8b 48 04             	mov    0x4(%eax),%ecx
 7a8:	39 f9                	cmp    %edi,%ecx
 7aa:	73 64                	jae    810 <malloc+0x90>
  if(nu < 4096)
 7ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b1:	39 df                	cmp    %ebx,%edi
 7b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7bd:	eb 0a                	jmp    7c9 <malloc+0x49>
 7bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7c2:	8b 48 04             	mov    0x4(%eax),%ecx
 7c5:	39 f9                	cmp    %edi,%ecx
 7c7:	73 47                	jae    810 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c9:	89 c2                	mov    %eax,%edx
 7cb:	3b 05 b4 0b 00 00    	cmp    0xbb4,%eax
 7d1:	75 ed                	jne    7c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	56                   	push   %esi
 7d7:	e8 5f fb ff ff       	call   33b <sbrk>
  if(p == (char*)-1)
 7dc:	83 c4 10             	add    $0x10,%esp
 7df:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e2:	74 1c                	je     800 <malloc+0x80>
  hp->s.size = nu;
 7e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e7:	83 ec 0c             	sub    $0xc,%esp
 7ea:	83 c0 08             	add    $0x8,%eax
 7ed:	50                   	push   %eax
 7ee:	e8 fd fe ff ff       	call   6f0 <free>
  return freep;
 7f3:	8b 15 b4 0b 00 00    	mov    0xbb4,%edx
      if((p = morecore(nunits)) == 0)
 7f9:	83 c4 10             	add    $0x10,%esp
 7fc:	85 d2                	test   %edx,%edx
 7fe:	75 c0                	jne    7c0 <malloc+0x40>
        return 0;
  }
}
 800:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 803:	31 c0                	xor    %eax,%eax
}
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret    
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 810:	39 cf                	cmp    %ecx,%edi
 812:	74 4c                	je     860 <malloc+0xe0>
        p->s.size -= nunits;
 814:	29 f9                	sub    %edi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 81f:	89 15 b4 0b 00 00    	mov    %edx,0xbb4
}
 825:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 828:	83 c0 08             	add    $0x8,%eax
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 b4 0b 00 00 b8 	movl   $0xbb8,0xbb4
 837:	0b 00 00 
    base.s.size = 0;
 83a:	b8 b8 0b 00 00       	mov    $0xbb8,%eax
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 b8 0b 00 00 b8 	movl   $0xbb8,0xbb8
 846:	0b 00 00 
    base.s.size = 0;
 849:	c7 05 bc 0b 00 00 00 	movl   $0x0,0xbbc
 850:	00 00 00 
    if(p->s.size >= nunits){
 853:	e9 54 ff ff ff       	jmp    7ac <malloc+0x2c>
 858:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b9                	jmp    81f <malloc+0x9f>
