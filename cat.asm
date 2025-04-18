
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   6:	eb 39                	jmp    41 <cat+0x41>
    if (write(1, buf, n) != n) {
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 c4 04 00 00       	call   4e7 <write>
  23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  26:	74 19                	je     41 <cat+0x41>
      printf(1, "cat: write error\n");
  28:	c7 44 24 04 1b 0a 00 	movl   $0xa1b,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 13 06 00 00       	call   64f <printf>
      exit();
  3c:	e8 86 04 00 00       	call   4c7 <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  41:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  50:	00 
  51:	8b 45 08             	mov    0x8(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 83 04 00 00       	call   4df <read>
  5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  63:	7f a3                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  69:	79 19                	jns    84 <cat+0x84>
    printf(1, "cat: read error\n");
  6b:	c7 44 24 04 2d 0a 00 	movl   $0xa2d,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 d0 05 00 00       	call   64f <printf>
    exit();
  7f:	e8 43 04 00 00       	call   4c7 <exit>
  }
}
  84:	c9                   	leave  
  85:	c3                   	ret    

00000086 <main>:

int
main(int argc, char *argv[])
{
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  8f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  93:	7f 11                	jg     a6 <main+0x20>
    cat(0);
  95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 21 04 00 00       	call   4c7 <exit>
  }

  for(i = 1; i < argc; i++){
  a6:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  ad:	00 
  ae:	eb 79                	jmp    129 <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  be:	01 d0                	add    %edx,%eax
  c0:	8b 00                	mov    (%eax),%eax
  c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c9:	00 
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 35 04 00 00       	call   507 <open>
  d2:	89 44 24 18          	mov    %eax,0x18(%esp)
  d6:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  db:	79 2f                	jns    10c <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	01 d0                	add    %edx,%eax
  ed:	8b 00                	mov    (%eax),%eax
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	c7 44 24 04 3e 0a 00 	movl   $0xa3e,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 48 05 00 00       	call   64f <printf>
      exit();
 107:	e8 bb 03 00 00       	call   4c7 <exit>
    }
    cat(fd);
 10c:	8b 44 24 18          	mov    0x18(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 e8 fe ff ff       	call   0 <cat>
    close(fd);
 118:	8b 44 24 18          	mov    0x18(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 cb 03 00 00       	call   4ef <close>
  for(i = 1; i < argc; i++){
 124:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	3b 45 08             	cmp    0x8(%ebp),%eax
 130:	0f 8c 7a ff ff ff    	jl     b0 <main+0x2a>
  }
  exit();
 136:	e8 8c 03 00 00       	call   4c7 <exit>

0000013b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	57                   	push   %edi
 13f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 140:	8b 4d 08             	mov    0x8(%ebp),%ecx
 143:	8b 55 10             	mov    0x10(%ebp),%edx
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	89 cb                	mov    %ecx,%ebx
 14b:	89 df                	mov    %ebx,%edi
 14d:	89 d1                	mov    %edx,%ecx
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
 152:	89 ca                	mov    %ecx,%edx
 154:	89 fb                	mov    %edi,%ebx
 156:	89 5d 08             	mov    %ebx,0x8(%ebp)
 159:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 15c:	5b                   	pop    %ebx
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 16c:	90                   	nop
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	8d 50 01             	lea    0x1(%eax),%edx
 173:	89 55 08             	mov    %edx,0x8(%ebp)
 176:	8b 55 0c             	mov    0xc(%ebp),%edx
 179:	8d 4a 01             	lea    0x1(%edx),%ecx
 17c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17f:	0f b6 12             	movzbl (%edx),%edx
 182:	88 10                	mov    %dl,(%eax)
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	84 c0                	test   %al,%al
 189:	75 e2                	jne    16d <strcpy+0xd>
    ;
  return os;
 18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18e:	c9                   	leave  
 18f:	c3                   	ret    

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 193:	eb 08                	jmp    19d <strcmp+0xd>
    p++, q++;
 195:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 199:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	84 c0                	test   %al,%al
 1a5:	74 10                	je     1b7 <strcmp+0x27>
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b0:	0f b6 00             	movzbl (%eax),%eax
 1b3:	38 c2                	cmp    %al,%dl
 1b5:	74 de                	je     195 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	0f b6 d0             	movzbl %al,%edx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	0f b6 c0             	movzbl %al,%eax
 1c9:	29 c2                	sub    %eax,%edx
 1cb:	89 d0                	mov    %edx,%eax
}
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <strlen>:

uint
strlen(const char *s)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1dc:	eb 04                	jmp    1e2 <strlen+0x13>
 1de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	01 d0                	add    %edx,%eax
 1ea:	0f b6 00             	movzbl (%eax),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 ed                	jne    1de <strlen+0xf>
    ;
  return n;
 1f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1fc:	8b 45 10             	mov    0x10(%ebp),%eax
 1ff:	89 44 24 08          	mov    %eax,0x8(%esp)
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	89 44 24 04          	mov    %eax,0x4(%esp)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	89 04 24             	mov    %eax,(%esp)
 210:	e8 26 ff ff ff       	call   13b <stosb>
  return dst;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
}
 218:	c9                   	leave  
 219:	c3                   	ret    

