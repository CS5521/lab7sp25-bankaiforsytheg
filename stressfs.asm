
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
  13:	73 74 72 65 
  17:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
  1e:	73 73 66 73 
  22:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
  29:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	c7 44 24 04 93 0a 00 	movl   $0xa93,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 87 06 00 00       	call   6c7 <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 12 02 00 00       	call   26e <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 13                	jmp    7c <main+0x7c>
    if(fork() > 0)
  69:	e8 c9 04 00 00       	call   537 <fork>
  6e:	85 c0                	test   %eax,%eax
  70:	7e 02                	jle    74 <main+0x74>
      break;
  72:	eb 12                	jmp    86 <main+0x86>
  for(i = 0; i < 4; i++)
  74:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  7b:	01 
  7c:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  83:	03 
  84:	7e e3                	jle    69 <main+0x69>

  printf(1, "write %d\n", i);
  86:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  8d:	89 44 24 08          	mov    %eax,0x8(%esp)
  91:	c7 44 24 04 a6 0a 00 	movl   $0xaa6,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 22 06 00 00       	call   6c7 <printf>

  path[8] += i;
  a5:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  ac:	00 
  ad:	89 c2                	mov    %eax,%edx
  af:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  b6:	01 d0                	add    %edx,%eax
  b8:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  bf:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c6:	00 
  c7:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  ce:	89 04 24             	mov    %eax,(%esp)
  d1:	e8 a9 04 00 00       	call   57f <open>
  d6:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  dd:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  e4:	00 00 00 00 
  e8:	eb 27                	jmp    111 <main+0x111>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ea:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  f1:	00 
  f2:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  fa:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 101:	89 04 24             	mov    %eax,(%esp)
 104:	e8 56 04 00 00       	call   55f <write>
  for(i = 0; i < 20; i++)
 109:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 110:	01 
 111:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 118:	13 
 119:	7e cf                	jle    ea <main+0xea>
  close(fd);
 11b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 122:	89 04 24             	mov    %eax,(%esp)
 125:	e8 3d 04 00 00       	call   567 <close>

  printf(1, "read\n");
 12a:	c7 44 24 04 b0 0a 00 	movl   $0xab0,0x4(%esp)
 131:	00 
 132:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 139:	e8 89 05 00 00       	call   6c7 <printf>

  fd = open(path, O_RDONLY);
 13e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 145:	00 
 146:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14d:	89 04 24             	mov    %eax,(%esp)
 150:	e8 2a 04 00 00       	call   57f <open>
 155:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 15c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 163:	00 00 00 00 
 167:	eb 27                	jmp    190 <main+0x190>
    read(fd, data, sizeof(data));
 169:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 170:	00 
 171:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 175:	89 44 24 04          	mov    %eax,0x4(%esp)
 179:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 180:	89 04 24             	mov    %eax,(%esp)
 183:	e8 cf 03 00 00       	call   557 <read>
  for (i = 0; i < 20; i++)
 188:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 18f:	01 
 190:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 197:	13 
 198:	7e cf                	jle    169 <main+0x169>
  close(fd);
 19a:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a1:	89 04 24             	mov    %eax,(%esp)
 1a4:	e8 be 03 00 00       	call   567 <close>

  wait();
 1a9:	e8 99 03 00 00       	call   547 <wait>

  exit();
 1ae:	e8 8c 03 00 00       	call   53f <exit>

000001b3 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	57                   	push   %edi
 1b7:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bb:	8b 55 10             	mov    0x10(%ebp),%edx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 cb                	mov    %ecx,%ebx
 1c3:	89 df                	mov    %ebx,%edi
 1c5:	89 d1                	mov    %edx,%ecx
 1c7:	fc                   	cld    
 1c8:	f3 aa                	rep stos %al,%es:(%edi)
 1ca:	89 ca                	mov    %ecx,%edx
 1cc:	89 fb                	mov    %edi,%ebx
 1ce:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d1:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d4:	5b                   	pop    %ebx
 1d5:	5f                   	pop    %edi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    

