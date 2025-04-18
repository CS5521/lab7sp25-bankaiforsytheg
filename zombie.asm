
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 99 03 00 00       	call   3a7 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 21 04 00 00       	call   43f <sleep>
  exit();
  1e:	e8 8c 03 00 00       	call   3af <exit>

00000023 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  23:	55                   	push   %ebp
  24:	89 e5                	mov    %esp,%ebp
  26:	57                   	push   %edi
  27:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2b:	8b 55 10             	mov    0x10(%ebp),%edx
  2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  31:	89 cb                	mov    %ecx,%ebx
  33:	89 df                	mov    %ebx,%edi
  35:	89 d1                	mov    %edx,%ecx
  37:	fc                   	cld    
  38:	f3 aa                	rep stos %al,%es:(%edi)
  3a:	89 ca                	mov    %ecx,%edx
  3c:	89 fb                	mov    %edi,%ebx
  3e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  41:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  44:	5b                   	pop    %ebx
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4e:	8b 45 08             	mov    0x8(%ebp),%eax
  51:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  54:	90                   	nop
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	8d 50 01             	lea    0x1(%eax),%edx
  5b:	89 55 08             	mov    %edx,0x8(%ebp)
  5e:	8b 55 0c             	mov    0xc(%ebp),%edx
  61:	8d 4a 01             	lea    0x1(%edx),%ecx
  64:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  67:	0f b6 12             	movzbl (%edx),%edx
  6a:	88 10                	mov    %dl,(%eax)
  6c:	0f b6 00             	movzbl (%eax),%eax
  6f:	84 c0                	test   %al,%al
  71:	75 e2                	jne    55 <strcpy+0xd>
    ;
  return os;
  73:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  76:	c9                   	leave  
  77:	c3                   	ret    

00000078 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  78:	55                   	push   %ebp
  79:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7b:	eb 08                	jmp    85 <strcmp+0xd>
    p++, q++;
  7d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  81:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	0f b6 00             	movzbl (%eax),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 10                	je     9f <strcmp+0x27>
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 10             	movzbl (%eax),%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	38 c2                	cmp    %al,%dl
  9d:	74 de                	je     7d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  9f:	8b 45 08             	mov    0x8(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	0f b6 d0             	movzbl %al,%edx
  a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  ab:	0f b6 00             	movzbl (%eax),%eax
  ae:	0f b6 c0             	movzbl %al,%eax
  b1:	29 c2                	sub    %eax,%edx
  b3:	89 d0                	mov    %edx,%eax
}
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    

000000b7 <strlen>:

uint
strlen(const char *s)
{
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c4:	eb 04                	jmp    ca <strlen+0x13>
  c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	01 d0                	add    %edx,%eax
  d2:	0f b6 00             	movzbl (%eax),%eax
  d5:	84 c0                	test   %al,%al
  d7:	75 ed                	jne    c6 <strlen+0xf>
    ;
  return n;
  d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dc:	c9                   	leave  
  dd:	c3                   	ret    

000000de <memset>:

void*
memset(void *dst, int c, uint n)
{
  de:	55                   	push   %ebp
  df:	89 e5                	mov    %esp,%ebp
  e1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e4:	8b 45 10             	mov    0x10(%ebp),%eax
  e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  f2:	8b 45 08             	mov    0x8(%ebp),%eax
  f5:	89 04 24             	mov    %eax,(%esp)
  f8:	e8 26 ff ff ff       	call   23 <stosb>
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	3a 45 fc             	cmp    -0x4(%ebp),%al
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 4c                	jmp    190 <gets+0x5b>
    cc = read(0, &c, 1);
 144:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14b:	00 
 14c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14f:	89 44 24 04          	mov    %eax,0x4(%esp)
 153:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15a:	e8 68 02 00 00       	call   3c7 <read>
 15f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 162:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 166:	7f 02                	jg     16a <gets+0x35>
      break;
 168:	eb 31                	jmp    19b <gets+0x66>
    buf[i++] = c;
 16a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16d:	8d 50 01             	lea    0x1(%eax),%edx
 170:	89 55 f4             	mov    %edx,-0xc(%ebp)
 173:	89 c2                	mov    %eax,%edx
 175:	8b 45 08             	mov    0x8(%ebp),%eax
 178:	01 c2                	add    %eax,%edx
 17a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 180:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 184:	3c 0a                	cmp    $0xa,%al
 186:	74 13                	je     19b <gets+0x66>
 188:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18c:	3c 0d                	cmp    $0xd,%al
 18e:	74 0b                	je     19b <gets+0x66>
  for(i=0; i+1 < max; ){
 190:	8b 45 f4             	mov    -0xc(%ebp),%eax
 193:	83 c0 01             	add    $0x1,%eax
 196:	3b 45 0c             	cmp    0xc(%ebp),%eax
 199:	7c a9                	jl     144 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 19b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19e:	8b 45 08             	mov    0x8(%ebp),%eax
 1a1:	01 d0                	add    %edx,%eax
 1a3:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a9:	c9                   	leave  
 1aa:	c3                   	ret    

000001ab <stat>:

int
stat(const char *n, struct stat *st)
{
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b8:	00 
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	89 04 24             	mov    %eax,(%esp)
 1bf:	e8 2b 02 00 00       	call   3ef <open>
 1c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1cb:	79 07                	jns    1d4 <stat+0x29>
    return -1;
 1cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d2:	eb 23                	jmp    1f7 <stat+0x4c>
  r = fstat(fd, st);
 1d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1de:	89 04 24             	mov    %eax,(%esp)
 1e1:	e8 21 02 00 00       	call   407 <fstat>
 1e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ec:	89 04 24             	mov    %eax,(%esp)
 1ef:	e8 e3 01 00 00       	call   3d7 <close>
  return r;
 1f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <atoi>:

int
atoi(const char *s)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 206:	eb 25                	jmp    22d <atoi+0x34>
    n = n*10 + *s++ - '0';
 208:	8b 55 fc             	mov    -0x4(%ebp),%edx
 20b:	89 d0                	mov    %edx,%eax
 20d:	c1 e0 02             	shl    $0x2,%eax
 210:	01 d0                	add    %edx,%eax
 212:	01 c0                	add    %eax,%eax
 214:	89 c1                	mov    %eax,%ecx
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	8d 50 01             	lea    0x1(%eax),%edx
 21c:	89 55 08             	mov    %edx,0x8(%ebp)
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	0f be c0             	movsbl %al,%eax
 225:	01 c8                	add    %ecx,%eax
 227:	83 e8 30             	sub    $0x30,%eax
 22a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 22d:	8b 45 08             	mov    0x8(%ebp),%eax
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	3c 2f                	cmp    $0x2f,%al
 235:	7e 0a                	jle    241 <atoi+0x48>
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	3c 39                	cmp    $0x39,%al
 23f:	7e c7                	jle    208 <atoi+0xf>
  return n;
 241:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
 249:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 252:	8b 45 0c             	mov    0xc(%ebp),%eax
 255:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 258:	eb 17                	jmp    271 <memmove+0x2b>
    *dst++ = *src++;
 25a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 fc             	mov    %edx,-0x4(%ebp)
 263:	8b 55 f8             	mov    -0x8(%ebp),%edx
 266:	8d 4a 01             	lea    0x1(%edx),%ecx
 269:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 26c:	0f b6 12             	movzbl (%edx),%edx
 26f:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 271:	8b 45 10             	mov    0x10(%ebp),%eax
 274:	8d 50 ff             	lea    -0x1(%eax),%edx
 277:	89 55 10             	mov    %edx,0x10(%ebp)
 27a:	85 c0                	test   %eax,%eax
 27c:	7f dc                	jg     25a <memmove+0x14>
  return vdst;
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <ps>:

void ps(void) {
 283:	55                   	push   %ebp
 284:	89 e5                	mov    %esp,%ebp
 286:	57                   	push   %edi
 287:	56                   	push   %esi
 288:	53                   	push   %ebx
 289:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 28f:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 295:	89 04 24             	mov    %eax,(%esp)
 298:	e8 b2 01 00 00       	call   44f <getpinfo>

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 29d:	c7 44 24 04 0b 09 00 	movl   $0x90b,0x4(%esp)
 2a4:	00 
 2a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ac:	e8 8e 02 00 00       	call   53f <printf>

  int i = 0;
 2b1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 2b8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2bf:	e9 ce 00 00 00       	jmp    392 <ps+0x10f>
    if (pstat[i].inuse) {
 2c4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2c7:	89 d0                	mov    %edx,%eax
 2c9:	c1 e0 03             	shl    $0x3,%eax
 2cc:	01 d0                	add    %edx,%eax
 2ce:	c1 e0 02             	shl    $0x2,%eax
 2d1:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 2d4:	01 d8                	add    %ebx,%eax
 2d6:	2d 04 09 00 00       	sub    $0x904,%eax
 2db:	8b 00                	mov    (%eax),%eax
 2dd:	85 c0                	test   %eax,%eax
 2df:	0f 84 a9 00 00 00    	je     38e <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 2e5:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 2eb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2ee:	89 d0                	mov    %edx,%eax
 2f0:	c1 e0 03             	shl    $0x3,%eax
 2f3:	01 d0                	add    %edx,%eax
 2f5:	c1 e0 02             	shl    $0x2,%eax
 2f8:	83 c0 10             	add    $0x10,%eax
 2fb:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 2fe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 301:	89 d0                	mov    %edx,%eax
 303:	c1 e0 03             	shl    $0x3,%eax
 306:	01 d0                	add    %edx,%eax
 308:	c1 e0 02             	shl    $0x2,%eax
 30b:	8d 75 e8             	lea    -0x18(%ebp),%esi
 30e:	01 f0                	add    %esi,%eax
 310:	2d e4 08 00 00       	sub    $0x8e4,%eax
 315:	0f b6 00             	movzbl (%eax),%eax
 318:	0f be f0             	movsbl %al,%esi
 31b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 31e:	89 d0                	mov    %edx,%eax
 320:	c1 e0 03             	shl    $0x3,%eax
 323:	01 d0                	add    %edx,%eax
 325:	c1 e0 02             	shl    $0x2,%eax
 328:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 32b:	01 c8                	add    %ecx,%eax
 32d:	2d f8 08 00 00       	sub    $0x8f8,%eax
 332:	8b 18                	mov    (%eax),%ebx
 334:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 337:	89 d0                	mov    %edx,%eax
 339:	c1 e0 03             	shl    $0x3,%eax
 33c:	01 d0                	add    %edx,%eax
 33e:	c1 e0 02             	shl    $0x2,%eax
 341:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 344:	01 c8                	add    %ecx,%eax
 346:	2d 00 09 00 00       	sub    $0x900,%eax
 34b:	8b 08                	mov    (%eax),%ecx
 34d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 350:	89 d0                	mov    %edx,%eax
 352:	c1 e0 03             	shl    $0x3,%eax
 355:	01 d0                	add    %edx,%eax
 357:	c1 e0 02             	shl    $0x2,%eax
 35a:	8d 55 e8             	lea    -0x18(%ebp),%edx
 35d:	01 d0                	add    %edx,%eax
 35f:	2d fc 08 00 00       	sub    $0x8fc,%eax
 364:	8b 00                	mov    (%eax),%eax
 366:	89 7c 24 18          	mov    %edi,0x18(%esp)
 36a:	89 74 24 14          	mov    %esi,0x14(%esp)
 36e:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 372:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 376:	89 44 24 08          	mov    %eax,0x8(%esp)
 37a:	c7 44 24 04 24 09 00 	movl   $0x924,0x4(%esp)
 381:	00 
 382:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 389:	e8 b1 01 00 00       	call   53f <printf>
  for (i = 0; i < NPROC; ++i) {
 38e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 392:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 396:	0f 8e 28 ff ff ff    	jle    2c4 <ps+0x41>
    }
  }
 39c:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3a2:	5b                   	pop    %ebx
 3a3:	5e                   	pop    %esi
 3a4:	5f                   	pop    %edi
 3a5:	5d                   	pop    %ebp
 3a6:	c3                   	ret    

000003a7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a7:	b8 01 00 00 00       	mov    $0x1,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <exit>:
SYSCALL(exit)
 3af:	b8 02 00 00 00       	mov    $0x2,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <wait>:
SYSCALL(wait)
 3b7:	b8 03 00 00 00       	mov    $0x3,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <pipe>:
SYSCALL(pipe)
 3bf:	b8 04 00 00 00       	mov    $0x4,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <read>:
SYSCALL(read)
 3c7:	b8 05 00 00 00       	mov    $0x5,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <write>:
SYSCALL(write)
 3cf:	b8 10 00 00 00       	mov    $0x10,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <close>:
SYSCALL(close)
 3d7:	b8 15 00 00 00       	mov    $0x15,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <kill>:
SYSCALL(kill)
 3df:	b8 06 00 00 00       	mov    $0x6,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <exec>:
SYSCALL(exec)
 3e7:	b8 07 00 00 00       	mov    $0x7,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <open>:
SYSCALL(open)
 3ef:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <mknod>:
SYSCALL(mknod)
 3f7:	b8 11 00 00 00       	mov    $0x11,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <unlink>:
SYSCALL(unlink)
 3ff:	b8 12 00 00 00       	mov    $0x12,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <fstat>:
SYSCALL(fstat)
 407:	b8 08 00 00 00       	mov    $0x8,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <link>:
SYSCALL(link)
 40f:	b8 13 00 00 00       	mov    $0x13,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <mkdir>:
SYSCALL(mkdir)
 417:	b8 14 00 00 00       	mov    $0x14,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <chdir>:
SYSCALL(chdir)
 41f:	b8 09 00 00 00       	mov    $0x9,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <dup>:
SYSCALL(dup)
 427:	b8 0a 00 00 00       	mov    $0xa,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <getpid>:
SYSCALL(getpid)
 42f:	b8 0b 00 00 00       	mov    $0xb,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <sbrk>:
SYSCALL(sbrk)
 437:	b8 0c 00 00 00       	mov    $0xc,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <sleep>:
SYSCALL(sleep)
 43f:	b8 0d 00 00 00       	mov    $0xd,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <uptime>:
SYSCALL(uptime)
 447:	b8 0e 00 00 00       	mov    $0xe,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <getpinfo>:
SYSCALL(getpinfo)
 44f:	b8 16 00 00 00       	mov    $0x16,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <settickets>:
 457:	b8 17 00 00 00       	mov    $0x17,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 45f:	55                   	push   %ebp
 460:	89 e5                	mov    %esp,%ebp
 462:	83 ec 18             	sub    $0x18,%esp
 465:	8b 45 0c             	mov    0xc(%ebp),%eax
 468:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 46b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 472:	00 
 473:	8d 45 f4             	lea    -0xc(%ebp),%eax
 476:	89 44 24 04          	mov    %eax,0x4(%esp)
 47a:	8b 45 08             	mov    0x8(%ebp),%eax
 47d:	89 04 24             	mov    %eax,(%esp)
 480:	e8 4a ff ff ff       	call   3cf <write>
}
 485:	c9                   	leave  
 486:	c3                   	ret    

00000487 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 487:	55                   	push   %ebp
 488:	89 e5                	mov    %esp,%ebp
 48a:	56                   	push   %esi
 48b:	53                   	push   %ebx
 48c:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 48f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 496:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 49a:	74 17                	je     4b3 <printint+0x2c>
 49c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4a0:	79 11                	jns    4b3 <printint+0x2c>
    neg = 1;
 4a2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ac:	f7 d8                	neg    %eax
 4ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4b1:	eb 06                	jmp    4b9 <printint+0x32>
  } else {
    x = xx;
 4b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4c0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4c3:	8d 41 01             	lea    0x1(%ecx),%eax
 4c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4c9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4cf:	ba 00 00 00 00       	mov    $0x0,%edx
 4d4:	f7 f3                	div    %ebx
 4d6:	89 d0                	mov    %edx,%eax
 4d8:	0f b6 80 b0 0b 00 00 	movzbl 0xbb0(%eax),%eax
 4df:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4e3:	8b 75 10             	mov    0x10(%ebp),%esi
 4e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4e9:	ba 00 00 00 00       	mov    $0x0,%edx
 4ee:	f7 f6                	div    %esi
 4f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4f7:	75 c7                	jne    4c0 <printint+0x39>
  if(neg)
 4f9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4fd:	74 10                	je     50f <printint+0x88>
    buf[i++] = '-';
 4ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 502:	8d 50 01             	lea    0x1(%eax),%edx
 505:	89 55 f4             	mov    %edx,-0xc(%ebp)
 508:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 50d:	eb 1f                	jmp    52e <printint+0xa7>
 50f:	eb 1d                	jmp    52e <printint+0xa7>
    putc(fd, buf[i]);
 511:	8d 55 dc             	lea    -0x24(%ebp),%edx
 514:	8b 45 f4             	mov    -0xc(%ebp),%eax
 517:	01 d0                	add    %edx,%eax
 519:	0f b6 00             	movzbl (%eax),%eax
 51c:	0f be c0             	movsbl %al,%eax
 51f:	89 44 24 04          	mov    %eax,0x4(%esp)
 523:	8b 45 08             	mov    0x8(%ebp),%eax
 526:	89 04 24             	mov    %eax,(%esp)
 529:	e8 31 ff ff ff       	call   45f <putc>
  while(--i >= 0)
 52e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 532:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 536:	79 d9                	jns    511 <printint+0x8a>
}
 538:	83 c4 30             	add    $0x30,%esp
 53b:	5b                   	pop    %ebx
 53c:	5e                   	pop    %esi
 53d:	5d                   	pop    %ebp
 53e:	c3                   	ret    

0000053f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 53f:	55                   	push   %ebp
 540:	89 e5                	mov    %esp,%ebp
 542:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 545:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 54c:	8d 45 0c             	lea    0xc(%ebp),%eax
 54f:	83 c0 04             	add    $0x4,%eax
 552:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 555:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 55c:	e9 7c 01 00 00       	jmp    6dd <printf+0x19e>
    c = fmt[i] & 0xff;
 561:	8b 55 0c             	mov    0xc(%ebp),%edx
 564:	8b 45 f0             	mov    -0x10(%ebp),%eax
 567:	01 d0                	add    %edx,%eax
 569:	0f b6 00             	movzbl (%eax),%eax
 56c:	0f be c0             	movsbl %al,%eax
 56f:	25 ff 00 00 00       	and    $0xff,%eax
 574:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 577:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 57b:	75 2c                	jne    5a9 <printf+0x6a>
      if(c == '%'){
 57d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 581:	75 0c                	jne    58f <printf+0x50>
        state = '%';
 583:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 58a:	e9 4a 01 00 00       	jmp    6d9 <printf+0x19a>
      } else {
        putc(fd, c);
 58f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 592:	0f be c0             	movsbl %al,%eax
 595:	89 44 24 04          	mov    %eax,0x4(%esp)
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	89 04 24             	mov    %eax,(%esp)
 59f:	e8 bb fe ff ff       	call   45f <putc>
 5a4:	e9 30 01 00 00       	jmp    6d9 <printf+0x19a>
      }
    } else if(state == '%'){
 5a9:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5ad:	0f 85 26 01 00 00    	jne    6d9 <printf+0x19a>
      if(c == 'd'){
 5b3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5b7:	75 2d                	jne    5e6 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5bc:	8b 00                	mov    (%eax),%eax
 5be:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5c5:	00 
 5c6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5cd:	00 
 5ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d2:	8b 45 08             	mov    0x8(%ebp),%eax
 5d5:	89 04 24             	mov    %eax,(%esp)
 5d8:	e8 aa fe ff ff       	call   487 <printint>
        ap++;
 5dd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e1:	e9 ec 00 00 00       	jmp    6d2 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5e6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5ea:	74 06                	je     5f2 <printf+0xb3>
 5ec:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5f0:	75 2d                	jne    61f <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f5:	8b 00                	mov    (%eax),%eax
 5f7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5fe:	00 
 5ff:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 606:	00 
 607:	89 44 24 04          	mov    %eax,0x4(%esp)
 60b:	8b 45 08             	mov    0x8(%ebp),%eax
 60e:	89 04 24             	mov    %eax,(%esp)
 611:	e8 71 fe ff ff       	call   487 <printint>
        ap++;
 616:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 61a:	e9 b3 00 00 00       	jmp    6d2 <printf+0x193>
      } else if(c == 's'){
 61f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 623:	75 45                	jne    66a <printf+0x12b>
        s = (char*)*ap;
 625:	8b 45 e8             	mov    -0x18(%ebp),%eax
 628:	8b 00                	mov    (%eax),%eax
 62a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 62d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 631:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 635:	75 09                	jne    640 <printf+0x101>
          s = "(null)";
 637:	c7 45 f4 34 09 00 00 	movl   $0x934,-0xc(%ebp)
        while(*s != 0){
 63e:	eb 1e                	jmp    65e <printf+0x11f>
 640:	eb 1c                	jmp    65e <printf+0x11f>
          putc(fd, *s);
 642:	8b 45 f4             	mov    -0xc(%ebp),%eax
 645:	0f b6 00             	movzbl (%eax),%eax
 648:	0f be c0             	movsbl %al,%eax
 64b:	89 44 24 04          	mov    %eax,0x4(%esp)
 64f:	8b 45 08             	mov    0x8(%ebp),%eax
 652:	89 04 24             	mov    %eax,(%esp)
 655:	e8 05 fe ff ff       	call   45f <putc>
          s++;
 65a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 65e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 661:	0f b6 00             	movzbl (%eax),%eax
 664:	84 c0                	test   %al,%al
 666:	75 da                	jne    642 <printf+0x103>
 668:	eb 68                	jmp    6d2 <printf+0x193>
        }
      } else if(c == 'c'){
 66a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 66e:	75 1d                	jne    68d <printf+0x14e>
        putc(fd, *ap);
 670:	8b 45 e8             	mov    -0x18(%ebp),%eax
 673:	8b 00                	mov    (%eax),%eax
 675:	0f be c0             	movsbl %al,%eax
 678:	89 44 24 04          	mov    %eax,0x4(%esp)
 67c:	8b 45 08             	mov    0x8(%ebp),%eax
 67f:	89 04 24             	mov    %eax,(%esp)
 682:	e8 d8 fd ff ff       	call   45f <putc>
        ap++;
 687:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 68b:	eb 45                	jmp    6d2 <printf+0x193>
      } else if(c == '%'){
 68d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 691:	75 17                	jne    6aa <printf+0x16b>
        putc(fd, c);
 693:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 696:	0f be c0             	movsbl %al,%eax
 699:	89 44 24 04          	mov    %eax,0x4(%esp)
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	89 04 24             	mov    %eax,(%esp)
 6a3:	e8 b7 fd ff ff       	call   45f <putc>
 6a8:	eb 28                	jmp    6d2 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6aa:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6b1:	00 
 6b2:	8b 45 08             	mov    0x8(%ebp),%eax
 6b5:	89 04 24             	mov    %eax,(%esp)
 6b8:	e8 a2 fd ff ff       	call   45f <putc>
        putc(fd, c);
 6bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c0:	0f be c0             	movsbl %al,%eax
 6c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ca:	89 04 24             	mov    %eax,(%esp)
 6cd:	e8 8d fd ff ff       	call   45f <putc>
      }
      state = 0;
 6d2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6d9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6dd:	8b 55 0c             	mov    0xc(%ebp),%edx
 6e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e3:	01 d0                	add    %edx,%eax
 6e5:	0f b6 00             	movzbl (%eax),%eax
 6e8:	84 c0                	test   %al,%al
 6ea:	0f 85 71 fe ff ff    	jne    561 <printf+0x22>
    }
  }
}
 6f0:	c9                   	leave  
 6f1:	c3                   	ret    

