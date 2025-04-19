
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
  28:	c7 44 24 04 23 0a 00 	movl   $0xa23,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 1b 06 00 00       	call   657 <printf>
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
  6b:	c7 44 24 04 35 0a 00 	movl   $0xa35,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 d8 05 00 00       	call   657 <printf>
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
  f3:	c7 44 24 04 46 0a 00 	movl   $0xa46,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 50 05 00 00       	call   657 <printf>
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
 3b5:	c7 44 24 04 5b 0a 00 	movl   $0xa5b,0x4(%esp)
 3bc:	00 
 3bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3c4:	e8 8e 02 00 00       	call   657 <printf>

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
 492:	c7 44 24 04 74 0a 00 	movl   $0xa74,0x4(%esp)
 499:	00 
 49a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4a1:	e8 b1 01 00 00       	call   657 <printf>
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

0000056f <settickets>:
 56f:	b8 17 00 00 00       	mov    $0x17,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 577:	55                   	push   %ebp
 578:	89 e5                	mov    %esp,%ebp
 57a:	83 ec 18             	sub    $0x18,%esp
 57d:	8b 45 0c             	mov    0xc(%ebp),%eax
 580:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 583:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 58a:	00 
 58b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 58e:	89 44 24 04          	mov    %eax,0x4(%esp)
 592:	8b 45 08             	mov    0x8(%ebp),%eax
 595:	89 04 24             	mov    %eax,(%esp)
 598:	e8 4a ff ff ff       	call   4e7 <write>
}
 59d:	c9                   	leave  
 59e:	c3                   	ret    

0000059f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 59f:	55                   	push   %ebp
 5a0:	89 e5                	mov    %esp,%ebp
 5a2:	56                   	push   %esi
 5a3:	53                   	push   %ebx
 5a4:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5a7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5ae:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5b2:	74 17                	je     5cb <printint+0x2c>
 5b4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5b8:	79 11                	jns    5cb <printint+0x2c>
    neg = 1;
 5ba:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c4:	f7 d8                	neg    %eax
 5c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5c9:	eb 06                	jmp    5d1 <printint+0x32>
  } else {
    x = xx;
 5cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5d8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5db:	8d 41 01             	lea    0x1(%ecx),%eax
 5de:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5e1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5e7:	ba 00 00 00 00       	mov    $0x0,%edx
 5ec:	f7 f3                	div    %ebx
 5ee:	89 d0                	mov    %edx,%eax
 5f0:	0f b6 80 20 0d 00 00 	movzbl 0xd20(%eax),%eax
 5f7:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5fb:	8b 75 10             	mov    0x10(%ebp),%esi
 5fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
 601:	ba 00 00 00 00       	mov    $0x0,%edx
 606:	f7 f6                	div    %esi
 608:	89 45 ec             	mov    %eax,-0x14(%ebp)
 60b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 60f:	75 c7                	jne    5d8 <printint+0x39>
  if(neg)
 611:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 615:	74 10                	je     627 <printint+0x88>
    buf[i++] = '-';
 617:	8b 45 f4             	mov    -0xc(%ebp),%eax
 61a:	8d 50 01             	lea    0x1(%eax),%edx
 61d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 620:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 625:	eb 1f                	jmp    646 <printint+0xa7>
 627:	eb 1d                	jmp    646 <printint+0xa7>
    putc(fd, buf[i]);
 629:	8d 55 dc             	lea    -0x24(%ebp),%edx
 62c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 62f:	01 d0                	add    %edx,%eax
 631:	0f b6 00             	movzbl (%eax),%eax
 634:	0f be c0             	movsbl %al,%eax
 637:	89 44 24 04          	mov    %eax,0x4(%esp)
 63b:	8b 45 08             	mov    0x8(%ebp),%eax
 63e:	89 04 24             	mov    %eax,(%esp)
 641:	e8 31 ff ff ff       	call   577 <putc>
  while(--i >= 0)
 646:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 64a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 64e:	79 d9                	jns    629 <printint+0x8a>
}
 650:	83 c4 30             	add    $0x30,%esp
 653:	5b                   	pop    %ebx
 654:	5e                   	pop    %esi
 655:	5d                   	pop    %ebp
 656:	c3                   	ret    