0000021a <strchr>:

char*
strchr(const char *s, char c)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	8b 45 0c             	mov    0xc(%ebp),%eax
 223:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 226:	eb 14                	jmp    23c <strchr+0x22>
    if(*s == c)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 231:	75 05                	jne    238 <strchr+0x1e>
      return (char*)s;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	eb 13                	jmp    24b <strchr+0x31>
  for(; *s; s++)
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	84 c0                	test   %al,%al
 244:	75 e2                	jne    228 <strchr+0xe>
  return 0;
 246:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <gets>:

char*
gets(char *buf, int max)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 25a:	eb 4c                	jmp    2a8 <gets+0x5b>
    cc = read(0, &c, 1);
 25c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 263:	00 
 264:	8d 45 ef             	lea    -0x11(%ebp),%eax
 267:	89 44 24 04          	mov    %eax,0x4(%esp)
 26b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 272:	e8 68 02 00 00       	call   4df <read>
 277:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 27a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27e:	7f 02                	jg     282 <gets+0x35>
      break;
 280:	eb 31                	jmp    2b3 <gets+0x66>
    buf[i++] = c;
 282:	8b 45 f4             	mov    -0xc(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28b:	89 c2                	mov    %eax,%edx
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	01 c2                	add    %eax,%edx
 292:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 296:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 298:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29c:	3c 0a                	cmp    $0xa,%al
 29e:	74 13                	je     2b3 <gets+0x66>
 2a0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a4:	3c 0d                	cmp    $0xd,%al
 2a6:	74 0b                	je     2b3 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ab:	83 c0 01             	add    $0x1,%eax
 2ae:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b1:	7c a9                	jl     25c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2d0:	00 
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	89 04 24             	mov    %eax,(%esp)
 2d7:	e8 2b 02 00 00       	call   507 <open>
 2dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e3:	79 07                	jns    2ec <stat+0x29>
    return -1;
 2e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ea:	eb 23                	jmp    30f <stat+0x4c>
  r = fstat(fd, st);
 2ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f6:	89 04 24             	mov    %eax,(%esp)
 2f9:	e8 21 02 00 00       	call   51f <fstat>
 2fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 304:	89 04 24             	mov    %eax,(%esp)
 307:	e8 e3 01 00 00       	call   4ef <close>
  return r;
 30c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <atoi>:

int
atoi(const char *s)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 317:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31e:	eb 25                	jmp    345 <atoi+0x34>
    n = n*10 + *s++ - '0';
 320:	8b 55 fc             	mov    -0x4(%ebp),%edx
 323:	89 d0                	mov    %edx,%eax
 325:	c1 e0 02             	shl    $0x2,%eax
 328:	01 d0                	add    %edx,%eax
 32a:	01 c0                	add    %eax,%eax
 32c:	89 c1                	mov    %eax,%ecx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	8d 50 01             	lea    0x1(%eax),%edx
 334:	89 55 08             	mov    %edx,0x8(%ebp)
 337:	0f b6 00             	movzbl (%eax),%eax
 33a:	0f be c0             	movsbl %al,%eax
 33d:	01 c8                	add    %ecx,%eax
 33f:	83 e8 30             	sub    $0x30,%eax
 342:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	3c 2f                	cmp    $0x2f,%al
 34d:	7e 0a                	jle    359 <atoi+0x48>
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	0f b6 00             	movzbl (%eax),%eax
 355:	3c 39                	cmp    $0x39,%al
 357:	7e c7                	jle    320 <atoi+0xf>
  return n;
 359:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 370:	eb 17                	jmp    389 <memmove+0x2b>
    *dst++ = *src++;
 372:	8b 45 fc             	mov    -0x4(%ebp),%eax
 375:	8d 50 01             	lea    0x1(%eax),%edx
 378:	89 55 fc             	mov    %edx,-0x4(%ebp)
 37b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37e:	8d 4a 01             	lea    0x1(%edx),%ecx
 381:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 384:	0f b6 12             	movzbl (%edx),%edx
 387:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 389:	8b 45 10             	mov    0x10(%ebp),%eax
 38c:	8d 50 ff             	lea    -0x1(%eax),%edx
 38f:	89 55 10             	mov    %edx,0x10(%ebp)
 392:	85 c0                	test   %eax,%eax
 394:	7f dc                	jg     372 <memmove+0x14>
  return vdst;
 396:	8b 45 08             	mov    0x8(%ebp),%eax
}
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <ps>:

void ps(void) {
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	57                   	push   %edi
 39f:	56                   	push   %esi
 3a0:	53                   	push   %ebx
 3a1:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 3a7:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 3ad:	89 04 24             	mov    %eax,(%esp)
 3b0:	e8 b2 01 00 00       	call   567 <getpinfo>

  // Print the information TODOWHAT

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 3b5:	c7 44 24 04 53 0a 00 	movl   $0xa53,0x4(%esp)
 3bc:	00 
 3bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3c4:	e8 86 02 00 00       	call   64f <printf>

  int i = 0;
 3c9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 3d0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3d7:	e9 ce 00 00 00       	jmp    4aa <ps+0x10f>
    if (pstat[i].inuse) {
 3dc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3df:	89 d0                	mov    %edx,%eax
 3e1:	c1 e0 03             	shl    $0x3,%eax
 3e4:	01 d0                	add    %edx,%eax
 3e6:	c1 e0 02             	shl    $0x2,%eax
 3e9:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3ec:	01 d8                	add    %ebx,%eax
 3ee:	2d 04 09 00 00       	sub    $0x904,%eax
 3f3:	8b 00                	mov    (%eax),%eax
 3f5:	85 c0                	test   %eax,%eax
 3f7:	0f 84 a9 00 00 00    	je     4a6 <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 3fd:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 403:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 406:	89 d0                	mov    %edx,%eax
 408:	c1 e0 03             	shl    $0x3,%eax
 40b:	01 d0                	add    %edx,%eax
 40d:	c1 e0 02             	shl    $0x2,%eax
 410:	83 c0 10             	add    $0x10,%eax
 413:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 416:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 419:	89 d0                	mov    %edx,%eax
 41b:	c1 e0 03             	shl    $0x3,%eax
 41e:	01 d0                	add    %edx,%eax
 420:	c1 e0 02             	shl    $0x2,%eax
 423:	8d 75 e8             	lea    -0x18(%ebp),%esi
 426:	01 f0                	add    %esi,%eax
 428:	2d e4 08 00 00       	sub    $0x8e4,%eax
 42d:	0f b6 00             	movzbl (%eax),%eax
 430:	0f be f0             	movsbl %al,%esi
 433:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 436:	89 d0                	mov    %edx,%eax
 438:	c1 e0 03             	shl    $0x3,%eax
 43b:	01 d0                	add    %edx,%eax
 43d:	c1 e0 02             	shl    $0x2,%eax
 440:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 443:	01 c8                	add    %ecx,%eax
 445:	2d f8 08 00 00       	sub    $0x8f8,%eax
 44a:	8b 18                	mov    (%eax),%ebx
 44c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 44f:	89 d0                	mov    %edx,%eax
 451:	c1 e0 03             	shl    $0x3,%eax
 454:	01 d0                	add    %edx,%eax
 456:	c1 e0 02             	shl    $0x2,%eax
 459:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 45c:	01 c8                	add    %ecx,%eax
 45e:	2d 00 09 00 00       	sub    $0x900,%eax
 463:	8b 08                	mov    (%eax),%ecx
 465:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 468:	89 d0                	mov    %edx,%eax
 46a:	c1 e0 03             	shl    $0x3,%eax
 46d:	01 d0                	add    %edx,%eax
 46f:	c1 e0 02             	shl    $0x2,%eax
 472:	8d 55 e8             	lea    -0x18(%ebp),%edx
 475:	01 d0                	add    %edx,%eax
 477:	2d fc 08 00 00       	sub    $0x8fc,%eax
 47c:	8b 00                	mov    (%eax),%eax
 47e:	89 7c 24 18          	mov    %edi,0x18(%esp)
 482:	89 74 24 14          	mov    %esi,0x14(%esp)
 486:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 48a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 48e:	89 44 24 08          	mov    %eax,0x8(%esp)
 492:	c7 44 24 04 6c 0a 00 	movl   $0xa6c,0x4(%esp)
 499:	00 
 49a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4a1:	e8 a9 01 00 00       	call   64f <printf>
  for (i = 0; i < NPROC; ++i) {
 4a6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 4aa:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 4ae:	0f 8e 28 ff ff ff    	jle    3dc <ps+0x41>
    }
  }
 4b4:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 4ba:	5b                   	pop    %ebx
 4bb:	5e                   	pop    %esi
 4bc:	5f                   	pop    %edi
 4bd:	5d                   	pop    %ebp
 4be:	c3                   	ret    

000004bf <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4bf:	b8 01 00 00 00       	mov    $0x1,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <exit>:
SYSCALL(exit)
 4c7:	b8 02 00 00 00       	mov    $0x2,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <wait>:
SYSCALL(wait)
 4cf:	b8 03 00 00 00       	mov    $0x3,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <pipe>:
SYSCALL(pipe)
 4d7:	b8 04 00 00 00       	mov    $0x4,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <read>:
SYSCALL(read)
 4df:	b8 05 00 00 00       	mov    $0x5,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <write>:
SYSCALL(write)
 4e7:	b8 10 00 00 00       	mov    $0x10,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <close>:
SYSCALL(close)
 4ef:	b8 15 00 00 00       	mov    $0x15,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <kill>:
SYSCALL(kill)
 4f7:	b8 06 00 00 00       	mov    $0x6,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <exec>:
SYSCALL(exec)
 4ff:	b8 07 00 00 00       	mov    $0x7,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <open>:
SYSCALL(open)
 507:	b8 0f 00 00 00       	mov    $0xf,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <mknod>:
SYSCALL(mknod)
 50f:	b8 11 00 00 00       	mov    $0x11,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <unlink>:
SYSCALL(unlink)
 517:	b8 12 00 00 00       	mov    $0x12,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <fstat>:
SYSCALL(fstat)
 51f:	b8 08 00 00 00       	mov    $0x8,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <link>:
SYSCALL(link)
 527:	b8 13 00 00 00       	mov    $0x13,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <mkdir>:
SYSCALL(mkdir)
 52f:	b8 14 00 00 00       	mov    $0x14,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <chdir>:
SYSCALL(chdir)
 537:	b8 09 00 00 00       	mov    $0x9,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <dup>:
SYSCALL(dup)
 53f:	b8 0a 00 00 00       	mov    $0xa,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <getpid>:
SYSCALL(getpid)
 547:	b8 0b 00 00 00       	mov    $0xb,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <sbrk>:
SYSCALL(sbrk)
 54f:	b8 0c 00 00 00       	mov    $0xc,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <sleep>:
SYSCALL(sleep)
 557:	b8 0d 00 00 00       	mov    $0xd,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <uptime>:
SYSCALL(uptime)
 55f:	b8 0e 00 00 00       	mov    $0xe,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <getpinfo>:
SYSCALL(getpinfo)
 567:	b8 16 00 00 00       	mov    $0x16,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 56f:	55                   	push   %ebp
 570:	89 e5                	mov    %esp,%ebp
 572:	83 ec 18             	sub    $0x18,%esp
 575:	8b 45 0c             	mov    0xc(%ebp),%eax
 578:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 57b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 582:	00 
 583:	8d 45 f4             	lea    -0xc(%ebp),%eax
 586:	89 44 24 04          	mov    %eax,0x4(%esp)
 58a:	8b 45 08             	mov    0x8(%ebp),%eax
 58d:	89 04 24             	mov    %eax,(%esp)
 590:	e8 52 ff ff ff       	call   4e7 <write>
}
 595:	c9                   	leave  
 596:	c3                   	ret    