000006f2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f2:	55                   	push   %ebp
 6f3:	89 e5                	mov    %esp,%ebp
 6f5:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6f8:	8b 45 08             	mov    0x8(%ebp),%eax
 6fb:	83 e8 08             	sub    $0x8,%eax
 6fe:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 706:	89 45 fc             	mov    %eax,-0x4(%ebp)
 709:	eb 24                	jmp    72f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70e:	8b 00                	mov    (%eax),%eax
 710:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 713:	77 12                	ja     727 <free+0x35>
 715:	8b 45 f8             	mov    -0x8(%ebp),%eax
 718:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 71b:	77 24                	ja     741 <free+0x4f>
 71d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 720:	8b 00                	mov    (%eax),%eax
 722:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 725:	77 1a                	ja     741 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 727:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72a:	8b 00                	mov    (%eax),%eax
 72c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 72f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 732:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 735:	76 d4                	jbe    70b <free+0x19>
 737:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73a:	8b 00                	mov    (%eax),%eax
 73c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 73f:	76 ca                	jbe    70b <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 741:	8b 45 f8             	mov    -0x8(%ebp),%eax
 744:	8b 40 04             	mov    0x4(%eax),%eax
 747:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 74e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 751:	01 c2                	add    %eax,%edx
 753:	8b 45 fc             	mov    -0x4(%ebp),%eax
 756:	8b 00                	mov    (%eax),%eax
 758:	39 c2                	cmp    %eax,%edx
 75a:	75 24                	jne    780 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 75c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75f:	8b 50 04             	mov    0x4(%eax),%edx
 762:	8b 45 fc             	mov    -0x4(%ebp),%eax
 765:	8b 00                	mov    (%eax),%eax
 767:	8b 40 04             	mov    0x4(%eax),%eax
 76a:	01 c2                	add    %eax,%edx
 76c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 772:	8b 45 fc             	mov    -0x4(%ebp),%eax
 775:	8b 00                	mov    (%eax),%eax
 777:	8b 10                	mov    (%eax),%edx
 779:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77c:	89 10                	mov    %edx,(%eax)
 77e:	eb 0a                	jmp    78a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 780:	8b 45 fc             	mov    -0x4(%ebp),%eax
 783:	8b 10                	mov    (%eax),%edx
 785:	8b 45 f8             	mov    -0x8(%ebp),%eax
 788:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 78a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78d:	8b 40 04             	mov    0x4(%eax),%eax
 790:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	01 d0                	add    %edx,%eax
 79c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 79f:	75 20                	jne    7c1 <free+0xcf>
    p->s.size += bp->s.size;
 7a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a4:	8b 50 04             	mov    0x4(%eax),%edx
 7a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7aa:	8b 40 04             	mov    0x4(%eax),%eax
 7ad:	01 c2                	add    %eax,%edx
 7af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b8:	8b 10                	mov    (%eax),%edx
 7ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bd:	89 10                	mov    %edx,(%eax)
 7bf:	eb 08                	jmp    7c9 <free+0xd7>
  } else
    p->s.ptr = bp;
 7c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7c7:	89 10                	mov    %edx,(%eax)
  freep = p;
 7c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cc:	a3 cc 0b 00 00       	mov    %eax,0xbcc
}
 7d1:	c9                   	leave  
 7d2:	c3                   	ret    

