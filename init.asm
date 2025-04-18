
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 f2 09 00 00 	movl   $0x9f2,(%esp)
  18:	e8 be 04 00 00       	call   4db <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 f2 09 00 00 	movl   $0x9f2,(%esp)
  38:	e8 a6 04 00 00       	call   4e3 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 f2 09 00 00 	movl   $0x9f2,(%esp)
  4c:	e8 8a 04 00 00       	call   4db <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 b6 04 00 00       	call   513 <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 aa 04 00 00       	call   513 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 fa 09 00 	movl   $0x9fa,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 a6 05 00 00       	call   623 <printf>
    pid = fork();
  7d:	e8 11 04 00 00       	call   493 <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 19                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 0d 0a 00 	movl   $0xa0d,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 82 05 00 00       	call   623 <printf>
      exit();
  a1:	e8 f5 03 00 00       	call   49b <exit>
    }
    if(pid == 0){
  a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ab:	75 2d                	jne    da <main+0xda>
      exec("sh", argv);
  ad:	c7 44 24 04 e4 0c 00 	movl   $0xce4,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 ef 09 00 00 	movl   $0x9ef,(%esp)
  bc:	e8 12 04 00 00       	call   4d3 <exec>
      printf(1, "init: exec sh failed\n");
  c1:	c7 44 24 04 20 0a 00 	movl   $0xa20,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 4e 05 00 00       	call   623 <printf>
      exit();
  d5:	e8 c1 03 00 00       	call   49b <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  da:	eb 14                	jmp    f0 <main+0xf0>
      printf(1, "zombie!\n");
  dc:	c7 44 24 04 36 0a 00 	movl   $0xa36,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	e8 33 05 00 00       	call   623 <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
  f0:	e8 ae 03 00 00       	call   4a3 <wait>
  f5:	89 44 24 18          	mov    %eax,0x18(%esp)
  f9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  fe:	78 0a                	js     10a <main+0x10a>
 100:	8b 44 24 18          	mov    0x18(%esp),%eax
 104:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 108:	75 d2                	jne    dc <main+0xdc>
  }
 10a:	e9 5a ff ff ff       	jmp    69 <main+0x69>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	5b                   	pop    %ebx
 131:	5f                   	pop    %edi
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    

00000134 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 140:	90                   	nop
 141:	8b 45 08             	mov    0x8(%ebp),%eax
 144:	8d 50 01             	lea    0x1(%eax),%edx
 147:	89 55 08             	mov    %edx,0x8(%ebp)
 14a:	8b 55 0c             	mov    0xc(%ebp),%edx
 14d:	8d 4a 01             	lea    0x1(%edx),%ecx
 150:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 153:	0f b6 12             	movzbl (%edx),%edx
 156:	88 10                	mov    %dl,(%eax)
 158:	0f b6 00             	movzbl (%eax),%eax
 15b:	84 c0                	test   %al,%al
 15d:	75 e2                	jne    141 <strcpy+0xd>
    ;
  return os;
 15f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 162:	c9                   	leave  
 163:	c3                   	ret    

00000164 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 167:	eb 08                	jmp    171 <strcmp+0xd>
    p++, q++;
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	0f b6 00             	movzbl (%eax),%eax
 177:	84 c0                	test   %al,%al
 179:	74 10                	je     18b <strcmp+0x27>
 17b:	8b 45 08             	mov    0x8(%ebp),%eax
 17e:	0f b6 10             	movzbl (%eax),%edx
 181:	8b 45 0c             	mov    0xc(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	38 c2                	cmp    %al,%dl
 189:	74 de                	je     169 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	0f b6 00             	movzbl (%eax),%eax
 191:	0f b6 d0             	movzbl %al,%edx
 194:	8b 45 0c             	mov    0xc(%ebp),%eax
 197:	0f b6 00             	movzbl (%eax),%eax
 19a:	0f b6 c0             	movzbl %al,%eax
 19d:	29 c2                	sub    %eax,%edx
 19f:	89 d0                	mov    %edx,%eax
}
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    

000001a3 <strlen>:

uint
strlen(const char *s)
{
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b0:	eb 04                	jmp    1b6 <strlen+0x13>
 1b2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 d0                	add    %edx,%eax
 1be:	0f b6 00             	movzbl (%eax),%eax
 1c1:	84 c0                	test   %al,%al
 1c3:	75 ed                	jne    1b2 <strlen+0xf>
    ;
  return n;
 1c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d0:	8b 45 10             	mov    0x10(%ebp),%eax
 1d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1da:	89 44 24 04          	mov    %eax,0x4(%esp)
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 26 ff ff ff       	call   10f <stosb>
  return dst;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ec:	c9                   	leave  
 1ed:	c3                   	ret    

000001ee <strchr>:

char*
strchr(const char *s, char c)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	83 ec 04             	sub    $0x4,%esp
 1f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1fa:	eb 14                	jmp    210 <strchr+0x22>
    if(*s == c)
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	3a 45 fc             	cmp    -0x4(%ebp),%al
 205:	75 05                	jne    20c <strchr+0x1e>
      return (char*)s;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	eb 13                	jmp    21f <strchr+0x31>
  for(; *s; s++)
 20c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	0f b6 00             	movzbl (%eax),%eax
 216:	84 c0                	test   %al,%al
 218:	75 e2                	jne    1fc <strchr+0xe>
  return 0;
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21f:	c9                   	leave  
 220:	c3                   	ret    

00000221 <gets>:

char*
gets(char *buf, int max)
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 22e:	eb 4c                	jmp    27c <gets+0x5b>
    cc = read(0, &c, 1);
 230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 237:	00 
 238:	8d 45 ef             	lea    -0x11(%ebp),%eax
 23b:	89 44 24 04          	mov    %eax,0x4(%esp)
 23f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 246:	e8 68 02 00 00       	call   4b3 <read>
 24b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 24e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 252:	7f 02                	jg     256 <gets+0x35>
      break;
 254:	eb 31                	jmp    287 <gets+0x66>
    buf[i++] = c;
 256:	8b 45 f4             	mov    -0xc(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 25f:	89 c2                	mov    %eax,%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	01 c2                	add    %eax,%edx
 266:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 26c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 270:	3c 0a                	cmp    $0xa,%al
 272:	74 13                	je     287 <gets+0x66>
 274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 278:	3c 0d                	cmp    $0xd,%al
 27a:	74 0b                	je     287 <gets+0x66>
  for(i=0; i+1 < max; ){
 27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27f:	83 c0 01             	add    $0x1,%eax
 282:	3b 45 0c             	cmp    0xc(%ebp),%eax
 285:	7c a9                	jl     230 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 287:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 d0                	add    %edx,%eax
 28f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 292:	8b 45 08             	mov    0x8(%ebp),%eax
}
 295:	c9                   	leave  
 296:	c3                   	ret    

00000297 <stat>:

int
stat(const char *n, struct stat *st)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a4:	00 
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	89 04 24             	mov    %eax,(%esp)
 2ab:	e8 2b 02 00 00       	call   4db <open>
 2b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b7:	79 07                	jns    2c0 <stat+0x29>
    return -1;
 2b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2be:	eb 23                	jmp    2e3 <stat+0x4c>
  r = fstat(fd, st);
 2c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ca:	89 04 24             	mov    %eax,(%esp)
 2cd:	e8 21 02 00 00       	call   4f3 <fstat>
 2d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	89 04 24             	mov    %eax,(%esp)
 2db:	e8 e3 01 00 00       	call   4c3 <close>
  return r;
 2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    

000002e5 <atoi>:

int
atoi(const char *s)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
 2e8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f2:	eb 25                	jmp    319 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2f4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f7:	89 d0                	mov    %edx,%eax
 2f9:	c1 e0 02             	shl    $0x2,%eax
 2fc:	01 d0                	add    %edx,%eax
 2fe:	01 c0                	add    %eax,%eax
 300:	89 c1                	mov    %eax,%ecx
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	8d 50 01             	lea    0x1(%eax),%edx
 308:	89 55 08             	mov    %edx,0x8(%ebp)
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	0f be c0             	movsbl %al,%eax
 311:	01 c8                	add    %ecx,%eax
 313:	83 e8 30             	sub    $0x30,%eax
 316:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	0f b6 00             	movzbl (%eax),%eax
 31f:	3c 2f                	cmp    $0x2f,%al
 321:	7e 0a                	jle    32d <atoi+0x48>
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	0f b6 00             	movzbl (%eax),%eax
 329:	3c 39                	cmp    $0x39,%al
 32b:	7e c7                	jle    2f4 <atoi+0xf>
  return n;
 32d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 330:	c9                   	leave  
 331:	c3                   	ret    

00000332 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 344:	eb 17                	jmp    35d <memmove+0x2b>
    *dst++ = *src++;
 346:	8b 45 fc             	mov    -0x4(%ebp),%eax
 349:	8d 50 01             	lea    0x1(%eax),%edx
 34c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 34f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 352:	8d 4a 01             	lea    0x1(%edx),%ecx
 355:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 358:	0f b6 12             	movzbl (%edx),%edx
 35b:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 35d:	8b 45 10             	mov    0x10(%ebp),%eax
 360:	8d 50 ff             	lea    -0x1(%eax),%edx
 363:	89 55 10             	mov    %edx,0x10(%ebp)
 366:	85 c0                	test   %eax,%eax
 368:	7f dc                	jg     346 <memmove+0x14>
  return vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <ps>:

void ps(void) {
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	57                   	push   %edi
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 37b:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 381:	89 04 24             	mov    %eax,(%esp)
 384:	e8 b2 01 00 00       	call   53b <getpinfo>

  // Print the information TODOWHAT

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 389:	c7 44 24 04 3f 0a 00 	movl   $0xa3f,0x4(%esp)
 390:	00 
 391:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 398:	e8 86 02 00 00       	call   623 <printf>

  int i = 0;
 39d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 3a4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3ab:	e9 ce 00 00 00       	jmp    47e <ps+0x10f>
    if (pstat[i].inuse) {
 3b0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3b3:	89 d0                	mov    %edx,%eax
 3b5:	c1 e0 03             	shl    $0x3,%eax
 3b8:	01 d0                	add    %edx,%eax
 3ba:	c1 e0 02             	shl    $0x2,%eax
 3bd:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3c0:	01 d8                	add    %ebx,%eax
 3c2:	2d 04 09 00 00       	sub    $0x904,%eax
 3c7:	8b 00                	mov    (%eax),%eax
 3c9:	85 c0                	test   %eax,%eax
 3cb:	0f 84 a9 00 00 00    	je     47a <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 3d1:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 3d7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3da:	89 d0                	mov    %edx,%eax
 3dc:	c1 e0 03             	shl    $0x3,%eax
 3df:	01 d0                	add    %edx,%eax
 3e1:	c1 e0 02             	shl    $0x2,%eax
 3e4:	83 c0 10             	add    $0x10,%eax
 3e7:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 3ea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3ed:	89 d0                	mov    %edx,%eax
 3ef:	c1 e0 03             	shl    $0x3,%eax
 3f2:	01 d0                	add    %edx,%eax
 3f4:	c1 e0 02             	shl    $0x2,%eax
 3f7:	8d 75 e8             	lea    -0x18(%ebp),%esi
 3fa:	01 f0                	add    %esi,%eax
 3fc:	2d e4 08 00 00       	sub    $0x8e4,%eax
 401:	0f b6 00             	movzbl (%eax),%eax
 404:	0f be f0             	movsbl %al,%esi
 407:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 40a:	89 d0                	mov    %edx,%eax
 40c:	c1 e0 03             	shl    $0x3,%eax
 40f:	01 d0                	add    %edx,%eax
 411:	c1 e0 02             	shl    $0x2,%eax
 414:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 417:	01 c8                	add    %ecx,%eax
 419:	2d f8 08 00 00       	sub    $0x8f8,%eax
 41e:	8b 18                	mov    (%eax),%ebx
 420:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 423:	89 d0                	mov    %edx,%eax
 425:	c1 e0 03             	shl    $0x3,%eax
 428:	01 d0                	add    %edx,%eax
 42a:	c1 e0 02             	shl    $0x2,%eax
 42d:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 430:	01 c8                	add    %ecx,%eax
 432:	2d 00 09 00 00       	sub    $0x900,%eax
 437:	8b 08                	mov    (%eax),%ecx
 439:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 43c:	89 d0                	mov    %edx,%eax
 43e:	c1 e0 03             	shl    $0x3,%eax
 441:	01 d0                	add    %edx,%eax
 443:	c1 e0 02             	shl    $0x2,%eax
 446:	8d 55 e8             	lea    -0x18(%ebp),%edx
 449:	01 d0                	add    %edx,%eax
 44b:	2d fc 08 00 00       	sub    $0x8fc,%eax
 450:	8b 00                	mov    (%eax),%eax
 452:	89 7c 24 18          	mov    %edi,0x18(%esp)
 456:	89 74 24 14          	mov    %esi,0x14(%esp)
 45a:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 45e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 462:	89 44 24 08          	mov    %eax,0x8(%esp)
 466:	c7 44 24 04 58 0a 00 	movl   $0xa58,0x4(%esp)
 46d:	00 
 46e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 475:	e8 a9 01 00 00       	call   623 <printf>
  for (i = 0; i < NPROC; ++i) {
 47a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 47e:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 482:	0f 8e 28 ff ff ff    	jle    3b0 <ps+0x41>
    }
  }
 488:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 48e:	5b                   	pop    %ebx
 48f:	5e                   	pop    %esi
 490:	5f                   	pop    %edi
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    

00000493 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 493:	b8 01 00 00 00       	mov    $0x1,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <exit>:
SYSCALL(exit)
 49b:	b8 02 00 00 00       	mov    $0x2,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <wait>:
SYSCALL(wait)
 4a3:	b8 03 00 00 00       	mov    $0x3,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <pipe>:
SYSCALL(pipe)
 4ab:	b8 04 00 00 00       	mov    $0x4,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <read>:
SYSCALL(read)
 4b3:	b8 05 00 00 00       	mov    $0x5,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <write>:
SYSCALL(write)
 4bb:	b8 10 00 00 00       	mov    $0x10,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <close>:
SYSCALL(close)
 4c3:	b8 15 00 00 00       	mov    $0x15,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <kill>:
SYSCALL(kill)
 4cb:	b8 06 00 00 00       	mov    $0x6,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <exec>:
SYSCALL(exec)
 4d3:	b8 07 00 00 00       	mov    $0x7,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <open>:
SYSCALL(open)
 4db:	b8 0f 00 00 00       	mov    $0xf,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <mknod>:
SYSCALL(mknod)
 4e3:	b8 11 00 00 00       	mov    $0x11,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <unlink>:
SYSCALL(unlink)
 4eb:	b8 12 00 00 00       	mov    $0x12,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <fstat>:
SYSCALL(fstat)
 4f3:	b8 08 00 00 00       	mov    $0x8,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <link>:
SYSCALL(link)
 4fb:	b8 13 00 00 00       	mov    $0x13,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <mkdir>:
SYSCALL(mkdir)
 503:	b8 14 00 00 00       	mov    $0x14,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <chdir>:
SYSCALL(chdir)
 50b:	b8 09 00 00 00       	mov    $0x9,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <dup>:
SYSCALL(dup)
 513:	b8 0a 00 00 00       	mov    $0xa,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <getpid>:
SYSCALL(getpid)
 51b:	b8 0b 00 00 00       	mov    $0xb,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <sbrk>:
SYSCALL(sbrk)
 523:	b8 0c 00 00 00       	mov    $0xc,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <sleep>:
SYSCALL(sleep)
 52b:	b8 0d 00 00 00       	mov    $0xd,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <uptime>:
SYSCALL(uptime)
 533:	b8 0e 00 00 00       	mov    $0xe,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <getpinfo>:
SYSCALL(getpinfo)
 53b:	b8 16 00 00 00       	mov    $0x16,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 543:	55                   	push   %ebp
 544:	89 e5                	mov    %esp,%ebp
 546:	83 ec 18             	sub    $0x18,%esp
 549:	8b 45 0c             	mov    0xc(%ebp),%eax
 54c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 54f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 556:	00 
 557:	8d 45 f4             	lea    -0xc(%ebp),%eax
 55a:	89 44 24 04          	mov    %eax,0x4(%esp)
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	89 04 24             	mov    %eax,(%esp)
 564:	e8 52 ff ff ff       	call   4bb <write>
}
 569:	c9                   	leave  
 56a:	c3                   	ret    

0000056b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 56b:	55                   	push   %ebp
 56c:	89 e5                	mov    %esp,%ebp
 56e:	56                   	push   %esi
 56f:	53                   	push   %ebx
 570:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 573:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 57a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 57e:	74 17                	je     597 <printint+0x2c>
 580:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 584:	79 11                	jns    597 <printint+0x2c>
    neg = 1;
 586:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 58d:	8b 45 0c             	mov    0xc(%ebp),%eax
 590:	f7 d8                	neg    %eax
 592:	89 45 ec             	mov    %eax,-0x14(%ebp)
 595:	eb 06                	jmp    59d <printint+0x32>
  } else {
    x = xx;
 597:	8b 45 0c             	mov    0xc(%ebp),%eax
 59a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 59d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5a4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5a7:	8d 41 01             	lea    0x1(%ecx),%eax
 5aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5ad:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5b3:	ba 00 00 00 00       	mov    $0x0,%edx
 5b8:	f7 f3                	div    %ebx
 5ba:	89 d0                	mov    %edx,%eax
 5bc:	0f b6 80 ec 0c 00 00 	movzbl 0xcec(%eax),%eax
 5c3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5c7:	8b 75 10             	mov    0x10(%ebp),%esi
 5ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5cd:	ba 00 00 00 00       	mov    $0x0,%edx
 5d2:	f7 f6                	div    %esi
 5d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5db:	75 c7                	jne    5a4 <printint+0x39>
  if(neg)
 5dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5e1:	74 10                	je     5f3 <printint+0x88>
    buf[i++] = '-';
 5e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e6:	8d 50 01             	lea    0x1(%eax),%edx
 5e9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5ec:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5f1:	eb 1f                	jmp    612 <printint+0xa7>
 5f3:	eb 1d                	jmp    612 <printint+0xa7>
    putc(fd, buf[i]);
 5f5:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5fb:	01 d0                	add    %edx,%eax
 5fd:	0f b6 00             	movzbl (%eax),%eax
 600:	0f be c0             	movsbl %al,%eax
 603:	89 44 24 04          	mov    %eax,0x4(%esp)
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	89 04 24             	mov    %eax,(%esp)
 60d:	e8 31 ff ff ff       	call   543 <putc>
  while(--i >= 0)
 612:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 616:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 61a:	79 d9                	jns    5f5 <printint+0x8a>
}
 61c:	83 c4 30             	add    $0x30,%esp
 61f:	5b                   	pop    %ebx
 620:	5e                   	pop    %esi
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    

00000623 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 623:	55                   	push   %ebp
 624:	89 e5                	mov    %esp,%ebp
 626:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 629:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 630:	8d 45 0c             	lea    0xc(%ebp),%eax
 633:	83 c0 04             	add    $0x4,%eax
 636:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 639:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 640:	e9 7c 01 00 00       	jmp    7c1 <printf+0x19e>
    c = fmt[i] & 0xff;
 645:	8b 55 0c             	mov    0xc(%ebp),%edx
 648:	8b 45 f0             	mov    -0x10(%ebp),%eax
 64b:	01 d0                	add    %edx,%eax
 64d:	0f b6 00             	movzbl (%eax),%eax
 650:	0f be c0             	movsbl %al,%eax
 653:	25 ff 00 00 00       	and    $0xff,%eax
 658:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 65b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 65f:	75 2c                	jne    68d <printf+0x6a>
      if(c == '%'){
 661:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 665:	75 0c                	jne    673 <printf+0x50>
        state = '%';
 667:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 66e:	e9 4a 01 00 00       	jmp    7bd <printf+0x19a>
      } else {
        putc(fd, c);
 673:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 676:	0f be c0             	movsbl %al,%eax
 679:	89 44 24 04          	mov    %eax,0x4(%esp)
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	89 04 24             	mov    %eax,(%esp)
 683:	e8 bb fe ff ff       	call   543 <putc>
 688:	e9 30 01 00 00       	jmp    7bd <printf+0x19a>
      }
    } else if(state == '%'){
 68d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 691:	0f 85 26 01 00 00    	jne    7bd <printf+0x19a>
      if(c == 'd'){
 697:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 69b:	75 2d                	jne    6ca <printf+0xa7>
        printint(fd, *ap, 10, 1);
 69d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a0:	8b 00                	mov    (%eax),%eax
 6a2:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6a9:	00 
 6aa:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6b1:	00 
 6b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	89 04 24             	mov    %eax,(%esp)
 6bc:	e8 aa fe ff ff       	call   56b <printint>
        ap++;
 6c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c5:	e9 ec 00 00 00       	jmp    7b6 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6ca:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6ce:	74 06                	je     6d6 <printf+0xb3>
 6d0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6d4:	75 2d                	jne    703 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d9:	8b 00                	mov    (%eax),%eax
 6db:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6e2:	00 
 6e3:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6ea:	00 
 6eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ef:	8b 45 08             	mov    0x8(%ebp),%eax
 6f2:	89 04 24             	mov    %eax,(%esp)
 6f5:	e8 71 fe ff ff       	call   56b <printint>
        ap++;
 6fa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6fe:	e9 b3 00 00 00       	jmp    7b6 <printf+0x193>
      } else if(c == 's'){
 703:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 707:	75 45                	jne    74e <printf+0x12b>
        s = (char*)*ap;
 709:	8b 45 e8             	mov    -0x18(%ebp),%eax
 70c:	8b 00                	mov    (%eax),%eax
 70e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 711:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 715:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 719:	75 09                	jne    724 <printf+0x101>
          s = "(null)";
 71b:	c7 45 f4 68 0a 00 00 	movl   $0xa68,-0xc(%ebp)
        while(*s != 0){
 722:	eb 1e                	jmp    742 <printf+0x11f>
 724:	eb 1c                	jmp    742 <printf+0x11f>
          putc(fd, *s);
 726:	8b 45 f4             	mov    -0xc(%ebp),%eax
 729:	0f b6 00             	movzbl (%eax),%eax
 72c:	0f be c0             	movsbl %al,%eax
 72f:	89 44 24 04          	mov    %eax,0x4(%esp)
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	89 04 24             	mov    %eax,(%esp)
 739:	e8 05 fe ff ff       	call   543 <putc>
          s++;
 73e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 742:	8b 45 f4             	mov    -0xc(%ebp),%eax
 745:	0f b6 00             	movzbl (%eax),%eax
 748:	84 c0                	test   %al,%al
 74a:	75 da                	jne    726 <printf+0x103>
 74c:	eb 68                	jmp    7b6 <printf+0x193>
        }
      } else if(c == 'c'){
 74e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 752:	75 1d                	jne    771 <printf+0x14e>
        putc(fd, *ap);
 754:	8b 45 e8             	mov    -0x18(%ebp),%eax
 757:	8b 00                	mov    (%eax),%eax
 759:	0f be c0             	movsbl %al,%eax
 75c:	89 44 24 04          	mov    %eax,0x4(%esp)
 760:	8b 45 08             	mov    0x8(%ebp),%eax
 763:	89 04 24             	mov    %eax,(%esp)
 766:	e8 d8 fd ff ff       	call   543 <putc>
        ap++;
 76b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 76f:	eb 45                	jmp    7b6 <printf+0x193>
      } else if(c == '%'){
 771:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 775:	75 17                	jne    78e <printf+0x16b>
        putc(fd, c);
 777:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 77a:	0f be c0             	movsbl %al,%eax
 77d:	89 44 24 04          	mov    %eax,0x4(%esp)
 781:	8b 45 08             	mov    0x8(%ebp),%eax
 784:	89 04 24             	mov    %eax,(%esp)
 787:	e8 b7 fd ff ff       	call   543 <putc>
 78c:	eb 28                	jmp    7b6 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 78e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 795:	00 
 796:	8b 45 08             	mov    0x8(%ebp),%eax
 799:	89 04 24             	mov    %eax,(%esp)
 79c:	e8 a2 fd ff ff       	call   543 <putc>
        putc(fd, c);
 7a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a4:	0f be c0             	movsbl %al,%eax
 7a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ab:	8b 45 08             	mov    0x8(%ebp),%eax
 7ae:	89 04 24             	mov    %eax,(%esp)
 7b1:	e8 8d fd ff ff       	call   543 <putc>
      }
      state = 0;
 7b6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7c1:	8b 55 0c             	mov    0xc(%ebp),%edx
 7c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c7:	01 d0                	add    %edx,%eax
 7c9:	0f b6 00             	movzbl (%eax),%eax
 7cc:	84 c0                	test   %al,%al
 7ce:	0f 85 71 fe ff ff    	jne    645 <printf+0x22>
    }
  }
}
 7d4:	c9                   	leave  
 7d5:	c3                   	ret    

