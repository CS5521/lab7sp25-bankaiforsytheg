
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
 28a:	c7 44 24 04 f8 08 00 	movl   $0x8f8,0x4(%esp)
 291:	00 
 292:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 299:	e8 8e 02 00 00       	call   52c <printf>

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
 367:	c7 44 24 04 11 09 00 	movl   $0x911,0x4(%esp)
 36e:	00 
 36f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 376:	e8 b1 01 00 00       	call   52c <printf>
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

00000444 <settickets>:
 444:	b8 17 00 00 00       	mov    $0x17,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 44c:	55                   	push   %ebp
 44d:	89 e5                	mov    %esp,%ebp
 44f:	83 ec 18             	sub    $0x18,%esp
 452:	8b 45 0c             	mov    0xc(%ebp),%eax
 455:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 458:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 45f:	00 
 460:	8d 45 f4             	lea    -0xc(%ebp),%eax
 463:	89 44 24 04          	mov    %eax,0x4(%esp)
 467:	8b 45 08             	mov    0x8(%ebp),%eax
 46a:	89 04 24             	mov    %eax,(%esp)
 46d:	e8 4a ff ff ff       	call   3bc <write>
}
 472:	c9                   	leave  
 473:	c3                   	ret    

00000474 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	56                   	push   %esi
 478:	53                   	push   %ebx
 479:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 47c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 483:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 487:	74 17                	je     4a0 <printint+0x2c>
 489:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 48d:	79 11                	jns    4a0 <printint+0x2c>
    neg = 1;
 48f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 496:	8b 45 0c             	mov    0xc(%ebp),%eax
 499:	f7 d8                	neg    %eax
 49b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 49e:	eb 06                	jmp    4a6 <printint+0x32>
  } else {
    x = xx;
 4a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4ad:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4b0:	8d 41 01             	lea    0x1(%ecx),%eax
 4b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4b6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4bc:	ba 00 00 00 00       	mov    $0x0,%edx
 4c1:	f7 f3                	div    %ebx
 4c3:	89 d0                	mov    %edx,%eax
 4c5:	0f b6 80 9c 0b 00 00 	movzbl 0xb9c(%eax),%eax
 4cc:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4d0:	8b 75 10             	mov    0x10(%ebp),%esi
 4d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d6:	ba 00 00 00 00       	mov    $0x0,%edx
 4db:	f7 f6                	div    %esi
 4dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4e4:	75 c7                	jne    4ad <printint+0x39>
  if(neg)
 4e6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ea:	74 10                	je     4fc <printint+0x88>
    buf[i++] = '-';
 4ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ef:	8d 50 01             	lea    0x1(%eax),%edx
 4f2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4f5:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4fa:	eb 1f                	jmp    51b <printint+0xa7>
 4fc:	eb 1d                	jmp    51b <printint+0xa7>
    putc(fd, buf[i]);
 4fe:	8d 55 dc             	lea    -0x24(%ebp),%edx
 501:	8b 45 f4             	mov    -0xc(%ebp),%eax
 504:	01 d0                	add    %edx,%eax
 506:	0f b6 00             	movzbl (%eax),%eax
 509:	0f be c0             	movsbl %al,%eax
 50c:	89 44 24 04          	mov    %eax,0x4(%esp)
 510:	8b 45 08             	mov    0x8(%ebp),%eax
 513:	89 04 24             	mov    %eax,(%esp)
 516:	e8 31 ff ff ff       	call   44c <putc>
  while(--i >= 0)
 51b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 51f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 523:	79 d9                	jns    4fe <printint+0x8a>
}
 525:	83 c4 30             	add    $0x30,%esp
 528:	5b                   	pop    %ebx
 529:	5e                   	pop    %esi
 52a:	5d                   	pop    %ebp
 52b:	c3                   	ret    