000001d8 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e4:	90                   	nop
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	8d 50 01             	lea    0x1(%eax),%edx
 1eb:	89 55 08             	mov    %edx,0x8(%ebp)
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f1:	8d 4a 01             	lea    0x1(%edx),%ecx
 1f4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1f7:	0f b6 12             	movzbl (%edx),%edx
 1fa:	88 10                	mov    %dl,(%eax)
 1fc:	0f b6 00             	movzbl (%eax),%eax
 1ff:	84 c0                	test   %al,%al
 201:	75 e2                	jne    1e5 <strcpy+0xd>
    ;
  return os;
 203:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 20b:	eb 08                	jmp    215 <strcmp+0xd>
    p++, q++;
 20d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 211:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	0f b6 00             	movzbl (%eax),%eax
 21b:	84 c0                	test   %al,%al
 21d:	74 10                	je     22f <strcmp+0x27>
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 10             	movzbl (%eax),%edx
 225:	8b 45 0c             	mov    0xc(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	38 c2                	cmp    %al,%dl
 22d:	74 de                	je     20d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 22f:	8b 45 08             	mov    0x8(%ebp),%eax
 232:	0f b6 00             	movzbl (%eax),%eax
 235:	0f b6 d0             	movzbl %al,%edx
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	0f b6 00             	movzbl (%eax),%eax
 23e:	0f b6 c0             	movzbl %al,%eax
 241:	29 c2                	sub    %eax,%edx
 243:	89 d0                	mov    %edx,%eax
}
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    

00000247 <strlen>:

uint
strlen(const char *s)
{
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 24d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 254:	eb 04                	jmp    25a <strlen+0x13>
 256:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 25a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	01 d0                	add    %edx,%eax
 262:	0f b6 00             	movzbl (%eax),%eax
 265:	84 c0                	test   %al,%al
 267:	75 ed                	jne    256 <strlen+0xf>
    ;
  return n;
 269:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 26c:	c9                   	leave  
 26d:	c3                   	ret    

0000026e <memset>:

void*
memset(void *dst, int c, uint n)
{
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 274:	8b 45 10             	mov    0x10(%ebp),%eax
 277:	89 44 24 08          	mov    %eax,0x8(%esp)
 27b:	8b 45 0c             	mov    0xc(%ebp),%eax
 27e:	89 44 24 04          	mov    %eax,0x4(%esp)
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	89 04 24             	mov    %eax,(%esp)
 288:	e8 26 ff ff ff       	call   1b3 <stosb>
  return dst;
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 290:	c9                   	leave  
 291:	c3                   	ret    

00000292 <strchr>:

char*
strchr(const char *s, char c)
{
 292:	55                   	push   %ebp
 293:	89 e5                	mov    %esp,%ebp
 295:	83 ec 04             	sub    $0x4,%esp
 298:	8b 45 0c             	mov    0xc(%ebp),%eax
 29b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29e:	eb 14                	jmp    2b4 <strchr+0x22>
    if(*s == c)
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2a9:	75 05                	jne    2b0 <strchr+0x1e>
      return (char*)s;
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	eb 13                	jmp    2c3 <strchr+0x31>
  for(; *s; s++)
 2b0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	0f b6 00             	movzbl (%eax),%eax
 2ba:	84 c0                	test   %al,%al
 2bc:	75 e2                	jne    2a0 <strchr+0xe>
  return 0;
 2be:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c3:	c9                   	leave  
 2c4:	c3                   	ret    

000002c5 <gets>:

char*
gets(char *buf, int max)
{
 2c5:	55                   	push   %ebp
 2c6:	89 e5                	mov    %esp,%ebp
 2c8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d2:	eb 4c                	jmp    320 <gets+0x5b>
    cc = read(0, &c, 1);
 2d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2db:	00 
 2dc:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2df:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ea:	e8 68 02 00 00       	call   557 <read>
 2ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2f6:	7f 02                	jg     2fa <gets+0x35>
      break;
 2f8:	eb 31                	jmp    32b <gets+0x66>
    buf[i++] = c;
 2fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2fd:	8d 50 01             	lea    0x1(%eax),%edx
 300:	89 55 f4             	mov    %edx,-0xc(%ebp)
 303:	89 c2                	mov    %eax,%edx
 305:	8b 45 08             	mov    0x8(%ebp),%eax
 308:	01 c2                	add    %eax,%edx
 30a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 310:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 314:	3c 0a                	cmp    $0xa,%al
 316:	74 13                	je     32b <gets+0x66>
 318:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31c:	3c 0d                	cmp    $0xd,%al
 31e:	74 0b                	je     32b <gets+0x66>
  for(i=0; i+1 < max; ){
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	83 c0 01             	add    $0x1,%eax
 326:	3b 45 0c             	cmp    0xc(%ebp),%eax
 329:	7c a9                	jl     2d4 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 32b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	01 d0                	add    %edx,%eax
 333:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 336:	8b 45 08             	mov    0x8(%ebp),%eax
}
 339:	c9                   	leave  
 33a:	c3                   	ret    

0000033b <stat>:

int
stat(const char *n, struct stat *st)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 341:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 348:	00 
 349:	8b 45 08             	mov    0x8(%ebp),%eax
 34c:	89 04 24             	mov    %eax,(%esp)
 34f:	e8 2b 02 00 00       	call   57f <open>
 354:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 357:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 35b:	79 07                	jns    364 <stat+0x29>
    return -1;
 35d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 362:	eb 23                	jmp    387 <stat+0x4c>
  r = fstat(fd, st);
 364:	8b 45 0c             	mov    0xc(%ebp),%eax
 367:	89 44 24 04          	mov    %eax,0x4(%esp)
 36b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 36e:	89 04 24             	mov    %eax,(%esp)
 371:	e8 21 02 00 00       	call   597 <fstat>
 376:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 379:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37c:	89 04 24             	mov    %eax,(%esp)
 37f:	e8 e3 01 00 00       	call   567 <close>
  return r;
 384:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 387:	c9                   	leave  
 388:	c3                   	ret    

00000389 <atoi>:

int
atoi(const char *s)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 38f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 396:	eb 25                	jmp    3bd <atoi+0x34>
    n = n*10 + *s++ - '0';
 398:	8b 55 fc             	mov    -0x4(%ebp),%edx
 39b:	89 d0                	mov    %edx,%eax
 39d:	c1 e0 02             	shl    $0x2,%eax
 3a0:	01 d0                	add    %edx,%eax
 3a2:	01 c0                	add    %eax,%eax
 3a4:	89 c1                	mov    %eax,%ecx
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	8d 50 01             	lea    0x1(%eax),%edx
 3ac:	89 55 08             	mov    %edx,0x8(%ebp)
 3af:	0f b6 00             	movzbl (%eax),%eax
 3b2:	0f be c0             	movsbl %al,%eax
 3b5:	01 c8                	add    %ecx,%eax
 3b7:	83 e8 30             	sub    $0x30,%eax
 3ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	3c 2f                	cmp    $0x2f,%al
 3c5:	7e 0a                	jle    3d1 <atoi+0x48>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 00             	movzbl (%eax),%eax
 3cd:	3c 39                	cmp    $0x39,%al
 3cf:	7e c7                	jle    398 <atoi+0xf>
  return n;
 3d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    

000003d6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e8:	eb 17                	jmp    401 <memmove+0x2b>
    *dst++ = *src++;
 3ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ed:	8d 50 01             	lea    0x1(%eax),%edx
 3f0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3f3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3f6:	8d 4a 01             	lea    0x1(%edx),%ecx
 3f9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3fc:	0f b6 12             	movzbl (%edx),%edx
 3ff:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 401:	8b 45 10             	mov    0x10(%ebp),%eax
 404:	8d 50 ff             	lea    -0x1(%eax),%edx
 407:	89 55 10             	mov    %edx,0x10(%ebp)
 40a:	85 c0                	test   %eax,%eax
 40c:	7f dc                	jg     3ea <memmove+0x14>
  return vdst;
 40e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 411:	c9                   	leave  
 412:	c3                   	ret    

00000413 <ps>:

void ps(void) {
 413:	55                   	push   %ebp
 414:	89 e5                	mov    %esp,%ebp
 416:	57                   	push   %edi
 417:	56                   	push   %esi
 418:	53                   	push   %ebx
 419:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 41f:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 425:	89 04 24             	mov    %eax,(%esp)
 428:	e8 b2 01 00 00       	call   5df <getpinfo>

  // Print the information TODOWHAT

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 42d:	c7 44 24 04 b6 0a 00 	movl   $0xab6,0x4(%esp)
 434:	00 
 435:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 43c:	e8 86 02 00 00       	call   6c7 <printf>

  int i = 0;
 441:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 448:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 44f:	e9 ce 00 00 00       	jmp    522 <ps+0x10f>
    if (pstat[i].inuse) {
 454:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 457:	89 d0                	mov    %edx,%eax
 459:	c1 e0 03             	shl    $0x3,%eax
 45c:	01 d0                	add    %edx,%eax
 45e:	c1 e0 02             	shl    $0x2,%eax
 461:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 464:	01 d8                	add    %ebx,%eax
 466:	2d 04 09 00 00       	sub    $0x904,%eax
 46b:	8b 00                	mov    (%eax),%eax
 46d:	85 c0                	test   %eax,%eax
 46f:	0f 84 a9 00 00 00    	je     51e <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 475:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 47b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 47e:	89 d0                	mov    %edx,%eax
 480:	c1 e0 03             	shl    $0x3,%eax
 483:	01 d0                	add    %edx,%eax
 485:	c1 e0 02             	shl    $0x2,%eax
 488:	83 c0 10             	add    $0x10,%eax
 48b:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 48e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 491:	89 d0                	mov    %edx,%eax
 493:	c1 e0 03             	shl    $0x3,%eax
 496:	01 d0                	add    %edx,%eax
 498:	c1 e0 02             	shl    $0x2,%eax
 49b:	8d 75 e8             	lea    -0x18(%ebp),%esi
 49e:	01 f0                	add    %esi,%eax
 4a0:	2d e4 08 00 00       	sub    $0x8e4,%eax
 4a5:	0f b6 00             	movzbl (%eax),%eax
 4a8:	0f be f0             	movsbl %al,%esi
 4ab:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4ae:	89 d0                	mov    %edx,%eax
 4b0:	c1 e0 03             	shl    $0x3,%eax
 4b3:	01 d0                	add    %edx,%eax
 4b5:	c1 e0 02             	shl    $0x2,%eax
 4b8:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4bb:	01 c8                	add    %ecx,%eax
 4bd:	2d f8 08 00 00       	sub    $0x8f8,%eax
 4c2:	8b 18                	mov    (%eax),%ebx
 4c4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4c7:	89 d0                	mov    %edx,%eax
 4c9:	c1 e0 03             	shl    $0x3,%eax
 4cc:	01 d0                	add    %edx,%eax
 4ce:	c1 e0 02             	shl    $0x2,%eax
 4d1:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4d4:	01 c8                	add    %ecx,%eax
 4d6:	2d 00 09 00 00       	sub    $0x900,%eax
 4db:	8b 08                	mov    (%eax),%ecx
 4dd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4e0:	89 d0                	mov    %edx,%eax
 4e2:	c1 e0 03             	shl    $0x3,%eax
 4e5:	01 d0                	add    %edx,%eax
 4e7:	c1 e0 02             	shl    $0x2,%eax
 4ea:	8d 55 e8             	lea    -0x18(%ebp),%edx
 4ed:	01 d0                	add    %edx,%eax
 4ef:	2d fc 08 00 00       	sub    $0x8fc,%eax
 4f4:	8b 00                	mov    (%eax),%eax
 4f6:	89 7c 24 18          	mov    %edi,0x18(%esp)
 4fa:	89 74 24 14          	mov    %esi,0x14(%esp)
 4fe:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 502:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 506:	89 44 24 08          	mov    %eax,0x8(%esp)
 50a:	c7 44 24 04 cf 0a 00 	movl   $0xacf,0x4(%esp)
 511:	00 
 512:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 519:	e8 a9 01 00 00       	call   6c7 <printf>
  for (i = 0; i < NPROC; ++i) {
 51e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 522:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 526:	0f 8e 28 ff ff ff    	jle    454 <ps+0x41>
    }
  }
 52c:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 532:	5b                   	pop    %ebx
 533:	5e                   	pop    %esi
 534:	5f                   	pop    %edi
 535:	5d                   	pop    %ebp
 536:	c3                   	ret    

00000537 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 537:	b8 01 00 00 00       	mov    $0x1,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <exit>:
SYSCALL(exit)
 53f:	b8 02 00 00 00       	mov    $0x2,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <wait>:
SYSCALL(wait)
 547:	b8 03 00 00 00       	mov    $0x3,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <pipe>:
SYSCALL(pipe)
 54f:	b8 04 00 00 00       	mov    $0x4,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <read>:
SYSCALL(read)
 557:	b8 05 00 00 00       	mov    $0x5,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <write>:
SYSCALL(write)
 55f:	b8 10 00 00 00       	mov    $0x10,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <close>:
SYSCALL(close)
 567:	b8 15 00 00 00       	mov    $0x15,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <kill>:
SYSCALL(kill)
 56f:	b8 06 00 00 00       	mov    $0x6,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <exec>:
SYSCALL(exec)
 577:	b8 07 00 00 00       	mov    $0x7,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <open>:
SYSCALL(open)
 57f:	b8 0f 00 00 00       	mov    $0xf,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <mknod>:
SYSCALL(mknod)
 587:	b8 11 00 00 00       	mov    $0x11,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <unlink>:
SYSCALL(unlink)
 58f:	b8 12 00 00 00       	mov    $0x12,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <fstat>:
SYSCALL(fstat)
 597:	b8 08 00 00 00       	mov    $0x8,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <link>:
SYSCALL(link)
 59f:	b8 13 00 00 00       	mov    $0x13,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <mkdir>:
SYSCALL(mkdir)
 5a7:	b8 14 00 00 00       	mov    $0x14,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <chdir>:
SYSCALL(chdir)
 5af:	b8 09 00 00 00       	mov    $0x9,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <dup>:
SYSCALL(dup)
 5b7:	b8 0a 00 00 00       	mov    $0xa,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <getpid>:
SYSCALL(getpid)
 5bf:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <sbrk>:
SYSCALL(sbrk)
 5c7:	b8 0c 00 00 00       	mov    $0xc,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <sleep>:
SYSCALL(sleep)
 5cf:	b8 0d 00 00 00       	mov    $0xd,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <uptime>:
SYSCALL(uptime)
 5d7:	b8 0e 00 00 00       	mov    $0xe,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <getpinfo>:
SYSCALL(getpinfo)
 5df:	b8 16 00 00 00       	mov    $0x16,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret    

000005e7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5e7:	55                   	push   %ebp
 5e8:	89 e5                	mov    %esp,%ebp
 5ea:	83 ec 18             	sub    $0x18,%esp
 5ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5f3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5fa:	00 
 5fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 602:	8b 45 08             	mov    0x8(%ebp),%eax
 605:	89 04 24             	mov    %eax,(%esp)
 608:	e8 52 ff ff ff       	call   55f <write>
}
 60d:	c9                   	leave  
 60e:	c3                   	ret    

0000060f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 60f:	55                   	push   %ebp
 610:	89 e5                	mov    %esp,%ebp
 612:	56                   	push   %esi
 613:	53                   	push   %ebx
 614:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 617:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 61e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 622:	74 17                	je     63b <printint+0x2c>
 624:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 628:	79 11                	jns    63b <printint+0x2c>
    neg = 1;
 62a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 631:	8b 45 0c             	mov    0xc(%ebp),%eax
 634:	f7 d8                	neg    %eax
 636:	89 45 ec             	mov    %eax,-0x14(%ebp)
 639:	eb 06                	jmp    641 <printint+0x32>
  } else {
    x = xx;
 63b:	8b 45 0c             	mov    0xc(%ebp),%eax
 63e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 641:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 648:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 64b:	8d 41 01             	lea    0x1(%ecx),%eax
 64e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 651:	8b 5d 10             	mov    0x10(%ebp),%ebx
 654:	8b 45 ec             	mov    -0x14(%ebp),%eax
 657:	ba 00 00 00 00       	mov    $0x0,%edx
 65c:	f7 f3                	div    %ebx
 65e:	89 d0                	mov    %edx,%eax
 660:	0f b6 80 5c 0d 00 00 	movzbl 0xd5c(%eax),%eax
 667:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 66b:	8b 75 10             	mov    0x10(%ebp),%esi
 66e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 671:	ba 00 00 00 00       	mov    $0x0,%edx
 676:	f7 f6                	div    %esi
 678:	89 45 ec             	mov    %eax,-0x14(%ebp)
 67b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 67f:	75 c7                	jne    648 <printint+0x39>
  if(neg)
 681:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 685:	74 10                	je     697 <printint+0x88>
    buf[i++] = '-';
 687:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68a:	8d 50 01             	lea    0x1(%eax),%edx
 68d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 690:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 695:	eb 1f                	jmp    6b6 <printint+0xa7>
 697:	eb 1d                	jmp    6b6 <printint+0xa7>
    putc(fd, buf[i]);
 699:	8d 55 dc             	lea    -0x24(%ebp),%edx
 69c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69f:	01 d0                	add    %edx,%eax
 6a1:	0f b6 00             	movzbl (%eax),%eax
 6a4:	0f be c0             	movsbl %al,%eax
 6a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	89 04 24             	mov    %eax,(%esp)
 6b1:	e8 31 ff ff ff       	call   5e7 <putc>
  while(--i >= 0)
 6b6:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6be:	79 d9                	jns    699 <printint+0x8a>
}
 6c0:	83 c4 30             	add    $0x30,%esp
 6c3:	5b                   	pop    %ebx
 6c4:	5e                   	pop    %esi
 6c5:	5d                   	pop    %ebp
 6c6:	c3                   	ret    

000006c7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6c7:	55                   	push   %ebp
 6c8:	89 e5                	mov    %esp,%ebp
 6ca:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6cd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6d4:	8d 45 0c             	lea    0xc(%ebp),%eax
 6d7:	83 c0 04             	add    $0x4,%eax
 6da:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6e4:	e9 7c 01 00 00       	jmp    865 <printf+0x19e>
    c = fmt[i] & 0xff;
 6e9:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ef:	01 d0                	add    %edx,%eax
 6f1:	0f b6 00             	movzbl (%eax),%eax
 6f4:	0f be c0             	movsbl %al,%eax
 6f7:	25 ff 00 00 00       	and    $0xff,%eax
 6fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6ff:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 703:	75 2c                	jne    731 <printf+0x6a>
      if(c == '%'){
 705:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 709:	75 0c                	jne    717 <printf+0x50>
        state = '%';
 70b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 712:	e9 4a 01 00 00       	jmp    861 <printf+0x19a>
      } else {
        putc(fd, c);
 717:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 71a:	0f be c0             	movsbl %al,%eax
 71d:	89 44 24 04          	mov    %eax,0x4(%esp)
 721:	8b 45 08             	mov    0x8(%ebp),%eax
 724:	89 04 24             	mov    %eax,(%esp)
 727:	e8 bb fe ff ff       	call   5e7 <putc>
 72c:	e9 30 01 00 00       	jmp    861 <printf+0x19a>
      }
    } else if(state == '%'){
 731:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 735:	0f 85 26 01 00 00    	jne    861 <printf+0x19a>
      if(c == 'd'){
 73b:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 73f:	75 2d                	jne    76e <printf+0xa7>
        printint(fd, *ap, 10, 1);
 741:	8b 45 e8             	mov    -0x18(%ebp),%eax
 744:	8b 00                	mov    (%eax),%eax
 746:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 74d:	00 
 74e:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 755:	00 
 756:	89 44 24 04          	mov    %eax,0x4(%esp)
 75a:	8b 45 08             	mov    0x8(%ebp),%eax
 75d:	89 04 24             	mov    %eax,(%esp)
 760:	e8 aa fe ff ff       	call   60f <printint>
        ap++;
 765:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 769:	e9 ec 00 00 00       	jmp    85a <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 76e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 772:	74 06                	je     77a <printf+0xb3>
 774:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 778:	75 2d                	jne    7a7 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 77a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 77d:	8b 00                	mov    (%eax),%eax
 77f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 786:	00 
 787:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 78e:	00 
 78f:	89 44 24 04          	mov    %eax,0x4(%esp)
 793:	8b 45 08             	mov    0x8(%ebp),%eax
 796:	89 04 24             	mov    %eax,(%esp)
 799:	e8 71 fe ff ff       	call   60f <printint>
        ap++;
 79e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7a2:	e9 b3 00 00 00       	jmp    85a <printf+0x193>
      } else if(c == 's'){
 7a7:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7ab:	75 45                	jne    7f2 <printf+0x12b>
        s = (char*)*ap;
 7ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b0:	8b 00                	mov    (%eax),%eax
 7b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7b5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7bd:	75 09                	jne    7c8 <printf+0x101>
          s = "(null)";
 7bf:	c7 45 f4 df 0a 00 00 	movl   $0xadf,-0xc(%ebp)
        while(*s != 0){
 7c6:	eb 1e                	jmp    7e6 <printf+0x11f>
 7c8:	eb 1c                	jmp    7e6 <printf+0x11f>
          putc(fd, *s);
 7ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cd:	0f b6 00             	movzbl (%eax),%eax
 7d0:	0f be c0             	movsbl %al,%eax
 7d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d7:	8b 45 08             	mov    0x8(%ebp),%eax
 7da:	89 04 24             	mov    %eax,(%esp)
 7dd:	e8 05 fe ff ff       	call   5e7 <putc>
          s++;
 7e2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e9:	0f b6 00             	movzbl (%eax),%eax
 7ec:	84 c0                	test   %al,%al
 7ee:	75 da                	jne    7ca <printf+0x103>
 7f0:	eb 68                	jmp    85a <printf+0x193>
        }
      } else if(c == 'c'){
 7f2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7f6:	75 1d                	jne    815 <printf+0x14e>
        putc(fd, *ap);
 7f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7fb:	8b 00                	mov    (%eax),%eax
 7fd:	0f be c0             	movsbl %al,%eax
 800:	89 44 24 04          	mov    %eax,0x4(%esp)
 804:	8b 45 08             	mov    0x8(%ebp),%eax
 807:	89 04 24             	mov    %eax,(%esp)
 80a:	e8 d8 fd ff ff       	call   5e7 <putc>
        ap++;
 80f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 813:	eb 45                	jmp    85a <printf+0x193>
      } else if(c == '%'){
 815:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 819:	75 17                	jne    832 <printf+0x16b>
        putc(fd, c);
 81b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 81e:	0f be c0             	movsbl %al,%eax
 821:	89 44 24 04          	mov    %eax,0x4(%esp)
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	89 04 24             	mov    %eax,(%esp)
 82b:	e8 b7 fd ff ff       	call   5e7 <putc>
 830:	eb 28                	jmp    85a <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 832:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 839:	00 
 83a:	8b 45 08             	mov    0x8(%ebp),%eax
 83d:	89 04 24             	mov    %eax,(%esp)
 840:	e8 a2 fd ff ff       	call   5e7 <putc>
        putc(fd, c);
 845:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 848:	0f be c0             	movsbl %al,%eax
 84b:	89 44 24 04          	mov    %eax,0x4(%esp)
 84f:	8b 45 08             	mov    0x8(%ebp),%eax
 852:	89 04 24             	mov    %eax,(%esp)
 855:	e8 8d fd ff ff       	call   5e7 <putc>
      }
      state = 0;
 85a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 861:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 865:	8b 55 0c             	mov    0xc(%ebp),%edx
 868:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86b:	01 d0                	add    %edx,%eax
 86d:	0f b6 00             	movzbl (%eax),%eax
 870:	84 c0                	test   %al,%al
 872:	0f 85 71 fe ff ff    	jne    6e9 <printf+0x22>
    }
  }
}
 878:	c9                   	leave  
 879:	c3                   	ret    