000007d6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d6:	55                   	push   %ebp
 7d7:	89 e5                	mov    %esp,%ebp
 7d9:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7dc:	8b 45 08             	mov    0x8(%ebp),%eax
 7df:	83 e8 08             	sub    $0x8,%eax
 7e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e5:	a1 08 0d 00 00       	mov    0xd08,%eax
 7ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7ed:	eb 24                	jmp    813 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f2:	8b 00                	mov    (%eax),%eax
 7f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7f7:	77 12                	ja     80b <free+0x35>
 7f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ff:	77 24                	ja     825 <free+0x4f>
 801:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804:	8b 00                	mov    (%eax),%eax
 806:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 809:	77 1a                	ja     825 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80e:	8b 00                	mov    (%eax),%eax
 810:	89 45 fc             	mov    %eax,-0x4(%ebp)
 813:	8b 45 f8             	mov    -0x8(%ebp),%eax
 816:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 819:	76 d4                	jbe    7ef <free+0x19>
 81b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81e:	8b 00                	mov    (%eax),%eax
 820:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 823:	76 ca                	jbe    7ef <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 825:	8b 45 f8             	mov    -0x8(%ebp),%eax
 828:	8b 40 04             	mov    0x4(%eax),%eax
 82b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 832:	8b 45 f8             	mov    -0x8(%ebp),%eax
 835:	01 c2                	add    %eax,%edx
 837:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83a:	8b 00                	mov    (%eax),%eax
 83c:	39 c2                	cmp    %eax,%edx
 83e:	75 24                	jne    864 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 840:	8b 45 f8             	mov    -0x8(%ebp),%eax
 843:	8b 50 04             	mov    0x4(%eax),%edx
 846:	8b 45 fc             	mov    -0x4(%ebp),%eax
 849:	8b 00                	mov    (%eax),%eax
 84b:	8b 40 04             	mov    0x4(%eax),%eax
 84e:	01 c2                	add    %eax,%edx
 850:	8b 45 f8             	mov    -0x8(%ebp),%eax
 853:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 856:	8b 45 fc             	mov    -0x4(%ebp),%eax
 859:	8b 00                	mov    (%eax),%eax
 85b:	8b 10                	mov    (%eax),%edx
 85d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 860:	89 10                	mov    %edx,(%eax)
 862:	eb 0a                	jmp    86e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 864:	8b 45 fc             	mov    -0x4(%ebp),%eax
 867:	8b 10                	mov    (%eax),%edx
 869:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 86e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 871:	8b 40 04             	mov    0x4(%eax),%eax
 874:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87e:	01 d0                	add    %edx,%eax
 880:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 883:	75 20                	jne    8a5 <free+0xcf>
    p->s.size += bp->s.size;
 885:	8b 45 fc             	mov    -0x4(%ebp),%eax
 888:	8b 50 04             	mov    0x4(%eax),%edx
 88b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 88e:	8b 40 04             	mov    0x4(%eax),%eax
 891:	01 c2                	add    %eax,%edx
 893:	8b 45 fc             	mov    -0x4(%ebp),%eax
 896:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 899:	8b 45 f8             	mov    -0x8(%ebp),%eax
 89c:	8b 10                	mov    (%eax),%edx
 89e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a1:	89 10                	mov    %edx,(%eax)
 8a3:	eb 08                	jmp    8ad <free+0xd7>
  } else
    p->s.ptr = bp;
 8a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8ab:	89 10                	mov    %edx,(%eax)
  freep = p;
 8ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b0:	a3 08 0d 00 00       	mov    %eax,0xd08
}
 8b5:	c9                   	leave  
 8b6:	c3                   	ret    