0000052c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 532:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 539:	8d 45 0c             	lea    0xc(%ebp),%eax
 53c:	83 c0 04             	add    $0x4,%eax
 53f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 542:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 549:	e9 7c 01 00 00       	jmp    6ca <printf+0x19e>
    c = fmt[i] & 0xff;
 54e:	8b 55 0c             	mov    0xc(%ebp),%edx
 551:	8b 45 f0             	mov    -0x10(%ebp),%eax
 554:	01 d0                	add    %edx,%eax
 556:	0f b6 00             	movzbl (%eax),%eax
 559:	0f be c0             	movsbl %al,%eax
 55c:	25 ff 00 00 00       	and    $0xff,%eax
 561:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 564:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 568:	75 2c                	jne    596 <printf+0x6a>
      if(c == '%'){
 56a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 56e:	75 0c                	jne    57c <printf+0x50>
        state = '%';
 570:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 577:	e9 4a 01 00 00       	jmp    6c6 <printf+0x19a>
      } else {
        putc(fd, c);
 57c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57f:	0f be c0             	movsbl %al,%eax
 582:	89 44 24 04          	mov    %eax,0x4(%esp)
 586:	8b 45 08             	mov    0x8(%ebp),%eax
 589:	89 04 24             	mov    %eax,(%esp)
 58c:	e8 bb fe ff ff       	call   44c <putc>
 591:	e9 30 01 00 00       	jmp    6c6 <printf+0x19a>
      }
    } else if(state == '%'){
 596:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 59a:	0f 85 26 01 00 00    	jne    6c6 <printf+0x19a>
      if(c == 'd'){
 5a0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5a4:	75 2d                	jne    5d3 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a9:	8b 00                	mov    (%eax),%eax
 5ab:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5b2:	00 
 5b3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5ba:	00 
 5bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bf:	8b 45 08             	mov    0x8(%ebp),%eax
 5c2:	89 04 24             	mov    %eax,(%esp)
 5c5:	e8 aa fe ff ff       	call   474 <printint>
        ap++;
 5ca:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ce:	e9 ec 00 00 00       	jmp    6bf <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5d3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5d7:	74 06                	je     5df <printf+0xb3>
 5d9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5dd:	75 2d                	jne    60c <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5df:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e2:	8b 00                	mov    (%eax),%eax
 5e4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5eb:	00 
 5ec:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5f3:	00 
 5f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f8:	8b 45 08             	mov    0x8(%ebp),%eax
 5fb:	89 04 24             	mov    %eax,(%esp)
 5fe:	e8 71 fe ff ff       	call   474 <printint>
        ap++;
 603:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 607:	e9 b3 00 00 00       	jmp    6bf <printf+0x193>
      } else if(c == 's'){
 60c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 610:	75 45                	jne    657 <printf+0x12b>
        s = (char*)*ap;
 612:	8b 45 e8             	mov    -0x18(%ebp),%eax
 615:	8b 00                	mov    (%eax),%eax
 617:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 61a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 61e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 622:	75 09                	jne    62d <printf+0x101>
          s = "(null)";
 624:	c7 45 f4 21 09 00 00 	movl   $0x921,-0xc(%ebp)
        while(*s != 0){
 62b:	eb 1e                	jmp    64b <printf+0x11f>
 62d:	eb 1c                	jmp    64b <printf+0x11f>
          putc(fd, *s);
 62f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 632:	0f b6 00             	movzbl (%eax),%eax
 635:	0f be c0             	movsbl %al,%eax
 638:	89 44 24 04          	mov    %eax,0x4(%esp)
 63c:	8b 45 08             	mov    0x8(%ebp),%eax
 63f:	89 04 24             	mov    %eax,(%esp)
 642:	e8 05 fe ff ff       	call   44c <putc>
          s++;
 647:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 64b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 64e:	0f b6 00             	movzbl (%eax),%eax
 651:	84 c0                	test   %al,%al
 653:	75 da                	jne    62f <printf+0x103>
 655:	eb 68                	jmp    6bf <printf+0x193>
        }
      } else if(c == 'c'){
 657:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 65b:	75 1d                	jne    67a <printf+0x14e>
        putc(fd, *ap);
 65d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 660:	8b 00                	mov    (%eax),%eax
 662:	0f be c0             	movsbl %al,%eax
 665:	89 44 24 04          	mov    %eax,0x4(%esp)
 669:	8b 45 08             	mov    0x8(%ebp),%eax
 66c:	89 04 24             	mov    %eax,(%esp)
 66f:	e8 d8 fd ff ff       	call   44c <putc>
        ap++;
 674:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 678:	eb 45                	jmp    6bf <printf+0x193>
      } else if(c == '%'){
 67a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 67e:	75 17                	jne    697 <printf+0x16b>
        putc(fd, c);
 680:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 683:	0f be c0             	movsbl %al,%eax
 686:	89 44 24 04          	mov    %eax,0x4(%esp)
 68a:	8b 45 08             	mov    0x8(%ebp),%eax
 68d:	89 04 24             	mov    %eax,(%esp)
 690:	e8 b7 fd ff ff       	call   44c <putc>
 695:	eb 28                	jmp    6bf <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 697:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 69e:	00 
 69f:	8b 45 08             	mov    0x8(%ebp),%eax
 6a2:	89 04 24             	mov    %eax,(%esp)
 6a5:	e8 a2 fd ff ff       	call   44c <putc>
        putc(fd, c);
 6aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ad:	0f be c0             	movsbl %al,%eax
 6b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b4:	8b 45 08             	mov    0x8(%ebp),%eax
 6b7:	89 04 24             	mov    %eax,(%esp)
 6ba:	e8 8d fd ff ff       	call   44c <putc>
      }
      state = 0;
 6bf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6c6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6ca:	8b 55 0c             	mov    0xc(%ebp),%edx
 6cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d0:	01 d0                	add    %edx,%eax
 6d2:	0f b6 00             	movzbl (%eax),%eax
 6d5:	84 c0                	test   %al,%al
 6d7:	0f 85 71 fe ff ff    	jne    54e <printf+0x22>
    }
  }
}
 6dd:	c9                   	leave  
 6de:	c3                   	ret    

