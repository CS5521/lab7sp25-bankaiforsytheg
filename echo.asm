
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 4b                	jmp    5e <main+0x5e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 54 09 00 00       	mov    $0x954,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 56 09 00 00       	mov    $0x956,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 58 09 00 	movl   $0x958,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 2f 05 00 00       	call   588 <printf>
  for(i = 1; i < argc; i++)
  59:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  5e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  62:	3b 45 08             	cmp    0x8(%ebp),%eax
  65:	7c ac                	jl     13 <main+0x13>
  exit();
  67:	e8 8c 03 00 00       	call   3f8 <exit>

0000006c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	57                   	push   %edi
  70:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  71:	8b 4d 08             	mov    0x8(%ebp),%ecx
  74:	8b 55 10             	mov    0x10(%ebp),%edx
  77:	8b 45 0c             	mov    0xc(%ebp),%eax
  7a:	89 cb                	mov    %ecx,%ebx
  7c:	89 df                	mov    %ebx,%edi
  7e:	89 d1                	mov    %edx,%ecx
  80:	fc                   	cld    
  81:	f3 aa                	rep stos %al,%es:(%edi)
  83:	89 ca                	mov    %ecx,%edx
  85:	89 fb                	mov    %edi,%ebx
  87:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  8d:	5b                   	pop    %ebx
  8e:	5f                   	pop    %edi
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    

00000091 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  94:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  9d:	90                   	nop
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	8d 50 01             	lea    0x1(%eax),%edx
  a4:	89 55 08             	mov    %edx,0x8(%ebp)
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  aa:	8d 4a 01             	lea    0x1(%edx),%ecx
  ad:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b0:	0f b6 12             	movzbl (%edx),%edx
  b3:	88 10                	mov    %dl,(%eax)
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	84 c0                	test   %al,%al
  ba:	75 e2                	jne    9e <strcpy+0xd>
    ;
  return os;
  bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  bf:	c9                   	leave  
  c0:	c3                   	ret    

000000c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c4:	eb 08                	jmp    ce <strcmp+0xd>
    p++, q++;
  c6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ca:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  ce:	8b 45 08             	mov    0x8(%ebp),%eax
  d1:	0f b6 00             	movzbl (%eax),%eax
  d4:	84 c0                	test   %al,%al
  d6:	74 10                	je     e8 <strcmp+0x27>
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	0f b6 10             	movzbl (%eax),%edx
  de:	8b 45 0c             	mov    0xc(%ebp),%eax
  e1:	0f b6 00             	movzbl (%eax),%eax
  e4:	38 c2                	cmp    %al,%dl
  e6:	74 de                	je     c6 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  e8:	8b 45 08             	mov    0x8(%ebp),%eax
  eb:	0f b6 00             	movzbl (%eax),%eax
  ee:	0f b6 d0             	movzbl %al,%edx
  f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 c0             	movzbl %al,%eax
  fa:	29 c2                	sub    %eax,%edx
  fc:	89 d0                	mov    %edx,%eax
}
  fe:	5d                   	pop    %ebp
  ff:	c3                   	ret    

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 106:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 10d:	eb 04                	jmp    113 <strlen+0x13>
 10f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 113:	8b 55 fc             	mov    -0x4(%ebp),%edx
 116:	8b 45 08             	mov    0x8(%ebp),%eax
 119:	01 d0                	add    %edx,%eax
 11b:	0f b6 00             	movzbl (%eax),%eax
 11e:	84 c0                	test   %al,%al
 120:	75 ed                	jne    10f <strlen+0xf>
    ;
  return n;
 122:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 125:	c9                   	leave  
 126:	c3                   	ret    

00000127 <memset>:

void*
memset(void *dst, int c, uint n)
{
 127:	55                   	push   %ebp
 128:	89 e5                	mov    %esp,%ebp
 12a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 12d:	8b 45 10             	mov    0x10(%ebp),%eax
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	8b 45 0c             	mov    0xc(%ebp),%eax
 137:	89 44 24 04          	mov    %eax,0x4(%esp)
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 04 24             	mov    %eax,(%esp)
 141:	e8 26 ff ff ff       	call   6c <stosb>
  return dst;
 146:	8b 45 08             	mov    0x8(%ebp),%eax
}
 149:	c9                   	leave  
 14a:	c3                   	ret    

