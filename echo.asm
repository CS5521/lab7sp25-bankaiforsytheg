
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
  1f:	b8 4c 09 00 00       	mov    $0x94c,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 4e 09 00 00       	mov    $0x94e,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 50 09 00 	movl   $0x950,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 27 05 00 00       	call   580 <printf>
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

  // Print the information TODOWHAT

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2e6:	c7 44 24 04 55 09 00 	movl   $0x955,0x4(%esp)
 2ed:	00 
 2ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2f5:	e8 86 02 00 00       	call   580 <printf>

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
 3c3:	c7 44 24 04 6e 09 00 	movl   $0x96e,0x4(%esp)
 3ca:	00 
 3cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3d2:	e8 a9 01 00 00       	call   580 <printf>
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

000004a0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	83 ec 18             	sub    $0x18,%esp
 4a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4ac:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b3:	00 
 4b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4bb:	8b 45 08             	mov    0x8(%ebp),%eax
 4be:	89 04 24             	mov    %eax,(%esp)
 4c1:	e8 52 ff ff ff       	call   418 <write>
}
 4c6:	c9                   	leave  
 4c7:	c3                   	ret    

000004c8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c8:	55                   	push   %ebp
 4c9:	89 e5                	mov    %esp,%ebp
 4cb:	56                   	push   %esi
 4cc:	53                   	push   %ebx
 4cd:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4d7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4db:	74 17                	je     4f4 <printint+0x2c>
 4dd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4e1:	79 11                	jns    4f4 <printint+0x2c>
    neg = 1;
 4e3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ed:	f7 d8                	neg    %eax
 4ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4f2:	eb 06                	jmp    4fa <printint+0x32>
  } else {
    x = xx;
 4f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 501:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 504:	8d 41 01             	lea    0x1(%ecx),%eax
 507:	89 45 f4             	mov    %eax,-0xc(%ebp)
 50a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 50d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 510:	ba 00 00 00 00       	mov    $0x0,%edx
 515:	f7 f3                	div    %ebx
 517:	89 d0                	mov    %edx,%eax
 519:	0f b6 80 fc 0b 00 00 	movzbl 0xbfc(%eax),%eax
 520:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 524:	8b 75 10             	mov    0x10(%ebp),%esi
 527:	8b 45 ec             	mov    -0x14(%ebp),%eax
 52a:	ba 00 00 00 00       	mov    $0x0,%edx
 52f:	f7 f6                	div    %esi
 531:	89 45 ec             	mov    %eax,-0x14(%ebp)
 534:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 538:	75 c7                	jne    501 <printint+0x39>
  if(neg)
 53a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 53e:	74 10                	je     550 <printint+0x88>
    buf[i++] = '-';
 540:	8b 45 f4             	mov    -0xc(%ebp),%eax
 543:	8d 50 01             	lea    0x1(%eax),%edx
 546:	89 55 f4             	mov    %edx,-0xc(%ebp)
 549:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 54e:	eb 1f                	jmp    56f <printint+0xa7>
 550:	eb 1d                	jmp    56f <printint+0xa7>
    putc(fd, buf[i]);
 552:	8d 55 dc             	lea    -0x24(%ebp),%edx
 555:	8b 45 f4             	mov    -0xc(%ebp),%eax
 558:	01 d0                	add    %edx,%eax
 55a:	0f b6 00             	movzbl (%eax),%eax
 55d:	0f be c0             	movsbl %al,%eax
 560:	89 44 24 04          	mov    %eax,0x4(%esp)
 564:	8b 45 08             	mov    0x8(%ebp),%eax
 567:	89 04 24             	mov    %eax,(%esp)
 56a:	e8 31 ff ff ff       	call   4a0 <putc>
  while(--i >= 0)
 56f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 573:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 577:	79 d9                	jns    552 <printint+0x8a>
}
 579:	83 c4 30             	add    $0x30,%esp
 57c:	5b                   	pop    %ebx
 57d:	5e                   	pop    %esi
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 586:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 58d:	8d 45 0c             	lea    0xc(%ebp),%eax
 590:	83 c0 04             	add    $0x4,%eax
 593:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 596:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 59d:	e9 7c 01 00 00       	jmp    71e <printf+0x19e>
    c = fmt[i] & 0xff;
 5a2:	8b 55 0c             	mov    0xc(%ebp),%edx
 5a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5a8:	01 d0                	add    %edx,%eax
 5aa:	0f b6 00             	movzbl (%eax),%eax
 5ad:	0f be c0             	movsbl %al,%eax
 5b0:	25 ff 00 00 00       	and    $0xff,%eax
 5b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5b8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5bc:	75 2c                	jne    5ea <printf+0x6a>
      if(c == '%'){
 5be:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5c2:	75 0c                	jne    5d0 <printf+0x50>
        state = '%';
 5c4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5cb:	e9 4a 01 00 00       	jmp    71a <printf+0x19a>
      } else {
        putc(fd, c);
 5d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d3:	0f be c0             	movsbl %al,%eax
 5d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	89 04 24             	mov    %eax,(%esp)
 5e0:	e8 bb fe ff ff       	call   4a0 <putc>
 5e5:	e9 30 01 00 00       	jmp    71a <printf+0x19a>
      }
    } else if(state == '%'){
 5ea:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5ee:	0f 85 26 01 00 00    	jne    71a <printf+0x19a>
      if(c == 'd'){
 5f4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5f8:	75 2d                	jne    627 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5fd:	8b 00                	mov    (%eax),%eax
 5ff:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 606:	00 
 607:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 60e:	00 
 60f:	89 44 24 04          	mov    %eax,0x4(%esp)
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	89 04 24             	mov    %eax,(%esp)
 619:	e8 aa fe ff ff       	call   4c8 <printint>
        ap++;
 61e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 622:	e9 ec 00 00 00       	jmp    713 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 627:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 62b:	74 06                	je     633 <printf+0xb3>
 62d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 631:	75 2d                	jne    660 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 633:	8b 45 e8             	mov    -0x18(%ebp),%eax
 636:	8b 00                	mov    (%eax),%eax
 638:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 63f:	00 
 640:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 647:	00 
 648:	89 44 24 04          	mov    %eax,0x4(%esp)
 64c:	8b 45 08             	mov    0x8(%ebp),%eax
 64f:	89 04 24             	mov    %eax,(%esp)
 652:	e8 71 fe ff ff       	call   4c8 <printint>
        ap++;
 657:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 65b:	e9 b3 00 00 00       	jmp    713 <printf+0x193>
      } else if(c == 's'){
 660:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 664:	75 45                	jne    6ab <printf+0x12b>
        s = (char*)*ap;
 666:	8b 45 e8             	mov    -0x18(%ebp),%eax
 669:	8b 00                	mov    (%eax),%eax
 66b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 66e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 672:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 676:	75 09                	jne    681 <printf+0x101>
          s = "(null)";
 678:	c7 45 f4 7e 09 00 00 	movl   $0x97e,-0xc(%ebp)
        while(*s != 0){
 67f:	eb 1e                	jmp    69f <printf+0x11f>
 681:	eb 1c                	jmp    69f <printf+0x11f>
          putc(fd, *s);
 683:	8b 45 f4             	mov    -0xc(%ebp),%eax
 686:	0f b6 00             	movzbl (%eax),%eax
 689:	0f be c0             	movsbl %al,%eax
 68c:	89 44 24 04          	mov    %eax,0x4(%esp)
 690:	8b 45 08             	mov    0x8(%ebp),%eax
 693:	89 04 24             	mov    %eax,(%esp)
 696:	e8 05 fe ff ff       	call   4a0 <putc>
          s++;
 69b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 69f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a2:	0f b6 00             	movzbl (%eax),%eax
 6a5:	84 c0                	test   %al,%al
 6a7:	75 da                	jne    683 <printf+0x103>
 6a9:	eb 68                	jmp    713 <printf+0x193>
        }
      } else if(c == 'c'){
 6ab:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6af:	75 1d                	jne    6ce <printf+0x14e>
        putc(fd, *ap);
 6b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b4:	8b 00                	mov    (%eax),%eax
 6b6:	0f be c0             	movsbl %al,%eax
 6b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
 6c0:	89 04 24             	mov    %eax,(%esp)
 6c3:	e8 d8 fd ff ff       	call   4a0 <putc>
        ap++;
 6c8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6cc:	eb 45                	jmp    713 <printf+0x193>
      } else if(c == '%'){
 6ce:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6d2:	75 17                	jne    6eb <printf+0x16b>
        putc(fd, c);
 6d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d7:	0f be c0             	movsbl %al,%eax
 6da:	89 44 24 04          	mov    %eax,0x4(%esp)
 6de:	8b 45 08             	mov    0x8(%ebp),%eax
 6e1:	89 04 24             	mov    %eax,(%esp)
 6e4:	e8 b7 fd ff ff       	call   4a0 <putc>
 6e9:	eb 28                	jmp    713 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6eb:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6f2:	00 
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	89 04 24             	mov    %eax,(%esp)
 6f9:	e8 a2 fd ff ff       	call   4a0 <putc>
        putc(fd, c);
 6fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 701:	0f be c0             	movsbl %al,%eax
 704:	89 44 24 04          	mov    %eax,0x4(%esp)
 708:	8b 45 08             	mov    0x8(%ebp),%eax
 70b:	89 04 24             	mov    %eax,(%esp)
 70e:	e8 8d fd ff ff       	call   4a0 <putc>
      }
      state = 0;
 713:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 71a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 71e:	8b 55 0c             	mov    0xc(%ebp),%edx
 721:	8b 45 f0             	mov    -0x10(%ebp),%eax
 724:	01 d0                	add    %edx,%eax
 726:	0f b6 00             	movzbl (%eax),%eax
 729:	84 c0                	test   %al,%al
 72b:	0f 85 71 fe ff ff    	jne    5a2 <printf+0x22>
    }
  }
}
 731:	c9                   	leave  
 732:	c3                   	ret    