00000657 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 657:	55                   	push   %ebp
 658:	89 e5                	mov    %esp,%ebp
 65a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 65d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 664:	8d 45 0c             	lea    0xc(%ebp),%eax
 667:	83 c0 04             	add    $0x4,%eax
 66a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 66d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 674:	e9 7c 01 00 00       	jmp    7f5 <printf+0x19e>
    c = fmt[i] & 0xff;
 679:	8b 55 0c             	mov    0xc(%ebp),%edx
 67c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 67f:	01 d0                	add    %edx,%eax
 681:	0f b6 00             	movzbl (%eax),%eax
 684:	0f be c0             	movsbl %al,%eax
 687:	25 ff 00 00 00       	and    $0xff,%eax
 68c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 68f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 693:	75 2c                	jne    6c1 <printf+0x6a>
      if(c == '%'){
 695:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 699:	75 0c                	jne    6a7 <printf+0x50>
        state = '%';
 69b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6a2:	e9 4a 01 00 00       	jmp    7f1 <printf+0x19a>
      } else {
        putc(fd, c);
 6a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6aa:	0f be c0             	movsbl %al,%eax
 6ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b1:	8b 45 08             	mov    0x8(%ebp),%eax
 6b4:	89 04 24             	mov    %eax,(%esp)
 6b7:	e8 bb fe ff ff       	call   577 <putc>
 6bc:	e9 30 01 00 00       	jmp    7f1 <printf+0x19a>
      }
    } else if(state == '%'){
 6c1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6c5:	0f 85 26 01 00 00    	jne    7f1 <printf+0x19a>
      if(c == 'd'){
 6cb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6cf:	75 2d                	jne    6fe <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d4:	8b 00                	mov    (%eax),%eax
 6d6:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6dd:	00 
 6de:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6e5:	00 
 6e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ea:	8b 45 08             	mov    0x8(%ebp),%eax
 6ed:	89 04 24             	mov    %eax,(%esp)
 6f0:	e8 aa fe ff ff       	call   59f <printint>
        ap++;
 6f5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6f9:	e9 ec 00 00 00       	jmp    7ea <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6fe:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 702:	74 06                	je     70a <printf+0xb3>
 704:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 708:	75 2d                	jne    737 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 70a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 70d:	8b 00                	mov    (%eax),%eax
 70f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 716:	00 
 717:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 71e:	00 
 71f:	89 44 24 04          	mov    %eax,0x4(%esp)
 723:	8b 45 08             	mov    0x8(%ebp),%eax
 726:	89 04 24             	mov    %eax,(%esp)
 729:	e8 71 fe ff ff       	call   59f <printint>
        ap++;
 72e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 732:	e9 b3 00 00 00       	jmp    7ea <printf+0x193>
      } else if(c == 's'){
 737:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 73b:	75 45                	jne    782 <printf+0x12b>
        s = (char*)*ap;
 73d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 740:	8b 00                	mov    (%eax),%eax
 742:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 745:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 749:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 74d:	75 09                	jne    758 <printf+0x101>
          s = "(null)";
 74f:	c7 45 f4 84 0a 00 00 	movl   $0xa84,-0xc(%ebp)
        while(*s != 0){
 756:	eb 1e                	jmp    776 <printf+0x11f>
 758:	eb 1c                	jmp    776 <printf+0x11f>
          putc(fd, *s);
 75a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75d:	0f b6 00             	movzbl (%eax),%eax
 760:	0f be c0             	movsbl %al,%eax
 763:	89 44 24 04          	mov    %eax,0x4(%esp)
 767:	8b 45 08             	mov    0x8(%ebp),%eax
 76a:	89 04 24             	mov    %eax,(%esp)
 76d:	e8 05 fe ff ff       	call   577 <putc>
          s++;
 772:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 776:	8b 45 f4             	mov    -0xc(%ebp),%eax
 779:	0f b6 00             	movzbl (%eax),%eax
 77c:	84 c0                	test   %al,%al
 77e:	75 da                	jne    75a <printf+0x103>
 780:	eb 68                	jmp    7ea <printf+0x193>
        }
      } else if(c == 'c'){
 782:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 786:	75 1d                	jne    7a5 <printf+0x14e>
        putc(fd, *ap);
 788:	8b 45 e8             	mov    -0x18(%ebp),%eax
 78b:	8b 00                	mov    (%eax),%eax
 78d:	0f be c0             	movsbl %al,%eax
 790:	89 44 24 04          	mov    %eax,0x4(%esp)
 794:	8b 45 08             	mov    0x8(%ebp),%eax
 797:	89 04 24             	mov    %eax,(%esp)
 79a:	e8 d8 fd ff ff       	call   577 <putc>
        ap++;
 79f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7a3:	eb 45                	jmp    7ea <printf+0x193>
      } else if(c == '%'){
 7a5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7a9:	75 17                	jne    7c2 <printf+0x16b>
        putc(fd, c);
 7ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ae:	0f be c0             	movsbl %al,%eax
 7b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b5:	8b 45 08             	mov    0x8(%ebp),%eax
 7b8:	89 04 24             	mov    %eax,(%esp)
 7bb:	e8 b7 fd ff ff       	call   577 <putc>
 7c0:	eb 28                	jmp    7ea <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7c2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7c9:	00 
 7ca:	8b 45 08             	mov    0x8(%ebp),%eax
 7cd:	89 04 24             	mov    %eax,(%esp)
 7d0:	e8 a2 fd ff ff       	call   577 <putc>
        putc(fd, c);
 7d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d8:	0f be c0             	movsbl %al,%eax
 7db:	89 44 24 04          	mov    %eax,0x4(%esp)
 7df:	8b 45 08             	mov    0x8(%ebp),%eax
 7e2:	89 04 24             	mov    %eax,(%esp)
 7e5:	e8 8d fd ff ff       	call   577 <putc>
      }
      state = 0;
 7ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7f1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7f5:	8b 55 0c             	mov    0xc(%ebp),%edx
 7f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fb:	01 d0                	add    %edx,%eax
 7fd:	0f b6 00             	movzbl (%eax),%eax
 800:	84 c0                	test   %al,%al
 802:	0f 85 71 fe ff ff    	jne    679 <printf+0x22>
    }
  }
}
 808:	c9                   	leave  
 809:	c3                   	ret    