0000014b <strchr>:

char*
strchr(const char *s, char c)
{
 14b:	55                   	push   %ebp
 14c:	89 e5                	mov    %esp,%ebp
 14e:	83 ec 04             	sub    $0x4,%esp
 151:	8b 45 0c             	mov    0xc(%ebp),%eax
 154:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 157:	eb 14                	jmp    16d <strchr+0x22>
    if(*s == c)
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	0f b6 00             	movzbl (%eax),%eax
 15f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 162:	75 05                	jne    169 <strchr+0x1e>
      return (char*)s;
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	eb 13                	jmp    17c <strchr+0x31>
  for(; *s; s++)
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	84 c0                	test   %al,%al
 175:	75 e2                	jne    159 <strchr+0xe>
  return 0;
 177:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17c:	c9                   	leave  
 17d:	c3                   	ret    

0000017e <gets>:

char*
gets(char *buf, int max)
{
 17e:	55                   	push   %ebp
 17f:	89 e5                	mov    %esp,%ebp
 181:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 184:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18b:	eb 4c                	jmp    1d9 <gets+0x5b>
    cc = read(0, &c, 1);
 18d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 194:	00 
 195:	8d 45 ef             	lea    -0x11(%ebp),%eax
 198:	89 44 24 04          	mov    %eax,0x4(%esp)
 19c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a3:	e8 68 02 00 00       	call   410 <read>
 1a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1af:	7f 02                	jg     1b3 <gets+0x35>
      break;
 1b1:	eb 31                	jmp    1e4 <gets+0x66>
    buf[i++] = c;
 1b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b6:	8d 50 01             	lea    0x1(%eax),%edx
 1b9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1bc:	89 c2                	mov    %eax,%edx
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	01 c2                	add    %eax,%edx
 1c3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 13                	je     1e4 <gets+0x66>
 1d1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 0b                	je     1e4 <gets+0x66>
  for(i=0; i+1 < max; ){
 1d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e2:	7c a9                	jl     18d <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	01 d0                	add    %edx,%eax
 1ec:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 201:	00 
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	89 04 24             	mov    %eax,(%esp)
 208:	e8 2b 02 00 00       	call   438 <open>
 20d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 210:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 214:	79 07                	jns    21d <stat+0x29>
    return -1;
 216:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21b:	eb 23                	jmp    240 <stat+0x4c>
  r = fstat(fd, st);
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	8b 45 f4             	mov    -0xc(%ebp),%eax
 227:	89 04 24             	mov    %eax,(%esp)
 22a:	e8 21 02 00 00       	call   450 <fstat>
 22f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 232:	8b 45 f4             	mov    -0xc(%ebp),%eax
 235:	89 04 24             	mov    %eax,(%esp)
 238:	e8 e3 01 00 00       	call   420 <close>
  return r;
 23d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 240:	c9                   	leave  
 241:	c3                   	ret    

00000242 <atoi>:

int
atoi(const char *s)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 248:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24f:	eb 25                	jmp    276 <atoi+0x34>
    n = n*10 + *s++ - '0';
 251:	8b 55 fc             	mov    -0x4(%ebp),%edx
 254:	89 d0                	mov    %edx,%eax
 256:	c1 e0 02             	shl    $0x2,%eax
 259:	01 d0                	add    %edx,%eax
 25b:	01 c0                	add    %eax,%eax
 25d:	89 c1                	mov    %eax,%ecx
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	8d 50 01             	lea    0x1(%eax),%edx
 265:	89 55 08             	mov    %edx,0x8(%ebp)
 268:	0f b6 00             	movzbl (%eax),%eax
 26b:	0f be c0             	movsbl %al,%eax
 26e:	01 c8                	add    %ecx,%eax
 270:	83 e8 30             	sub    $0x30,%eax
 273:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	0f b6 00             	movzbl (%eax),%eax
 27c:	3c 2f                	cmp    $0x2f,%al
 27e:	7e 0a                	jle    28a <atoi+0x48>
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	0f b6 00             	movzbl (%eax),%eax
 286:	3c 39                	cmp    $0x39,%al
 288:	7e c7                	jle    251 <atoi+0xf>
  return n;
 28a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28d:	c9                   	leave  
 28e:	c3                   	ret    

0000028f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 295:	8b 45 08             	mov    0x8(%ebp),%eax
 298:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 29b:	8b 45 0c             	mov    0xc(%ebp),%eax
 29e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2a1:	eb 17                	jmp    2ba <memmove+0x2b>
    *dst++ = *src++;
 2a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a6:	8d 50 01             	lea    0x1(%eax),%edx
 2a9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2af:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b5:	0f b6 12             	movzbl (%edx),%edx
 2b8:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2ba:	8b 45 10             	mov    0x10(%ebp),%eax
 2bd:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c0:	89 55 10             	mov    %edx,0x10(%ebp)
 2c3:	85 c0                	test   %eax,%eax
 2c5:	7f dc                	jg     2a3 <memmove+0x14>
  return vdst;
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <ps>:

void ps(void) {
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	57                   	push   %edi
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 2d8:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2de:	89 04 24             	mov    %eax,(%esp)
 2e1:	e8 b2 01 00 00       	call   498 <getpinfo>

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2e6:	c7 44 24 04 5d 09 00 	movl   $0x95d,0x4(%esp)
 2ed:	00 
 2ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2f5:	e8 8e 02 00 00       	call   588 <printf>

  int i = 0;
 2fa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 301:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 308:	e9 ce 00 00 00       	jmp    3db <ps+0x10f>
    if (pstat[i].inuse) {
 30d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 310:	89 d0                	mov    %edx,%eax
 312:	c1 e0 03             	shl    $0x3,%eax
 315:	01 d0                	add    %edx,%eax
 317:	c1 e0 02             	shl    $0x2,%eax
 31a:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 31d:	01 d8                	add    %ebx,%eax
 31f:	2d 04 09 00 00       	sub    $0x904,%eax
 324:	8b 00                	mov    (%eax),%eax
 326:	85 c0                	test   %eax,%eax
 328:	0f 84 a9 00 00 00    	je     3d7 <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 32e:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 334:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 337:	89 d0                	mov    %edx,%eax
 339:	c1 e0 03             	shl    $0x3,%eax
 33c:	01 d0                	add    %edx,%eax
 33e:	c1 e0 02             	shl    $0x2,%eax
 341:	83 c0 10             	add    $0x10,%eax
 344:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 347:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 34a:	89 d0                	mov    %edx,%eax
 34c:	c1 e0 03             	shl    $0x3,%eax
 34f:	01 d0                	add    %edx,%eax
 351:	c1 e0 02             	shl    $0x2,%eax
 354:	8d 75 e8             	lea    -0x18(%ebp),%esi
 357:	01 f0                	add    %esi,%eax
 359:	2d e4 08 00 00       	sub    $0x8e4,%eax
 35e:	0f b6 00             	movzbl (%eax),%eax
 361:	0f be f0             	movsbl %al,%esi
 364:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 367:	89 d0                	mov    %edx,%eax
 369:	c1 e0 03             	shl    $0x3,%eax
 36c:	01 d0                	add    %edx,%eax
 36e:	c1 e0 02             	shl    $0x2,%eax
 371:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 374:	01 c8                	add    %ecx,%eax
 376:	2d f8 08 00 00       	sub    $0x8f8,%eax
 37b:	8b 18                	mov    (%eax),%ebx
 37d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 380:	89 d0                	mov    %edx,%eax
 382:	c1 e0 03             	shl    $0x3,%eax
 385:	01 d0                	add    %edx,%eax
 387:	c1 e0 02             	shl    $0x2,%eax
 38a:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 38d:	01 c8                	add    %ecx,%eax
 38f:	2d 00 09 00 00       	sub    $0x900,%eax
 394:	8b 08                	mov    (%eax),%ecx
 396:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 399:	89 d0                	mov    %edx,%eax
 39b:	c1 e0 03             	shl    $0x3,%eax
 39e:	01 d0                	add    %edx,%eax
 3a0:	c1 e0 02             	shl    $0x2,%eax
 3a3:	8d 55 e8             	lea    -0x18(%ebp),%edx
 3a6:	01 d0                	add    %edx,%eax
 3a8:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3ad:	8b 00                	mov    (%eax),%eax
 3af:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3b3:	89 74 24 14          	mov    %esi,0x14(%esp)
 3b7:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3bb:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3bf:	89 44 24 08          	mov    %eax,0x8(%esp)
 3c3:	c7 44 24 04 76 09 00 	movl   $0x976,0x4(%esp)
 3ca:	00 
 3cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3d2:	e8 b1 01 00 00       	call   588 <printf>
  for (i = 0; i < NPROC; ++i) {
 3d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3db:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3df:	0f 8e 28 ff ff ff    	jle    30d <ps+0x41>
    }
  }
 3e5:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3eb:	5b                   	pop    %ebx
 3ec:	5e                   	pop    %esi
 3ed:	5f                   	pop    %edi
 3ee:	5d                   	pop    %ebp
 3ef:	c3                   	ret    

000003f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f0:	b8 01 00 00 00       	mov    $0x1,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <exit>:
SYSCALL(exit)
 3f8:	b8 02 00 00 00       	mov    $0x2,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <wait>:
SYSCALL(wait)
 400:	b8 03 00 00 00       	mov    $0x3,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <pipe>:
SYSCALL(pipe)
 408:	b8 04 00 00 00       	mov    $0x4,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <read>:
SYSCALL(read)
 410:	b8 05 00 00 00       	mov    $0x5,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <write>:
SYSCALL(write)
 418:	b8 10 00 00 00       	mov    $0x10,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <close>:
SYSCALL(close)
 420:	b8 15 00 00 00       	mov    $0x15,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <kill>:
SYSCALL(kill)
 428:	b8 06 00 00 00       	mov    $0x6,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <exec>:
SYSCALL(exec)
 430:	b8 07 00 00 00       	mov    $0x7,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <open>:
SYSCALL(open)
 438:	b8 0f 00 00 00       	mov    $0xf,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <mknod>:
SYSCALL(mknod)
 440:	b8 11 00 00 00       	mov    $0x11,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <unlink>:
SYSCALL(unlink)
 448:	b8 12 00 00 00       	mov    $0x12,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <fstat>:
SYSCALL(fstat)
 450:	b8 08 00 00 00       	mov    $0x8,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <link>:
SYSCALL(link)
 458:	b8 13 00 00 00       	mov    $0x13,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <mkdir>:
SYSCALL(mkdir)
 460:	b8 14 00 00 00       	mov    $0x14,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <chdir>:
SYSCALL(chdir)
 468:	b8 09 00 00 00       	mov    $0x9,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <dup>:
SYSCALL(dup)
 470:	b8 0a 00 00 00       	mov    $0xa,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <getpid>:
SYSCALL(getpid)
 478:	b8 0b 00 00 00       	mov    $0xb,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <sbrk>:
SYSCALL(sbrk)
 480:	b8 0c 00 00 00       	mov    $0xc,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <sleep>:
SYSCALL(sleep)
 488:	b8 0d 00 00 00       	mov    $0xd,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <uptime>:
SYSCALL(uptime)
 490:	b8 0e 00 00 00       	mov    $0xe,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <getpinfo>:
SYSCALL(getpinfo)
 498:	b8 16 00 00 00       	mov    $0x16,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <settickets>:
 4a0:	b8 17 00 00 00       	mov    $0x17,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	83 ec 18             	sub    $0x18,%esp
 4ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4b4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4bb:	00 
 4bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	89 04 24             	mov    %eax,(%esp)
 4c9:	e8 4a ff ff ff       	call   418 <write>
}
 4ce:	c9                   	leave  
 4cf:	c3                   	ret    

000004d0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
 4d5:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4d8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4df:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4e3:	74 17                	je     4fc <printint+0x2c>
 4e5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4e9:	79 11                	jns    4fc <printint+0x2c>
    neg = 1;
 4eb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f5:	f7 d8                	neg    %eax
 4f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4fa:	eb 06                	jmp    502 <printint+0x32>
  } else {
    x = xx;
 4fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 502:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 509:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 50c:	8d 41 01             	lea    0x1(%ecx),%eax
 50f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 512:	8b 5d 10             	mov    0x10(%ebp),%ebx
 515:	8b 45 ec             	mov    -0x14(%ebp),%eax
 518:	ba 00 00 00 00       	mov    $0x0,%edx
 51d:	f7 f3                	div    %ebx
 51f:	89 d0                	mov    %edx,%eax
 521:	0f b6 80 04 0c 00 00 	movzbl 0xc04(%eax),%eax
 528:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 52c:	8b 75 10             	mov    0x10(%ebp),%esi
 52f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 532:	ba 00 00 00 00       	mov    $0x0,%edx
 537:	f7 f6                	div    %esi
 539:	89 45 ec             	mov    %eax,-0x14(%ebp)
 53c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 540:	75 c7                	jne    509 <printint+0x39>
  if(neg)
 542:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 546:	74 10                	je     558 <printint+0x88>
    buf[i++] = '-';
 548:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54b:	8d 50 01             	lea    0x1(%eax),%edx
 54e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 551:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 556:	eb 1f                	jmp    577 <printint+0xa7>
 558:	eb 1d                	jmp    577 <printint+0xa7>
    putc(fd, buf[i]);
 55a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 55d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 560:	01 d0                	add    %edx,%eax
 562:	0f b6 00             	movzbl (%eax),%eax
 565:	0f be c0             	movsbl %al,%eax
 568:	89 44 24 04          	mov    %eax,0x4(%esp)
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	89 04 24             	mov    %eax,(%esp)
 572:	e8 31 ff ff ff       	call   4a8 <putc>
  while(--i >= 0)
 577:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 57b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 57f:	79 d9                	jns    55a <printint+0x8a>
}
 581:	83 c4 30             	add    $0x30,%esp
 584:	5b                   	pop    %ebx
 585:	5e                   	pop    %esi
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    

00000588 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 58e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 595:	8d 45 0c             	lea    0xc(%ebp),%eax
 598:	83 c0 04             	add    $0x4,%eax
 59b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 59e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5a5:	e9 7c 01 00 00       	jmp    726 <printf+0x19e>
    c = fmt[i] & 0xff;
 5aa:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5b0:	01 d0                	add    %edx,%eax
 5b2:	0f b6 00             	movzbl (%eax),%eax
 5b5:	0f be c0             	movsbl %al,%eax
 5b8:	25 ff 00 00 00       	and    $0xff,%eax
 5bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c4:	75 2c                	jne    5f2 <printf+0x6a>
      if(c == '%'){
 5c6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ca:	75 0c                	jne    5d8 <printf+0x50>
        state = '%';
 5cc:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5d3:	e9 4a 01 00 00       	jmp    722 <printf+0x19a>
      } else {
        putc(fd, c);
 5d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5db:	0f be c0             	movsbl %al,%eax
 5de:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	89 04 24             	mov    %eax,(%esp)
 5e8:	e8 bb fe ff ff       	call   4a8 <putc>
 5ed:	e9 30 01 00 00       	jmp    722 <printf+0x19a>
      }
    } else if(state == '%'){
 5f2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5f6:	0f 85 26 01 00 00    	jne    722 <printf+0x19a>
      if(c == 'd'){
 5fc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 600:	75 2d                	jne    62f <printf+0xa7>
        printint(fd, *ap, 10, 1);
 602:	8b 45 e8             	mov    -0x18(%ebp),%eax
 605:	8b 00                	mov    (%eax),%eax
 607:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 60e:	00 
 60f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 616:	00 
 617:	89 44 24 04          	mov    %eax,0x4(%esp)
 61b:	8b 45 08             	mov    0x8(%ebp),%eax
 61e:	89 04 24             	mov    %eax,(%esp)
 621:	e8 aa fe ff ff       	call   4d0 <printint>
        ap++;
 626:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 62a:	e9 ec 00 00 00       	jmp    71b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 62f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 633:	74 06                	je     63b <printf+0xb3>
 635:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 639:	75 2d                	jne    668 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 63b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 63e:	8b 00                	mov    (%eax),%eax
 640:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 647:	00 
 648:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 64f:	00 
 650:	89 44 24 04          	mov    %eax,0x4(%esp)
 654:	8b 45 08             	mov    0x8(%ebp),%eax
 657:	89 04 24             	mov    %eax,(%esp)
 65a:	e8 71 fe ff ff       	call   4d0 <printint>
        ap++;
 65f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 663:	e9 b3 00 00 00       	jmp    71b <printf+0x193>
      } else if(c == 's'){
 668:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 66c:	75 45                	jne    6b3 <printf+0x12b>
        s = (char*)*ap;
 66e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 671:	8b 00                	mov    (%eax),%eax
 673:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 676:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 67a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 67e:	75 09                	jne    689 <printf+0x101>
          s = "(null)";
 680:	c7 45 f4 86 09 00 00 	movl   $0x986,-0xc(%ebp)
        while(*s != 0){
 687:	eb 1e                	jmp    6a7 <printf+0x11f>
 689:	eb 1c                	jmp    6a7 <printf+0x11f>
          putc(fd, *s);
 68b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68e:	0f b6 00             	movzbl (%eax),%eax
 691:	0f be c0             	movsbl %al,%eax
 694:	89 44 24 04          	mov    %eax,0x4(%esp)
 698:	8b 45 08             	mov    0x8(%ebp),%eax
 69b:	89 04 24             	mov    %eax,(%esp)
 69e:	e8 05 fe ff ff       	call   4a8 <putc>
          s++;
 6a3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6aa:	0f b6 00             	movzbl (%eax),%eax
 6ad:	84 c0                	test   %al,%al
 6af:	75 da                	jne    68b <printf+0x103>
 6b1:	eb 68                	jmp    71b <printf+0x193>
        }
      } else if(c == 'c'){
 6b3:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6b7:	75 1d                	jne    6d6 <printf+0x14e>
        putc(fd, *ap);
 6b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6bc:	8b 00                	mov    (%eax),%eax
 6be:	0f be c0             	movsbl %al,%eax
 6c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	89 04 24             	mov    %eax,(%esp)
 6cb:	e8 d8 fd ff ff       	call   4a8 <putc>
        ap++;
 6d0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d4:	eb 45                	jmp    71b <printf+0x193>
      } else if(c == '%'){
 6d6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6da:	75 17                	jne    6f3 <printf+0x16b>
        putc(fd, c);
 6dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6df:	0f be c0             	movsbl %al,%eax
 6e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e6:	8b 45 08             	mov    0x8(%ebp),%eax
 6e9:	89 04 24             	mov    %eax,(%esp)
 6ec:	e8 b7 fd ff ff       	call   4a8 <putc>
 6f1:	eb 28                	jmp    71b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6f3:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6fa:	00 
 6fb:	8b 45 08             	mov    0x8(%ebp),%eax
 6fe:	89 04 24             	mov    %eax,(%esp)
 701:	e8 a2 fd ff ff       	call   4a8 <putc>
        putc(fd, c);
 706:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 709:	0f be c0             	movsbl %al,%eax
 70c:	89 44 24 04          	mov    %eax,0x4(%esp)
 710:	8b 45 08             	mov    0x8(%ebp),%eax
 713:	89 04 24             	mov    %eax,(%esp)
 716:	e8 8d fd ff ff       	call   4a8 <putc>
      }
      state = 0;
 71b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 722:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 726:	8b 55 0c             	mov    0xc(%ebp),%edx
 729:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72c:	01 d0                	add    %edx,%eax
 72e:	0f b6 00             	movzbl (%eax),%eax
 731:	84 c0                	test   %al,%al
 733:	0f 85 71 fe ff ff    	jne    5aa <printf+0x22>
    }
  }
}
 739:	c9                   	leave  
 73a:	c3                   	ret    