00000597 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	56                   	push   %esi
 59b:	53                   	push   %ebx
 59c:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 59f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5a6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5aa:	74 17                	je     5c3 <printint+0x2c>
 5ac:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5b0:	79 11                	jns    5c3 <printint+0x2c>
    neg = 1;
 5b2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 5bc:	f7 d8                	neg    %eax
 5be:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5c1:	eb 06                	jmp    5c9 <printint+0x32>
  } else {
    x = xx;
 5c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5d0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5d3:	8d 41 01             	lea    0x1(%ecx),%eax
 5d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5d9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5df:	ba 00 00 00 00       	mov    $0x0,%edx
 5e4:	f7 f3                	div    %ebx
 5e6:	89 d0                	mov    %edx,%eax
 5e8:	0f b6 80 18 0d 00 00 	movzbl 0xd18(%eax),%eax
 5ef:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5f3:	8b 75 10             	mov    0x10(%ebp),%esi
 5f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5f9:	ba 00 00 00 00       	mov    $0x0,%edx
 5fe:	f7 f6                	div    %esi
 600:	89 45 ec             	mov    %eax,-0x14(%ebp)
 603:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 607:	75 c7                	jne    5d0 <printint+0x39>
  if(neg)
 609:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 60d:	74 10                	je     61f <printint+0x88>
    buf[i++] = '-';
 60f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 612:	8d 50 01             	lea    0x1(%eax),%edx
 615:	89 55 f4             	mov    %edx,-0xc(%ebp)
 618:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 61d:	eb 1f                	jmp    63e <printint+0xa7>
 61f:	eb 1d                	jmp    63e <printint+0xa7>
    putc(fd, buf[i]);
 621:	8d 55 dc             	lea    -0x24(%ebp),%edx
 624:	8b 45 f4             	mov    -0xc(%ebp),%eax
 627:	01 d0                	add    %edx,%eax
 629:	0f b6 00             	movzbl (%eax),%eax
 62c:	0f be c0             	movsbl %al,%eax
 62f:	89 44 24 04          	mov    %eax,0x4(%esp)
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	89 04 24             	mov    %eax,(%esp)
 639:	e8 31 ff ff ff       	call   56f <putc>
  while(--i >= 0)
 63e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 642:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 646:	79 d9                	jns    621 <printint+0x8a>
}
 648:	83 c4 30             	add    $0x30,%esp
 64b:	5b                   	pop    %ebx
 64c:	5e                   	pop    %esi
 64d:	5d                   	pop    %ebp
 64e:	c3                   	ret    

