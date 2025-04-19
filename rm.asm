
_rm:     file format elf32-i386


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

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: rm files...\n");
   f:	c7 44 24 04 77 09 00 	movl   $0x977,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 88 05 00 00       	call   5ab <printf>
    exit();
  23:	e8 f3 03 00 00       	call   41b <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 4f                	jmp    81 <main+0x81>
    if(unlink(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 1f 04 00 00       	call   46b <unlink>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 8b 09 00 	movl   $0x98b,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 31 05 00 00       	call   5ab <printf>
      break;
  7a:	eb 0e                	jmp    8a <main+0x8a>
  for(i = 1; i < argc; i++){
  7c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  81:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  85:	3b 45 08             	cmp    0x8(%ebp),%eax
  88:	7c a8                	jl     32 <main+0x32>
    }
  }

  exit();
  8a:	e8 8c 03 00 00       	call   41b <exit>

0000008f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 10             	mov    0x10(%ebp),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	89 cb                	mov    %ecx,%ebx
  9f:	89 df                	mov    %ebx,%edi
  a1:	89 d1                	mov    %edx,%ecx
  a3:	fc                   	cld    
  a4:	f3 aa                	rep stos %al,%es:(%edi)
  a6:	89 ca                	mov    %ecx,%edx
  a8:	89 fb                	mov    %edi,%ebx
  aa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ad:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b0:	5b                   	pop    %ebx
  b1:	5f                   	pop    %edi
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c0:	90                   	nop
  c1:	8b 45 08             	mov    0x8(%ebp),%eax
  c4:	8d 50 01             	lea    0x1(%eax),%edx
  c7:	89 55 08             	mov    %edx,0x8(%ebp)
  ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  cd:	8d 4a 01             	lea    0x1(%edx),%ecx
  d0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d3:	0f b6 12             	movzbl (%edx),%edx
  d6:	88 10                	mov    %dl,(%eax)
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	75 e2                	jne    c1 <strcpy+0xd>
    ;
  return os;
  df:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e2:	c9                   	leave  
  e3:	c3                   	ret    

000000e4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e7:	eb 08                	jmp    f1 <strcmp+0xd>
    p++, q++;
  e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ed:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	84 c0                	test   %al,%al
  f9:	74 10                	je     10b <strcmp+0x27>
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	0f b6 10             	movzbl (%eax),%edx
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	0f b6 00             	movzbl (%eax),%eax
 107:	38 c2                	cmp    %al,%dl
 109:	74 de                	je     e9 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	0f b6 00             	movzbl (%eax),%eax
 111:	0f b6 d0             	movzbl %al,%edx
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	0f b6 00             	movzbl (%eax),%eax
 11a:	0f b6 c0             	movzbl %al,%eax
 11d:	29 c2                	sub    %eax,%edx
 11f:	89 d0                	mov    %edx,%eax
}
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    

00000123 <strlen>:

uint
strlen(const char *s)
{
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 129:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 130:	eb 04                	jmp    136 <strlen+0x13>
 132:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 136:	8b 55 fc             	mov    -0x4(%ebp),%edx
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	01 d0                	add    %edx,%eax
 13e:	0f b6 00             	movzbl (%eax),%eax
 141:	84 c0                	test   %al,%al
 143:	75 ed                	jne    132 <strlen+0xf>
    ;
  return n;
 145:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <memset>:

void*
memset(void *dst, int c, uint n)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 150:	8b 45 10             	mov    0x10(%ebp),%eax
 153:	89 44 24 08          	mov    %eax,0x8(%esp)
 157:	8b 45 0c             	mov    0xc(%ebp),%eax
 15a:	89 44 24 04          	mov    %eax,0x4(%esp)
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	89 04 24             	mov    %eax,(%esp)
 164:	e8 26 ff ff ff       	call   8f <stosb>
  return dst;
 169:	8b 45 08             	mov    0x8(%ebp),%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <strchr>:

char*
strchr(const char *s, char c)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 04             	sub    $0x4,%esp
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 17a:	eb 14                	jmp    190 <strchr+0x22>
    if(*s == c)
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	3a 45 fc             	cmp    -0x4(%ebp),%al
 185:	75 05                	jne    18c <strchr+0x1e>
      return (char*)s;
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	eb 13                	jmp    19f <strchr+0x31>
  for(; *s; s++)
 18c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	84 c0                	test   %al,%al
 198:	75 e2                	jne    17c <strchr+0xe>
  return 0;
 19a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19f:	c9                   	leave  
 1a0:	c3                   	ret    

000001a1 <gets>:

char*
gets(char *buf, int max)
{
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
 1a4:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1ae:	eb 4c                	jmp    1fc <gets+0x5b>
    cc = read(0, &c, 1);
 1b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b7:	00 
 1b8:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c6:	e8 68 02 00 00       	call   433 <read>
 1cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d2:	7f 02                	jg     1d6 <gets+0x35>
      break;
 1d4:	eb 31                	jmp    207 <gets+0x66>
    buf[i++] = c;
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	8d 50 01             	lea    0x1(%eax),%edx
 1dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1df:	89 c2                	mov    %eax,%edx
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	01 c2                	add    %eax,%edx
 1e6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ea:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0a                	cmp    $0xa,%al
 1f2:	74 13                	je     207 <gets+0x66>
 1f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0b                	je     207 <gets+0x66>
  for(i=0; i+1 < max; ){
 1fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ff:	83 c0 01             	add    $0x1,%eax
 202:	3b 45 0c             	cmp    0xc(%ebp),%eax
 205:	7c a9                	jl     1b0 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 207:	8b 55 f4             	mov    -0xc(%ebp),%edx
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	01 d0                	add    %edx,%eax
 20f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <stat>:

int
stat(const char *n, struct stat *st)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 224:	00 
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	89 04 24             	mov    %eax,(%esp)
 22b:	e8 2b 02 00 00       	call   45b <open>
 230:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 233:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 237:	79 07                	jns    240 <stat+0x29>
    return -1;
 239:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23e:	eb 23                	jmp    263 <stat+0x4c>
  r = fstat(fd, st);
 240:	8b 45 0c             	mov    0xc(%ebp),%eax
 243:	89 44 24 04          	mov    %eax,0x4(%esp)
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	89 04 24             	mov    %eax,(%esp)
 24d:	e8 21 02 00 00       	call   473 <fstat>
 252:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 255:	8b 45 f4             	mov    -0xc(%ebp),%eax
 258:	89 04 24             	mov    %eax,(%esp)
 25b:	e8 e3 01 00 00       	call   443 <close>
  return r;
 260:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <atoi>:

int
atoi(const char *s)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 26b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 272:	eb 25                	jmp    299 <atoi+0x34>
    n = n*10 + *s++ - '0';
 274:	8b 55 fc             	mov    -0x4(%ebp),%edx
 277:	89 d0                	mov    %edx,%eax
 279:	c1 e0 02             	shl    $0x2,%eax
 27c:	01 d0                	add    %edx,%eax
 27e:	01 c0                	add    %eax,%eax
 280:	89 c1                	mov    %eax,%ecx
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 08             	mov    %edx,0x8(%ebp)
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	01 c8                	add    %ecx,%eax
 293:	83 e8 30             	sub    $0x30,%eax
 296:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	0f b6 00             	movzbl (%eax),%eax
 29f:	3c 2f                	cmp    $0x2f,%al
 2a1:	7e 0a                	jle    2ad <atoi+0x48>
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	3c 39                	cmp    $0x39,%al
 2ab:	7e c7                	jle    274 <atoi+0xf>
  return n;
 2ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    

000002b2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c4:	eb 17                	jmp    2dd <memmove+0x2b>
    *dst++ = *src++;
 2c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c9:	8d 50 01             	lea    0x1(%eax),%edx
 2cc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d2:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2d8:	0f b6 12             	movzbl (%edx),%edx
 2db:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2dd:	8b 45 10             	mov    0x10(%ebp),%eax
 2e0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e3:	89 55 10             	mov    %edx,0x10(%ebp)
 2e6:	85 c0                	test   %eax,%eax
 2e8:	7f dc                	jg     2c6 <memmove+0x14>
  return vdst;
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ed:	c9                   	leave  
 2ee:	c3                   	ret    

000002ef <ps>:

void ps(void) {
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	57                   	push   %edi
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 2fb:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 b2 01 00 00       	call   4bb <getpinfo>

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 309:	c7 44 24 04 a4 09 00 	movl   $0x9a4,0x4(%esp)
 310:	00 
 311:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 318:	e8 8e 02 00 00       	call   5ab <printf>

  int i = 0;
 31d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 324:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 32b:	e9 ce 00 00 00       	jmp    3fe <ps+0x10f>
    if (pstat[i].inuse) {
 330:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 333:	89 d0                	mov    %edx,%eax
 335:	c1 e0 03             	shl    $0x3,%eax
 338:	01 d0                	add    %edx,%eax
 33a:	c1 e0 02             	shl    $0x2,%eax
 33d:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 340:	01 d8                	add    %ebx,%eax
 342:	2d 04 09 00 00       	sub    $0x904,%eax
 347:	8b 00                	mov    (%eax),%eax
 349:	85 c0                	test   %eax,%eax
 34b:	0f 84 a9 00 00 00    	je     3fa <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 351:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 357:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 35a:	89 d0                	mov    %edx,%eax
 35c:	c1 e0 03             	shl    $0x3,%eax
 35f:	01 d0                	add    %edx,%eax
 361:	c1 e0 02             	shl    $0x2,%eax
 364:	83 c0 10             	add    $0x10,%eax
 367:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 36a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 36d:	89 d0                	mov    %edx,%eax
 36f:	c1 e0 03             	shl    $0x3,%eax
 372:	01 d0                	add    %edx,%eax
 374:	c1 e0 02             	shl    $0x2,%eax
 377:	8d 75 e8             	lea    -0x18(%ebp),%esi
 37a:	01 f0                	add    %esi,%eax
 37c:	2d e4 08 00 00       	sub    $0x8e4,%eax
 381:	0f b6 00             	movzbl (%eax),%eax
 384:	0f be f0             	movsbl %al,%esi
 387:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 38a:	89 d0                	mov    %edx,%eax
 38c:	c1 e0 03             	shl    $0x3,%eax
 38f:	01 d0                	add    %edx,%eax
 391:	c1 e0 02             	shl    $0x2,%eax
 394:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 397:	01 c8                	add    %ecx,%eax
 399:	2d f8 08 00 00       	sub    $0x8f8,%eax
 39e:	8b 18                	mov    (%eax),%ebx
 3a0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3a3:	89 d0                	mov    %edx,%eax
 3a5:	c1 e0 03             	shl    $0x3,%eax
 3a8:	01 d0                	add    %edx,%eax
 3aa:	c1 e0 02             	shl    $0x2,%eax
 3ad:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 3b0:	01 c8                	add    %ecx,%eax
 3b2:	2d 00 09 00 00       	sub    $0x900,%eax
 3b7:	8b 08                	mov    (%eax),%ecx
 3b9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3bc:	89 d0                	mov    %edx,%eax
 3be:	c1 e0 03             	shl    $0x3,%eax
 3c1:	01 d0                	add    %edx,%eax
 3c3:	c1 e0 02             	shl    $0x2,%eax
 3c6:	8d 55 e8             	lea    -0x18(%ebp),%edx
 3c9:	01 d0                	add    %edx,%eax
 3cb:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3d0:	8b 00                	mov    (%eax),%eax
 3d2:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3d6:	89 74 24 14          	mov    %esi,0x14(%esp)
 3da:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3de:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3e2:	89 44 24 08          	mov    %eax,0x8(%esp)
 3e6:	c7 44 24 04 bd 09 00 	movl   $0x9bd,0x4(%esp)
 3ed:	00 
 3ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3f5:	e8 b1 01 00 00       	call   5ab <printf>
  for (i = 0; i < NPROC; ++i) {
 3fa:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3fe:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 402:	0f 8e 28 ff ff ff    	jle    330 <ps+0x41>
    }
  }
 408:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 40e:	5b                   	pop    %ebx
 40f:	5e                   	pop    %esi
 410:	5f                   	pop    %edi
 411:	5d                   	pop    %ebp
 412:	c3                   	ret    

00000413 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 413:	b8 01 00 00 00       	mov    $0x1,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <exit>:
SYSCALL(exit)
 41b:	b8 02 00 00 00       	mov    $0x2,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <wait>:
SYSCALL(wait)
 423:	b8 03 00 00 00       	mov    $0x3,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <pipe>:
SYSCALL(pipe)
 42b:	b8 04 00 00 00       	mov    $0x4,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <read>:
SYSCALL(read)
 433:	b8 05 00 00 00       	mov    $0x5,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <write>:
SYSCALL(write)
 43b:	b8 10 00 00 00       	mov    $0x10,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <close>:
SYSCALL(close)
 443:	b8 15 00 00 00       	mov    $0x15,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <kill>:
SYSCALL(kill)
 44b:	b8 06 00 00 00       	mov    $0x6,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <exec>:
SYSCALL(exec)
 453:	b8 07 00 00 00       	mov    $0x7,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <open>:
SYSCALL(open)
 45b:	b8 0f 00 00 00       	mov    $0xf,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <mknod>:
SYSCALL(mknod)
 463:	b8 11 00 00 00       	mov    $0x11,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <unlink>:
SYSCALL(unlink)
 46b:	b8 12 00 00 00       	mov    $0x12,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <fstat>:
SYSCALL(fstat)
 473:	b8 08 00 00 00       	mov    $0x8,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <link>:
SYSCALL(link)
 47b:	b8 13 00 00 00       	mov    $0x13,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <mkdir>:
SYSCALL(mkdir)
 483:	b8 14 00 00 00       	mov    $0x14,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <chdir>:
SYSCALL(chdir)
 48b:	b8 09 00 00 00       	mov    $0x9,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <dup>:
SYSCALL(dup)
 493:	b8 0a 00 00 00       	mov    $0xa,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <getpid>:
SYSCALL(getpid)
 49b:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <sbrk>:
SYSCALL(sbrk)
 4a3:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <sleep>:
SYSCALL(sleep)
 4ab:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <uptime>:
SYSCALL(uptime)
 4b3:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <getpinfo>:
SYSCALL(getpinfo)
 4bb:	b8 16 00 00 00       	mov    $0x16,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <settickets>:
 4c3:	b8 17 00 00 00       	mov    $0x17,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	83 ec 18             	sub    $0x18,%esp
 4d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d4:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4d7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4de:	00 
 4df:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e6:	8b 45 08             	mov    0x8(%ebp),%eax
 4e9:	89 04 24             	mov    %eax,(%esp)
 4ec:	e8 4a ff ff ff       	call   43b <write>
}
 4f1:	c9                   	leave  
 4f2:	c3                   	ret    

000004f3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4f3:	55                   	push   %ebp
 4f4:	89 e5                	mov    %esp,%ebp
 4f6:	56                   	push   %esi
 4f7:	53                   	push   %ebx
 4f8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 502:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 506:	74 17                	je     51f <printint+0x2c>
 508:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 50c:	79 11                	jns    51f <printint+0x2c>
    neg = 1;
 50e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 515:	8b 45 0c             	mov    0xc(%ebp),%eax
 518:	f7 d8                	neg    %eax
 51a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 51d:	eb 06                	jmp    525 <printint+0x32>
  } else {
    x = xx;
 51f:	8b 45 0c             	mov    0xc(%ebp),%eax
 522:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 525:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 52c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 52f:	8d 41 01             	lea    0x1(%ecx),%eax
 532:	89 45 f4             	mov    %eax,-0xc(%ebp)
 535:	8b 5d 10             	mov    0x10(%ebp),%ebx
 538:	8b 45 ec             	mov    -0x14(%ebp),%eax
 53b:	ba 00 00 00 00       	mov    $0x0,%edx
 540:	f7 f3                	div    %ebx
 542:	89 d0                	mov    %edx,%eax
 544:	0f b6 80 48 0c 00 00 	movzbl 0xc48(%eax),%eax
 54b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 54f:	8b 75 10             	mov    0x10(%ebp),%esi
 552:	8b 45 ec             	mov    -0x14(%ebp),%eax
 555:	ba 00 00 00 00       	mov    $0x0,%edx
 55a:	f7 f6                	div    %esi
 55c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 55f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 563:	75 c7                	jne    52c <printint+0x39>
  if(neg)
 565:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 569:	74 10                	je     57b <printint+0x88>
    buf[i++] = '-';
 56b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56e:	8d 50 01             	lea    0x1(%eax),%edx
 571:	89 55 f4             	mov    %edx,-0xc(%ebp)
 574:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 579:	eb 1f                	jmp    59a <printint+0xa7>
 57b:	eb 1d                	jmp    59a <printint+0xa7>
    putc(fd, buf[i]);
 57d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 580:	8b 45 f4             	mov    -0xc(%ebp),%eax
 583:	01 d0                	add    %edx,%eax
 585:	0f b6 00             	movzbl (%eax),%eax
 588:	0f be c0             	movsbl %al,%eax
 58b:	89 44 24 04          	mov    %eax,0x4(%esp)
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	89 04 24             	mov    %eax,(%esp)
 595:	e8 31 ff ff ff       	call   4cb <putc>
  while(--i >= 0)
 59a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 59e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5a2:	79 d9                	jns    57d <printint+0x8a>
}
 5a4:	83 c4 30             	add    $0x30,%esp
 5a7:	5b                   	pop    %ebx
 5a8:	5e                   	pop    %esi
 5a9:	5d                   	pop    %ebp
 5aa:	c3                   	ret    

000005ab <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5b8:	8d 45 0c             	lea    0xc(%ebp),%eax
 5bb:	83 c0 04             	add    $0x4,%eax
 5be:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5c1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5c8:	e9 7c 01 00 00       	jmp    749 <printf+0x19e>
    c = fmt[i] & 0xff;
 5cd:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d3:	01 d0                	add    %edx,%eax
 5d5:	0f b6 00             	movzbl (%eax),%eax
 5d8:	0f be c0             	movsbl %al,%eax
 5db:	25 ff 00 00 00       	and    $0xff,%eax
 5e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5e7:	75 2c                	jne    615 <printf+0x6a>
      if(c == '%'){
 5e9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ed:	75 0c                	jne    5fb <printf+0x50>
        state = '%';
 5ef:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5f6:	e9 4a 01 00 00       	jmp    745 <printf+0x19a>
      } else {
        putc(fd, c);
 5fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5fe:	0f be c0             	movsbl %al,%eax
 601:	89 44 24 04          	mov    %eax,0x4(%esp)
 605:	8b 45 08             	mov    0x8(%ebp),%eax
 608:	89 04 24             	mov    %eax,(%esp)
 60b:	e8 bb fe ff ff       	call   4cb <putc>
 610:	e9 30 01 00 00       	jmp    745 <printf+0x19a>
      }
    } else if(state == '%'){
 615:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 619:	0f 85 26 01 00 00    	jne    745 <printf+0x19a>
      if(c == 'd'){
 61f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 623:	75 2d                	jne    652 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 625:	8b 45 e8             	mov    -0x18(%ebp),%eax
 628:	8b 00                	mov    (%eax),%eax
 62a:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 631:	00 
 632:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 639:	00 
 63a:	89 44 24 04          	mov    %eax,0x4(%esp)
 63e:	8b 45 08             	mov    0x8(%ebp),%eax
 641:	89 04 24             	mov    %eax,(%esp)
 644:	e8 aa fe ff ff       	call   4f3 <printint>
        ap++;
 649:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 64d:	e9 ec 00 00 00       	jmp    73e <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 652:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 656:	74 06                	je     65e <printf+0xb3>
 658:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 65c:	75 2d                	jne    68b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 65e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 661:	8b 00                	mov    (%eax),%eax
 663:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 66a:	00 
 66b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 672:	00 
 673:	89 44 24 04          	mov    %eax,0x4(%esp)
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	89 04 24             	mov    %eax,(%esp)
 67d:	e8 71 fe ff ff       	call   4f3 <printint>
        ap++;
 682:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 686:	e9 b3 00 00 00       	jmp    73e <printf+0x193>
      } else if(c == 's'){
 68b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 68f:	75 45                	jne    6d6 <printf+0x12b>
        s = (char*)*ap;
 691:	8b 45 e8             	mov    -0x18(%ebp),%eax
 694:	8b 00                	mov    (%eax),%eax
 696:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 699:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 69d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6a1:	75 09                	jne    6ac <printf+0x101>
          s = "(null)";
 6a3:	c7 45 f4 cd 09 00 00 	movl   $0x9cd,-0xc(%ebp)
        while(*s != 0){
 6aa:	eb 1e                	jmp    6ca <printf+0x11f>
 6ac:	eb 1c                	jmp    6ca <printf+0x11f>
          putc(fd, *s);
 6ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b1:	0f b6 00             	movzbl (%eax),%eax
 6b4:	0f be c0             	movsbl %al,%eax
 6b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bb:	8b 45 08             	mov    0x8(%ebp),%eax
 6be:	89 04 24             	mov    %eax,(%esp)
 6c1:	e8 05 fe ff ff       	call   4cb <putc>
          s++;
 6c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6cd:	0f b6 00             	movzbl (%eax),%eax
 6d0:	84 c0                	test   %al,%al
 6d2:	75 da                	jne    6ae <printf+0x103>
 6d4:	eb 68                	jmp    73e <printf+0x193>
        }
      } else if(c == 'c'){
 6d6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6da:	75 1d                	jne    6f9 <printf+0x14e>
        putc(fd, *ap);
 6dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6df:	8b 00                	mov    (%eax),%eax
 6e1:	0f be c0             	movsbl %al,%eax
 6e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	89 04 24             	mov    %eax,(%esp)
 6ee:	e8 d8 fd ff ff       	call   4cb <putc>
        ap++;
 6f3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6f7:	eb 45                	jmp    73e <printf+0x193>
      } else if(c == '%'){
 6f9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6fd:	75 17                	jne    716 <printf+0x16b>
        putc(fd, c);
 6ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 702:	0f be c0             	movsbl %al,%eax
 705:	89 44 24 04          	mov    %eax,0x4(%esp)
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	89 04 24             	mov    %eax,(%esp)
 70f:	e8 b7 fd ff ff       	call   4cb <putc>
 714:	eb 28                	jmp    73e <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 716:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 71d:	00 
 71e:	8b 45 08             	mov    0x8(%ebp),%eax
 721:	89 04 24             	mov    %eax,(%esp)
 724:	e8 a2 fd ff ff       	call   4cb <putc>
        putc(fd, c);
 729:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 72c:	0f be c0             	movsbl %al,%eax
 72f:	89 44 24 04          	mov    %eax,0x4(%esp)
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	89 04 24             	mov    %eax,(%esp)
 739:	e8 8d fd ff ff       	call   4cb <putc>
      }
      state = 0;
 73e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 745:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 749:	8b 55 0c             	mov    0xc(%ebp),%edx
 74c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74f:	01 d0                	add    %edx,%eax
 751:	0f b6 00             	movzbl (%eax),%eax
 754:	84 c0                	test   %al,%al
 756:	0f 85 71 fe ff ff    	jne    5cd <printf+0x22>
    }
  }
}
 75c:	c9                   	leave  
 75d:	c3                   	ret    

