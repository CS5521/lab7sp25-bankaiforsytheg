
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "pstat.h"

int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   ps();
   6:	e8 65 02 00 00       	call   270 <ps>
   exit();
   b:	e8 8c 03 00 00       	call   39c <exit>

00000010 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	57                   	push   %edi
  14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  15:	8b 4d 08             	mov    0x8(%ebp),%ecx
  18:	8b 55 10             	mov    0x10(%ebp),%edx
  1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  1e:	89 cb                	mov    %ecx,%ebx
  20:	89 df                	mov    %ebx,%edi
  22:	89 d1                	mov    %edx,%ecx
  24:	fc                   	cld    
  25:	f3 aa                	rep stos %al,%es:(%edi)
  27:	89 ca                	mov    %ecx,%edx
  29:	89 fb                	mov    %edi,%ebx
  2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  31:	5b                   	pop    %ebx
  32:	5f                   	pop    %edi
  33:	5d                   	pop    %ebp
  34:	c3                   	ret    

00000035 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  35:	55                   	push   %ebp
  36:	89 e5                	mov    %esp,%ebp
  38:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  3b:	8b 45 08             	mov    0x8(%ebp),%eax
  3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  41:	90                   	nop
  42:	8b 45 08             	mov    0x8(%ebp),%eax
  45:	8d 50 01             	lea    0x1(%eax),%edx
  48:	89 55 08             	mov    %edx,0x8(%ebp)
  4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  4e:	8d 4a 01             	lea    0x1(%edx),%ecx
  51:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  54:	0f b6 12             	movzbl (%edx),%edx
  57:	88 10                	mov    %dl,(%eax)
  59:	0f b6 00             	movzbl (%eax),%eax
  5c:	84 c0                	test   %al,%al
  5e:	75 e2                	jne    42 <strcpy+0xd>
    ;
  return os;
  60:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  63:	c9                   	leave  
  64:	c3                   	ret    

00000065 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  68:	eb 08                	jmp    72 <strcmp+0xd>
    p++, q++;
  6a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  6e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  72:	8b 45 08             	mov    0x8(%ebp),%eax
  75:	0f b6 00             	movzbl (%eax),%eax
  78:	84 c0                	test   %al,%al
  7a:	74 10                	je     8c <strcmp+0x27>
  7c:	8b 45 08             	mov    0x8(%ebp),%eax
  7f:	0f b6 10             	movzbl (%eax),%edx
  82:	8b 45 0c             	mov    0xc(%ebp),%eax
  85:	0f b6 00             	movzbl (%eax),%eax
  88:	38 c2                	cmp    %al,%dl
  8a:	74 de                	je     6a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	0f b6 00             	movzbl (%eax),%eax
  92:	0f b6 d0             	movzbl %al,%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	0f b6 c0             	movzbl %al,%eax
  9e:	29 c2                	sub    %eax,%edx
  a0:	89 d0                	mov    %edx,%eax
}
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    

000000a4 <strlen>:

uint
strlen(const char *s)
{
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  b1:	eb 04                	jmp    b7 <strlen+0x13>
  b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	01 d0                	add    %edx,%eax
  bf:	0f b6 00             	movzbl (%eax),%eax
  c2:	84 c0                	test   %al,%al
  c4:	75 ed                	jne    b3 <strlen+0xf>
    ;
  return n;
  c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c9:	c9                   	leave  
  ca:	c3                   	ret    

000000cb <memset>:

void*
memset(void *dst, int c, uint n)
{
  cb:	55                   	push   %ebp
  cc:	89 e5                	mov    %esp,%ebp
  ce:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  d1:	8b 45 10             	mov    0x10(%ebp),%eax
  d4:	89 44 24 08          	mov    %eax,0x8(%esp)
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	89 44 24 04          	mov    %eax,0x4(%esp)
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	89 04 24             	mov    %eax,(%esp)
  e5:	e8 26 ff ff ff       	call   10 <stosb>
  return dst;
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
  ed:	c9                   	leave  
  ee:	c3                   	ret    

000000ef <strchr>:

char*
strchr(const char *s, char c)
{
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	83 ec 04             	sub    $0x4,%esp
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  fb:	eb 14                	jmp    111 <strchr+0x22>
    if(*s == c)
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 00             	movzbl (%eax),%eax
 103:	3a 45 fc             	cmp    -0x4(%ebp),%al
 106:	75 05                	jne    10d <strchr+0x1e>
      return (char*)s;
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	eb 13                	jmp    120 <strchr+0x31>
  for(; *s; s++)
 10d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	0f b6 00             	movzbl (%eax),%eax
 117:	84 c0                	test   %al,%al
 119:	75 e2                	jne    fd <strchr+0xe>
  return 0;
 11b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <gets>:

char*
gets(char *buf, int max)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 128:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 12f:	eb 4c                	jmp    17d <gets+0x5b>
    cc = read(0, &c, 1);
 131:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 138:	00 
 139:	8d 45 ef             	lea    -0x11(%ebp),%eax
 13c:	89 44 24 04          	mov    %eax,0x4(%esp)
 140:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 147:	e8 68 02 00 00       	call   3b4 <read>
 14c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 14f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 153:	7f 02                	jg     157 <gets+0x35>
      break;
 155:	eb 31                	jmp    188 <gets+0x66>
    buf[i++] = c;
 157:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15a:	8d 50 01             	lea    0x1(%eax),%edx
 15d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 160:	89 c2                	mov    %eax,%edx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	01 c2                	add    %eax,%edx
 167:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 171:	3c 0a                	cmp    $0xa,%al
 173:	74 13                	je     188 <gets+0x66>
 175:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 179:	3c 0d                	cmp    $0xd,%al
 17b:	74 0b                	je     188 <gets+0x66>
  for(i=0; i+1 < max; ){
 17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 180:	83 c0 01             	add    $0x1,%eax
 183:	3b 45 0c             	cmp    0xc(%ebp),%eax
 186:	7c a9                	jl     131 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 188:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	01 d0                	add    %edx,%eax
 190:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 193:	8b 45 08             	mov    0x8(%ebp),%eax
}
 196:	c9                   	leave  
 197:	c3                   	ret    

00000198 <stat>:

int
stat(const char *n, struct stat *st)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 19e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1a5:	00 
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	89 04 24             	mov    %eax,(%esp)
 1ac:	e8 2b 02 00 00       	call   3dc <open>
 1b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b8:	79 07                	jns    1c1 <stat+0x29>
    return -1;
 1ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1bf:	eb 23                	jmp    1e4 <stat+0x4c>
  r = fstat(fd, st);
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cb:	89 04 24             	mov    %eax,(%esp)
 1ce:	e8 21 02 00 00       	call   3f4 <fstat>
 1d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	89 04 24             	mov    %eax,(%esp)
 1dc:	e8 e3 01 00 00       	call   3c4 <close>
  return r;
 1e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    

000001e6 <atoi>:

int
atoi(const char *s)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1f3:	eb 25                	jmp    21a <atoi+0x34>
    n = n*10 + *s++ - '0';
 1f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f8:	89 d0                	mov    %edx,%eax
 1fa:	c1 e0 02             	shl    $0x2,%eax
 1fd:	01 d0                	add    %edx,%eax
 1ff:	01 c0                	add    %eax,%eax
 201:	89 c1                	mov    %eax,%ecx
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	8d 50 01             	lea    0x1(%eax),%edx
 209:	89 55 08             	mov    %edx,0x8(%ebp)
 20c:	0f b6 00             	movzbl (%eax),%eax
 20f:	0f be c0             	movsbl %al,%eax
 212:	01 c8                	add    %ecx,%eax
 214:	83 e8 30             	sub    $0x30,%eax
 217:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	0f b6 00             	movzbl (%eax),%eax
 220:	3c 2f                	cmp    $0x2f,%al
 222:	7e 0a                	jle    22e <atoi+0x48>
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	3c 39                	cmp    $0x39,%al
 22c:	7e c7                	jle    1f5 <atoi+0xf>
  return n;
 22e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 245:	eb 17                	jmp    25e <memmove+0x2b>
    *dst++ = *src++;
 247:	8b 45 fc             	mov    -0x4(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 250:	8b 55 f8             	mov    -0x8(%ebp),%edx
 253:	8d 4a 01             	lea    0x1(%edx),%ecx
 256:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 259:	0f b6 12             	movzbl (%edx),%edx
 25c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 25e:	8b 45 10             	mov    0x10(%ebp),%eax
 261:	8d 50 ff             	lea    -0x1(%eax),%edx
 264:	89 55 10             	mov    %edx,0x10(%ebp)
 267:	85 c0                	test   %eax,%eax
 269:	7f dc                	jg     247 <memmove+0x14>
  return vdst;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26e:	c9                   	leave  
 26f:	c3                   	ret    

00000270 <ps>:

void ps(void) {
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 27c:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 282:	89 04 24             	mov    %eax,(%esp)
 285:	e8 b2 01 00 00       	call   43c <getpinfo>

  // Print the information TODOWHAT

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 28a:	c7 44 24 04 f0 08 00 	movl   $0x8f0,0x4(%esp)
 291:	00 
 292:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 299:	e8 86 02 00 00       	call   524 <printf>

  int i = 0;
 29e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 2a5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2ac:	e9 ce 00 00 00       	jmp    37f <ps+0x10f>
    if (pstat[i].inuse) {
 2b1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2b4:	89 d0                	mov    %edx,%eax
 2b6:	c1 e0 03             	shl    $0x3,%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	c1 e0 02             	shl    $0x2,%eax
 2be:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 2c1:	01 d8                	add    %ebx,%eax
 2c3:	2d 04 09 00 00       	sub    $0x904,%eax
 2c8:	8b 00                	mov    (%eax),%eax
 2ca:	85 c0                	test   %eax,%eax
 2cc:	0f 84 a9 00 00 00    	je     37b <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 2d2:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 2d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2db:	89 d0                	mov    %edx,%eax
 2dd:	c1 e0 03             	shl    $0x3,%eax
 2e0:	01 d0                	add    %edx,%eax
 2e2:	c1 e0 02             	shl    $0x2,%eax
 2e5:	83 c0 10             	add    $0x10,%eax
 2e8:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 2eb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2ee:	89 d0                	mov    %edx,%eax
 2f0:	c1 e0 03             	shl    $0x3,%eax
 2f3:	01 d0                	add    %edx,%eax
 2f5:	c1 e0 02             	shl    $0x2,%eax
 2f8:	8d 75 e8             	lea    -0x18(%ebp),%esi
 2fb:	01 f0                	add    %esi,%eax
 2fd:	2d e4 08 00 00       	sub    $0x8e4,%eax
 302:	0f b6 00             	movzbl (%eax),%eax
 305:	0f be f0             	movsbl %al,%esi
 308:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 30b:	89 d0                	mov    %edx,%eax
 30d:	c1 e0 03             	shl    $0x3,%eax
 310:	01 d0                	add    %edx,%eax
 312:	c1 e0 02             	shl    $0x2,%eax
 315:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 318:	01 c8                	add    %ecx,%eax
 31a:	2d f8 08 00 00       	sub    $0x8f8,%eax
 31f:	8b 18                	mov    (%eax),%ebx
 321:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 324:	89 d0                	mov    %edx,%eax
 326:	c1 e0 03             	shl    $0x3,%eax
 329:	01 d0                	add    %edx,%eax
 32b:	c1 e0 02             	shl    $0x2,%eax
 32e:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 331:	01 c8                	add    %ecx,%eax
 333:	2d 00 09 00 00       	sub    $0x900,%eax
 338:	8b 08                	mov    (%eax),%ecx
 33a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 33d:	89 d0                	mov    %edx,%eax
 33f:	c1 e0 03             	shl    $0x3,%eax
 342:	01 d0                	add    %edx,%eax
 344:	c1 e0 02             	shl    $0x2,%eax
 347:	8d 55 e8             	lea    -0x18(%ebp),%edx
 34a:	01 d0                	add    %edx,%eax
 34c:	2d fc 08 00 00       	sub    $0x8fc,%eax
 351:	8b 00                	mov    (%eax),%eax
 353:	89 7c 24 18          	mov    %edi,0x18(%esp)
 357:	89 74 24 14          	mov    %esi,0x14(%esp)
 35b:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 35f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 363:	89 44 24 08          	mov    %eax,0x8(%esp)
 367:	c7 44 24 04 09 09 00 	movl   $0x909,0x4(%esp)
 36e:	00 
 36f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 376:	e8 a9 01 00 00       	call   524 <printf>
  for (i = 0; i < NPROC; ++i) {
 37b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 37f:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 383:	0f 8e 28 ff ff ff    	jle    2b1 <ps+0x41>
    }
  }
 389:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 38f:	5b                   	pop    %ebx
 390:	5e                   	pop    %esi
 391:	5f                   	pop    %edi
 392:	5d                   	pop    %ebp
 393:	c3                   	ret    

00000394 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 394:	b8 01 00 00 00       	mov    $0x1,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <exit>:
SYSCALL(exit)
 39c:	b8 02 00 00 00       	mov    $0x2,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <wait>:
SYSCALL(wait)
 3a4:	b8 03 00 00 00       	mov    $0x3,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <pipe>:
SYSCALL(pipe)
 3ac:	b8 04 00 00 00       	mov    $0x4,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <read>:
SYSCALL(read)
 3b4:	b8 05 00 00 00       	mov    $0x5,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <write>:
SYSCALL(write)
 3bc:	b8 10 00 00 00       	mov    $0x10,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <close>:
SYSCALL(close)
 3c4:	b8 15 00 00 00       	mov    $0x15,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <kill>:
SYSCALL(kill)
 3cc:	b8 06 00 00 00       	mov    $0x6,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <exec>:
SYSCALL(exec)
 3d4:	b8 07 00 00 00       	mov    $0x7,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <open>:
SYSCALL(open)
 3dc:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <mknod>:
SYSCALL(mknod)
 3e4:	b8 11 00 00 00       	mov    $0x11,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <unlink>:
SYSCALL(unlink)
 3ec:	b8 12 00 00 00       	mov    $0x12,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <fstat>:
SYSCALL(fstat)
 3f4:	b8 08 00 00 00       	mov    $0x8,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <link>:
SYSCALL(link)
 3fc:	b8 13 00 00 00       	mov    $0x13,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <mkdir>:
SYSCALL(mkdir)
 404:	b8 14 00 00 00       	mov    $0x14,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <chdir>:
SYSCALL(chdir)
 40c:	b8 09 00 00 00       	mov    $0x9,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <dup>:
SYSCALL(dup)
 414:	b8 0a 00 00 00       	mov    $0xa,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <getpid>:
SYSCALL(getpid)
 41c:	b8 0b 00 00 00       	mov    $0xb,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <sbrk>:
SYSCALL(sbrk)
 424:	b8 0c 00 00 00       	mov    $0xc,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <sleep>:
SYSCALL(sleep)
 42c:	b8 0d 00 00 00       	mov    $0xd,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <uptime>:
SYSCALL(uptime)
 434:	b8 0e 00 00 00       	mov    $0xe,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <getpinfo>:
SYSCALL(getpinfo)
 43c:	b8 16 00 00 00       	mov    $0x16,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	83 ec 18             	sub    $0x18,%esp
 44a:	8b 45 0c             	mov    0xc(%ebp),%eax
 44d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 450:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 457:	00 
 458:	8d 45 f4             	lea    -0xc(%ebp),%eax
 45b:	89 44 24 04          	mov    %eax,0x4(%esp)
 45f:	8b 45 08             	mov    0x8(%ebp),%eax
 462:	89 04 24             	mov    %eax,(%esp)
 465:	e8 52 ff ff ff       	call   3bc <write>
}
 46a:	c9                   	leave  
 46b:	c3                   	ret    

0000046c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	56                   	push   %esi
 470:	53                   	push   %ebx
 471:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 474:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 47b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 47f:	74 17                	je     498 <printint+0x2c>
 481:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 485:	79 11                	jns    498 <printint+0x2c>
    neg = 1;
 487:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 48e:	8b 45 0c             	mov    0xc(%ebp),%eax
 491:	f7 d8                	neg    %eax
 493:	89 45 ec             	mov    %eax,-0x14(%ebp)
 496:	eb 06                	jmp    49e <printint+0x32>
  } else {
    x = xx;
 498:	8b 45 0c             	mov    0xc(%ebp),%eax
 49b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 49e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4a5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4a8:	8d 41 01             	lea    0x1(%ecx),%eax
 4ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4ae:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b4:	ba 00 00 00 00       	mov    $0x0,%edx
 4b9:	f7 f3                	div    %ebx
 4bb:	89 d0                	mov    %edx,%eax
 4bd:	0f b6 80 94 0b 00 00 	movzbl 0xb94(%eax),%eax
 4c4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4c8:	8b 75 10             	mov    0x10(%ebp),%esi
 4cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ce:	ba 00 00 00 00       	mov    $0x0,%edx
 4d3:	f7 f6                	div    %esi
 4d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4dc:	75 c7                	jne    4a5 <printint+0x39>
  if(neg)
 4de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4e2:	74 10                	je     4f4 <printint+0x88>
    buf[i++] = '-';
 4e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e7:	8d 50 01             	lea    0x1(%eax),%edx
 4ea:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ed:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4f2:	eb 1f                	jmp    513 <printint+0xa7>
 4f4:	eb 1d                	jmp    513 <printint+0xa7>
    putc(fd, buf[i]);
 4f6:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4fc:	01 d0                	add    %edx,%eax
 4fe:	0f b6 00             	movzbl (%eax),%eax
 501:	0f be c0             	movsbl %al,%eax
 504:	89 44 24 04          	mov    %eax,0x4(%esp)
 508:	8b 45 08             	mov    0x8(%ebp),%eax
 50b:	89 04 24             	mov    %eax,(%esp)
 50e:	e8 31 ff ff ff       	call   444 <putc>
  while(--i >= 0)
 513:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 517:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 51b:	79 d9                	jns    4f6 <printint+0x8a>
}
 51d:	83 c4 30             	add    $0x30,%esp
 520:	5b                   	pop    %ebx
 521:	5e                   	pop    %esi
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    

00000524 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 52a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 531:	8d 45 0c             	lea    0xc(%ebp),%eax
 534:	83 c0 04             	add    $0x4,%eax
 537:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 53a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 541:	e9 7c 01 00 00       	jmp    6c2 <printf+0x19e>
    c = fmt[i] & 0xff;
 546:	8b 55 0c             	mov    0xc(%ebp),%edx
 549:	8b 45 f0             	mov    -0x10(%ebp),%eax
 54c:	01 d0                	add    %edx,%eax
 54e:	0f b6 00             	movzbl (%eax),%eax
 551:	0f be c0             	movsbl %al,%eax
 554:	25 ff 00 00 00       	and    $0xff,%eax
 559:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 55c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 560:	75 2c                	jne    58e <printf+0x6a>
      if(c == '%'){
 562:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 566:	75 0c                	jne    574 <printf+0x50>
        state = '%';
 568:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 56f:	e9 4a 01 00 00       	jmp    6be <printf+0x19a>
      } else {
        putc(fd, c);
 574:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 577:	0f be c0             	movsbl %al,%eax
 57a:	89 44 24 04          	mov    %eax,0x4(%esp)
 57e:	8b 45 08             	mov    0x8(%ebp),%eax
 581:	89 04 24             	mov    %eax,(%esp)
 584:	e8 bb fe ff ff       	call   444 <putc>
 589:	e9 30 01 00 00       	jmp    6be <printf+0x19a>
      }
    } else if(state == '%'){
 58e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 592:	0f 85 26 01 00 00    	jne    6be <printf+0x19a>
      if(c == 'd'){
 598:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 59c:	75 2d                	jne    5cb <printf+0xa7>
        printint(fd, *ap, 10, 1);
 59e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a1:	8b 00                	mov    (%eax),%eax
 5a3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5aa:	00 
 5ab:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5b2:	00 
 5b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ba:	89 04 24             	mov    %eax,(%esp)
 5bd:	e8 aa fe ff ff       	call   46c <printint>
        ap++;
 5c2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c6:	e9 ec 00 00 00       	jmp    6b7 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5cb:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5cf:	74 06                	je     5d7 <printf+0xb3>
 5d1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5d5:	75 2d                	jne    604 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5da:	8b 00                	mov    (%eax),%eax
 5dc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5e3:	00 
 5e4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5eb:	00 
 5ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f0:	8b 45 08             	mov    0x8(%ebp),%eax
 5f3:	89 04 24             	mov    %eax,(%esp)
 5f6:	e8 71 fe ff ff       	call   46c <printint>
        ap++;
 5fb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ff:	e9 b3 00 00 00       	jmp    6b7 <printf+0x193>
      } else if(c == 's'){
 604:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 608:	75 45                	jne    64f <printf+0x12b>
        s = (char*)*ap;
 60a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 60d:	8b 00                	mov    (%eax),%eax
 60f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 612:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 616:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 61a:	75 09                	jne    625 <printf+0x101>
          s = "(null)";
 61c:	c7 45 f4 19 09 00 00 	movl   $0x919,-0xc(%ebp)
        while(*s != 0){
 623:	eb 1e                	jmp    643 <printf+0x11f>
 625:	eb 1c                	jmp    643 <printf+0x11f>
          putc(fd, *s);
 627:	8b 45 f4             	mov    -0xc(%ebp),%eax
 62a:	0f b6 00             	movzbl (%eax),%eax
 62d:	0f be c0             	movsbl %al,%eax
 630:	89 44 24 04          	mov    %eax,0x4(%esp)
 634:	8b 45 08             	mov    0x8(%ebp),%eax
 637:	89 04 24             	mov    %eax,(%esp)
 63a:	e8 05 fe ff ff       	call   444 <putc>
          s++;
 63f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 643:	8b 45 f4             	mov    -0xc(%ebp),%eax
 646:	0f b6 00             	movzbl (%eax),%eax
 649:	84 c0                	test   %al,%al
 64b:	75 da                	jne    627 <printf+0x103>
 64d:	eb 68                	jmp    6b7 <printf+0x193>
        }
      } else if(c == 'c'){
 64f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 653:	75 1d                	jne    672 <printf+0x14e>
        putc(fd, *ap);
 655:	8b 45 e8             	mov    -0x18(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	0f be c0             	movsbl %al,%eax
 65d:	89 44 24 04          	mov    %eax,0x4(%esp)
 661:	8b 45 08             	mov    0x8(%ebp),%eax
 664:	89 04 24             	mov    %eax,(%esp)
 667:	e8 d8 fd ff ff       	call   444 <putc>
        ap++;
 66c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 670:	eb 45                	jmp    6b7 <printf+0x193>
      } else if(c == '%'){
 672:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 676:	75 17                	jne    68f <printf+0x16b>
        putc(fd, c);
 678:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67b:	0f be c0             	movsbl %al,%eax
 67e:	89 44 24 04          	mov    %eax,0x4(%esp)
 682:	8b 45 08             	mov    0x8(%ebp),%eax
 685:	89 04 24             	mov    %eax,(%esp)
 688:	e8 b7 fd ff ff       	call   444 <putc>
 68d:	eb 28                	jmp    6b7 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 68f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 696:	00 
 697:	8b 45 08             	mov    0x8(%ebp),%eax
 69a:	89 04 24             	mov    %eax,(%esp)
 69d:	e8 a2 fd ff ff       	call   444 <putc>
        putc(fd, c);
 6a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a5:	0f be c0             	movsbl %al,%eax
 6a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ac:	8b 45 08             	mov    0x8(%ebp),%eax
 6af:	89 04 24             	mov    %eax,(%esp)
 6b2:	e8 8d fd ff ff       	call   444 <putc>
      }
      state = 0;
 6b7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6be:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6c2:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c8:	01 d0                	add    %edx,%eax
 6ca:	0f b6 00             	movzbl (%eax),%eax
 6cd:	84 c0                	test   %al,%al
 6cf:	0f 85 71 fe ff ff    	jne    546 <printf+0x22>
    }
  }
}
 6d5:	c9                   	leave  
 6d6:	c3                   	ret    

000006d7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d7:	55                   	push   %ebp
 6d8:	89 e5                	mov    %esp,%ebp
 6da:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	83 e8 08             	sub    $0x8,%eax
 6e3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e6:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 6eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ee:	eb 24                	jmp    714 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f3:	8b 00                	mov    (%eax),%eax
 6f5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f8:	77 12                	ja     70c <free+0x35>
 6fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 700:	77 24                	ja     726 <free+0x4f>
 702:	8b 45 fc             	mov    -0x4(%ebp),%eax
 705:	8b 00                	mov    (%eax),%eax
 707:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 70a:	77 1a                	ja     726 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70f:	8b 00                	mov    (%eax),%eax
 711:	89 45 fc             	mov    %eax,-0x4(%ebp)
 714:	8b 45 f8             	mov    -0x8(%ebp),%eax
 717:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 71a:	76 d4                	jbe    6f0 <free+0x19>
 71c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71f:	8b 00                	mov    (%eax),%eax
 721:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 724:	76 ca                	jbe    6f0 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 726:	8b 45 f8             	mov    -0x8(%ebp),%eax
 729:	8b 40 04             	mov    0x4(%eax),%eax
 72c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 733:	8b 45 f8             	mov    -0x8(%ebp),%eax
 736:	01 c2                	add    %eax,%edx
 738:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73b:	8b 00                	mov    (%eax),%eax
 73d:	39 c2                	cmp    %eax,%edx
 73f:	75 24                	jne    765 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 741:	8b 45 f8             	mov    -0x8(%ebp),%eax
 744:	8b 50 04             	mov    0x4(%eax),%edx
 747:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74a:	8b 00                	mov    (%eax),%eax
 74c:	8b 40 04             	mov    0x4(%eax),%eax
 74f:	01 c2                	add    %eax,%edx
 751:	8b 45 f8             	mov    -0x8(%ebp),%eax
 754:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 00                	mov    (%eax),%eax
 75c:	8b 10                	mov    (%eax),%edx
 75e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 761:	89 10                	mov    %edx,(%eax)
 763:	eb 0a                	jmp    76f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 765:	8b 45 fc             	mov    -0x4(%ebp),%eax
 768:	8b 10                	mov    (%eax),%edx
 76a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 772:	8b 40 04             	mov    0x4(%eax),%eax
 775:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 77c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77f:	01 d0                	add    %edx,%eax
 781:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 784:	75 20                	jne    7a6 <free+0xcf>
    p->s.size += bp->s.size;
 786:	8b 45 fc             	mov    -0x4(%ebp),%eax
 789:	8b 50 04             	mov    0x4(%eax),%edx
 78c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78f:	8b 40 04             	mov    0x4(%eax),%eax
 792:	01 c2                	add    %eax,%edx
 794:	8b 45 fc             	mov    -0x4(%ebp),%eax
 797:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 79a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79d:	8b 10                	mov    (%eax),%edx
 79f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a2:	89 10                	mov    %edx,(%eax)
 7a4:	eb 08                	jmp    7ae <free+0xd7>
  } else
    p->s.ptr = bp;
 7a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7ac:	89 10                	mov    %edx,(%eax)
  freep = p;
 7ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b1:	a3 b0 0b 00 00       	mov    %eax,0xbb0
}
 7b6:	c9                   	leave  
 7b7:	c3                   	ret    