000008b7 <morecore>:

static Header*
morecore(uint nu)
{
 8b7:	55                   	push   %ebp
 8b8:	89 e5                	mov    %esp,%ebp
 8ba:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8bd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8c4:	77 07                	ja     8cd <morecore+0x16>
    nu = 4096;
 8c6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8cd:	8b 45 08             	mov    0x8(%ebp),%eax
 8d0:	c1 e0 03             	shl    $0x3,%eax
 8d3:	89 04 24             	mov    %eax,(%esp)
 8d6:	e8 48 fc ff ff       	call   523 <sbrk>
 8db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8de:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8e2:	75 07                	jne    8eb <morecore+0x34>
    return 0;
 8e4:	b8 00 00 00 00       	mov    $0x0,%eax
 8e9:	eb 22                	jmp    90d <morecore+0x56>
  hp = (Header*)p;
 8eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f4:	8b 55 08             	mov    0x8(%ebp),%edx
 8f7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fd:	83 c0 08             	add    $0x8,%eax
 900:	89 04 24             	mov    %eax,(%esp)
 903:	e8 ce fe ff ff       	call   7d6 <free>
  return freep;
 908:	a1 08 0d 00 00       	mov    0xd08,%eax
}
 90d:	c9                   	leave  
 90e:	c3                   	ret    

