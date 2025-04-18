
_ln:     file format elf32-i386


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
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 59 09 00 	movl   $0x959,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 6a 05 00 00       	call   58d <printf>
    exit();
  23:	e8 dd 03 00 00       	call   405 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 21 04 00 00       	call   465 <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 6c 09 00 	movl   $0x96c,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 19 05 00 00       	call   58d <printf>
  exit();
  74:	e8 8c 03 00 00       	call   405 <exit>

00000079 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	57                   	push   %edi
  7d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  81:	8b 55 10             	mov    0x10(%ebp),%edx
  84:	8b 45 0c             	mov    0xc(%ebp),%eax
  87:	89 cb                	mov    %ecx,%ebx
  89:	89 df                	mov    %ebx,%edi
  8b:	89 d1                	mov    %edx,%ecx
  8d:	fc                   	cld    
  8e:	f3 aa                	rep stos %al,%es:(%edi)
  90:	89 ca                	mov    %ecx,%edx
  92:	89 fb                	mov    %edi,%ebx
  94:	89 5d 08             	mov    %ebx,0x8(%ebp)
  97:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9a:	5b                   	pop    %ebx
  9b:	5f                   	pop    %edi
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    

0000009e <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  aa:	90                   	nop
  ab:	8b 45 08             	mov    0x8(%ebp),%eax
  ae:	8d 50 01             	lea    0x1(%eax),%edx
  b1:	89 55 08             	mov    %edx,0x8(%ebp)
  b4:	8b 55 0c             	mov    0xc(%ebp),%edx
  b7:	8d 4a 01             	lea    0x1(%edx),%ecx
  ba:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  bd:	0f b6 12             	movzbl (%edx),%edx
  c0:	88 10                	mov    %dl,(%eax)
  c2:	0f b6 00             	movzbl (%eax),%eax
  c5:	84 c0                	test   %al,%al
  c7:	75 e2                	jne    ab <strcpy+0xd>
    ;
  return os;
  c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d1:	eb 08                	jmp    db <strcmp+0xd>
    p++, q++;
  d3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 00             	movzbl (%eax),%eax
  e1:	84 c0                	test   %al,%al
  e3:	74 10                	je     f5 <strcmp+0x27>
  e5:	8b 45 08             	mov    0x8(%ebp),%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	38 c2                	cmp    %al,%dl
  f3:	74 de                	je     d3 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  f5:	8b 45 08             	mov    0x8(%ebp),%eax
  f8:	0f b6 00             	movzbl (%eax),%eax
  fb:	0f b6 d0             	movzbl %al,%edx
  fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 101:	0f b6 00             	movzbl (%eax),%eax
 104:	0f b6 c0             	movzbl %al,%eax
 107:	29 c2                	sub    %eax,%edx
 109:	89 d0                	mov    %edx,%eax
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    

0000010d <strlen>:

uint
strlen(const char *s)
{
 10d:	55                   	push   %ebp
 10e:	89 e5                	mov    %esp,%ebp
 110:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 113:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 11a:	eb 04                	jmp    120 <strlen+0x13>
 11c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 120:	8b 55 fc             	mov    -0x4(%ebp),%edx
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	01 d0                	add    %edx,%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 ed                	jne    11c <strlen+0xf>
    ;
  return n;
 12f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <memset>:

void*
memset(void *dst, int c, uint n)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 13a:	8b 45 10             	mov    0x10(%ebp),%eax
 13d:	89 44 24 08          	mov    %eax,0x8(%esp)
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	89 44 24 04          	mov    %eax,0x4(%esp)
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	89 04 24             	mov    %eax,(%esp)
 14e:	e8 26 ff ff ff       	call   79 <stosb>
  return dst;
 153:	8b 45 08             	mov    0x8(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 164:	eb 14                	jmp    17a <strchr+0x22>
    if(*s == c)
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	0f b6 00             	movzbl (%eax),%eax
 16c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 16f:	75 05                	jne    176 <strchr+0x1e>
      return (char*)s;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	eb 13                	jmp    189 <strchr+0x31>
  for(; *s; s++)
 176:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 00             	movzbl (%eax),%eax
 180:	84 c0                	test   %al,%al
 182:	75 e2                	jne    166 <strchr+0xe>
  return 0;
 184:	b8 00 00 00 00       	mov    $0x0,%eax
}
 189:	c9                   	leave  
 18a:	c3                   	ret    

0000018b <gets>:

char*
gets(char *buf, int max)
{
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 191:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 198:	eb 4c                	jmp    1e6 <gets+0x5b>
    cc = read(0, &c, 1);
 19a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a1:	00 
 1a2:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b0:	e8 68 02 00 00       	call   41d <read>
 1b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1bc:	7f 02                	jg     1c0 <gets+0x35>
      break;
 1be:	eb 31                	jmp    1f1 <gets+0x66>
    buf[i++] = c;
 1c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c3:	8d 50 01             	lea    0x1(%eax),%edx
 1c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c9:	89 c2                	mov    %eax,%edx
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	01 c2                	add    %eax,%edx
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1da:	3c 0a                	cmp    $0xa,%al
 1dc:	74 13                	je     1f1 <gets+0x66>
 1de:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e2:	3c 0d                	cmp    $0xd,%al
 1e4:	74 0b                	je     1f1 <gets+0x66>
  for(i=0; i+1 < max; ){
 1e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e9:	83 c0 01             	add    $0x1,%eax
 1ec:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ef:	7c a9                	jl     19a <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	01 d0                	add    %edx,%eax
 1f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <stat>:

int
stat(const char *n, struct stat *st)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 207:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20e:	00 
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 04 24             	mov    %eax,(%esp)
 215:	e8 2b 02 00 00       	call   445 <open>
 21a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 21d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 221:	79 07                	jns    22a <stat+0x29>
    return -1;
 223:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 228:	eb 23                	jmp    24d <stat+0x4c>
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 21 02 00 00       	call   45d <fstat>
 23c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 e3 01 00 00       	call   42d <close>
  return r;
 24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <atoi>:

int
atoi(const char *s)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 255:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25c:	eb 25                	jmp    283 <atoi+0x34>
    n = n*10 + *s++ - '0';
 25e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 261:	89 d0                	mov    %edx,%eax
 263:	c1 e0 02             	shl    $0x2,%eax
 266:	01 d0                	add    %edx,%eax
 268:	01 c0                	add    %eax,%eax
 26a:	89 c1                	mov    %eax,%ecx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	8d 50 01             	lea    0x1(%eax),%edx
 272:	89 55 08             	mov    %edx,0x8(%ebp)
 275:	0f b6 00             	movzbl (%eax),%eax
 278:	0f be c0             	movsbl %al,%eax
 27b:	01 c8                	add    %ecx,%eax
 27d:	83 e8 30             	sub    $0x30,%eax
 280:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	3c 2f                	cmp    $0x2f,%al
 28b:	7e 0a                	jle    297 <atoi+0x48>
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	3c 39                	cmp    $0x39,%al
 295:	7e c7                	jle    25e <atoi+0xf>
  return n;
 297:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
 2a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ae:	eb 17                	jmp    2c7 <memmove+0x2b>
    *dst++ = *src++;
 2b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b3:	8d 50 01             	lea    0x1(%eax),%edx
 2b6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2bc:	8d 4a 01             	lea    0x1(%edx),%ecx
 2bf:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2c2:	0f b6 12             	movzbl (%edx),%edx
 2c5:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2c7:	8b 45 10             	mov    0x10(%ebp),%eax
 2ca:	8d 50 ff             	lea    -0x1(%eax),%edx
 2cd:	89 55 10             	mov    %edx,0x10(%ebp)
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7f dc                	jg     2b0 <memmove+0x14>
  return vdst;
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <ps>:

void ps(void) {
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	57                   	push   %edi
 2dd:	56                   	push   %esi
 2de:	53                   	push   %ebx
 2df:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 2e5:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2eb:	89 04 24             	mov    %eax,(%esp)
 2ee:	e8 b2 01 00 00       	call   4a5 <getpinfo>

  // Print the information TODOWHAT

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2f3:	c7 44 24 04 80 09 00 	movl   $0x980,0x4(%esp)
 2fa:	00 
 2fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 302:	e8 86 02 00 00       	call   58d <printf>

  int i = 0;
 307:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 30e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 315:	e9 ce 00 00 00       	jmp    3e8 <ps+0x10f>
    if (pstat[i].inuse) {
 31a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 31d:	89 d0                	mov    %edx,%eax
 31f:	c1 e0 03             	shl    $0x3,%eax
 322:	01 d0                	add    %edx,%eax
 324:	c1 e0 02             	shl    $0x2,%eax
 327:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 32a:	01 d8                	add    %ebx,%eax
 32c:	2d 04 09 00 00       	sub    $0x904,%eax
 331:	8b 00                	mov    (%eax),%eax
 333:	85 c0                	test   %eax,%eax
 335:	0f 84 a9 00 00 00    	je     3e4 <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 33b:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 341:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 344:	89 d0                	mov    %edx,%eax
 346:	c1 e0 03             	shl    $0x3,%eax
 349:	01 d0                	add    %edx,%eax
 34b:	c1 e0 02             	shl    $0x2,%eax
 34e:	83 c0 10             	add    $0x10,%eax
 351:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 354:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 357:	89 d0                	mov    %edx,%eax
 359:	c1 e0 03             	shl    $0x3,%eax
 35c:	01 d0                	add    %edx,%eax
 35e:	c1 e0 02             	shl    $0x2,%eax
 361:	8d 75 e8             	lea    -0x18(%ebp),%esi
 364:	01 f0                	add    %esi,%eax
 366:	2d e4 08 00 00       	sub    $0x8e4,%eax
 36b:	0f b6 00             	movzbl (%eax),%eax
 36e:	0f be f0             	movsbl %al,%esi
 371:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 374:	89 d0                	mov    %edx,%eax
 376:	c1 e0 03             	shl    $0x3,%eax
 379:	01 d0                	add    %edx,%eax
 37b:	c1 e0 02             	shl    $0x2,%eax
 37e:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 381:	01 c8                	add    %ecx,%eax
 383:	2d f8 08 00 00       	sub    $0x8f8,%eax
 388:	8b 18                	mov    (%eax),%ebx
 38a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 38d:	89 d0                	mov    %edx,%eax
 38f:	c1 e0 03             	shl    $0x3,%eax
 392:	01 d0                	add    %edx,%eax
 394:	c1 e0 02             	shl    $0x2,%eax
 397:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 39a:	01 c8                	add    %ecx,%eax
 39c:	2d 00 09 00 00       	sub    $0x900,%eax
 3a1:	8b 08                	mov    (%eax),%ecx
 3a3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	c1 e0 03             	shl    $0x3,%eax
 3ab:	01 d0                	add    %edx,%eax
 3ad:	c1 e0 02             	shl    $0x2,%eax
 3b0:	8d 55 e8             	lea    -0x18(%ebp),%edx
 3b3:	01 d0                	add    %edx,%eax
 3b5:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3ba:	8b 00                	mov    (%eax),%eax
 3bc:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3c0:	89 74 24 14          	mov    %esi,0x14(%esp)
 3c4:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3c8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3cc:	89 44 24 08          	mov    %eax,0x8(%esp)
 3d0:	c7 44 24 04 99 09 00 	movl   $0x999,0x4(%esp)
 3d7:	00 
 3d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3df:	e8 a9 01 00 00       	call   58d <printf>
  for (i = 0; i < NPROC; ++i) {
 3e4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3e8:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3ec:	0f 8e 28 ff ff ff    	jle    31a <ps+0x41>
    }
  }
 3f2:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3f8:	5b                   	pop    %ebx
 3f9:	5e                   	pop    %esi
 3fa:	5f                   	pop    %edi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    

000003fd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3fd:	b8 01 00 00 00       	mov    $0x1,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <exit>:
SYSCALL(exit)
 405:	b8 02 00 00 00       	mov    $0x2,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <wait>:
SYSCALL(wait)
 40d:	b8 03 00 00 00       	mov    $0x3,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <pipe>:
SYSCALL(pipe)
 415:	b8 04 00 00 00       	mov    $0x4,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <read>:
SYSCALL(read)
 41d:	b8 05 00 00 00       	mov    $0x5,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <write>:
SYSCALL(write)
 425:	b8 10 00 00 00       	mov    $0x10,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <close>:
SYSCALL(close)
 42d:	b8 15 00 00 00       	mov    $0x15,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <kill>:
SYSCALL(kill)
 435:	b8 06 00 00 00       	mov    $0x6,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <exec>:
SYSCALL(exec)
 43d:	b8 07 00 00 00       	mov    $0x7,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <open>:
SYSCALL(open)
 445:	b8 0f 00 00 00       	mov    $0xf,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <mknod>:
SYSCALL(mknod)
 44d:	b8 11 00 00 00       	mov    $0x11,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <unlink>:
SYSCALL(unlink)
 455:	b8 12 00 00 00       	mov    $0x12,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <fstat>:
SYSCALL(fstat)
 45d:	b8 08 00 00 00       	mov    $0x8,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <link>:
SYSCALL(link)
 465:	b8 13 00 00 00       	mov    $0x13,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <mkdir>:
SYSCALL(mkdir)
 46d:	b8 14 00 00 00       	mov    $0x14,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <chdir>:
SYSCALL(chdir)
 475:	b8 09 00 00 00       	mov    $0x9,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <dup>:
SYSCALL(dup)
 47d:	b8 0a 00 00 00       	mov    $0xa,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <getpid>:
SYSCALL(getpid)
 485:	b8 0b 00 00 00       	mov    $0xb,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <sbrk>:
SYSCALL(sbrk)
 48d:	b8 0c 00 00 00       	mov    $0xc,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <sleep>:
SYSCALL(sleep)
 495:	b8 0d 00 00 00       	mov    $0xd,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <uptime>:
SYSCALL(uptime)
 49d:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <getpinfo>:
SYSCALL(getpinfo)
 4a5:	b8 16 00 00 00       	mov    $0x16,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4ad:	55                   	push   %ebp
 4ae:	89 e5                	mov    %esp,%ebp
 4b0:	83 ec 18             	sub    $0x18,%esp
 4b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b6:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4b9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c0:	00 
 4c1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
 4cb:	89 04 24             	mov    %eax,(%esp)
 4ce:	e8 52 ff ff ff       	call   425 <write>
}
 4d3:	c9                   	leave  
 4d4:	c3                   	ret    

000004d5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d5:	55                   	push   %ebp
 4d6:	89 e5                	mov    %esp,%ebp
 4d8:	56                   	push   %esi
 4d9:	53                   	push   %ebx
 4da:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4e4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4e8:	74 17                	je     501 <printint+0x2c>
 4ea:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4ee:	79 11                	jns    501 <printint+0x2c>
    neg = 1;
 4f0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fa:	f7 d8                	neg    %eax
 4fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4ff:	eb 06                	jmp    507 <printint+0x32>
  } else {
    x = xx;
 501:	8b 45 0c             	mov    0xc(%ebp),%eax
 504:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 507:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 50e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 511:	8d 41 01             	lea    0x1(%ecx),%eax
 514:	89 45 f4             	mov    %eax,-0xc(%ebp)
 517:	8b 5d 10             	mov    0x10(%ebp),%ebx
 51a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 51d:	ba 00 00 00 00       	mov    $0x0,%edx
 522:	f7 f3                	div    %ebx
 524:	89 d0                	mov    %edx,%eax
 526:	0f b6 80 24 0c 00 00 	movzbl 0xc24(%eax),%eax
 52d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 531:	8b 75 10             	mov    0x10(%ebp),%esi
 534:	8b 45 ec             	mov    -0x14(%ebp),%eax
 537:	ba 00 00 00 00       	mov    $0x0,%edx
 53c:	f7 f6                	div    %esi
 53e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 541:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 545:	75 c7                	jne    50e <printint+0x39>
  if(neg)
 547:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 54b:	74 10                	je     55d <printint+0x88>
    buf[i++] = '-';
 54d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 550:	8d 50 01             	lea    0x1(%eax),%edx
 553:	89 55 f4             	mov    %edx,-0xc(%ebp)
 556:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 55b:	eb 1f                	jmp    57c <printint+0xa7>
 55d:	eb 1d                	jmp    57c <printint+0xa7>
    putc(fd, buf[i]);
 55f:	8d 55 dc             	lea    -0x24(%ebp),%edx
 562:	8b 45 f4             	mov    -0xc(%ebp),%eax
 565:	01 d0                	add    %edx,%eax
 567:	0f b6 00             	movzbl (%eax),%eax
 56a:	0f be c0             	movsbl %al,%eax
 56d:	89 44 24 04          	mov    %eax,0x4(%esp)
 571:	8b 45 08             	mov    0x8(%ebp),%eax
 574:	89 04 24             	mov    %eax,(%esp)
 577:	e8 31 ff ff ff       	call   4ad <putc>
  while(--i >= 0)
 57c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 580:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 584:	79 d9                	jns    55f <printint+0x8a>
}
 586:	83 c4 30             	add    $0x30,%esp
 589:	5b                   	pop    %ebx
 58a:	5e                   	pop    %esi
 58b:	5d                   	pop    %ebp
 58c:	c3                   	ret    

0000058d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 58d:	55                   	push   %ebp
 58e:	89 e5                	mov    %esp,%ebp
 590:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 593:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 59a:	8d 45 0c             	lea    0xc(%ebp),%eax
 59d:	83 c0 04             	add    $0x4,%eax
 5a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5aa:	e9 7c 01 00 00       	jmp    72b <printf+0x19e>
    c = fmt[i] & 0xff;
 5af:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5b5:	01 d0                	add    %edx,%eax
 5b7:	0f b6 00             	movzbl (%eax),%eax
 5ba:	0f be c0             	movsbl %al,%eax
 5bd:	25 ff 00 00 00       	and    $0xff,%eax
 5c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c9:	75 2c                	jne    5f7 <printf+0x6a>
      if(c == '%'){
 5cb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5cf:	75 0c                	jne    5dd <printf+0x50>
        state = '%';
 5d1:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5d8:	e9 4a 01 00 00       	jmp    727 <printf+0x19a>
      } else {
        putc(fd, c);
 5dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e0:	0f be c0             	movsbl %al,%eax
 5e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	89 04 24             	mov    %eax,(%esp)
 5ed:	e8 bb fe ff ff       	call   4ad <putc>
 5f2:	e9 30 01 00 00       	jmp    727 <printf+0x19a>
      }
    } else if(state == '%'){
 5f7:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5fb:	0f 85 26 01 00 00    	jne    727 <printf+0x19a>
      if(c == 'd'){
 601:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 605:	75 2d                	jne    634 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 607:	8b 45 e8             	mov    -0x18(%ebp),%eax
 60a:	8b 00                	mov    (%eax),%eax
 60c:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 613:	00 
 614:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 61b:	00 
 61c:	89 44 24 04          	mov    %eax,0x4(%esp)
 620:	8b 45 08             	mov    0x8(%ebp),%eax
 623:	89 04 24             	mov    %eax,(%esp)
 626:	e8 aa fe ff ff       	call   4d5 <printint>
        ap++;
 62b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 62f:	e9 ec 00 00 00       	jmp    720 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 634:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 638:	74 06                	je     640 <printf+0xb3>
 63a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 63e:	75 2d                	jne    66d <printf+0xe0>
        printint(fd, *ap, 16, 0);
 640:	8b 45 e8             	mov    -0x18(%ebp),%eax
 643:	8b 00                	mov    (%eax),%eax
 645:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 64c:	00 
 64d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 654:	00 
 655:	89 44 24 04          	mov    %eax,0x4(%esp)
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	89 04 24             	mov    %eax,(%esp)
 65f:	e8 71 fe ff ff       	call   4d5 <printint>
        ap++;
 664:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 668:	e9 b3 00 00 00       	jmp    720 <printf+0x193>
      } else if(c == 's'){
 66d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 671:	75 45                	jne    6b8 <printf+0x12b>
        s = (char*)*ap;
 673:	8b 45 e8             	mov    -0x18(%ebp),%eax
 676:	8b 00                	mov    (%eax),%eax
 678:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 67b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 67f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 683:	75 09                	jne    68e <printf+0x101>
          s = "(null)";
 685:	c7 45 f4 a9 09 00 00 	movl   $0x9a9,-0xc(%ebp)
        while(*s != 0){
 68c:	eb 1e                	jmp    6ac <printf+0x11f>
 68e:	eb 1c                	jmp    6ac <printf+0x11f>
          putc(fd, *s);
 690:	8b 45 f4             	mov    -0xc(%ebp),%eax
 693:	0f b6 00             	movzbl (%eax),%eax
 696:	0f be c0             	movsbl %al,%eax
 699:	89 44 24 04          	mov    %eax,0x4(%esp)
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	89 04 24             	mov    %eax,(%esp)
 6a3:	e8 05 fe ff ff       	call   4ad <putc>
          s++;
 6a8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6af:	0f b6 00             	movzbl (%eax),%eax
 6b2:	84 c0                	test   %al,%al
 6b4:	75 da                	jne    690 <printf+0x103>
 6b6:	eb 68                	jmp    720 <printf+0x193>
        }
      } else if(c == 'c'){
 6b8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6bc:	75 1d                	jne    6db <printf+0x14e>
        putc(fd, *ap);
 6be:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c1:	8b 00                	mov    (%eax),%eax
 6c3:	0f be c0             	movsbl %al,%eax
 6c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ca:	8b 45 08             	mov    0x8(%ebp),%eax
 6cd:	89 04 24             	mov    %eax,(%esp)
 6d0:	e8 d8 fd ff ff       	call   4ad <putc>
        ap++;
 6d5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d9:	eb 45                	jmp    720 <printf+0x193>
      } else if(c == '%'){
 6db:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6df:	75 17                	jne    6f8 <printf+0x16b>
        putc(fd, c);
 6e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e4:	0f be c0             	movsbl %al,%eax
 6e7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6eb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ee:	89 04 24             	mov    %eax,(%esp)
 6f1:	e8 b7 fd ff ff       	call   4ad <putc>
 6f6:	eb 28                	jmp    720 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6f8:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6ff:	00 
 700:	8b 45 08             	mov    0x8(%ebp),%eax
 703:	89 04 24             	mov    %eax,(%esp)
 706:	e8 a2 fd ff ff       	call   4ad <putc>
        putc(fd, c);
 70b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 70e:	0f be c0             	movsbl %al,%eax
 711:	89 44 24 04          	mov    %eax,0x4(%esp)
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	89 04 24             	mov    %eax,(%esp)
 71b:	e8 8d fd ff ff       	call   4ad <putc>
      }
      state = 0;
 720:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 727:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 72b:	8b 55 0c             	mov    0xc(%ebp),%edx
 72e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 731:	01 d0                	add    %edx,%eax
 733:	0f b6 00             	movzbl (%eax),%eax
 736:	84 c0                	test   %al,%al
 738:	0f 85 71 fe ff ff    	jne    5af <printf+0x22>
    }
  }
}
 73e:	c9                   	leave  
 73f:	c3                   	ret    

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 746:	8b 45 08             	mov    0x8(%ebp),%eax
 749:	83 e8 08             	sub    $0x8,%eax
 74c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74f:	a1 40 0c 00 00       	mov    0xc40,%eax
 754:	89 45 fc             	mov    %eax,-0x4(%ebp)
 757:	eb 24                	jmp    77d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 759:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75c:	8b 00                	mov    (%eax),%eax
 75e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 761:	77 12                	ja     775 <free+0x35>
 763:	8b 45 f8             	mov    -0x8(%ebp),%eax
 766:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 769:	77 24                	ja     78f <free+0x4f>
 76b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76e:	8b 00                	mov    (%eax),%eax
 770:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 773:	77 1a                	ja     78f <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 775:	8b 45 fc             	mov    -0x4(%ebp),%eax
 778:	8b 00                	mov    (%eax),%eax
 77a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 77d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 780:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 783:	76 d4                	jbe    759 <free+0x19>
 785:	8b 45 fc             	mov    -0x4(%ebp),%eax
 788:	8b 00                	mov    (%eax),%eax
 78a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 78d:	76 ca                	jbe    759 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 78f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 792:	8b 40 04             	mov    0x4(%eax),%eax
 795:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 79c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79f:	01 c2                	add    %eax,%edx
 7a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a4:	8b 00                	mov    (%eax),%eax
 7a6:	39 c2                	cmp    %eax,%edx
 7a8:	75 24                	jne    7ce <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ad:	8b 50 04             	mov    0x4(%eax),%edx
 7b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b3:	8b 00                	mov    (%eax),%eax
 7b5:	8b 40 04             	mov    0x4(%eax),%eax
 7b8:	01 c2                	add    %eax,%edx
 7ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c3:	8b 00                	mov    (%eax),%eax
 7c5:	8b 10                	mov    (%eax),%edx
 7c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ca:	89 10                	mov    %edx,(%eax)
 7cc:	eb 0a                	jmp    7d8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d1:	8b 10                	mov    (%eax),%edx
 7d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7db:	8b 40 04             	mov    0x4(%eax),%eax
 7de:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e8:	01 d0                	add    %edx,%eax
 7ea:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ed:	75 20                	jne    80f <free+0xcf>
    p->s.size += bp->s.size;
 7ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f2:	8b 50 04             	mov    0x4(%eax),%edx
 7f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f8:	8b 40 04             	mov    0x4(%eax),%eax
 7fb:	01 c2                	add    %eax,%edx
 7fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 800:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 803:	8b 45 f8             	mov    -0x8(%ebp),%eax
 806:	8b 10                	mov    (%eax),%edx
 808:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80b:	89 10                	mov    %edx,(%eax)
 80d:	eb 08                	jmp    817 <free+0xd7>
  } else
    p->s.ptr = bp;
 80f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 812:	8b 55 f8             	mov    -0x8(%ebp),%edx
 815:	89 10                	mov    %edx,(%eax)
  freep = p;
 817:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81a:	a3 40 0c 00 00       	mov    %eax,0xc40
}
 81f:	c9                   	leave  
 820:	c3                   	ret    