0000073b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 73b:	55                   	push   %ebp
 73c:	89 e5                	mov    %esp,%ebp
 73e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 741:	8b 45 08             	mov    0x8(%ebp),%eax
 744:	83 e8 08             	sub    $0x8,%eax
 747:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74a:	a1 20 0c 00 00       	mov    0xc20,%eax
 74f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 752:	eb 24                	jmp    778 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 754:	8b 45 fc             	mov    -0x4(%ebp),%eax
 757:	8b 00                	mov    (%eax),%eax
 759:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 75c:	77 12                	ja     770 <free+0x35>
 75e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 761:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 764:	77 24                	ja     78a <free+0x4f>
 766:	8b 45 fc             	mov    -0x4(%ebp),%eax
 769:	8b 00                	mov    (%eax),%eax
 76b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76e:	77 1a                	ja     78a <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	8b 00                	mov    (%eax),%eax
 775:	89 45 fc             	mov    %eax,-0x4(%ebp)
 778:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77e:	76 d4                	jbe    754 <free+0x19>
 780:	8b 45 fc             	mov    -0x4(%ebp),%eax
 783:	8b 00                	mov    (%eax),%eax
 785:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 788:	76 ca                	jbe    754 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 78a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78d:	8b 40 04             	mov    0x4(%eax),%eax
 790:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 797:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79a:	01 c2                	add    %eax,%edx
 79c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79f:	8b 00                	mov    (%eax),%eax
 7a1:	39 c2                	cmp    %eax,%edx
 7a3:	75 24                	jne    7c9 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a8:	8b 50 04             	mov    0x4(%eax),%edx
 7ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ae:	8b 00                	mov    (%eax),%eax
 7b0:	8b 40 04             	mov    0x4(%eax),%eax
 7b3:	01 c2                	add    %eax,%edx
 7b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b8:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7be:	8b 00                	mov    (%eax),%eax
 7c0:	8b 10                	mov    (%eax),%edx
 7c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c5:	89 10                	mov    %edx,(%eax)
 7c7:	eb 0a                	jmp    7d3 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cc:	8b 10                	mov    (%eax),%edx
 7ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d1:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d6:	8b 40 04             	mov    0x4(%eax),%eax
 7d9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e3:	01 d0                	add    %edx,%eax
 7e5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e8:	75 20                	jne    80a <free+0xcf>
    p->s.size += bp->s.size;
 7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ed:	8b 50 04             	mov    0x4(%eax),%edx
 7f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f3:	8b 40 04             	mov    0x4(%eax),%eax
 7f6:	01 c2                	add    %eax,%edx
 7f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 801:	8b 10                	mov    (%eax),%edx
 803:	8b 45 fc             	mov    -0x4(%ebp),%eax
 806:	89 10                	mov    %edx,(%eax)
 808:	eb 08                	jmp    812 <free+0xd7>
  } else
    p->s.ptr = bp;
 80a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 810:	89 10                	mov    %edx,(%eax)
  freep = p;
 812:	8b 45 fc             	mov    -0x4(%ebp),%eax
 815:	a3 20 0c 00 00       	mov    %eax,0xc20
}
 81a:	c9                   	leave  
 81b:	c3                   	ret    