000007d3 <morecore>:

static Header*
morecore(uint nu)
{
 7d3:	55                   	push   %ebp
 7d4:	89 e5                	mov    %esp,%ebp
 7d6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7d9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7e0:	77 07                	ja     7e9 <morecore+0x16>
    nu = 4096;
 7e2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ec:	c1 e0 03             	shl    $0x3,%eax
 7ef:	89 04 24             	mov    %eax,(%esp)
 7f2:	e8 40 fc ff ff       	call   437 <sbrk>
 7f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7fa:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7fe:	75 07                	jne    807 <morecore+0x34>
    return 0;
 800:	b8 00 00 00 00       	mov    $0x0,%eax
 805:	eb 22                	jmp    829 <morecore+0x56>
  hp = (Header*)p;
 807:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 80d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 810:	8b 55 08             	mov    0x8(%ebp),%edx
 813:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 816:	8b 45 f0             	mov    -0x10(%ebp),%eax
 819:	83 c0 08             	add    $0x8,%eax
 81c:	89 04 24             	mov    %eax,(%esp)
 81f:	e8 ce fe ff ff       	call   6f2 <free>
  return freep;
 824:	a1 cc 0b 00 00       	mov    0xbcc,%eax
}
 829:	c9                   	leave  
 82a:	c3                   	ret    