00000821 <morecore>:

static Header*
morecore(uint nu)
{
 821:	55                   	push   %ebp
 822:	89 e5                	mov    %esp,%ebp
 824:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 827:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 82e:	77 07                	ja     837 <morecore+0x16>
    nu = 4096;
 830:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 837:	8b 45 08             	mov    0x8(%ebp),%eax
 83a:	c1 e0 03             	shl    $0x3,%eax
 83d:	89 04 24             	mov    %eax,(%esp)
 840:	e8 48 fc ff ff       	call   48d <sbrk>
 845:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 848:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 84c:	75 07                	jne    855 <morecore+0x34>
    return 0;
 84e:	b8 00 00 00 00       	mov    $0x0,%eax
 853:	eb 22                	jmp    877 <morecore+0x56>
  hp = (Header*)p;
 855:	8b 45 f4             	mov    -0xc(%ebp),%eax
 858:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 85b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85e:	8b 55 08             	mov    0x8(%ebp),%edx
 861:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 864:	8b 45 f0             	mov    -0x10(%ebp),%eax
 867:	83 c0 08             	add    $0x8,%eax
 86a:	89 04 24             	mov    %eax,(%esp)
 86d:	e8 ce fe ff ff       	call   740 <free>
  return freep;
 872:	a1 40 0c 00 00       	mov    0xc40,%eax
}
 877:	c9                   	leave  
 878:	c3                   	ret    