0000075e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 75e:	55                   	push   %ebp
 75f:	89 e5                	mov    %esp,%ebp
 761:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	83 e8 08             	sub    $0x8,%eax
 76a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76d:	a1 64 0c 00 00       	mov    0xc64,%eax
 772:	89 45 fc             	mov    %eax,-0x4(%ebp)
 775:	eb 24                	jmp    79b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 777:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77a:	8b 00                	mov    (%eax),%eax
 77c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77f:	77 12                	ja     793 <free+0x35>
 781:	8b 45 f8             	mov    -0x8(%ebp),%eax
 784:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 787:	77 24                	ja     7ad <free+0x4f>
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	8b 00                	mov    (%eax),%eax
 78e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 791:	77 1a                	ja     7ad <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 793:	8b 45 fc             	mov    -0x4(%ebp),%eax
 796:	8b 00                	mov    (%eax),%eax
 798:	89 45 fc             	mov    %eax,-0x4(%ebp)
 79b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a1:	76 d4                	jbe    777 <free+0x19>
 7a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a6:	8b 00                	mov    (%eax),%eax
 7a8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ab:	76 ca                	jbe    777 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b0:	8b 40 04             	mov    0x4(%eax),%eax
 7b3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bd:	01 c2                	add    %eax,%edx
 7bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c2:	8b 00                	mov    (%eax),%eax
 7c4:	39 c2                	cmp    %eax,%edx
 7c6:	75 24                	jne    7ec <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cb:	8b 50 04             	mov    0x4(%eax),%edx
 7ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d1:	8b 00                	mov    (%eax),%eax
 7d3:	8b 40 04             	mov    0x4(%eax),%eax
 7d6:	01 c2                	add    %eax,%edx
 7d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7db:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e1:	8b 00                	mov    (%eax),%eax
 7e3:	8b 10                	mov    (%eax),%edx
 7e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e8:	89 10                	mov    %edx,(%eax)
 7ea:	eb 0a                	jmp    7f6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ef:	8b 10                	mov    (%eax),%edx
 7f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f9:	8b 40 04             	mov    0x4(%eax),%eax
 7fc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 803:	8b 45 fc             	mov    -0x4(%ebp),%eax
 806:	01 d0                	add    %edx,%eax
 808:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 80b:	75 20                	jne    82d <free+0xcf>
    p->s.size += bp->s.size;
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	8b 50 04             	mov    0x4(%eax),%edx
 813:	8b 45 f8             	mov    -0x8(%ebp),%eax
 816:	8b 40 04             	mov    0x4(%eax),%eax
 819:	01 c2                	add    %eax,%edx
 81b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 821:	8b 45 f8             	mov    -0x8(%ebp),%eax
 824:	8b 10                	mov    (%eax),%edx
 826:	8b 45 fc             	mov    -0x4(%ebp),%eax
 829:	89 10                	mov    %edx,(%eax)
 82b:	eb 08                	jmp    835 <free+0xd7>
  } else
    p->s.ptr = bp;
 82d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 830:	8b 55 f8             	mov    -0x8(%ebp),%edx
 833:	89 10                	mov    %edx,(%eax)
  freep = p;
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	a3 64 0c 00 00       	mov    %eax,0xc64
}
 83d:	c9                   	leave  
 83e:	c3                   	ret    