00000733 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 733:	55                   	push   %ebp
 734:	89 e5                	mov    %esp,%ebp
 736:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 739:	8b 45 08             	mov    0x8(%ebp),%eax
 73c:	83 e8 08             	sub    $0x8,%eax
 73f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 742:	a1 18 0c 00 00       	mov    0xc18,%eax
 747:	89 45 fc             	mov    %eax,-0x4(%ebp)
 74a:	eb 24                	jmp    770 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74f:	8b 00                	mov    (%eax),%eax
 751:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 754:	77 12                	ja     768 <free+0x35>
 756:	8b 45 f8             	mov    -0x8(%ebp),%eax
 759:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 75c:	77 24                	ja     782 <free+0x4f>
 75e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 761:	8b 00                	mov    (%eax),%eax
 763:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 766:	77 1a                	ja     782 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 768:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76b:	8b 00                	mov    (%eax),%eax
 76d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 770:	8b 45 f8             	mov    -0x8(%ebp),%eax
 773:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 776:	76 d4                	jbe    74c <free+0x19>
 778:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77b:	8b 00                	mov    (%eax),%eax
 77d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 780:	76 ca                	jbe    74c <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 782:	8b 45 f8             	mov    -0x8(%ebp),%eax
 785:	8b 40 04             	mov    0x4(%eax),%eax
 788:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 78f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 792:	01 c2                	add    %eax,%edx
 794:	8b 45 fc             	mov    -0x4(%ebp),%eax
 797:	8b 00                	mov    (%eax),%eax
 799:	39 c2                	cmp    %eax,%edx
 79b:	75 24                	jne    7c1 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 79d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a0:	8b 50 04             	mov    0x4(%eax),%edx
 7a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a6:	8b 00                	mov    (%eax),%eax
 7a8:	8b 40 04             	mov    0x4(%eax),%eax
 7ab:	01 c2                	add    %eax,%edx
 7ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b0:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b6:	8b 00                	mov    (%eax),%eax
 7b8:	8b 10                	mov    (%eax),%edx
 7ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bd:	89 10                	mov    %edx,(%eax)
 7bf:	eb 0a                	jmp    7cb <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c4:	8b 10                	mov    (%eax),%edx
 7c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c9:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ce:	8b 40 04             	mov    0x4(%eax),%eax
 7d1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7db:	01 d0                	add    %edx,%eax
 7dd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e0:	75 20                	jne    802 <free+0xcf>
    p->s.size += bp->s.size;
 7e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e5:	8b 50 04             	mov    0x4(%eax),%edx
 7e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7eb:	8b 40 04             	mov    0x4(%eax),%eax
 7ee:	01 c2                	add    %eax,%edx
 7f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	8b 10                	mov    (%eax),%edx
 7fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fe:	89 10                	mov    %edx,(%eax)
 800:	eb 08                	jmp    80a <free+0xd7>
  } else
    p->s.ptr = bp;
 802:	8b 45 fc             	mov    -0x4(%ebp),%eax
 805:	8b 55 f8             	mov    -0x8(%ebp),%edx
 808:	89 10                	mov    %edx,(%eax)
  freep = p;
 80a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80d:	a3 18 0c 00 00       	mov    %eax,0xc18
}
 812:	c9                   	leave  
 813:	c3                   	ret    