00000879 <malloc>:

void*
malloc(uint nbytes)
{
 879:	55                   	push   %ebp
 87a:	89 e5                	mov    %esp,%ebp
 87c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 87f:	8b 45 08             	mov    0x8(%ebp),%eax
 882:	83 c0 07             	add    $0x7,%eax
 885:	c1 e8 03             	shr    $0x3,%eax
 888:	83 c0 01             	add    $0x1,%eax
 88b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 88e:	a1 40 0c 00 00       	mov    0xc40,%eax
 893:	89 45 f0             	mov    %eax,-0x10(%ebp)
 896:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 89a:	75 23                	jne    8bf <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 89c:	c7 45 f0 38 0c 00 00 	movl   $0xc38,-0x10(%ebp)
 8a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a6:	a3 40 0c 00 00       	mov    %eax,0xc40
 8ab:	a1 40 0c 00 00       	mov    0xc40,%eax
 8b0:	a3 38 0c 00 00       	mov    %eax,0xc38
    base.s.size = 0;
 8b5:	c7 05 3c 0c 00 00 00 	movl   $0x0,0xc3c
 8bc:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c2:	8b 00                	mov    (%eax),%eax
 8c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ca:	8b 40 04             	mov    0x4(%eax),%eax
 8cd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d0:	72 4d                	jb     91f <malloc+0xa6>
      if(p->s.size == nunits)
 8d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d5:	8b 40 04             	mov    0x4(%eax),%eax
 8d8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8db:	75 0c                	jne    8e9 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e0:	8b 10                	mov    (%eax),%edx
 8e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e5:	89 10                	mov    %edx,(%eax)
 8e7:	eb 26                	jmp    90f <malloc+0x96>
      else {
        p->s.size -= nunits;
 8e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ec:	8b 40 04             	mov    0x4(%eax),%eax
 8ef:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8f2:	89 c2                	mov    %eax,%edx
 8f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fd:	8b 40 04             	mov    0x4(%eax),%eax
 900:	c1 e0 03             	shl    $0x3,%eax
 903:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 906:	8b 45 f4             	mov    -0xc(%ebp),%eax
 909:	8b 55 ec             	mov    -0x14(%ebp),%edx
 90c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 90f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 912:	a3 40 0c 00 00       	mov    %eax,0xc40
      return (void*)(p + 1);
 917:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91a:	83 c0 08             	add    $0x8,%eax
 91d:	eb 38                	jmp    957 <malloc+0xde>
    }
    if(p == freep)
 91f:	a1 40 0c 00 00       	mov    0xc40,%eax
 924:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 927:	75 1b                	jne    944 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 929:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92c:	89 04 24             	mov    %eax,(%esp)
 92f:	e8 ed fe ff ff       	call   821 <morecore>
 934:	89 45 f4             	mov    %eax,-0xc(%ebp)
 937:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 93b:	75 07                	jne    944 <malloc+0xcb>
        return 0;
 93d:	b8 00 00 00 00       	mov    $0x0,%eax
 942:	eb 13                	jmp    957 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 944:	8b 45 f4             	mov    -0xc(%ebp),%eax
 947:	89 45 f0             	mov    %eax,-0x10(%ebp)
 94a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94d:	8b 00                	mov    (%eax),%eax
 94f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 952:	e9 70 ff ff ff       	jmp    8c7 <malloc+0x4e>
}
 957:	c9                   	leave  
 958:	c3                   	ret    