0000087a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 87a:	55                   	push   %ebp
 87b:	89 e5                	mov    %esp,%ebp
 87d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 880:	8b 45 08             	mov    0x8(%ebp),%eax
 883:	83 e8 08             	sub    $0x8,%eax
 886:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 889:	a1 78 0d 00 00       	mov    0xd78,%eax
 88e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 891:	eb 24                	jmp    8b7 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 893:	8b 45 fc             	mov    -0x4(%ebp),%eax
 896:	8b 00                	mov    (%eax),%eax
 898:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 89b:	77 12                	ja     8af <free+0x35>
 89d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8a3:	77 24                	ja     8c9 <free+0x4f>
 8a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a8:	8b 00                	mov    (%eax),%eax
 8aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ad:	77 1a                	ja     8c9 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b2:	8b 00                	mov    (%eax),%eax
 8b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ba:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8bd:	76 d4                	jbe    893 <free+0x19>
 8bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c2:	8b 00                	mov    (%eax),%eax
 8c4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8c7:	76 ca                	jbe    893 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cc:	8b 40 04             	mov    0x4(%eax),%eax
 8cf:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d9:	01 c2                	add    %eax,%edx
 8db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8de:	8b 00                	mov    (%eax),%eax
 8e0:	39 c2                	cmp    %eax,%edx
 8e2:	75 24                	jne    908 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e7:	8b 50 04             	mov    0x4(%eax),%edx
 8ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ed:	8b 00                	mov    (%eax),%eax
 8ef:	8b 40 04             	mov    0x4(%eax),%eax
 8f2:	01 c2                	add    %eax,%edx
 8f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f7:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fd:	8b 00                	mov    (%eax),%eax
 8ff:	8b 10                	mov    (%eax),%edx
 901:	8b 45 f8             	mov    -0x8(%ebp),%eax
 904:	89 10                	mov    %edx,(%eax)
 906:	eb 0a                	jmp    912 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 908:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90b:	8b 10                	mov    (%eax),%edx
 90d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 910:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 912:	8b 45 fc             	mov    -0x4(%ebp),%eax
 915:	8b 40 04             	mov    0x4(%eax),%eax
 918:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 91f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 922:	01 d0                	add    %edx,%eax
 924:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 927:	75 20                	jne    949 <free+0xcf>
    p->s.size += bp->s.size;
 929:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92c:	8b 50 04             	mov    0x4(%eax),%edx
 92f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 932:	8b 40 04             	mov    0x4(%eax),%eax
 935:	01 c2                	add    %eax,%edx
 937:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 93d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 940:	8b 10                	mov    (%eax),%edx
 942:	8b 45 fc             	mov    -0x4(%ebp),%eax
 945:	89 10                	mov    %edx,(%eax)
 947:	eb 08                	jmp    951 <free+0xd7>
  } else
    p->s.ptr = bp;
 949:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 94f:	89 10                	mov    %edx,(%eax)
  freep = p;
 951:	8b 45 fc             	mov    -0x4(%ebp),%eax
 954:	a3 78 0d 00 00       	mov    %eax,0xd78
}
 959:	c9                   	leave  
 95a:	c3                   	ret    