000007b8 <morecore>:

static Header*
morecore(uint nu)
{
 7b8:	55                   	push   %ebp
 7b9:	89 e5                	mov    %esp,%ebp
 7bb:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7be:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7c5:	77 07                	ja     7ce <morecore+0x16>
    nu = 4096;
 7c7:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7ce:	8b 45 08             	mov    0x8(%ebp),%eax
 7d1:	c1 e0 03             	shl    $0x3,%eax
 7d4:	89 04 24             	mov    %eax,(%esp)
 7d7:	e8 48 fc ff ff       	call   424 <sbrk>
 7dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7df:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7e3:	75 07                	jne    7ec <morecore+0x34>
    return 0;
 7e5:	b8 00 00 00 00       	mov    $0x0,%eax
 7ea:	eb 22                	jmp    80e <morecore+0x56>
  hp = (Header*)p;
 7ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f5:	8b 55 08             	mov    0x8(%ebp),%edx
 7f8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fe:	83 c0 08             	add    $0x8,%eax
 801:	89 04 24             	mov    %eax,(%esp)
 804:	e8 ce fe ff ff       	call   6d7 <free>
  return freep;
 809:	a1 b0 0b 00 00       	mov    0xbb0,%eax
}
 80e:	c9                   	leave  
 80f:	c3                   	ret    