0000081c <morecore>:

static Header*
morecore(uint nu)
{
 81c:	55                   	push   %ebp
 81d:	89 e5                	mov    %esp,%ebp
 81f:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 822:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 829:	77 07                	ja     832 <morecore+0x16>
    nu = 4096;
 82b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 832:	8b 45 08             	mov    0x8(%ebp),%eax
 835:	c1 e0 03             	shl    $0x3,%eax
 838:	89 04 24             	mov    %eax,(%esp)
 83b:	e8 40 fc ff ff       	call   480 <sbrk>
 840:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 843:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 847:	75 07                	jne    850 <morecore+0x34>
    return 0;
 849:	b8 00 00 00 00       	mov    $0x0,%eax
 84e:	eb 22                	jmp    872 <morecore+0x56>
  hp = (Header*)p;
 850:	8b 45 f4             	mov    -0xc(%ebp),%eax
 853:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 856:	8b 45 f0             	mov    -0x10(%ebp),%eax
 859:	8b 55 08             	mov    0x8(%ebp),%edx
 85c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 85f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 862:	83 c0 08             	add    $0x8,%eax
 865:	89 04 24             	mov    %eax,(%esp)
 868:	e8 ce fe ff ff       	call   73b <free>
  return freep;
 86d:	a1 20 0c 00 00       	mov    0xc20,%eax
}
 872:	c9                   	leave  
 873:	c3                   	ret    