0000083f <morecore>:

static Header*
morecore(uint nu)
{
 83f:	55                   	push   %ebp
 840:	89 e5                	mov    %esp,%ebp
 842:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 845:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 84c:	77 07                	ja     855 <morecore+0x16>
    nu = 4096;
 84e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 855:	8b 45 08             	mov    0x8(%ebp),%eax
 858:	c1 e0 03             	shl    $0x3,%eax
 85b:	89 04 24             	mov    %eax,(%esp)
 85e:	e8 40 fc ff ff       	call   4a3 <sbrk>
 863:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 866:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 86a:	75 07                	jne    873 <morecore+0x34>
    return 0;
 86c:	b8 00 00 00 00       	mov    $0x0,%eax
 871:	eb 22                	jmp    895 <morecore+0x56>
  hp = (Header*)p;
 873:	8b 45 f4             	mov    -0xc(%ebp),%eax
 876:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 879:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87c:	8b 55 08             	mov    0x8(%ebp),%edx
 87f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 882:	8b 45 f0             	mov    -0x10(%ebp),%eax
 885:	83 c0 08             	add    $0x8,%eax
 888:	89 04 24             	mov    %eax,(%esp)
 88b:	e8 ce fe ff ff       	call   75e <free>
  return freep;
 890:	a1 64 0c 00 00       	mov    0xc64,%eax
}
 895:	c9                   	leave  
 896:	c3                   	ret    

