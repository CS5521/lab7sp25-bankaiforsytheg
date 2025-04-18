
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

  // Print the information TODOWHAT

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 29d:	c7 44 24 04 03 09 00 	movl   $0x903,0x4(%esp)
 2a4:	00 
 2a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ac:	e8 86 02 00 00       	call   537 <printf>

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
 37a:	c7 44 24 04 1c 09 00 	movl   $0x91c,0x4(%esp)
 381:	00 
 382:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 389:	e8 a9 01 00 00       	call   537 <printf>
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

00000457 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 457:	55                   	push   %ebp
 458:	89 e5                	mov    %esp,%ebp
 45a:	83 ec 18             	sub    $0x18,%esp
 45d:	8b 45 0c             	mov    0xc(%ebp),%eax
 460:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 463:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 46a:	00 
 46b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 46e:	89 44 24 04          	mov    %eax,0x4(%esp)
 472:	8b 45 08             	mov    0x8(%ebp),%eax
 475:	89 04 24             	mov    %eax,(%esp)
 478:	e8 52 ff ff ff       	call   3cf <write>
}
 47d:	c9                   	leave  
 47e:	c3                   	ret    

0000047f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 47f:	55                   	push   %ebp
 480:	89 e5                	mov    %esp,%ebp
 482:	56                   	push   %esi
 483:	53                   	push   %ebx
 484:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 487:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 48e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 492:	74 17                	je     4ab <printint+0x2c>
 494:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 498:	79 11                	jns    4ab <printint+0x2c>
    neg = 1;
 49a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a4:	f7 d8                	neg    %eax
 4a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a9:	eb 06                	jmp    4b1 <printint+0x32>
  } else {
    x = xx;
 4ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4b8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4bb:	8d 41 01             	lea    0x1(%ecx),%eax
 4be:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4c1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c7:	ba 00 00 00 00       	mov    $0x0,%edx
 4cc:	f7 f3                	div    %ebx
 4ce:	89 d0                	mov    %edx,%eax
 4d0:	0f b6 80 a8 0b 00 00 	movzbl 0xba8(%eax),%eax
 4d7:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4db:	8b 75 10             	mov    0x10(%ebp),%esi
 4de:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4e1:	ba 00 00 00 00       	mov    $0x0,%edx
 4e6:	f7 f6                	div    %esi
 4e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4eb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4ef:	75 c7                	jne    4b8 <printint+0x39>
  if(neg)
 4f1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4f5:	74 10                	je     507 <printint+0x88>
    buf[i++] = '-';
 4f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4fa:	8d 50 01             	lea    0x1(%eax),%edx
 4fd:	89 55 f4             	mov    %edx,-0xc(%ebp)
 500:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 505:	eb 1f                	jmp    526 <printint+0xa7>
 507:	eb 1d                	jmp    526 <printint+0xa7>
    putc(fd, buf[i]);
 509:	8d 55 dc             	lea    -0x24(%ebp),%edx
 50c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50f:	01 d0                	add    %edx,%eax
 511:	0f b6 00             	movzbl (%eax),%eax
 514:	0f be c0             	movsbl %al,%eax
 517:	89 44 24 04          	mov    %eax,0x4(%esp)
 51b:	8b 45 08             	mov    0x8(%ebp),%eax
 51e:	89 04 24             	mov    %eax,(%esp)
 521:	e8 31 ff ff ff       	call   457 <putc>
  while(--i >= 0)
 526:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 52a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 52e:	79 d9                	jns    509 <printint+0x8a>
}
 530:	83 c4 30             	add    $0x30,%esp
 533:	5b                   	pop    %ebx
 534:	5e                   	pop    %esi
 535:	5d                   	pop    %ebp
 536:	c3                   	ret    