0000064f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 64f:	55                   	push   %ebp
 650:	89 e5                	mov    %esp,%ebp
 652:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 655:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 65c:	8d 45 0c             	lea    0xc(%ebp),%eax
 65f:	83 c0 04             	add    $0x4,%eax
 662:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 665:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 66c:	e9 7c 01 00 00       	jmp    7ed <printf+0x19e>
    c = fmt[i] & 0xff;
 671:	8b 55 0c             	mov    0xc(%ebp),%edx
 674:	8b 45 f0             	mov    -0x10(%ebp),%eax
 677:	01 d0                	add    %edx,%eax
 679:	0f b6 00             	movzbl (%eax),%eax
 67c:	0f be c0             	movsbl %al,%eax
 67f:	25 ff 00 00 00       	and    $0xff,%eax
 684:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 687:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 68b:	75 2c                	jne    6b9 <printf+0x6a>
      if(c == '%'){
 68d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 691:	75 0c                	jne    69f <printf+0x50>
        state = '%';
 693:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 69a:	e9 4a 01 00 00       	jmp    7e9 <printf+0x19a>
      } else {
        putc(fd, c);
 69f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a2:	0f be c0             	movsbl %al,%eax
 6a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a9:	8b 45 08             	mov    0x8(%ebp),%eax
 6ac:	89 04 24             	mov    %eax,(%esp)
 6af:	e8 bb fe ff ff       	call   56f <putc>
 6b4:	e9 30 01 00 00       	jmp    7e9 <printf+0x19a>
      }
    } else if(state == '%'){
 6b9:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6bd:	0f 85 26 01 00 00    	jne    7e9 <printf+0x19a>
      if(c == 'd'){
 6c3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6c7:	75 2d                	jne    6f6 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6cc:	8b 00                	mov    (%eax),%eax
 6ce:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6d5:	00 
 6d6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6dd:	00 
 6de:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e2:	8b 45 08             	mov    0x8(%ebp),%eax
 6e5:	89 04 24             	mov    %eax,(%esp)
 6e8:	e8 aa fe ff ff       	call   597 <printint>
        ap++;
 6ed:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6f1:	e9 ec 00 00 00       	jmp    7e2 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6f6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6fa:	74 06                	je     702 <printf+0xb3>
 6fc:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 700:	75 2d                	jne    72f <printf+0xe0>
        printint(fd, *ap, 16, 0);
 702:	8b 45 e8             	mov    -0x18(%ebp),%eax
 705:	8b 00                	mov    (%eax),%eax
 707:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 70e:	00 
 70f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 716:	00 
 717:	89 44 24 04          	mov    %eax,0x4(%esp)
 71b:	8b 45 08             	mov    0x8(%ebp),%eax
 71e:	89 04 24             	mov    %eax,(%esp)
 721:	e8 71 fe ff ff       	call   597 <printint>
        ap++;
 726:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 72a:	e9 b3 00 00 00       	jmp    7e2 <printf+0x193>
      } else if(c == 's'){
 72f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 733:	75 45                	jne    77a <printf+0x12b>
        s = (char*)*ap;
 735:	8b 45 e8             	mov    -0x18(%ebp),%eax
 738:	8b 00                	mov    (%eax),%eax
 73a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 73d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 741:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 745:	75 09                	jne    750 <printf+0x101>
          s = "(null)";
 747:	c7 45 f4 7c 0a 00 00 	movl   $0xa7c,-0xc(%ebp)
        while(*s != 0){
 74e:	eb 1e                	jmp    76e <printf+0x11f>
 750:	eb 1c                	jmp    76e <printf+0x11f>
          putc(fd, *s);
 752:	8b 45 f4             	mov    -0xc(%ebp),%eax
 755:	0f b6 00             	movzbl (%eax),%eax
 758:	0f be c0             	movsbl %al,%eax
 75b:	89 44 24 04          	mov    %eax,0x4(%esp)
 75f:	8b 45 08             	mov    0x8(%ebp),%eax
 762:	89 04 24             	mov    %eax,(%esp)
 765:	e8 05 fe ff ff       	call   56f <putc>
          s++;
 76a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 76e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 771:	0f b6 00             	movzbl (%eax),%eax
 774:	84 c0                	test   %al,%al
 776:	75 da                	jne    752 <printf+0x103>
 778:	eb 68                	jmp    7e2 <printf+0x193>
        }
      } else if(c == 'c'){
 77a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 77e:	75 1d                	jne    79d <printf+0x14e>
        putc(fd, *ap);
 780:	8b 45 e8             	mov    -0x18(%ebp),%eax
 783:	8b 00                	mov    (%eax),%eax
 785:	0f be c0             	movsbl %al,%eax
 788:	89 44 24 04          	mov    %eax,0x4(%esp)
 78c:	8b 45 08             	mov    0x8(%ebp),%eax
 78f:	89 04 24             	mov    %eax,(%esp)
 792:	e8 d8 fd ff ff       	call   56f <putc>
        ap++;
 797:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 79b:	eb 45                	jmp    7e2 <printf+0x193>
      } else if(c == '%'){
 79d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7a1:	75 17                	jne    7ba <printf+0x16b>
        putc(fd, c);
 7a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a6:	0f be c0             	movsbl %al,%eax
 7a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 7b0:	89 04 24             	mov    %eax,(%esp)
 7b3:	e8 b7 fd ff ff       	call   56f <putc>
 7b8:	eb 28                	jmp    7e2 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7ba:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7c1:	00 
 7c2:	8b 45 08             	mov    0x8(%ebp),%eax
 7c5:	89 04 24             	mov    %eax,(%esp)
 7c8:	e8 a2 fd ff ff       	call   56f <putc>
        putc(fd, c);
 7cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d0:	0f be c0             	movsbl %al,%eax
 7d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d7:	8b 45 08             	mov    0x8(%ebp),%eax
 7da:	89 04 24             	mov    %eax,(%esp)
 7dd:	e8 8d fd ff ff       	call   56f <putc>
      }
      state = 0;
 7e2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7e9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7ed:	8b 55 0c             	mov    0xc(%ebp),%edx
 7f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f3:	01 d0                	add    %edx,%eax
 7f5:	0f b6 00             	movzbl (%eax),%eax
 7f8:	84 c0                	test   %al,%al
 7fa:	0f 85 71 fe ff ff    	jne    671 <printf+0x22>
    }
  }
}
 800:	c9                   	leave  
 801:	c3                   	ret    