0000095b <morecore>:

static Header*
morecore(uint nu)
{
 95b:	55                   	push   %ebp
 95c:	89 e5                	mov    %esp,%ebp
 95e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 961:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 968:	77 07                	ja     971 <morecore+0x16>
    nu = 4096;
 96a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 971:	8b 45 08             	mov    0x8(%ebp),%eax
 974:	c1 e0 03             	shl    $0x3,%eax
 977:	89 04 24             	mov    %eax,(%esp)
 97a:	e8 48 fc ff ff       	call   5c7 <sbrk>
 97f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 982:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 986:	75 07                	jne    98f <morecore+0x34>
    return 0;
 988:	b8 00 00 00 00       	mov    $0x0,%eax
 98d:	eb 22                	jmp    9b1 <morecore+0x56>
  hp = (Header*)p;
 98f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 992:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 995:	8b 45 f0             	mov    -0x10(%ebp),%eax
 998:	8b 55 08             	mov    0x8(%ebp),%edx
 99b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 99e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a1:	83 c0 08             	add    $0x8,%eax
 9a4:	89 04 24             	mov    %eax,(%esp)
 9a7:	e8 ce fe ff ff       	call   87a <free>
  return freep;
 9ac:	a1 78 0d 00 00       	mov    0xd78,%eax
}
 9b1:	c9                   	leave  
 9b2:	c3                   	ret    