00000537 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 537:	55                   	push   %ebp
 538:	89 e5                	mov    %esp,%ebp
 53a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 53d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 544:	8d 45 0c             	lea    0xc(%ebp),%eax
 547:	83 c0 04             	add    $0x4,%eax
 54a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 54d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 554:	e9 7c 01 00 00       	jmp    6d5 <printf+0x19e>
    c = fmt[i] & 0xff;
 559:	8b 55 0c             	mov    0xc(%ebp),%edx
 55c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 55f:	01 d0                	add    %edx,%eax
 561:	0f b6 00             	movzbl (%eax),%eax
 564:	0f be c0             	movsbl %al,%eax
 567:	25 ff 00 00 00       	and    $0xff,%eax
 56c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 56f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 573:	75 2c                	jne    5a1 <printf+0x6a>
      if(c == '%'){
 575:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 579:	75 0c                	jne    587 <printf+0x50>
        state = '%';
 57b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 582:	e9 4a 01 00 00       	jmp    6d1 <printf+0x19a>
      } else {
        putc(fd, c);
 587:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58a:	0f be c0             	movsbl %al,%eax
 58d:	89 44 24 04          	mov    %eax,0x4(%esp)
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	89 04 24             	mov    %eax,(%esp)
 597:	e8 bb fe ff ff       	call   457 <putc>
 59c:	e9 30 01 00 00       	jmp    6d1 <printf+0x19a>
      }
    } else if(state == '%'){
 5a1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5a5:	0f 85 26 01 00 00    	jne    6d1 <printf+0x19a>
      if(c == 'd'){
 5ab:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5af:	75 2d                	jne    5de <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b4:	8b 00                	mov    (%eax),%eax
 5b6:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5bd:	00 
 5be:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5c5:	00 
 5c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ca:	8b 45 08             	mov    0x8(%ebp),%eax
 5cd:	89 04 24             	mov    %eax,(%esp)
 5d0:	e8 aa fe ff ff       	call   47f <printint>
        ap++;
 5d5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d9:	e9 ec 00 00 00       	jmp    6ca <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5de:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5e2:	74 06                	je     5ea <printf+0xb3>
 5e4:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5e8:	75 2d                	jne    617 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ed:	8b 00                	mov    (%eax),%eax
 5ef:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5f6:	00 
 5f7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5fe:	00 
 5ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 603:	8b 45 08             	mov    0x8(%ebp),%eax
 606:	89 04 24             	mov    %eax,(%esp)
 609:	e8 71 fe ff ff       	call   47f <printint>
        ap++;
 60e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 612:	e9 b3 00 00 00       	jmp    6ca <printf+0x193>
      } else if(c == 's'){
 617:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 61b:	75 45                	jne    662 <printf+0x12b>
        s = (char*)*ap;
 61d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 620:	8b 00                	mov    (%eax),%eax
 622:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 625:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 629:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 62d:	75 09                	jne    638 <printf+0x101>
          s = "(null)";
 62f:	c7 45 f4 2c 09 00 00 	movl   $0x92c,-0xc(%ebp)
        while(*s != 0){
 636:	eb 1e                	jmp    656 <printf+0x11f>
 638:	eb 1c                	jmp    656 <printf+0x11f>
          putc(fd, *s);
 63a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63d:	0f b6 00             	movzbl (%eax),%eax
 640:	0f be c0             	movsbl %al,%eax
 643:	89 44 24 04          	mov    %eax,0x4(%esp)
 647:	8b 45 08             	mov    0x8(%ebp),%eax
 64a:	89 04 24             	mov    %eax,(%esp)
 64d:	e8 05 fe ff ff       	call   457 <putc>
          s++;
 652:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 656:	8b 45 f4             	mov    -0xc(%ebp),%eax
 659:	0f b6 00             	movzbl (%eax),%eax
 65c:	84 c0                	test   %al,%al
 65e:	75 da                	jne    63a <printf+0x103>
 660:	eb 68                	jmp    6ca <printf+0x193>
        }
      } else if(c == 'c'){
 662:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 666:	75 1d                	jne    685 <printf+0x14e>
        putc(fd, *ap);
 668:	8b 45 e8             	mov    -0x18(%ebp),%eax
 66b:	8b 00                	mov    (%eax),%eax
 66d:	0f be c0             	movsbl %al,%eax
 670:	89 44 24 04          	mov    %eax,0x4(%esp)
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	89 04 24             	mov    %eax,(%esp)
 67a:	e8 d8 fd ff ff       	call   457 <putc>
        ap++;
 67f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 683:	eb 45                	jmp    6ca <printf+0x193>
      } else if(c == '%'){
 685:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 689:	75 17                	jne    6a2 <printf+0x16b>
        putc(fd, c);
 68b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 68e:	0f be c0             	movsbl %al,%eax
 691:	89 44 24 04          	mov    %eax,0x4(%esp)
 695:	8b 45 08             	mov    0x8(%ebp),%eax
 698:	89 04 24             	mov    %eax,(%esp)
 69b:	e8 b7 fd ff ff       	call   457 <putc>
 6a0:	eb 28                	jmp    6ca <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6a2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6a9:	00 
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	89 04 24             	mov    %eax,(%esp)
 6b0:	e8 a2 fd ff ff       	call   457 <putc>
        putc(fd, c);
 6b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b8:	0f be c0             	movsbl %al,%eax
 6bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bf:	8b 45 08             	mov    0x8(%ebp),%eax
 6c2:	89 04 24             	mov    %eax,(%esp)
 6c5:	e8 8d fd ff ff       	call   457 <putc>
      }
      state = 0;
 6ca:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6d1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6d5:	8b 55 0c             	mov    0xc(%ebp),%edx
 6d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6db:	01 d0                	add    %edx,%eax
 6dd:	0f b6 00             	movzbl (%eax),%eax
 6e0:	84 c0                	test   %al,%al
 6e2:	0f 85 71 fe ff ff    	jne    559 <printf+0x22>
    }
  }
}
 6e8:	c9                   	leave  
 6e9:	c3                   	ret    