00000802 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 802:	55                   	push   %ebp
 803:	89 e5                	mov    %esp,%ebp
 805:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 808:	8b 45 08             	mov    0x8(%ebp),%eax
 80b:	83 e8 08             	sub    $0x8,%eax
 80e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 48 0d 00 00       	mov    0xd48,%eax
 816:	89 45 fc             	mov    %eax,-0x4(%ebp)
 819:	eb 24                	jmp    83f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81e:	8b 00                	mov    (%eax),%eax
 820:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 823:	77 12                	ja     837 <free+0x35>
 825:	8b 45 f8             	mov    -0x8(%ebp),%eax
 828:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 82b:	77 24                	ja     851 <free+0x4f>
 82d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 830:	8b 00                	mov    (%eax),%eax
 832:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 835:	77 1a                	ja     851 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 837:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83a:	8b 00                	mov    (%eax),%eax
 83c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 83f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 842:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 845:	76 d4                	jbe    81b <free+0x19>
 847:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84a:	8b 00                	mov    (%eax),%eax
 84c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 84f:	76 ca                	jbe    81b <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 851:	8b 45 f8             	mov    -0x8(%ebp),%eax
 854:	8b 40 04             	mov    0x4(%eax),%eax
 857:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 85e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 861:	01 c2                	add    %eax,%edx
 863:	8b 45 fc             	mov    -0x4(%ebp),%eax
 866:	8b 00                	mov    (%eax),%eax
 868:	39 c2                	cmp    %eax,%edx
 86a:	75 24                	jne    890 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 86c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86f:	8b 50 04             	mov    0x4(%eax),%edx
 872:	8b 45 fc             	mov    -0x4(%ebp),%eax
 875:	8b 00                	mov    (%eax),%eax
 877:	8b 40 04             	mov    0x4(%eax),%eax
 87a:	01 c2                	add    %eax,%edx
 87c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 87f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 882:	8b 45 fc             	mov    -0x4(%ebp),%eax
 885:	8b 00                	mov    (%eax),%eax
 887:	8b 10                	mov    (%eax),%edx
 889:	8b 45 f8             	mov    -0x8(%ebp),%eax
 88c:	89 10                	mov    %edx,(%eax)
 88e:	eb 0a                	jmp    89a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 890:	8b 45 fc             	mov    -0x4(%ebp),%eax
 893:	8b 10                	mov    (%eax),%edx
 895:	8b 45 f8             	mov    -0x8(%ebp),%eax
 898:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 89a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89d:	8b 40 04             	mov    0x4(%eax),%eax
 8a0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8aa:	01 d0                	add    %edx,%eax
 8ac:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8af:	75 20                	jne    8d1 <free+0xcf>
    p->s.size += bp->s.size;
 8b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b4:	8b 50 04             	mov    0x4(%eax),%edx
 8b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ba:	8b 40 04             	mov    0x4(%eax),%eax
 8bd:	01 c2                	add    %eax,%edx
 8bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c8:	8b 10                	mov    (%eax),%edx
 8ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cd:	89 10                	mov    %edx,(%eax)
 8cf:	eb 08                	jmp    8d9 <free+0xd7>
  } else
    p->s.ptr = bp;
 8d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8d7:	89 10                	mov    %edx,(%eax)
  freep = p;
 8d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8dc:	a3 48 0d 00 00       	mov    %eax,0xd48
}
 8e1:	c9                   	leave  
 8e2:	c3                   	ret    