00000810 <malloc>:

void*
malloc(uint nbytes)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 816:	8b 45 08             	mov    0x8(%ebp),%eax
 819:	83 c0 07             	add    $0x7,%eax
 81c:	c1 e8 03             	shr    $0x3,%eax
 81f:	83 c0 01             	add    $0x1,%eax
 822:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 825:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 82a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 82d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 831:	75 23                	jne    856 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 833:	c7 45 f0 a8 0b 00 00 	movl   $0xba8,-0x10(%ebp)
 83a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83d:	a3 b0 0b 00 00       	mov    %eax,0xbb0
 842:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 847:	a3 a8 0b 00 00       	mov    %eax,0xba8
    base.s.size = 0;
 84c:	c7 05 ac 0b 00 00 00 	movl   $0x0,0xbac
 853:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 856:	8b 45 f0             	mov    -0x10(%ebp),%eax
 859:	8b 00                	mov    (%eax),%eax
 85b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 85e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 861:	8b 40 04             	mov    0x4(%eax),%eax
 864:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 867:	72 4d                	jb     8b6 <malloc+0xa6>
      if(p->s.size == nunits)
 869:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86c:	8b 40 04             	mov    0x4(%eax),%eax
 86f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 872:	75 0c                	jne    880 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 874:	8b 45 f4             	mov    -0xc(%ebp),%eax
 877:	8b 10                	mov    (%eax),%edx
 879:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87c:	89 10                	mov    %edx,(%eax)
 87e:	eb 26                	jmp    8a6 <malloc+0x96>
      else {
        p->s.size -= nunits;
 880:	8b 45 f4             	mov    -0xc(%ebp),%eax
 883:	8b 40 04             	mov    0x4(%eax),%eax
 886:	2b 45 ec             	sub    -0x14(%ebp),%eax
 889:	89 c2                	mov    %eax,%edx
 88b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 891:	8b 45 f4             	mov    -0xc(%ebp),%eax
 894:	8b 40 04             	mov    0x4(%eax),%eax
 897:	c1 e0 03             	shl    $0x3,%eax
 89a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 89d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a0:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8a3:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a9:	a3 b0 0b 00 00       	mov    %eax,0xbb0
      return (void*)(p + 1);
 8ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b1:	83 c0 08             	add    $0x8,%eax
 8b4:	eb 38                	jmp    8ee <malloc+0xde>
    }
    if(p == freep)
 8b6:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 8bb:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8be:	75 1b                	jne    8db <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8c3:	89 04 24             	mov    %eax,(%esp)
 8c6:	e8 ed fe ff ff       	call   7b8 <morecore>
 8cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8d2:	75 07                	jne    8db <malloc+0xcb>
        return 0;
 8d4:	b8 00 00 00 00       	mov    $0x0,%eax
 8d9:	eb 13                	jmp    8ee <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8de:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e4:	8b 00                	mov    (%eax),%eax
 8e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8e9:	e9 70 ff ff ff       	jmp    85e <malloc+0x4e>
}
 8ee:	c9                   	leave  
 8ef:	c3                   	ret    