0000080a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 80a:	55                   	push   %ebp
 80b:	89 e5                	mov    %esp,%ebp
 80d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 810:	8b 45 08             	mov    0x8(%ebp),%eax
 813:	83 e8 08             	sub    $0x8,%eax
 816:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 819:	a1 48 0d 00 00       	mov    0xd48,%eax
 81e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 821:	eb 24                	jmp    847 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 823:	8b 45 fc             	mov    -0x4(%ebp),%eax
 826:	8b 00                	mov    (%eax),%eax
 828:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 82b:	77 12                	ja     83f <free+0x35>
 82d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 830:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 833:	77 24                	ja     859 <free+0x4f>
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	8b 00                	mov    (%eax),%eax
 83a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 83d:	77 1a                	ja     859 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 83f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 842:	8b 00                	mov    (%eax),%eax
 844:	89 45 fc             	mov    %eax,-0x4(%ebp)
 847:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 84d:	76 d4                	jbe    823 <free+0x19>
 84f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 852:	8b 00                	mov    (%eax),%eax
 854:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 857:	76 ca                	jbe    823 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 859:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85c:	8b 40 04             	mov    0x4(%eax),%eax
 85f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 866:	8b 45 f8             	mov    -0x8(%ebp),%eax
 869:	01 c2                	add    %eax,%edx
 86b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86e:	8b 00                	mov    (%eax),%eax
 870:	39 c2                	cmp    %eax,%edx
 872:	75 24                	jne    898 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 874:	8b 45 f8             	mov    -0x8(%ebp),%eax
 877:	8b 50 04             	mov    0x4(%eax),%edx
 87a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87d:	8b 00                	mov    (%eax),%eax
 87f:	8b 40 04             	mov    0x4(%eax),%eax
 882:	01 c2                	add    %eax,%edx
 884:	8b 45 f8             	mov    -0x8(%ebp),%eax
 887:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 88a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88d:	8b 00                	mov    (%eax),%eax
 88f:	8b 10                	mov    (%eax),%edx
 891:	8b 45 f8             	mov    -0x8(%ebp),%eax
 894:	89 10                	mov    %edx,(%eax)
 896:	eb 0a                	jmp    8a2 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 898:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89b:	8b 10                	mov    (%eax),%edx
 89d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a0:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a5:	8b 40 04             	mov    0x4(%eax),%eax
 8a8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b2:	01 d0                	add    %edx,%eax
 8b4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8b7:	75 20                	jne    8d9 <free+0xcf>
    p->s.size += bp->s.size;
 8b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bc:	8b 50 04             	mov    0x4(%eax),%edx
 8bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c2:	8b 40 04             	mov    0x4(%eax),%eax
 8c5:	01 c2                	add    %eax,%edx
 8c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d0:	8b 10                	mov    (%eax),%edx
 8d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d5:	89 10                	mov    %edx,(%eax)
 8d7:	eb 08                	jmp    8e1 <free+0xd7>
  } else
    p->s.ptr = bp;
 8d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8dc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8df:	89 10                	mov    %edx,(%eax)
  freep = p;
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e4:	a3 48 0d 00 00       	mov    %eax,0xd48
}
 8e9:	c9                   	leave  
 8ea:	c3                   	ret    

