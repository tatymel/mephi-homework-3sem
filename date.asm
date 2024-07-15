
_date:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
//   uint hour;
//   uint day;
//   uint month;
//   uint year;
// };
int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
    struct rtcdate* time = (struct rtcdate*)malloc(sizeof(struct rtcdate));
   f:	83 ec 0c             	sub    $0xc,%esp
  12:	6a 18                	push   $0x18
  14:	e8 57 07 00 00       	call   770 <malloc>
    if(date(time) == 0){
  19:	89 04 24             	mov    %eax,(%esp)
    struct rtcdate* time = (struct rtcdate*)malloc(sizeof(struct rtcdate));
  1c:	89 c3                	mov    %eax,%ebx
    if(date(time) == 0){
  1e:	e8 20 03 00 00       	call   343 <date>
  23:	83 c4 10             	add    $0x10,%esp
  26:	85 c0                	test   %eax,%eax
  28:	74 0e                	je     38 <main+0x38>
    printf(1, "%d-%02d-%02dT%02d:%02d:%02d\n", time->year, time->month,
            time->day, time->hour, time->minute, time->second);
    }
    free(time);
  2a:	83 ec 0c             	sub    $0xc,%esp
  2d:	53                   	push   %ebx
  2e:	e8 ad 06 00 00       	call   6e0 <free>
    exit();
  33:	e8 6b 02 00 00       	call   2a3 <exit>
    printf(1, "%d-%02d-%02dT%02d:%02d:%02d\n", time->year, time->month,
  38:	ff 33                	push   (%ebx)
  3a:	ff 73 04             	push   0x4(%ebx)
  3d:	ff 73 08             	push   0x8(%ebx)
  40:	ff 73 0c             	push   0xc(%ebx)
  43:	ff 73 10             	push   0x10(%ebx)
  46:	ff 73 14             	push   0x14(%ebx)
  49:	68 58 08 00 00       	push   $0x858
  4e:	6a 01                	push   $0x1
  50:	e8 4b 04 00 00       	call   4a0 <printf>
  55:	83 c4 20             	add    $0x20,%esp
  58:	eb d0                	jmp    2a <main+0x2a>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave  
  84:	c3                   	ret    
  85:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 17                	jne    b8 <strcmp+0x28>
  a1:	eb 3a                	jmp    dd <strcmp+0x4d>
  a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a7:	90                   	nop
  a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ac:	83 c2 01             	add    $0x1,%edx
  af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  b2:	84 c0                	test   %al,%al
  b4:	74 1a                	je     d0 <strcmp+0x40>
  b6:	89 d9                	mov    %ebx,%ecx
  b8:	0f b6 19             	movzbl (%ecx),%ebx
  bb:	38 c3                	cmp    %al,%bl
  bd:	74 e9                	je     a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  bf:	29 d8                	sub    %ebx,%eax
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave  
  c5:	c3                   	ret    
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  d4:	31 c0                	xor    %eax,%eax
  d6:	29 d8                	sub    %ebx,%eax
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave  
  dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	31 c0                	xor    %eax,%eax
  e2:	eb db                	jmp    bf <strcmp+0x2f>
  e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop

000000f0 <strlen>:

uint
strlen(char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 107:	89 c1                	mov    %eax,%ecx
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	8b 7d fc             	mov    -0x4(%ebp),%edi
 135:	89 d0                	mov    %edx,%eax
 137:	c9                   	leave  
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	56                   	push   %esi
 196:	6a 00                	push   $0x0
 198:	e8 1e 01 00 00       	call   2bb <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 10                	je     1c3 <gets+0x43>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 0c                	je     1c3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1b7:	89 df                	mov    %ebx,%edi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
 1c1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cd:	5b                   	pop    %ebx
 1ce:	5e                   	pop    %esi
 1cf:	5f                   	pop    %edi
 1d0:	5d                   	pop    %ebp
 1d1:	c3                   	ret    
 1d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <stat>:

int
stat(char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 f1 00 00 00       	call   2e3 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 27                	js     220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1f9:	83 ec 08             	sub    $0x8,%esp
 1fc:	ff 75 0c             	push   0xc(%ebp)
 1ff:	89 c3                	mov    %eax,%ebx
 201:	50                   	push   %eax
 202:	e8 f4 00 00 00       	call   2fb <fstat>
  close(fd);
 207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 20a:	89 c6                	mov    %eax,%esi
  close(fd);
 20c:	e8 ba 00 00 00       	call   2cb <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	8d 65 f8             	lea    -0x8(%ebp),%esp
 217:	89 f0                	mov    %esi,%eax
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 220:	be ff ff ff ff       	mov    $0xffffffff,%esi
 225:	eb ed                	jmp    214 <stat+0x34>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 237:	0f be 02             	movsbl (%edx),%eax
 23a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 23d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 240:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 245:	77 1e                	ja     265 <atoi+0x35>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 250:	83 c2 01             	add    $0x1,%edx
 253:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 256:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 25a:	0f be 02             	movsbl (%edx),%eax
 25d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 260:	80 fb 09             	cmp    $0x9,%bl
 263:	76 eb                	jbe    250 <atoi+0x20>
  return n;
}
 265:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 268:	89 c8                	mov    %ecx,%eax
 26a:	c9                   	leave  
 26b:	c3                   	ret    
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 45 10             	mov    0x10(%ebp),%eax
 277:	8b 55 08             	mov    0x8(%ebp),%edx
 27a:	56                   	push   %esi
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27e:	85 c0                	test   %eax,%eax
 280:	7e 13                	jle    295 <memmove+0x25>
 282:	01 d0                	add    %edx,%eax
  dst = vdst;
 284:	89 d7                	mov    %edx,%edi
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 290:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 291:	39 f8                	cmp    %edi,%eax
 293:	75 fb                	jne    290 <memmove+0x20>
  return vdst;
}
 295:	5e                   	pop    %esi
 296:	89 d0                	mov    %edx,%eax
 298:	5f                   	pop    %edi
 299:	5d                   	pop    %ebp
 29a:	c3                   	ret    

0000029b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29b:	b8 01 00 00 00       	mov    $0x1,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <exit>:
SYSCALL(exit)
 2a3:	b8 02 00 00 00       	mov    $0x2,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <wait>:
SYSCALL(wait)
 2ab:	b8 03 00 00 00       	mov    $0x3,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <pipe>:
SYSCALL(pipe)
 2b3:	b8 04 00 00 00       	mov    $0x4,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <read>:
SYSCALL(read)
 2bb:	b8 05 00 00 00       	mov    $0x5,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <write>:
SYSCALL(write)
 2c3:	b8 10 00 00 00       	mov    $0x10,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <close>:
SYSCALL(close)
 2cb:	b8 15 00 00 00       	mov    $0x15,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <kill>:
SYSCALL(kill)
 2d3:	b8 06 00 00 00       	mov    $0x6,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <exec>:
SYSCALL(exec)
 2db:	b8 07 00 00 00       	mov    $0x7,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <open>:
SYSCALL(open)
 2e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mknod>:
SYSCALL(mknod)
 2eb:	b8 11 00 00 00       	mov    $0x11,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <unlink>:
SYSCALL(unlink)
 2f3:	b8 12 00 00 00       	mov    $0x12,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <fstat>:
SYSCALL(fstat)
 2fb:	b8 08 00 00 00       	mov    $0x8,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <link>:
SYSCALL(link)
 303:	b8 13 00 00 00       	mov    $0x13,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <mkdir>:
SYSCALL(mkdir)
 30b:	b8 14 00 00 00       	mov    $0x14,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <chdir>:
SYSCALL(chdir)
 313:	b8 09 00 00 00       	mov    $0x9,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <dup>:
SYSCALL(dup)
 31b:	b8 0a 00 00 00       	mov    $0xa,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <getpid>:
SYSCALL(getpid)
 323:	b8 0b 00 00 00       	mov    $0xb,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <sbrk>:
SYSCALL(sbrk)
 32b:	b8 0c 00 00 00       	mov    $0xc,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <sleep>:
SYSCALL(sleep)
 333:	b8 0d 00 00 00       	mov    $0xd,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <uptime>:
SYSCALL(uptime)
 33b:	b8 0e 00 00 00       	mov    $0xe,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <date>:
SYSCALL(date)
 343:	b8 16 00 00 00       	mov    $0x16,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    
 34b:	66 90                	xchg   %ax,%ax
 34d:	66 90                	xchg   %ax,%ax
 34f:	90                   	nop

00000350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn, int len)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	89 ce                	mov    %ecx,%esi
 357:	53                   	push   %ebx
 358:	89 d3                	mov    %edx,%ebx
 35a:	83 ec 3c             	sub    $0x3c,%esp
 35d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 360:	85 d2                	test   %edx,%edx
 362:	0f 89 c8 00 00 00    	jns    430 <printint+0xe0>
 368:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 36c:	0f 84 be 00 00 00    	je     430 <printint+0xe0>
    neg = 1;
    x = -xx;
 372:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 376:	f7 db                	neg    %ebx
    neg = 1;
 378:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 37f:	31 c9                	xor    %ecx,%ecx
 381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 388:	89 d8                	mov    %ebx,%eax
 38a:	31 d2                	xor    %edx,%edx
 38c:	89 cf                	mov    %ecx,%edi
 38e:	83 c1 01             	add    $0x1,%ecx
 391:	f7 f6                	div    %esi
 393:	0f b6 92 d4 08 00 00 	movzbl 0x8d4(%edx),%edx
 39a:	88 54 0d d7          	mov    %dl,-0x29(%ebp,%ecx,1)
  }while((x /= base) != 0);
 39e:	89 da                	mov    %ebx,%edx
 3a0:	89 c3                	mov    %eax,%ebx
 3a2:	39 f2                	cmp    %esi,%edx
 3a4:	73 e2                	jae    388 <printint+0x38>
  while (i < len - neg) {
 3a6:	39 4d 0c             	cmp    %ecx,0xc(%ebp)
 3a9:	0f 8e 91 00 00 00    	jle    440 <printint+0xf0>
 3af:	8d 45 d8             	lea    -0x28(%ebp),%eax
 3b2:	01 c1                	add    %eax,%ecx
 3b4:	03 45 0c             	add    0xc(%ebp),%eax
 3b7:	89 c2                	mov    %eax,%edx
 3b9:	29 ca                	sub    %ecx,%edx
 3bb:	83 e2 01             	and    $0x1,%edx
 3be:	74 10                	je     3d0 <printint+0x80>
    buf[i++] = '0';
 3c0:	c6 01 30             	movb   $0x30,(%ecx)
  while (i < len - neg) {
 3c3:	83 c1 01             	add    $0x1,%ecx
 3c6:	39 c1                	cmp    %eax,%ecx
 3c8:	74 14                	je     3de <printint+0x8e>
 3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    buf[i++] = '0';
 3d0:	c6 01 30             	movb   $0x30,(%ecx)
  while (i < len - neg) {
 3d3:	83 c1 02             	add    $0x2,%ecx
    buf[i++] = '0';
 3d6:	c6 41 ff 30          	movb   $0x30,-0x1(%ecx)
  while (i < len - neg) {
 3da:	39 c1                	cmp    %eax,%ecx
 3dc:	75 f2                	jne    3d0 <printint+0x80>
 3de:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e1:	8d 78 ff             	lea    -0x1(%eax),%edi
  }
  if(neg)
 3e4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3e7:	85 c0                	test   %eax,%eax
 3e9:	74 0a                	je     3f5 <printint+0xa5>
    buf[i++] = '-';
 3eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ee:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 3f3:	89 c7                	mov    %eax,%edi
 3f5:	8d 45 d8             	lea    -0x28(%ebp),%eax
 3f8:	8b 5d c0             	mov    -0x40(%ebp),%ebx
 3fb:	01 c7                	add    %eax,%edi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    putc(fd, buf[i]);
 400:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 403:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 406:	8d 75 d8             	lea    -0x28(%ebp),%esi
 409:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
 40c:	8d 45 d7             	lea    -0x29(%ebp),%eax
 40f:	6a 01                	push   $0x1
 411:	50                   	push   %eax
 412:	53                   	push   %ebx
 413:	e8 ab fe ff ff       	call   2c3 <write>
  while(--i >= 0)
 418:	89 f8                	mov    %edi,%eax
 41a:	83 c4 10             	add    $0x10,%esp
 41d:	83 ef 01             	sub    $0x1,%edi
 420:	39 f0                	cmp    %esi,%eax
 422:	75 dc                	jne    400 <printint+0xb0>
}
 424:	8d 65 f4             	lea    -0xc(%ebp),%esp
 427:	5b                   	pop    %ebx
 428:	5e                   	pop    %esi
 429:	5f                   	pop    %edi
 42a:	5d                   	pop    %ebp
 42b:	c3                   	ret    
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 430:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 437:	e9 43 ff ff ff       	jmp    37f <printint+0x2f>
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while (i < len - neg) {
 440:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 443:	eb 9f                	jmp    3e4 <printint+0x94>
 445:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000450 <readint>:

int readint(char *fmt, int *l)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	8b 75 08             	mov    0x8(%ebp),%esi
 458:	53                   	push   %ebx
 459:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 45c:	0f be 06             	movsbl (%esi),%eax
 45f:	8d 50 d0             	lea    -0x30(%eax),%edx
 462:	80 fa 09             	cmp    $0x9,%dl
 465:	77 29                	ja     490 <readint+0x40>
    *l = *l*10 + fmt[i] - '0';
 467:	8b 17                	mov    (%edi),%edx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 469:	31 c9                	xor    %ecx,%ecx
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop
    *l = *l*10 + fmt[i] - '0';
 470:	8d 14 92             	lea    (%edx,%edx,4),%edx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 473:	83 c1 01             	add    $0x1,%ecx
    *l = *l*10 + fmt[i] - '0';
 476:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
 47a:	89 17                	mov    %edx,(%edi)
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 47c:	0f be 04 0e          	movsbl (%esi,%ecx,1),%eax
 480:	8d 58 d0             	lea    -0x30(%eax),%ebx
 483:	80 fb 09             	cmp    $0x9,%bl
 486:	76 e8                	jbe    470 <readint+0x20>
  }
  return i;
}
 488:	5b                   	pop    %ebx
 489:	89 c8                	mov    %ecx,%eax
 48b:	5e                   	pop    %esi
 48c:	5f                   	pop    %edi
 48d:	5d                   	pop    %ebp
 48e:	c3                   	ret    
 48f:	90                   	nop
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 490:	31 c9                	xor    %ecx,%ecx
}
 492:	5b                   	pop    %ebx
 493:	5e                   	pop    %esi
 494:	89 c8                	mov    %ecx,%eax
 496:	5f                   	pop    %edi
 497:	5d                   	pop    %ebp
 498:	c3                   	ret    
 499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state, len;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 7d 0c             	mov    0xc(%ebp),%edi
 4ac:	0f b6 17             	movzbl (%edi),%edx
 4af:	84 d2                	test   %dl,%dl
 4b1:	0f 84 82 00 00 00    	je     539 <printf+0x99>
  ap = (uint*)(void*)&fmt + 1;
 4b7:	8d 45 10             	lea    0x10(%ebp),%eax
  state = 0;
 4ba:	31 f6                	xor    %esi,%esi
  for(i = 0; fmt[i]; i++){
 4bc:	31 db                	xor    %ebx,%ebx
 4be:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c3:	eb 2c                	jmp    4f1 <printf+0x51>
 4c5:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4c8:	83 f8 25             	cmp    $0x25,%eax
 4cb:	74 53                	je     520 <printf+0x80>
  write(fd, &c, 1);
 4cd:	83 ec 04             	sub    $0x4,%esp
 4d0:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 4d3:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4d6:	6a 01                	push   $0x1
 4d8:	51                   	push   %ecx
 4d9:	ff 75 08             	push   0x8(%ebp)
 4dc:	e8 e2 fd ff ff       	call   2c3 <write>
        state = '%';
        len = 0;
      } else {
        putc(fd, c);
 4e1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4e4:	83 c3 01             	add    $0x1,%ebx
 4e7:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 4eb:	89 d9                	mov    %ebx,%ecx
 4ed:	84 d2                	test   %dl,%dl
 4ef:	74 48                	je     539 <printf+0x99>
    c = fmt[i] & 0xff;
 4f1:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4f4:	85 f6                	test   %esi,%esi
 4f6:	74 d0                	je     4c8 <printf+0x28>
      }
    } else if(state == '%'){
 4f8:	83 fe 25             	cmp    $0x25,%esi
 4fb:	75 e7                	jne    4e4 <printf+0x44>
      if(c == '0'){
 4fd:	83 f8 78             	cmp    $0x78,%eax
 500:	0f 8f aa 00 00 00    	jg     5b0 <printf+0x110>
 506:	83 f8 62             	cmp    $0x62,%eax
 509:	7e 3d                	jle    548 <printf+0xa8>
 50b:	83 e8 63             	sub    $0x63,%eax
 50e:	83 f8 15             	cmp    $0x15,%eax
 511:	0f 87 99 00 00 00    	ja     5b0 <printf+0x110>
 517:	ff 24 85 7c 08 00 00 	jmp    *0x87c(,%eax,4)
 51e:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
 520:	83 c3 01             	add    $0x1,%ebx
        len = 0;
 523:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
        state = '%';
 52a:	be 25 00 00 00       	mov    $0x25,%esi
  for(i = 0; fmt[i]; i++){
 52f:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
 533:	89 d9                	mov    %ebx,%ecx
 535:	84 d2                	test   %dl,%dl
 537:	75 b8                	jne    4f1 <printf+0x51>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 539:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53c:	5b                   	pop    %ebx
 53d:	5e                   	pop    %esi
 53e:	5f                   	pop    %edi
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    
 541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 548:	83 f8 25             	cmp    $0x25,%eax
 54b:	0f 84 6f 01 00 00    	je     6c0 <printf+0x220>
 551:	83 f8 30             	cmp    $0x30,%eax
 554:	75 5a                	jne    5b0 <printf+0x110>
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 556:	0f be 44 0f 01       	movsbl 0x1(%edi,%ecx,1),%eax
 55b:	8d 50 d0             	lea    -0x30(%eax),%edx
 55e:	80 fa 09             	cmp    $0x9,%dl
 561:	77 81                	ja     4e4 <printf+0x44>
 563:	01 f9                	add    %edi,%ecx
 565:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
 568:	31 d2                	xor    %edx,%edx
 56a:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 56d:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 570:	89 75 c8             	mov    %esi,-0x38(%ebp)
 573:	8b 75 cc             	mov    -0x34(%ebp),%esi
 576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
    *l = *l*10 + fmt[i] - '0';
 580:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 583:	83 c2 01             	add    $0x1,%edx
    *l = *l*10 + fmt[i] - '0';
 586:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  for (i = 0; fmt[i] >= '0' && fmt[i] <= '9'; i++) {
 58a:	0f be 44 16 01       	movsbl 0x1(%esi,%edx,1),%eax
 58f:	8d 58 d0             	lea    -0x30(%eax),%ebx
 592:	80 fb 09             	cmp    $0x9,%bl
 595:	76 e9                	jbe    580 <printf+0xe0>
        i += readint(&fmt[i+1], &len);
 597:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
 59a:	8b 75 c8             	mov    -0x38(%ebp),%esi
 59d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 5a0:	01 d3                	add    %edx,%ebx
        continue;
 5a2:	e9 3d ff ff ff       	jmp    4e4 <printf+0x44>
 5a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ae:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 5b6:	88 55 c8             	mov    %dl,-0x38(%ebp)
        putc(fd, '%');
 5b9:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 5bd:	6a 01                	push   $0x1
 5bf:	51                   	push   %ecx
 5c0:	89 4d cc             	mov    %ecx,-0x34(%ebp)
 5c3:	ff 75 08             	push   0x8(%ebp)
 5c6:	e8 f8 fc ff ff       	call   2c3 <write>
        putc(fd, c);
 5cb:	0f b6 55 c8          	movzbl -0x38(%ebp),%edx
  write(fd, &c, 1);
 5cf:	83 c4 0c             	add    $0xc,%esp
 5d2:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5d5:	6a 01                	push   $0x1
 5d7:	8b 4d cc             	mov    -0x34(%ebp),%ecx
 5da:	51                   	push   %ecx
      state = 0;
 5db:	31 f6                	xor    %esi,%esi
  write(fd, &c, 1);
 5dd:	ff 75 08             	push   0x8(%ebp)
 5e0:	e8 de fc ff ff       	call   2c3 <write>
        putc(fd, c);
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	e9 f7 fe ff ff       	jmp    4e4 <printf+0x44>
        printint(fd, *ap, 16, 0, len);
 5ed:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5f0:	83 ec 08             	sub    $0x8,%esp
 5f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5f8:	8b 16                	mov    (%esi),%edx
 5fa:	ff 75 d4             	push   -0x2c(%ebp)
 5fd:	6a 00                	push   $0x0
 5ff:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
 602:	83 c6 04             	add    $0x4,%esi
        printint(fd, *ap, 16, 0, len);
 605:	e8 46 fd ff ff       	call   350 <printint>
        ap++;
 60a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 60d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 610:	31 f6                	xor    %esi,%esi
 612:	e9 cd fe ff ff       	jmp    4e4 <printf+0x44>
        s = (char*)*ap;
 617:	8b 45 d0             	mov    -0x30(%ebp),%eax
 61a:	8b 10                	mov    (%eax),%edx
        ap++;
 61c:	83 c0 04             	add    $0x4,%eax
 61f:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 622:	85 d2                	test   %edx,%edx
 624:	0f 84 a6 00 00 00    	je     6d0 <printf+0x230>
        while(*s != 0){
 62a:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 62d:	31 f6                	xor    %esi,%esi
        while(*s != 0){
 62f:	84 c0                	test   %al,%al
 631:	0f 84 ad fe ff ff    	je     4e4 <printf+0x44>
 637:	89 5d cc             	mov    %ebx,-0x34(%ebp)
 63a:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 63d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 640:	89 7d c8             	mov    %edi,-0x38(%ebp)
 643:	89 ce                	mov    %ecx,%esi
 645:	89 d7                	mov    %edx,%edi
 647:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 656:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 659:	6a 01                	push   $0x1
 65b:	56                   	push   %esi
 65c:	53                   	push   %ebx
 65d:	e8 61 fc ff ff       	call   2c3 <write>
        while(*s != 0){
 662:	0f b6 07             	movzbl (%edi),%eax
 665:	83 c4 10             	add    $0x10,%esp
 668:	84 c0                	test   %al,%al
 66a:	75 e4                	jne    650 <printf+0x1b0>
      state = 0;
 66c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
 66f:	8b 7d c8             	mov    -0x38(%ebp),%edi
 672:	31 f6                	xor    %esi,%esi
 674:	e9 6b fe ff ff       	jmp    4e4 <printf+0x44>
        printint(fd, *ap, 10, 1, len);
 679:	8b 75 d0             	mov    -0x30(%ebp),%esi
 67c:	83 ec 08             	sub    $0x8,%esp
 67f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 684:	8b 16                	mov    (%esi),%edx
 686:	ff 75 d4             	push   -0x2c(%ebp)
 689:	6a 01                	push   $0x1
 68b:	e9 6f ff ff ff       	jmp    5ff <printf+0x15f>
        putc(fd, *ap);
 690:	8b 75 d0             	mov    -0x30(%ebp),%esi
  write(fd, &c, 1);
 693:	83 ec 04             	sub    $0x4,%esp
 696:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        putc(fd, *ap);
 699:	8b 06                	mov    (%esi),%eax
        ap++;
 69b:	83 c6 04             	add    $0x4,%esi
        putc(fd, *ap);
 69e:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a1:	6a 01                	push   $0x1
 6a3:	51                   	push   %ecx
 6a4:	ff 75 08             	push   0x8(%ebp)
 6a7:	e8 17 fc ff ff       	call   2c3 <write>
        ap++;
 6ac:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6af:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b2:	31 f6                	xor    %esi,%esi
 6b4:	e9 2b fe ff ff       	jmp    4e4 <printf+0x44>
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
 6c3:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6c6:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 6c9:	6a 01                	push   $0x1
 6cb:	e9 0a ff ff ff       	jmp    5da <printf+0x13a>
 6d0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6d5:	ba 75 08 00 00       	mov    $0x875,%edx
 6da:	e9 58 ff ff ff       	jmp    637 <printf+0x197>
 6df:	90                   	nop

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 b0 0b 00 00       	mov    0xbb0,%eax
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fa:	39 c8                	cmp    %ecx,%eax
 6fc:	73 32                	jae    730 <free+0x50>
 6fe:	39 d1                	cmp    %edx,%ecx
 700:	72 04                	jb     706 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 702:	39 d0                	cmp    %edx,%eax
 704:	72 32                	jb     738 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 706:	8b 73 fc             	mov    -0x4(%ebx),%esi
 709:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70c:	39 fa                	cmp    %edi,%edx
 70e:	74 30                	je     740 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 710:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 713:	8b 50 04             	mov    0x4(%eax),%edx
 716:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 719:	39 f1                	cmp    %esi,%ecx
 71b:	74 3a                	je     757 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 71d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 71f:	5b                   	pop    %ebx
  freep = p;
 720:	a3 b0 0b 00 00       	mov    %eax,0xbb0
}
 725:	5e                   	pop    %esi
 726:	5f                   	pop    %edi
 727:	5d                   	pop    %ebp
 728:	c3                   	ret    
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 730:	39 d0                	cmp    %edx,%eax
 732:	72 04                	jb     738 <free+0x58>
 734:	39 d1                	cmp    %edx,%ecx
 736:	72 ce                	jb     706 <free+0x26>
{
 738:	89 d0                	mov    %edx,%eax
 73a:	eb bc                	jmp    6f8 <free+0x18>
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 740:	03 72 04             	add    0x4(%edx),%esi
 743:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 746:	8b 10                	mov    (%eax),%edx
 748:	8b 12                	mov    (%edx),%edx
 74a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 74d:	8b 50 04             	mov    0x4(%eax),%edx
 750:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 753:	39 f1                	cmp    %esi,%ecx
 755:	75 c6                	jne    71d <free+0x3d>
    p->s.size += bp->s.size;
 757:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 75a:	a3 b0 0b 00 00       	mov    %eax,0xbb0
    p->s.size += bp->s.size;
 75f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 762:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 765:	89 08                	mov    %ecx,(%eax)
}
 767:	5b                   	pop    %ebx
 768:	5e                   	pop    %esi
 769:	5f                   	pop    %edi
 76a:	5d                   	pop    %ebp
 76b:	c3                   	ret    
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 77c:	8b 15 b0 0b 00 00    	mov    0xbb0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	8d 78 07             	lea    0x7(%eax),%edi
 785:	c1 ef 03             	shr    $0x3,%edi
 788:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 78b:	85 d2                	test   %edx,%edx
 78d:	0f 84 8d 00 00 00    	je     820 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 793:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 795:	8b 48 04             	mov    0x4(%eax),%ecx
 798:	39 f9                	cmp    %edi,%ecx
 79a:	73 64                	jae    800 <malloc+0x90>
  if(nu < 4096)
 79c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7a1:	39 df                	cmp    %ebx,%edi
 7a3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7a6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7ad:	eb 0a                	jmp    7b9 <malloc+0x49>
 7af:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7b2:	8b 48 04             	mov    0x4(%eax),%ecx
 7b5:	39 f9                	cmp    %edi,%ecx
 7b7:	73 47                	jae    800 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7b9:	89 c2                	mov    %eax,%edx
 7bb:	3b 05 b0 0b 00 00    	cmp    0xbb0,%eax
 7c1:	75 ed                	jne    7b0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7c3:	83 ec 0c             	sub    $0xc,%esp
 7c6:	56                   	push   %esi
 7c7:	e8 5f fb ff ff       	call   32b <sbrk>
  if(p == (char*)-1)
 7cc:	83 c4 10             	add    $0x10,%esp
 7cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d2:	74 1c                	je     7f0 <malloc+0x80>
  hp->s.size = nu;
 7d4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7d7:	83 ec 0c             	sub    $0xc,%esp
 7da:	83 c0 08             	add    $0x8,%eax
 7dd:	50                   	push   %eax
 7de:	e8 fd fe ff ff       	call   6e0 <free>
  return freep;
 7e3:	8b 15 b0 0b 00 00    	mov    0xbb0,%edx
      if((p = morecore(nunits)) == 0)
 7e9:	83 c4 10             	add    $0x10,%esp
 7ec:	85 d2                	test   %edx,%edx
 7ee:	75 c0                	jne    7b0 <malloc+0x40>
        return 0;
  }
}
 7f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7f3:	31 c0                	xor    %eax,%eax
}
 7f5:	5b                   	pop    %ebx
 7f6:	5e                   	pop    %esi
 7f7:	5f                   	pop    %edi
 7f8:	5d                   	pop    %ebp
 7f9:	c3                   	ret    
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 800:	39 cf                	cmp    %ecx,%edi
 802:	74 4c                	je     850 <malloc+0xe0>
        p->s.size -= nunits;
 804:	29 f9                	sub    %edi,%ecx
 806:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 809:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 80c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 80f:	89 15 b0 0b 00 00    	mov    %edx,0xbb0
}
 815:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 818:	83 c0 08             	add    $0x8,%eax
}
 81b:	5b                   	pop    %ebx
 81c:	5e                   	pop    %esi
 81d:	5f                   	pop    %edi
 81e:	5d                   	pop    %ebp
 81f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 820:	c7 05 b0 0b 00 00 b4 	movl   $0xbb4,0xbb0
 827:	0b 00 00 
    base.s.size = 0;
 82a:	b8 b4 0b 00 00       	mov    $0xbb4,%eax
    base.s.ptr = freep = prevp = &base;
 82f:	c7 05 b4 0b 00 00 b4 	movl   $0xbb4,0xbb4
 836:	0b 00 00 
    base.s.size = 0;
 839:	c7 05 b8 0b 00 00 00 	movl   $0x0,0xbb8
 840:	00 00 00 
    if(p->s.size >= nunits){
 843:	e9 54 ff ff ff       	jmp    79c <malloc+0x2c>
 848:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 850:	8b 08                	mov    (%eax),%ecx
 852:	89 0a                	mov    %ecx,(%edx)
 854:	eb b9                	jmp    80f <malloc+0x9f>