00000814 <morecore>:

static Header*
morecore(uint nu)
{
 814:	55                   	push   %ebp
 815:	89 e5                	mov    %esp,%ebp
 817:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 81a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 821:	77 07                	ja     82a <morecore+0x16>
    nu = 4096;
 823:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 82a:	8b 45 08             	mov    0x8(%ebp),%eax
 82d:	c1 e0 03             	shl    $0x3,%eax
 830:	89 04 24             	mov    %eax,(%esp)
 833:	e8 48 fc ff ff       	call   480 <sbrk>
 838:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 83b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 83f:	75 07                	jne    848 <morecore+0x34>
    return 0;
 841:	b8 00 00 00 00       	mov    $0x0,%eax
 846:	eb 22                	jmp    86a <morecore+0x56>
  hp = (Header*)p;
 848:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 84e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 851:	8b 55 08             	mov    0x8(%ebp),%edx
 854:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 857:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85a:	83 c0 08             	add    $0x8,%eax
 85d:	89 04 24             	mov    %eax,(%esp)
 860:	e8 ce fe ff ff       	call   733 <free>
  return freep;
 865:	a1 18 0c 00 00       	mov    0xc18,%eax
}
 86a:	c9                   	leave  
 86b:	c3                   	ret    

0000086c <malloc>:

void*
malloc(uint nbytes)
{
 86c:	55                   	push   %ebp
 86d:	89 e5                	mov    %esp,%ebp
 86f:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 872:	8b 45 08             	mov    0x8(%ebp),%eax
 875:	83 c0 07             	add    $0x7,%eax
 878:	c1 e8 03             	shr    $0x3,%eax
 87b:	83 c0 01             	add    $0x1,%eax
 87e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 881:	a1 18 0c 00 00       	mov    0xc18,%eax
 886:	89 45 f0             	mov    %eax,-0x10(%ebp)
 889:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 88d:	75 23                	jne    8b2 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 88f:	c7 45 f0 10 0c 00 00 	movl   $0xc10,-0x10(%ebp)
 896:	8b 45 f0             	mov    -0x10(%ebp),%eax
 899:	a3 18 0c 00 00       	mov    %eax,0xc18
 89e:	a1 18 0c 00 00       	mov    0xc18,%eax
 8a3:	a3 10 0c 00 00       	mov    %eax,0xc10
    base.s.size = 0;
 8a8:	c7 05 14 0c 00 00 00 	movl   $0x0,0xc14
 8af:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b5:	8b 00                	mov    (%eax),%eax
 8b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bd:	8b 40 04             	mov    0x4(%eax),%eax
 8c0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c3:	72 4d                	jb     912 <malloc+0xa6>
      if(p->s.size == nunits)
 8c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c8:	8b 40 04             	mov    0x4(%eax),%eax
 8cb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8ce:	75 0c                	jne    8dc <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d3:	8b 10                	mov    (%eax),%edx
 8d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d8:	89 10                	mov    %edx,(%eax)
 8da:	eb 26                	jmp    902 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	8b 40 04             	mov    0x4(%eax),%eax
 8e2:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8e5:	89 c2                	mov    %eax,%edx
 8e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ea:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f0:	8b 40 04             	mov    0x4(%eax),%eax
 8f3:	c1 e0 03             	shl    $0x3,%eax
 8f6:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fc:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8ff:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 902:	8b 45 f0             	mov    -0x10(%ebp),%eax
 905:	a3 18 0c 00 00       	mov    %eax,0xc18
      return (void*)(p + 1);
 90a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90d:	83 c0 08             	add    $0x8,%eax
 910:	eb 38                	jmp    94a <malloc+0xde>
    }
    if(p == freep)
 912:	a1 18 0c 00 00       	mov    0xc18,%eax
 917:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 91a:	75 1b                	jne    937 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 91c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 91f:	89 04 24             	mov    %eax,(%esp)
 922:	e8 ed fe ff ff       	call   814 <morecore>
 927:	89 45 f4             	mov    %eax,-0xc(%ebp)
 92a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 92e:	75 07                	jne    937 <malloc+0xcb>
        return 0;
 930:	b8 00 00 00 00       	mov    $0x0,%eax
 935:	eb 13                	jmp    94a <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 937:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 93d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 940:	8b 00                	mov    (%eax),%eax
 942:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 945:	e9 70 ff ff ff       	jmp    8ba <malloc+0x4e>
}
 94a:	c9                   	leave  
 94b:	c3                   	ret    