000008e3 <morecore>:

static Header*
morecore(uint nu)
{
 8e3:	55                   	push   %ebp
 8e4:	89 e5                	mov    %esp,%ebp
 8e6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8e9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8f0:	77 07                	ja     8f9 <morecore+0x16>
    nu = 4096;
 8f2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8f9:	8b 45 08             	mov    0x8(%ebp),%eax
 8fc:	c1 e0 03             	shl    $0x3,%eax
 8ff:	89 04 24             	mov    %eax,(%esp)
 902:	e8 48 fc ff ff       	call   54f <sbrk>
 907:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 90a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 90e:	75 07                	jne    917 <morecore+0x34>
    return 0;
 910:	b8 00 00 00 00       	mov    $0x0,%eax
 915:	eb 22                	jmp    939 <morecore+0x56>
  hp = (Header*)p;
 917:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 91d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 920:	8b 55 08             	mov    0x8(%ebp),%edx
 923:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 926:	8b 45 f0             	mov    -0x10(%ebp),%eax
 929:	83 c0 08             	add    $0x8,%eax
 92c:	89 04 24             	mov    %eax,(%esp)
 92f:	e8 ce fe ff ff       	call   802 <free>
  return freep;
 934:	a1 48 0d 00 00       	mov    0xd48,%eax
}
 939:	c9                   	leave  
 93a:	c3                   	ret    