0000090f <malloc>:

void*
malloc(uint nbytes)
{
 90f:	55                   	push   %ebp
 910:	89 e5                	mov    %esp,%ebp
 912:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 915:	8b 45 08             	mov    0x8(%ebp),%eax
 918:	83 c0 07             	add    $0x7,%eax
 91b:	c1 e8 03             	shr    $0x3,%eax
 91e:	83 c0 01             	add    $0x1,%eax
 921:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 924:	a1 08 0d 00 00       	mov    0xd08,%eax
 929:	89 45 f0             	mov    %eax,-0x10(%ebp)
 92c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 930:	75 23                	jne    955 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 932:	c7 45 f0 00 0d 00 00 	movl   $0xd00,-0x10(%ebp)
 939:	8b 45 f0             	mov    -0x10(%ebp),%eax
 93c:	a3 08 0d 00 00       	mov    %eax,0xd08
 941:	a1 08 0d 00 00       	mov    0xd08,%eax
 946:	a3 00 0d 00 00       	mov    %eax,0xd00
    base.s.size = 0;
 94b:	c7 05 04 0d 00 00 00 	movl   $0x0,0xd04
 952:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 955:	8b 45 f0             	mov    -0x10(%ebp),%eax
 958:	8b 00                	mov    (%eax),%eax
 95a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 95d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 960:	8b 40 04             	mov    0x4(%eax),%eax
 963:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 966:	72 4d                	jb     9b5 <malloc+0xa6>
      if(p->s.size == nunits)
 968:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96b:	8b 40 04             	mov    0x4(%eax),%eax
 96e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 971:	75 0c                	jne    97f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 973:	8b 45 f4             	mov    -0xc(%ebp),%eax
 976:	8b 10                	mov    (%eax),%edx
 978:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97b:	89 10                	mov    %edx,(%eax)
 97d:	eb 26                	jmp    9a5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 97f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 982:	8b 40 04             	mov    0x4(%eax),%eax
 985:	2b 45 ec             	sub    -0x14(%ebp),%eax
 988:	89 c2                	mov    %eax,%edx
 98a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 990:	8b 45 f4             	mov    -0xc(%ebp),%eax
 993:	8b 40 04             	mov    0x4(%eax),%eax
 996:	c1 e0 03             	shl    $0x3,%eax
 999:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 99c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9a2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a8:	a3 08 0d 00 00       	mov    %eax,0xd08
      return (void*)(p + 1);
 9ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b0:	83 c0 08             	add    $0x8,%eax
 9b3:	eb 38                	jmp    9ed <malloc+0xde>
    }
    if(p == freep)
 9b5:	a1 08 0d 00 00       	mov    0xd08,%eax
 9ba:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9bd:	75 1b                	jne    9da <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9c2:	89 04 24             	mov    %eax,(%esp)
 9c5:	e8 ed fe ff ff       	call   8b7 <morecore>
 9ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9d1:	75 07                	jne    9da <malloc+0xcb>
        return 0;
 9d3:	b8 00 00 00 00       	mov    $0x0,%eax
 9d8:	eb 13                	jmp    9ed <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e3:	8b 00                	mov    (%eax),%eax
 9e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9e8:	e9 70 ff ff ff       	jmp    95d <malloc+0x4e>
}
 9ed:	c9                   	leave  
 9ee:	c3                   	ret    