000008eb <morecore>:

static Header*
morecore(uint nu)
{
 8eb:	55                   	push   %ebp
 8ec:	89 e5                	mov    %esp,%ebp
 8ee:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8f1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8f8:	77 07                	ja     901 <morecore+0x16>
    nu = 4096;
 8fa:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 901:	8b 45 08             	mov    0x8(%ebp),%eax
 904:	c1 e0 03             	shl    $0x3,%eax
 907:	89 04 24             	mov    %eax,(%esp)
 90a:	e8 40 fc ff ff       	call   54f <sbrk>
 90f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 912:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 916:	75 07                	jne    91f <morecore+0x34>
    return 0;
 918:	b8 00 00 00 00       	mov    $0x0,%eax
 91d:	eb 22                	jmp    941 <morecore+0x56>
  hp = (Header*)p;
 91f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 922:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 925:	8b 45 f0             	mov    -0x10(%ebp),%eax
 928:	8b 55 08             	mov    0x8(%ebp),%edx
 92b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 92e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 931:	83 c0 08             	add    $0x8,%eax
 934:	89 04 24             	mov    %eax,(%esp)
 937:	e8 ce fe ff ff       	call   80a <free>
  return freep;
 93c:	a1 48 0d 00 00       	mov    0xd48,%eax
}
 941:	c9                   	leave  
 942:	c3                   	ret    

00000943 <malloc>:

void*
malloc(uint nbytes)
{
 943:	55                   	push   %ebp
 944:	89 e5                	mov    %esp,%ebp
 946:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 949:	8b 45 08             	mov    0x8(%ebp),%eax
 94c:	83 c0 07             	add    $0x7,%eax
 94f:	c1 e8 03             	shr    $0x3,%eax
 952:	83 c0 01             	add    $0x1,%eax
 955:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 958:	a1 48 0d 00 00       	mov    0xd48,%eax
 95d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 960:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 964:	75 23                	jne    989 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 966:	c7 45 f0 40 0d 00 00 	movl   $0xd40,-0x10(%ebp)
 96d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 970:	a3 48 0d 00 00       	mov    %eax,0xd48
 975:	a1 48 0d 00 00       	mov    0xd48,%eax
 97a:	a3 40 0d 00 00       	mov    %eax,0xd40
    base.s.size = 0;
 97f:	c7 05 44 0d 00 00 00 	movl   $0x0,0xd44
 986:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 989:	8b 45 f0             	mov    -0x10(%ebp),%eax
 98c:	8b 00                	mov    (%eax),%eax
 98e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 991:	8b 45 f4             	mov    -0xc(%ebp),%eax
 994:	8b 40 04             	mov    0x4(%eax),%eax
 997:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 99a:	72 4d                	jb     9e9 <malloc+0xa6>
      if(p->s.size == nunits)
 99c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99f:	8b 40 04             	mov    0x4(%eax),%eax
 9a2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9a5:	75 0c                	jne    9b3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9aa:	8b 10                	mov    (%eax),%edx
 9ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9af:	89 10                	mov    %edx,(%eax)
 9b1:	eb 26                	jmp    9d9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b6:	8b 40 04             	mov    0x4(%eax),%eax
 9b9:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9bc:	89 c2                	mov    %eax,%edx
 9be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c7:	8b 40 04             	mov    0x4(%eax),%eax
 9ca:	c1 e0 03             	shl    $0x3,%eax
 9cd:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9d6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9dc:	a3 48 0d 00 00       	mov    %eax,0xd48
      return (void*)(p + 1);
 9e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e4:	83 c0 08             	add    $0x8,%eax
 9e7:	eb 38                	jmp    a21 <malloc+0xde>
    }
    if(p == freep)
 9e9:	a1 48 0d 00 00       	mov    0xd48,%eax
 9ee:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9f1:	75 1b                	jne    a0e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9f6:	89 04 24             	mov    %eax,(%esp)
 9f9:	e8 ed fe ff ff       	call   8eb <morecore>
 9fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a01:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a05:	75 07                	jne    a0e <malloc+0xcb>
        return 0;
 a07:	b8 00 00 00 00       	mov    $0x0,%eax
 a0c:	eb 13                	jmp    a21 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a11:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a14:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a17:	8b 00                	mov    (%eax),%eax
 a19:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a1c:	e9 70 ff ff ff       	jmp    991 <malloc+0x4e>
}
 a21:	c9                   	leave  
 a22:	c3                   	ret    