0000093b <malloc>:

void*
malloc(uint nbytes)
{
 93b:	55                   	push   %ebp
 93c:	89 e5                	mov    %esp,%ebp
 93e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 941:	8b 45 08             	mov    0x8(%ebp),%eax
 944:	83 c0 07             	add    $0x7,%eax
 947:	c1 e8 03             	shr    $0x3,%eax
 94a:	83 c0 01             	add    $0x1,%eax
 94d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 950:	a1 48 0d 00 00       	mov    0xd48,%eax
 955:	89 45 f0             	mov    %eax,-0x10(%ebp)
 958:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 95c:	75 23                	jne    981 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 95e:	c7 45 f0 40 0d 00 00 	movl   $0xd40,-0x10(%ebp)
 965:	8b 45 f0             	mov    -0x10(%ebp),%eax
 968:	a3 48 0d 00 00       	mov    %eax,0xd48
 96d:	a1 48 0d 00 00       	mov    0xd48,%eax
 972:	a3 40 0d 00 00       	mov    %eax,0xd40
    base.s.size = 0;
 977:	c7 05 44 0d 00 00 00 	movl   $0x0,0xd44
 97e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 981:	8b 45 f0             	mov    -0x10(%ebp),%eax
 984:	8b 00                	mov    (%eax),%eax
 986:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 989:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98c:	8b 40 04             	mov    0x4(%eax),%eax
 98f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 992:	72 4d                	jb     9e1 <malloc+0xa6>
      if(p->s.size == nunits)
 994:	8b 45 f4             	mov    -0xc(%ebp),%eax
 997:	8b 40 04             	mov    0x4(%eax),%eax
 99a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 99d:	75 0c                	jne    9ab <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 99f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a2:	8b 10                	mov    (%eax),%edx
 9a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a7:	89 10                	mov    %edx,(%eax)
 9a9:	eb 26                	jmp    9d1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ae:	8b 40 04             	mov    0x4(%eax),%eax
 9b1:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9b4:	89 c2                	mov    %eax,%edx
 9b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bf:	8b 40 04             	mov    0x4(%eax),%eax
 9c2:	c1 e0 03             	shl    $0x3,%eax
 9c5:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9cb:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9ce:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d4:	a3 48 0d 00 00       	mov    %eax,0xd48
      return (void*)(p + 1);
 9d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9dc:	83 c0 08             	add    $0x8,%eax
 9df:	eb 38                	jmp    a19 <malloc+0xde>
    }
    if(p == freep)
 9e1:	a1 48 0d 00 00       	mov    0xd48,%eax
 9e6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9e9:	75 1b                	jne    a06 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9ee:	89 04 24             	mov    %eax,(%esp)
 9f1:	e8 ed fe ff ff       	call   8e3 <morecore>
 9f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9fd:	75 07                	jne    a06 <malloc+0xcb>
        return 0;
 9ff:	b8 00 00 00 00       	mov    $0x0,%eax
 a04:	eb 13                	jmp    a19 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a06:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a09:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0f:	8b 00                	mov    (%eax),%eax
 a11:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a14:	e9 70 ff ff ff       	jmp    989 <malloc+0x4e>
}
 a19:	c9                   	leave  
 a1a:	c3                   	ret    