0000082b <malloc>:

void*
malloc(uint nbytes)
{
 82b:	55                   	push   %ebp
 82c:	89 e5                	mov    %esp,%ebp
 82e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 831:	8b 45 08             	mov    0x8(%ebp),%eax
 834:	83 c0 07             	add    $0x7,%eax
 837:	c1 e8 03             	shr    $0x3,%eax
 83a:	83 c0 01             	add    $0x1,%eax
 83d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 840:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 845:	89 45 f0             	mov    %eax,-0x10(%ebp)
 848:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 84c:	75 23                	jne    871 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 84e:	c7 45 f0 c4 0b 00 00 	movl   $0xbc4,-0x10(%ebp)
 855:	8b 45 f0             	mov    -0x10(%ebp),%eax
 858:	a3 cc 0b 00 00       	mov    %eax,0xbcc
 85d:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 862:	a3 c4 0b 00 00       	mov    %eax,0xbc4
    base.s.size = 0;
 867:	c7 05 c8 0b 00 00 00 	movl   $0x0,0xbc8
 86e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 871:	8b 45 f0             	mov    -0x10(%ebp),%eax
 874:	8b 00                	mov    (%eax),%eax
 876:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 879:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87c:	8b 40 04             	mov    0x4(%eax),%eax
 87f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 882:	72 4d                	jb     8d1 <malloc+0xa6>
      if(p->s.size == nunits)
 884:	8b 45 f4             	mov    -0xc(%ebp),%eax
 887:	8b 40 04             	mov    0x4(%eax),%eax
 88a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 88d:	75 0c                	jne    89b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 88f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 892:	8b 10                	mov    (%eax),%edx
 894:	8b 45 f0             	mov    -0x10(%ebp),%eax
 897:	89 10                	mov    %edx,(%eax)
 899:	eb 26                	jmp    8c1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 89b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89e:	8b 40 04             	mov    0x4(%eax),%eax
 8a1:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8a4:	89 c2                	mov    %eax,%edx
 8a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8af:	8b 40 04             	mov    0x4(%eax),%eax
 8b2:	c1 e0 03             	shl    $0x3,%eax
 8b5:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bb:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8be:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c4:	a3 cc 0b 00 00       	mov    %eax,0xbcc
      return (void*)(p + 1);
 8c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cc:	83 c0 08             	add    $0x8,%eax
 8cf:	eb 38                	jmp    909 <malloc+0xde>
    }
    if(p == freep)
 8d1:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 8d6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8d9:	75 1b                	jne    8f6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8db:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8de:	89 04 24             	mov    %eax,(%esp)
 8e1:	e8 ed fe ff ff       	call   7d3 <morecore>
 8e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8ed:	75 07                	jne    8f6 <malloc+0xcb>
        return 0;
 8ef:	b8 00 00 00 00       	mov    $0x0,%eax
 8f4:	eb 13                	jmp    909 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ff:	8b 00                	mov    (%eax),%eax
 901:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 904:	e9 70 ff ff ff       	jmp    879 <malloc+0x4e>
}
 909:	c9                   	leave  
 90a:	c3                   	ret    