000009b3 <malloc>:

void*
malloc(uint nbytes)
{
 9b3:	55                   	push   %ebp
 9b4:	89 e5                	mov    %esp,%ebp
 9b6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b9:	8b 45 08             	mov    0x8(%ebp),%eax
 9bc:	83 c0 07             	add    $0x7,%eax
 9bf:	c1 e8 03             	shr    $0x3,%eax
 9c2:	83 c0 01             	add    $0x1,%eax
 9c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9c8:	a1 78 0d 00 00       	mov    0xd78,%eax
 9cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9d0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9d4:	75 23                	jne    9f9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9d6:	c7 45 f0 70 0d 00 00 	movl   $0xd70,-0x10(%ebp)
 9dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e0:	a3 78 0d 00 00       	mov    %eax,0xd78
 9e5:	a1 78 0d 00 00       	mov    0xd78,%eax
 9ea:	a3 70 0d 00 00       	mov    %eax,0xd70
    base.s.size = 0;
 9ef:	c7 05 74 0d 00 00 00 	movl   $0x0,0xd74
 9f6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9fc:	8b 00                	mov    (%eax),%eax
 9fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a04:	8b 40 04             	mov    0x4(%eax),%eax
 a07:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a0a:	72 4d                	jb     a59 <malloc+0xa6>
      if(p->s.size == nunits)
 a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0f:	8b 40 04             	mov    0x4(%eax),%eax
 a12:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a15:	75 0c                	jne    a23 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a17:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1a:	8b 10                	mov    (%eax),%edx
 a1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a1f:	89 10                	mov    %edx,(%eax)
 a21:	eb 26                	jmp    a49 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a23:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a26:	8b 40 04             	mov    0x4(%eax),%eax
 a29:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a2c:	89 c2                	mov    %eax,%edx
 a2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a31:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a34:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a37:	8b 40 04             	mov    0x4(%eax),%eax
 a3a:	c1 e0 03             	shl    $0x3,%eax
 a3d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a40:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a43:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a46:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a49:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a4c:	a3 78 0d 00 00       	mov    %eax,0xd78
      return (void*)(p + 1);
 a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a54:	83 c0 08             	add    $0x8,%eax
 a57:	eb 38                	jmp    a91 <malloc+0xde>
    }
    if(p == freep)
 a59:	a1 78 0d 00 00       	mov    0xd78,%eax
 a5e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a61:	75 1b                	jne    a7e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a63:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a66:	89 04 24             	mov    %eax,(%esp)
 a69:	e8 ed fe ff ff       	call   95b <morecore>
 a6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a71:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a75:	75 07                	jne    a7e <malloc+0xcb>
        return 0;
 a77:	b8 00 00 00 00       	mov    $0x0,%eax
 a7c:	eb 13                	jmp    a91 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a81:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a84:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a87:	8b 00                	mov    (%eax),%eax
 a89:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a8c:	e9 70 ff ff ff       	jmp    a01 <malloc+0x4e>
}
 a91:	c9                   	leave  
 a92:	c3                   	ret    