000006ea <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ea:	55                   	push   %ebp
 6eb:	89 e5                	mov    %esp,%ebp
 6ed:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6f0:	8b 45 08             	mov    0x8(%ebp),%eax
 6f3:	83 e8 08             	sub    $0x8,%eax
 6f6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f9:	a1 c4 0b 00 00       	mov    0xbc4,%eax
 6fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
 701:	eb 24                	jmp    727 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 703:	8b 45 fc             	mov    -0x4(%ebp),%eax
 706:	8b 00                	mov    (%eax),%eax
 708:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 70b:	77 12                	ja     71f <free+0x35>
 70d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 710:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 713:	77 24                	ja     739 <free+0x4f>
 715:	8b 45 fc             	mov    -0x4(%ebp),%eax
 718:	8b 00                	mov    (%eax),%eax
 71a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 71d:	77 1a                	ja     739 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 722:	8b 00                	mov    (%eax),%eax
 724:	89 45 fc             	mov    %eax,-0x4(%ebp)
 727:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 72d:	76 d4                	jbe    703 <free+0x19>
 72f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 732:	8b 00                	mov    (%eax),%eax
 734:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 737:	76 ca                	jbe    703 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 739:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73c:	8b 40 04             	mov    0x4(%eax),%eax
 73f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 746:	8b 45 f8             	mov    -0x8(%ebp),%eax
 749:	01 c2                	add    %eax,%edx
 74b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74e:	8b 00                	mov    (%eax),%eax
 750:	39 c2                	cmp    %eax,%edx
 752:	75 24                	jne    778 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 754:	8b 45 f8             	mov    -0x8(%ebp),%eax
 757:	8b 50 04             	mov    0x4(%eax),%edx
 75a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75d:	8b 00                	mov    (%eax),%eax
 75f:	8b 40 04             	mov    0x4(%eax),%eax
 762:	01 c2                	add    %eax,%edx
 764:	8b 45 f8             	mov    -0x8(%ebp),%eax
 767:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 76a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76d:	8b 00                	mov    (%eax),%eax
 76f:	8b 10                	mov    (%eax),%edx
 771:	8b 45 f8             	mov    -0x8(%ebp),%eax
 774:	89 10                	mov    %edx,(%eax)
 776:	eb 0a                	jmp    782 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 778:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77b:	8b 10                	mov    (%eax),%edx
 77d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 780:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 782:	8b 45 fc             	mov    -0x4(%ebp),%eax
 785:	8b 40 04             	mov    0x4(%eax),%eax
 788:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 78f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 792:	01 d0                	add    %edx,%eax
 794:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 797:	75 20                	jne    7b9 <free+0xcf>
    p->s.size += bp->s.size;
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	8b 50 04             	mov    0x4(%eax),%edx
 79f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a2:	8b 40 04             	mov    0x4(%eax),%eax
 7a5:	01 c2                	add    %eax,%edx
 7a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7aa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b0:	8b 10                	mov    (%eax),%edx
 7b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b5:	89 10                	mov    %edx,(%eax)
 7b7:	eb 08                	jmp    7c1 <free+0xd7>
  } else
    p->s.ptr = bp;
 7b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7bf:	89 10                	mov    %edx,(%eax)
  freep = p;
 7c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c4:	a3 c4 0b 00 00       	mov    %eax,0xbc4
}
 7c9:	c9                   	leave  
 7ca:	c3                   	ret    

000007cb <morecore>:

static Header*
morecore(uint nu)
{
 7cb:	55                   	push   %ebp
 7cc:	89 e5                	mov    %esp,%ebp
 7ce:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7d1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7d8:	77 07                	ja     7e1 <morecore+0x16>
    nu = 4096;
 7da:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7e1:	8b 45 08             	mov    0x8(%ebp),%eax
 7e4:	c1 e0 03             	shl    $0x3,%eax
 7e7:	89 04 24             	mov    %eax,(%esp)
 7ea:	e8 48 fc ff ff       	call   437 <sbrk>
 7ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7f2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7f6:	75 07                	jne    7ff <morecore+0x34>
    return 0;
 7f8:	b8 00 00 00 00       	mov    $0x0,%eax
 7fd:	eb 22                	jmp    821 <morecore+0x56>
  hp = (Header*)p;
 7ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 802:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 805:	8b 45 f0             	mov    -0x10(%ebp),%eax
 808:	8b 55 08             	mov    0x8(%ebp),%edx
 80b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 80e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 811:	83 c0 08             	add    $0x8,%eax
 814:	89 04 24             	mov    %eax,(%esp)
 817:	e8 ce fe ff ff       	call   6ea <free>
  return freep;
 81c:	a1 c4 0b 00 00       	mov    0xbc4,%eax
}
 821:	c9                   	leave  
 822:	c3                   	ret    

00000823 <malloc>:

void*
malloc(uint nbytes)
{
 823:	55                   	push   %ebp
 824:	89 e5                	mov    %esp,%ebp
 826:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 829:	8b 45 08             	mov    0x8(%ebp),%eax
 82c:	83 c0 07             	add    $0x7,%eax
 82f:	c1 e8 03             	shr    $0x3,%eax
 832:	83 c0 01             	add    $0x1,%eax
 835:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 838:	a1 c4 0b 00 00       	mov    0xbc4,%eax
 83d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 840:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 844:	75 23                	jne    869 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 846:	c7 45 f0 bc 0b 00 00 	movl   $0xbbc,-0x10(%ebp)
 84d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 850:	a3 c4 0b 00 00       	mov    %eax,0xbc4
 855:	a1 c4 0b 00 00       	mov    0xbc4,%eax
 85a:	a3 bc 0b 00 00       	mov    %eax,0xbbc
    base.s.size = 0;
 85f:	c7 05 c0 0b 00 00 00 	movl   $0x0,0xbc0
 866:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 869:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86c:	8b 00                	mov    (%eax),%eax
 86e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 871:	8b 45 f4             	mov    -0xc(%ebp),%eax
 874:	8b 40 04             	mov    0x4(%eax),%eax
 877:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 87a:	72 4d                	jb     8c9 <malloc+0xa6>
      if(p->s.size == nunits)
 87c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87f:	8b 40 04             	mov    0x4(%eax),%eax
 882:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 885:	75 0c                	jne    893 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 887:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88a:	8b 10                	mov    (%eax),%edx
 88c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88f:	89 10                	mov    %edx,(%eax)
 891:	eb 26                	jmp    8b9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 893:	8b 45 f4             	mov    -0xc(%ebp),%eax
 896:	8b 40 04             	mov    0x4(%eax),%eax
 899:	2b 45 ec             	sub    -0x14(%ebp),%eax
 89c:	89 c2                	mov    %eax,%edx
 89e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a7:	8b 40 04             	mov    0x4(%eax),%eax
 8aa:	c1 e0 03             	shl    $0x3,%eax
 8ad:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8b6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bc:	a3 c4 0b 00 00       	mov    %eax,0xbc4
      return (void*)(p + 1);
 8c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c4:	83 c0 08             	add    $0x8,%eax
 8c7:	eb 38                	jmp    901 <malloc+0xde>
    }
    if(p == freep)
 8c9:	a1 c4 0b 00 00       	mov    0xbc4,%eax
 8ce:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8d1:	75 1b                	jne    8ee <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8d6:	89 04 24             	mov    %eax,(%esp)
 8d9:	e8 ed fe ff ff       	call   7cb <morecore>
 8de:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8e5:	75 07                	jne    8ee <malloc+0xcb>
        return 0;
 8e7:	b8 00 00 00 00       	mov    $0x0,%eax
 8ec:	eb 13                	jmp    901 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f7:	8b 00                	mov    (%eax),%eax
 8f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8fc:	e9 70 ff ff ff       	jmp    871 <malloc+0x4e>
}
 901:	c9                   	leave  
 902:	c3                   	ret    