00000897 <malloc>:

void*
malloc(uint nbytes)
{
 897:	55                   	push   %ebp
 898:	89 e5                	mov    %esp,%ebp
 89a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
 8a0:	83 c0 07             	add    $0x7,%eax
 8a3:	c1 e8 03             	shr    $0x3,%eax
 8a6:	83 c0 01             	add    $0x1,%eax
 8a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8ac:	a1 64 0c 00 00       	mov    0xc64,%eax
 8b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8b8:	75 23                	jne    8dd <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8ba:	c7 45 f0 5c 0c 00 00 	movl   $0xc5c,-0x10(%ebp)
 8c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c4:	a3 64 0c 00 00       	mov    %eax,0xc64
 8c9:	a1 64 0c 00 00       	mov    0xc64,%eax
 8ce:	a3 5c 0c 00 00       	mov    %eax,0xc5c
    base.s.size = 0;
 8d3:	c7 05 60 0c 00 00 00 	movl   $0x0,0xc60
 8da:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e0:	8b 00                	mov    (%eax),%eax
 8e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e8:	8b 40 04             	mov    0x4(%eax),%eax
 8eb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8ee:	72 4d                	jb     93d <malloc+0xa6>
      if(p->s.size == nunits)
 8f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f3:	8b 40 04             	mov    0x4(%eax),%eax
 8f6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8f9:	75 0c                	jne    907 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fe:	8b 10                	mov    (%eax),%edx
 900:	8b 45 f0             	mov    -0x10(%ebp),%eax
 903:	89 10                	mov    %edx,(%eax)
 905:	eb 26                	jmp    92d <malloc+0x96>
      else {
        p->s.size -= nunits;
 907:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90a:	8b 40 04             	mov    0x4(%eax),%eax
 90d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 910:	89 c2                	mov    %eax,%edx
 912:	8b 45 f4             	mov    -0xc(%ebp),%eax
 915:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 918:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91b:	8b 40 04             	mov    0x4(%eax),%eax
 91e:	c1 e0 03             	shl    $0x3,%eax
 921:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 924:	8b 45 f4             	mov    -0xc(%ebp),%eax
 927:	8b 55 ec             	mov    -0x14(%ebp),%edx
 92a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 92d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 930:	a3 64 0c 00 00       	mov    %eax,0xc64
      return (void*)(p + 1);
 935:	8b 45 f4             	mov    -0xc(%ebp),%eax
 938:	83 c0 08             	add    $0x8,%eax
 93b:	eb 38                	jmp    975 <malloc+0xde>
    }
    if(p == freep)
 93d:	a1 64 0c 00 00       	mov    0xc64,%eax
 942:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 945:	75 1b                	jne    962 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 947:	8b 45 ec             	mov    -0x14(%ebp),%eax
 94a:	89 04 24             	mov    %eax,(%esp)
 94d:	e8 ed fe ff ff       	call   83f <morecore>
 952:	89 45 f4             	mov    %eax,-0xc(%ebp)
 955:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 959:	75 07                	jne    962 <malloc+0xcb>
        return 0;
 95b:	b8 00 00 00 00       	mov    $0x0,%eax
 960:	eb 13                	jmp    975 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 962:	8b 45 f4             	mov    -0xc(%ebp),%eax
 965:	89 45 f0             	mov    %eax,-0x10(%ebp)
 968:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96b:	8b 00                	mov    (%eax),%eax
 96d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 970:	e9 70 ff ff ff       	jmp    8e5 <malloc+0x4e>
}
 975:	c9                   	leave  
 976:	c3                   	ret    