00000874 <malloc>:

void*
malloc(uint nbytes)
{
 874:	55                   	push   %ebp
 875:	89 e5                	mov    %esp,%ebp
 877:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 87a:	8b 45 08             	mov    0x8(%ebp),%eax
 87d:	83 c0 07             	add    $0x7,%eax
 880:	c1 e8 03             	shr    $0x3,%eax
 883:	83 c0 01             	add    $0x1,%eax
 886:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 889:	a1 20 0c 00 00       	mov    0xc20,%eax
 88e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 891:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 895:	75 23                	jne    8ba <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 897:	c7 45 f0 18 0c 00 00 	movl   $0xc18,-0x10(%ebp)
 89e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a1:	a3 20 0c 00 00       	mov    %eax,0xc20
 8a6:	a1 20 0c 00 00       	mov    0xc20,%eax
 8ab:	a3 18 0c 00 00       	mov    %eax,0xc18
    base.s.size = 0;
 8b0:	c7 05 1c 0c 00 00 00 	movl   $0x0,0xc1c
 8b7:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bd:	8b 00                	mov    (%eax),%eax
 8bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c5:	8b 40 04             	mov    0x4(%eax),%eax
 8c8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8cb:	72 4d                	jb     91a <malloc+0xa6>
      if(p->s.size == nunits)
 8cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d0:	8b 40 04             	mov    0x4(%eax),%eax
 8d3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d6:	75 0c                	jne    8e4 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8db:	8b 10                	mov    (%eax),%edx
 8dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e0:	89 10                	mov    %edx,(%eax)
 8e2:	eb 26                	jmp    90a <malloc+0x96>
      else {
        p->s.size -= nunits;
 8e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e7:	8b 40 04             	mov    0x4(%eax),%eax
 8ea:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8ed:	89 c2                	mov    %eax,%edx
 8ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f8:	8b 40 04             	mov    0x4(%eax),%eax
 8fb:	c1 e0 03             	shl    $0x3,%eax
 8fe:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 901:	8b 45 f4             	mov    -0xc(%ebp),%eax
 904:	8b 55 ec             	mov    -0x14(%ebp),%edx
 907:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 90a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90d:	a3 20 0c 00 00       	mov    %eax,0xc20
      return (void*)(p + 1);
 912:	8b 45 f4             	mov    -0xc(%ebp),%eax
 915:	83 c0 08             	add    $0x8,%eax
 918:	eb 38                	jmp    952 <malloc+0xde>
    }
    if(p == freep)
 91a:	a1 20 0c 00 00       	mov    0xc20,%eax
 91f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 922:	75 1b                	jne    93f <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 924:	8b 45 ec             	mov    -0x14(%ebp),%eax
 927:	89 04 24             	mov    %eax,(%esp)
 92a:	e8 ed fe ff ff       	call   81c <morecore>
 92f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 932:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 936:	75 07                	jne    93f <malloc+0xcb>
        return 0;
 938:	b8 00 00 00 00       	mov    $0x0,%eax
 93d:	eb 13                	jmp    952 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 942:	89 45 f0             	mov    %eax,-0x10(%ebp)
 945:	8b 45 f4             	mov    -0xc(%ebp),%eax
 948:	8b 00                	mov    (%eax),%eax
 94a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 94d:	e9 70 ff ff ff       	jmp    8c2 <malloc+0x4e>
}
 952:	c9                   	leave  
 953:	c3                   	ret    