000006df <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6df:	55                   	push   %ebp
 6e0:	89 e5                	mov    %esp,%ebp
 6e2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6e5:	8b 45 08             	mov    0x8(%ebp),%eax
 6e8:	83 e8 08             	sub    $0x8,%eax
 6eb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ee:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 6f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6f6:	eb 24                	jmp    71c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fb:	8b 00                	mov    (%eax),%eax
 6fd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 700:	77 12                	ja     714 <free+0x35>
 702:	8b 45 f8             	mov    -0x8(%ebp),%eax
 705:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 708:	77 24                	ja     72e <free+0x4f>
 70a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70d:	8b 00                	mov    (%eax),%eax
 70f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 712:	77 1a                	ja     72e <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 714:	8b 45 fc             	mov    -0x4(%ebp),%eax
 717:	8b 00                	mov    (%eax),%eax
 719:	89 45 fc             	mov    %eax,-0x4(%ebp)
 71c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 722:	76 d4                	jbe    6f8 <free+0x19>
 724:	8b 45 fc             	mov    -0x4(%ebp),%eax
 727:	8b 00                	mov    (%eax),%eax
 729:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 72c:	76 ca                	jbe    6f8 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 72e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 731:	8b 40 04             	mov    0x4(%eax),%eax
 734:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 73b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73e:	01 c2                	add    %eax,%edx
 740:	8b 45 fc             	mov    -0x4(%ebp),%eax
 743:	8b 00                	mov    (%eax),%eax
 745:	39 c2                	cmp    %eax,%edx
 747:	75 24                	jne    76d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 749:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74c:	8b 50 04             	mov    0x4(%eax),%edx
 74f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 752:	8b 00                	mov    (%eax),%eax
 754:	8b 40 04             	mov    0x4(%eax),%eax
 757:	01 c2                	add    %eax,%edx
 759:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 75f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 762:	8b 00                	mov    (%eax),%eax
 764:	8b 10                	mov    (%eax),%edx
 766:	8b 45 f8             	mov    -0x8(%ebp),%eax
 769:	89 10                	mov    %edx,(%eax)
 76b:	eb 0a                	jmp    777 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 76d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 770:	8b 10                	mov    (%eax),%edx
 772:	8b 45 f8             	mov    -0x8(%ebp),%eax
 775:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 777:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77a:	8b 40 04             	mov    0x4(%eax),%eax
 77d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 784:	8b 45 fc             	mov    -0x4(%ebp),%eax
 787:	01 d0                	add    %edx,%eax
 789:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 78c:	75 20                	jne    7ae <free+0xcf>
    p->s.size += bp->s.size;
 78e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 791:	8b 50 04             	mov    0x4(%eax),%edx
 794:	8b 45 f8             	mov    -0x8(%ebp),%eax
 797:	8b 40 04             	mov    0x4(%eax),%eax
 79a:	01 c2                	add    %eax,%edx
 79c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a5:	8b 10                	mov    (%eax),%edx
 7a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7aa:	89 10                	mov    %edx,(%eax)
 7ac:	eb 08                	jmp    7b6 <free+0xd7>
  } else
    p->s.ptr = bp;
 7ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7b4:	89 10                	mov    %edx,(%eax)
  freep = p;
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	a3 b8 0b 00 00       	mov    %eax,0xbb8
}
 7be:	c9                   	leave  
 7bf:	c3                   	ret    

000007c0 <morecore>:

static Header*
morecore(uint nu)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7c6:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7cd:	77 07                	ja     7d6 <morecore+0x16>
    nu = 4096;
 7cf:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7d6:	8b 45 08             	mov    0x8(%ebp),%eax
 7d9:	c1 e0 03             	shl    $0x3,%eax
 7dc:	89 04 24             	mov    %eax,(%esp)
 7df:	e8 40 fc ff ff       	call   424 <sbrk>
 7e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7e7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7eb:	75 07                	jne    7f4 <morecore+0x34>
    return 0;
 7ed:	b8 00 00 00 00       	mov    $0x0,%eax
 7f2:	eb 22                	jmp    816 <morecore+0x56>
  hp = (Header*)p;
 7f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fd:	8b 55 08             	mov    0x8(%ebp),%edx
 800:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 803:	8b 45 f0             	mov    -0x10(%ebp),%eax
 806:	83 c0 08             	add    $0x8,%eax
 809:	89 04 24             	mov    %eax,(%esp)
 80c:	e8 ce fe ff ff       	call   6df <free>
  return freep;
 811:	a1 b8 0b 00 00       	mov    0xbb8,%eax
}
 816:	c9                   	leave  
 817:	c3                   	ret    

00000818 <malloc>:

void*
malloc(uint nbytes)
{
 818:	55                   	push   %ebp
 819:	89 e5                	mov    %esp,%ebp
 81b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 81e:	8b 45 08             	mov    0x8(%ebp),%eax
 821:	83 c0 07             	add    $0x7,%eax
 824:	c1 e8 03             	shr    $0x3,%eax
 827:	83 c0 01             	add    $0x1,%eax
 82a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 82d:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 832:	89 45 f0             	mov    %eax,-0x10(%ebp)
 835:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 839:	75 23                	jne    85e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 83b:	c7 45 f0 b0 0b 00 00 	movl   $0xbb0,-0x10(%ebp)
 842:	8b 45 f0             	mov    -0x10(%ebp),%eax
 845:	a3 b8 0b 00 00       	mov    %eax,0xbb8
 84a:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 84f:	a3 b0 0b 00 00       	mov    %eax,0xbb0
    base.s.size = 0;
 854:	c7 05 b4 0b 00 00 00 	movl   $0x0,0xbb4
 85b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 861:	8b 00                	mov    (%eax),%eax
 863:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 866:	8b 45 f4             	mov    -0xc(%ebp),%eax
 869:	8b 40 04             	mov    0x4(%eax),%eax
 86c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 86f:	72 4d                	jb     8be <malloc+0xa6>
      if(p->s.size == nunits)
 871:	8b 45 f4             	mov    -0xc(%ebp),%eax
 874:	8b 40 04             	mov    0x4(%eax),%eax
 877:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 87a:	75 0c                	jne    888 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 87c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87f:	8b 10                	mov    (%eax),%edx
 881:	8b 45 f0             	mov    -0x10(%ebp),%eax
 884:	89 10                	mov    %edx,(%eax)
 886:	eb 26                	jmp    8ae <malloc+0x96>
      else {
        p->s.size -= nunits;
 888:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88b:	8b 40 04             	mov    0x4(%eax),%eax
 88e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 891:	89 c2                	mov    %eax,%edx
 893:	8b 45 f4             	mov    -0xc(%ebp),%eax
 896:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 899:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89c:	8b 40 04             	mov    0x4(%eax),%eax
 89f:	c1 e0 03             	shl    $0x3,%eax
 8a2:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a8:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8ab:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b1:	a3 b8 0b 00 00       	mov    %eax,0xbb8
      return (void*)(p + 1);
 8b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b9:	83 c0 08             	add    $0x8,%eax
 8bc:	eb 38                	jmp    8f6 <malloc+0xde>
    }
    if(p == freep)
 8be:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 8c3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8c6:	75 1b                	jne    8e3 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8cb:	89 04 24             	mov    %eax,(%esp)
 8ce:	e8 ed fe ff ff       	call   7c0 <morecore>
 8d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8da:	75 07                	jne    8e3 <malloc+0xcb>
        return 0;
 8dc:	b8 00 00 00 00       	mov    $0x0,%eax
 8e1:	eb 13                	jmp    8f6 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ec:	8b 00                	mov    (%eax),%eax
 8ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8f1:	e9 70 ff ff ff       	jmp    866 <malloc+0x4e>
}
 8f6:	c9                   	leave  
 8f7:	c3                   	ret    
