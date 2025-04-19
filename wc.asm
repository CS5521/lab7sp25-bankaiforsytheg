
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 00 0e 00 00       	add    $0xe00,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 00 0e 00 00       	add    $0xe00,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 c1 0a 00 00 	movl   $0xac1,(%esp)
  5b:	e8 58 02 00 00       	call   2b8 <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 00 0e 00 	movl   $0xe00,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 d8 04 00 00       	call   57d <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 c7 0a 00 	movl   $0xac7,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 29 06 00 00       	call   6f5 <printf>
    exit();
  cc:	e8 94 04 00 00       	call   565 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 d7 0a 00 	movl   $0xad7,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 f4 05 00 00       	call   6f5 <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 e4 0a 00 	movl   $0xae4,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 3a 04 00 00       	call   565 <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	e9 8f 00 00 00       	jmp    1c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
 138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 13c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	01 d0                	add    %edx,%eax
 148:	8b 00                	mov    (%eax),%eax
 14a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 151:	00 
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 4b 04 00 00       	call   5a5 <open>
 15a:	89 44 24 18          	mov    %eax,0x18(%esp)
 15e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 163:	79 2f                	jns    194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
 165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	01 d0                	add    %edx,%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 e5 0a 00 	movl   $0xae5,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 66 05 00 00       	call   6f5 <printf>
      exit();
 18f:	e8 d1 03 00 00       	call   565 <exit>
    }
    wc(fd, argv[i]);
 194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19f:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	8b 00                	mov    (%eax),%eax
 1a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ae:	89 04 24             	mov    %eax,(%esp)
 1b1:	e8 4a fe ff ff       	call   0 <wc>
    close(fd);
 1b6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 cb 03 00 00       	call   58d <close>
  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
  }
  exit();
 1d4:	e8 8c 03 00 00       	call   565 <exit>

000001d9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	57                   	push   %edi
 1dd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e1:	8b 55 10             	mov    0x10(%ebp),%edx
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	89 cb                	mov    %ecx,%ebx
 1e9:	89 df                	mov    %ebx,%edi
 1eb:	89 d1                	mov    %edx,%ecx
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
 1f0:	89 ca                	mov    %ecx,%edx
 1f2:	89 fb                	mov    %edi,%ebx
 1f4:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fa:	5b                   	pop    %ebx
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20a:	90                   	nop
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 08             	mov    %edx,0x8(%ebp)
 214:	8b 55 0c             	mov    0xc(%ebp),%edx
 217:	8d 4a 01             	lea    0x1(%edx),%ecx
 21a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	88 10                	mov    %dl,(%eax)
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strcpy+0xd>
    ;
  return os;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 231:	eb 08                	jmp    23b <strcmp+0xd>
    p++, q++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	84 c0                	test   %al,%al
 243:	74 10                	je     255 <strcmp+0x27>
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 10             	movzbl (%eax),%edx
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	38 c2                	cmp    %al,%dl
 253:	74 de                	je     233 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f b6 d0             	movzbl %al,%edx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f b6 c0             	movzbl %al,%eax
 267:	29 c2                	sub    %eax,%edx
 269:	89 d0                	mov    %edx,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strlen>:

uint
strlen(const char *s)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 273:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27a:	eb 04                	jmp    280 <strlen+0x13>
 27c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 280:	8b 55 fc             	mov    -0x4(%ebp),%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 d0                	add    %edx,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	84 c0                	test   %al,%al
 28d:	75 ed                	jne    27c <strlen+0xf>
    ;
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29a:	8b 45 10             	mov    0x10(%ebp),%eax
 29d:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 04 24             	mov    %eax,(%esp)
 2ae:	e8 26 ff ff ff       	call   1d9 <stosb>
  return dst;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <strchr>:

char*
strchr(const char *s, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c4:	eb 14                	jmp    2da <strchr+0x22>
    if(*s == c)
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
 2c9:	0f b6 00             	movzbl (%eax),%eax
 2cc:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2cf:	75 05                	jne    2d6 <strchr+0x1e>
      return (char*)s;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	eb 13                	jmp    2e9 <strchr+0x31>
  for(; *s; s++)
 2d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	0f b6 00             	movzbl (%eax),%eax
 2e0:	84 c0                	test   %al,%al
 2e2:	75 e2                	jne    2c6 <strchr+0xe>
  return 0;
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <gets>:

char*
gets(char *buf, int max)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f8:	eb 4c                	jmp    346 <gets+0x5b>
    cc = read(0, &c, 1);
 2fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 301:	00 
 302:	8d 45 ef             	lea    -0x11(%ebp),%eax
 305:	89 44 24 04          	mov    %eax,0x4(%esp)
 309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 310:	e8 68 02 00 00       	call   57d <read>
 315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 318:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 31c:	7f 02                	jg     320 <gets+0x35>
      break;
 31e:	eb 31                	jmp    351 <gets+0x66>
    buf[i++] = c;
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	8d 50 01             	lea    0x1(%eax),%edx
 326:	89 55 f4             	mov    %edx,-0xc(%ebp)
 329:	89 c2                	mov    %eax,%edx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	01 c2                	add    %eax,%edx
 330:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 334:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 336:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33a:	3c 0a                	cmp    $0xa,%al
 33c:	74 13                	je     351 <gets+0x66>
 33e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 342:	3c 0d                	cmp    $0xd,%al
 344:	74 0b                	je     351 <gets+0x66>
  for(i=0; i+1 < max; ){
 346:	8b 45 f4             	mov    -0xc(%ebp),%eax
 349:	83 c0 01             	add    $0x1,%eax
 34c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34f:	7c a9                	jl     2fa <gets+0xf>
      break;
  }
  buf[i] = '\0';
 351:	8b 55 f4             	mov    -0xc(%ebp),%edx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	01 d0                	add    %edx,%eax
 359:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <stat>:

int
stat(const char *n, struct stat *st)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 367:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 36e:	00 
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	89 04 24             	mov    %eax,(%esp)
 375:	e8 2b 02 00 00       	call   5a5 <open>
 37a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 37d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 381:	79 07                	jns    38a <stat+0x29>
    return -1;
 383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 388:	eb 23                	jmp    3ad <stat+0x4c>
  r = fstat(fd, st);
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 44 24 04          	mov    %eax,0x4(%esp)
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 394:	89 04 24             	mov    %eax,(%esp)
 397:	e8 21 02 00 00       	call   5bd <fstat>
 39c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a2:	89 04 24             	mov    %eax,(%esp)
 3a5:	e8 e3 01 00 00       	call   58d <close>
  return r;
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <atoi>:

int
atoi(const char *s)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bc:	eb 25                	jmp    3e3 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3be:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c1:	89 d0                	mov    %edx,%eax
 3c3:	c1 e0 02             	shl    $0x2,%eax
 3c6:	01 d0                	add    %edx,%eax
 3c8:	01 c0                	add    %eax,%eax
 3ca:	89 c1                	mov    %eax,%ecx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	8d 50 01             	lea    0x1(%eax),%edx
 3d2:	89 55 08             	mov    %edx,0x8(%ebp)
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	0f be c0             	movsbl %al,%eax
 3db:	01 c8                	add    %ecx,%eax
 3dd:	83 e8 30             	sub    $0x30,%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	3c 2f                	cmp    $0x2f,%al
 3eb:	7e 0a                	jle    3f7 <atoi+0x48>
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 39                	cmp    $0x39,%al
 3f5:	7e c7                	jle    3be <atoi+0xf>
  return n;
 3f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    

000003fc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 402:	8b 45 08             	mov    0x8(%ebp),%eax
 405:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 408:	8b 45 0c             	mov    0xc(%ebp),%eax
 40b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40e:	eb 17                	jmp    427 <memmove+0x2b>
    *dst++ = *src++;
 410:	8b 45 fc             	mov    -0x4(%ebp),%eax
 413:	8d 50 01             	lea    0x1(%eax),%edx
 416:	89 55 fc             	mov    %edx,-0x4(%ebp)
 419:	8b 55 f8             	mov    -0x8(%ebp),%edx
 41c:	8d 4a 01             	lea    0x1(%edx),%ecx
 41f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 422:	0f b6 12             	movzbl (%edx),%edx
 425:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 427:	8b 45 10             	mov    0x10(%ebp),%eax
 42a:	8d 50 ff             	lea    -0x1(%eax),%edx
 42d:	89 55 10             	mov    %edx,0x10(%ebp)
 430:	85 c0                	test   %eax,%eax
 432:	7f dc                	jg     410 <memmove+0x14>
  return vdst;
 434:	8b 45 08             	mov    0x8(%ebp),%eax
}
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <ps>:

void ps(void) {
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 445:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 44b:	89 04 24             	mov    %eax,(%esp)
 44e:	e8 b2 01 00 00       	call   605 <getpinfo>

  // Print the information TODOWHAT

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 453:	c7 44 24 04 f9 0a 00 	movl   $0xaf9,0x4(%esp)
 45a:	00 
 45b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 462:	e8 8e 02 00 00       	call   6f5 <printf>

  int i = 0;
 467:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 46e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 475:	e9 ce 00 00 00       	jmp    548 <ps+0x10f>
    if (pstat[i].inuse) {
 47a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 47d:	89 d0                	mov    %edx,%eax
 47f:	c1 e0 03             	shl    $0x3,%eax
 482:	01 d0                	add    %edx,%eax
 484:	c1 e0 02             	shl    $0x2,%eax
 487:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 48a:	01 d8                	add    %ebx,%eax
 48c:	2d 04 09 00 00       	sub    $0x904,%eax
 491:	8b 00                	mov    (%eax),%eax
 493:	85 c0                	test   %eax,%eax
 495:	0f 84 a9 00 00 00    	je     544 <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 49b:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 4a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4a4:	89 d0                	mov    %edx,%eax
 4a6:	c1 e0 03             	shl    $0x3,%eax
 4a9:	01 d0                	add    %edx,%eax
 4ab:	c1 e0 02             	shl    $0x2,%eax
 4ae:	83 c0 10             	add    $0x10,%eax
 4b1:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 4b4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4b7:	89 d0                	mov    %edx,%eax
 4b9:	c1 e0 03             	shl    $0x3,%eax
 4bc:	01 d0                	add    %edx,%eax
 4be:	c1 e0 02             	shl    $0x2,%eax
 4c1:	8d 75 e8             	lea    -0x18(%ebp),%esi
 4c4:	01 f0                	add    %esi,%eax
 4c6:	2d e4 08 00 00       	sub    $0x8e4,%eax
 4cb:	0f b6 00             	movzbl (%eax),%eax
 4ce:	0f be f0             	movsbl %al,%esi
 4d1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4d4:	89 d0                	mov    %edx,%eax
 4d6:	c1 e0 03             	shl    $0x3,%eax
 4d9:	01 d0                	add    %edx,%eax
 4db:	c1 e0 02             	shl    $0x2,%eax
 4de:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4e1:	01 c8                	add    %ecx,%eax
 4e3:	2d f8 08 00 00       	sub    $0x8f8,%eax
 4e8:	8b 18                	mov    (%eax),%ebx
 4ea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4ed:	89 d0                	mov    %edx,%eax
 4ef:	c1 e0 03             	shl    $0x3,%eax
 4f2:	01 d0                	add    %edx,%eax
 4f4:	c1 e0 02             	shl    $0x2,%eax
 4f7:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4fa:	01 c8                	add    %ecx,%eax
 4fc:	2d 00 09 00 00       	sub    $0x900,%eax
 501:	8b 08                	mov    (%eax),%ecx
 503:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 506:	89 d0                	mov    %edx,%eax
 508:	c1 e0 03             	shl    $0x3,%eax
 50b:	01 d0                	add    %edx,%eax
 50d:	c1 e0 02             	shl    $0x2,%eax
 510:	8d 55 e8             	lea    -0x18(%ebp),%edx
 513:	01 d0                	add    %edx,%eax
 515:	2d fc 08 00 00       	sub    $0x8fc,%eax
 51a:	8b 00                	mov    (%eax),%eax
 51c:	89 7c 24 18          	mov    %edi,0x18(%esp)
 520:	89 74 24 14          	mov    %esi,0x14(%esp)
 524:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 528:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 52c:	89 44 24 08          	mov    %eax,0x8(%esp)
 530:	c7 44 24 04 12 0b 00 	movl   $0xb12,0x4(%esp)
 537:	00 
 538:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 53f:	e8 b1 01 00 00       	call   6f5 <printf>
  for (i = 0; i < NPROC; ++i) {
 544:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 548:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 54c:	0f 8e 28 ff ff ff    	jle    47a <ps+0x41>
    }
  }
 552:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 558:	5b                   	pop    %ebx
 559:	5e                   	pop    %esi
 55a:	5f                   	pop    %edi
 55b:	5d                   	pop    %ebp
 55c:	c3                   	ret    

0000055d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 55d:	b8 01 00 00 00       	mov    $0x1,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <exit>:
SYSCALL(exit)
 565:	b8 02 00 00 00       	mov    $0x2,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <wait>:
SYSCALL(wait)
 56d:	b8 03 00 00 00       	mov    $0x3,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <pipe>:
SYSCALL(pipe)
 575:	b8 04 00 00 00       	mov    $0x4,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <read>:
SYSCALL(read)
 57d:	b8 05 00 00 00       	mov    $0x5,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <write>:
SYSCALL(write)
 585:	b8 10 00 00 00       	mov    $0x10,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <close>:
SYSCALL(close)
 58d:	b8 15 00 00 00       	mov    $0x15,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <kill>:
SYSCALL(kill)
 595:	b8 06 00 00 00       	mov    $0x6,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <exec>:
SYSCALL(exec)
 59d:	b8 07 00 00 00       	mov    $0x7,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <open>:
SYSCALL(open)
 5a5:	b8 0f 00 00 00       	mov    $0xf,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <mknod>:
SYSCALL(mknod)
 5ad:	b8 11 00 00 00       	mov    $0x11,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <unlink>:
SYSCALL(unlink)
 5b5:	b8 12 00 00 00       	mov    $0x12,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <fstat>:
SYSCALL(fstat)
 5bd:	b8 08 00 00 00       	mov    $0x8,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <link>:
SYSCALL(link)
 5c5:	b8 13 00 00 00       	mov    $0x13,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <mkdir>:
SYSCALL(mkdir)
 5cd:	b8 14 00 00 00       	mov    $0x14,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <chdir>:
SYSCALL(chdir)
 5d5:	b8 09 00 00 00       	mov    $0x9,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <dup>:
SYSCALL(dup)
 5dd:	b8 0a 00 00 00       	mov    $0xa,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <getpid>:
SYSCALL(getpid)
 5e5:	b8 0b 00 00 00       	mov    $0xb,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <sbrk>:
SYSCALL(sbrk)
 5ed:	b8 0c 00 00 00       	mov    $0xc,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <sleep>:
SYSCALL(sleep)
 5f5:	b8 0d 00 00 00       	mov    $0xd,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <uptime>:
SYSCALL(uptime)
 5fd:	b8 0e 00 00 00       	mov    $0xe,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <getpinfo>:
SYSCALL(getpinfo)
 605:	b8 16 00 00 00       	mov    $0x16,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <settickets>:
 60d:	b8 17 00 00 00       	mov    $0x17,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 615:	55                   	push   %ebp
 616:	89 e5                	mov    %esp,%ebp
 618:	83 ec 18             	sub    $0x18,%esp
 61b:	8b 45 0c             	mov    0xc(%ebp),%eax
 61e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 621:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 628:	00 
 629:	8d 45 f4             	lea    -0xc(%ebp),%eax
 62c:	89 44 24 04          	mov    %eax,0x4(%esp)
 630:	8b 45 08             	mov    0x8(%ebp),%eax
 633:	89 04 24             	mov    %eax,(%esp)
 636:	e8 4a ff ff ff       	call   585 <write>
}
 63b:	c9                   	leave  
 63c:	c3                   	ret    

0000063d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 63d:	55                   	push   %ebp
 63e:	89 e5                	mov    %esp,%ebp
 640:	56                   	push   %esi
 641:	53                   	push   %ebx
 642:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 645:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 64c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 650:	74 17                	je     669 <printint+0x2c>
 652:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 656:	79 11                	jns    669 <printint+0x2c>
    neg = 1;
 658:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 65f:	8b 45 0c             	mov    0xc(%ebp),%eax
 662:	f7 d8                	neg    %eax
 664:	89 45 ec             	mov    %eax,-0x14(%ebp)
 667:	eb 06                	jmp    66f <printint+0x32>
  } else {
    x = xx;
 669:	8b 45 0c             	mov    0xc(%ebp),%eax
 66c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 66f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 676:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 679:	8d 41 01             	lea    0x1(%ecx),%eax
 67c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 67f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 682:	8b 45 ec             	mov    -0x14(%ebp),%eax
 685:	ba 00 00 00 00       	mov    $0x0,%edx
 68a:	f7 f3                	div    %ebx
 68c:	89 d0                	mov    %edx,%eax
 68e:	0f b6 80 c0 0d 00 00 	movzbl 0xdc0(%eax),%eax
 695:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 699:	8b 75 10             	mov    0x10(%ebp),%esi
 69c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 69f:	ba 00 00 00 00       	mov    $0x0,%edx
 6a4:	f7 f6                	div    %esi
 6a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6ad:	75 c7                	jne    676 <printint+0x39>
  if(neg)
 6af:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6b3:	74 10                	je     6c5 <printint+0x88>
    buf[i++] = '-';
 6b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b8:	8d 50 01             	lea    0x1(%eax),%edx
 6bb:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6be:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6c3:	eb 1f                	jmp    6e4 <printint+0xa7>
 6c5:	eb 1d                	jmp    6e4 <printint+0xa7>
    putc(fd, buf[i]);
 6c7:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6cd:	01 d0                	add    %edx,%eax
 6cf:	0f b6 00             	movzbl (%eax),%eax
 6d2:	0f be c0             	movsbl %al,%eax
 6d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	89 04 24             	mov    %eax,(%esp)
 6df:	e8 31 ff ff ff       	call   615 <putc>
  while(--i >= 0)
 6e4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6e8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6ec:	79 d9                	jns    6c7 <printint+0x8a>
}
 6ee:	83 c4 30             	add    $0x30,%esp
 6f1:	5b                   	pop    %ebx
 6f2:	5e                   	pop    %esi
 6f3:	5d                   	pop    %ebp
 6f4:	c3                   	ret    

000006f5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6f5:	55                   	push   %ebp
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 702:	8d 45 0c             	lea    0xc(%ebp),%eax
 705:	83 c0 04             	add    $0x4,%eax
 708:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 70b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 712:	e9 7c 01 00 00       	jmp    893 <printf+0x19e>
    c = fmt[i] & 0xff;
 717:	8b 55 0c             	mov    0xc(%ebp),%edx
 71a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71d:	01 d0                	add    %edx,%eax
 71f:	0f b6 00             	movzbl (%eax),%eax
 722:	0f be c0             	movsbl %al,%eax
 725:	25 ff 00 00 00       	and    $0xff,%eax
 72a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 72d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 731:	75 2c                	jne    75f <printf+0x6a>
      if(c == '%'){
 733:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 737:	75 0c                	jne    745 <printf+0x50>
        state = '%';
 739:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 740:	e9 4a 01 00 00       	jmp    88f <printf+0x19a>
      } else {
        putc(fd, c);
 745:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 748:	0f be c0             	movsbl %al,%eax
 74b:	89 44 24 04          	mov    %eax,0x4(%esp)
 74f:	8b 45 08             	mov    0x8(%ebp),%eax
 752:	89 04 24             	mov    %eax,(%esp)
 755:	e8 bb fe ff ff       	call   615 <putc>
 75a:	e9 30 01 00 00       	jmp    88f <printf+0x19a>
      }
    } else if(state == '%'){
 75f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 763:	0f 85 26 01 00 00    	jne    88f <printf+0x19a>
      if(c == 'd'){
 769:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 76d:	75 2d                	jne    79c <printf+0xa7>
        printint(fd, *ap, 10, 1);
 76f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 772:	8b 00                	mov    (%eax),%eax
 774:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 77b:	00 
 77c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 783:	00 
 784:	89 44 24 04          	mov    %eax,0x4(%esp)
 788:	8b 45 08             	mov    0x8(%ebp),%eax
 78b:	89 04 24             	mov    %eax,(%esp)
 78e:	e8 aa fe ff ff       	call   63d <printint>
        ap++;
 793:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 797:	e9 ec 00 00 00       	jmp    888 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 79c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7a0:	74 06                	je     7a8 <printf+0xb3>
 7a2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7a6:	75 2d                	jne    7d5 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ab:	8b 00                	mov    (%eax),%eax
 7ad:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7b4:	00 
 7b5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7bc:	00 
 7bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c1:	8b 45 08             	mov    0x8(%ebp),%eax
 7c4:	89 04 24             	mov    %eax,(%esp)
 7c7:	e8 71 fe ff ff       	call   63d <printint>
        ap++;
 7cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7d0:	e9 b3 00 00 00       	jmp    888 <printf+0x193>
      } else if(c == 's'){
 7d5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7d9:	75 45                	jne    820 <printf+0x12b>
        s = (char*)*ap;
 7db:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7de:	8b 00                	mov    (%eax),%eax
 7e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7e3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7eb:	75 09                	jne    7f6 <printf+0x101>
          s = "(null)";
 7ed:	c7 45 f4 22 0b 00 00 	movl   $0xb22,-0xc(%ebp)
        while(*s != 0){
 7f4:	eb 1e                	jmp    814 <printf+0x11f>
 7f6:	eb 1c                	jmp    814 <printf+0x11f>
          putc(fd, *s);
 7f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fb:	0f b6 00             	movzbl (%eax),%eax
 7fe:	0f be c0             	movsbl %al,%eax
 801:	89 44 24 04          	mov    %eax,0x4(%esp)
 805:	8b 45 08             	mov    0x8(%ebp),%eax
 808:	89 04 24             	mov    %eax,(%esp)
 80b:	e8 05 fe ff ff       	call   615 <putc>
          s++;
 810:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 814:	8b 45 f4             	mov    -0xc(%ebp),%eax
 817:	0f b6 00             	movzbl (%eax),%eax
 81a:	84 c0                	test   %al,%al
 81c:	75 da                	jne    7f8 <printf+0x103>
 81e:	eb 68                	jmp    888 <printf+0x193>
        }
      } else if(c == 'c'){
 820:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 824:	75 1d                	jne    843 <printf+0x14e>
        putc(fd, *ap);
 826:	8b 45 e8             	mov    -0x18(%ebp),%eax
 829:	8b 00                	mov    (%eax),%eax
 82b:	0f be c0             	movsbl %al,%eax
 82e:	89 44 24 04          	mov    %eax,0x4(%esp)
 832:	8b 45 08             	mov    0x8(%ebp),%eax
 835:	89 04 24             	mov    %eax,(%esp)
 838:	e8 d8 fd ff ff       	call   615 <putc>
        ap++;
 83d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 841:	eb 45                	jmp    888 <printf+0x193>
      } else if(c == '%'){
 843:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 847:	75 17                	jne    860 <printf+0x16b>
        putc(fd, c);
 849:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 84c:	0f be c0             	movsbl %al,%eax
 84f:	89 44 24 04          	mov    %eax,0x4(%esp)
 853:	8b 45 08             	mov    0x8(%ebp),%eax
 856:	89 04 24             	mov    %eax,(%esp)
 859:	e8 b7 fd ff ff       	call   615 <putc>
 85e:	eb 28                	jmp    888 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 860:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 867:	00 
 868:	8b 45 08             	mov    0x8(%ebp),%eax
 86b:	89 04 24             	mov    %eax,(%esp)
 86e:	e8 a2 fd ff ff       	call   615 <putc>
        putc(fd, c);
 873:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 876:	0f be c0             	movsbl %al,%eax
 879:	89 44 24 04          	mov    %eax,0x4(%esp)
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
 880:	89 04 24             	mov    %eax,(%esp)
 883:	e8 8d fd ff ff       	call   615 <putc>
      }
      state = 0;
 888:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 88f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 893:	8b 55 0c             	mov    0xc(%ebp),%edx
 896:	8b 45 f0             	mov    -0x10(%ebp),%eax
 899:	01 d0                	add    %edx,%eax
 89b:	0f b6 00             	movzbl (%eax),%eax
 89e:	84 c0                	test   %al,%al
 8a0:	0f 85 71 fe ff ff    	jne    717 <printf+0x22>
    }
  }
}
 8a6:	c9                   	leave  
 8a7:	c3                   	ret    

000008a8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a8:	55                   	push   %ebp
 8a9:	89 e5                	mov    %esp,%ebp
 8ab:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8ae:	8b 45 08             	mov    0x8(%ebp),%eax
 8b1:	83 e8 08             	sub    $0x8,%eax
 8b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b7:	a1 e8 0d 00 00       	mov    0xde8,%eax
 8bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8bf:	eb 24                	jmp    8e5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c4:	8b 00                	mov    (%eax),%eax
 8c6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8c9:	77 12                	ja     8dd <free+0x35>
 8cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8d1:	77 24                	ja     8f7 <free+0x4f>
 8d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d6:	8b 00                	mov    (%eax),%eax
 8d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8db:	77 1a                	ja     8f7 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e0:	8b 00                	mov    (%eax),%eax
 8e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8eb:	76 d4                	jbe    8c1 <free+0x19>
 8ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f0:	8b 00                	mov    (%eax),%eax
 8f2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8f5:	76 ca                	jbe    8c1 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fa:	8b 40 04             	mov    0x4(%eax),%eax
 8fd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 904:	8b 45 f8             	mov    -0x8(%ebp),%eax
 907:	01 c2                	add    %eax,%edx
 909:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90c:	8b 00                	mov    (%eax),%eax
 90e:	39 c2                	cmp    %eax,%edx
 910:	75 24                	jne    936 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 912:	8b 45 f8             	mov    -0x8(%ebp),%eax
 915:	8b 50 04             	mov    0x4(%eax),%edx
 918:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91b:	8b 00                	mov    (%eax),%eax
 91d:	8b 40 04             	mov    0x4(%eax),%eax
 920:	01 c2                	add    %eax,%edx
 922:	8b 45 f8             	mov    -0x8(%ebp),%eax
 925:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 928:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92b:	8b 00                	mov    (%eax),%eax
 92d:	8b 10                	mov    (%eax),%edx
 92f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 932:	89 10                	mov    %edx,(%eax)
 934:	eb 0a                	jmp    940 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 936:	8b 45 fc             	mov    -0x4(%ebp),%eax
 939:	8b 10                	mov    (%eax),%edx
 93b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 93e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 940:	8b 45 fc             	mov    -0x4(%ebp),%eax
 943:	8b 40 04             	mov    0x4(%eax),%eax
 946:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 94d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 950:	01 d0                	add    %edx,%eax
 952:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 955:	75 20                	jne    977 <free+0xcf>
    p->s.size += bp->s.size;
 957:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95a:	8b 50 04             	mov    0x4(%eax),%edx
 95d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 960:	8b 40 04             	mov    0x4(%eax),%eax
 963:	01 c2                	add    %eax,%edx
 965:	8b 45 fc             	mov    -0x4(%ebp),%eax
 968:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 96b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96e:	8b 10                	mov    (%eax),%edx
 970:	8b 45 fc             	mov    -0x4(%ebp),%eax
 973:	89 10                	mov    %edx,(%eax)
 975:	eb 08                	jmp    97f <free+0xd7>
  } else
    p->s.ptr = bp;
 977:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 97d:	89 10                	mov    %edx,(%eax)
  freep = p;
 97f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 982:	a3 e8 0d 00 00       	mov    %eax,0xde8
}
 987:	c9                   	leave  
 988:	c3                   	ret    

00000989 <morecore>:

static Header*
morecore(uint nu)
{
 989:	55                   	push   %ebp
 98a:	89 e5                	mov    %esp,%ebp
 98c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 98f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 996:	77 07                	ja     99f <morecore+0x16>
    nu = 4096;
 998:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 99f:	8b 45 08             	mov    0x8(%ebp),%eax
 9a2:	c1 e0 03             	shl    $0x3,%eax
 9a5:	89 04 24             	mov    %eax,(%esp)
 9a8:	e8 40 fc ff ff       	call   5ed <sbrk>
 9ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9b0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9b4:	75 07                	jne    9bd <morecore+0x34>
    return 0;
 9b6:	b8 00 00 00 00       	mov    $0x0,%eax
 9bb:	eb 22                	jmp    9df <morecore+0x56>
  hp = (Header*)p;
 9bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c6:	8b 55 08             	mov    0x8(%ebp),%edx
 9c9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9cf:	83 c0 08             	add    $0x8,%eax
 9d2:	89 04 24             	mov    %eax,(%esp)
 9d5:	e8 ce fe ff ff       	call   8a8 <free>
  return freep;
 9da:	a1 e8 0d 00 00       	mov    0xde8,%eax
}
 9df:	c9                   	leave  
 9e0:	c3                   	ret    

000009e1 <malloc>:

void*
malloc(uint nbytes)
{
 9e1:	55                   	push   %ebp
 9e2:	89 e5                	mov    %esp,%ebp
 9e4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e7:	8b 45 08             	mov    0x8(%ebp),%eax
 9ea:	83 c0 07             	add    $0x7,%eax
 9ed:	c1 e8 03             	shr    $0x3,%eax
 9f0:	83 c0 01             	add    $0x1,%eax
 9f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9f6:	a1 e8 0d 00 00       	mov    0xde8,%eax
 9fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9fe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a02:	75 23                	jne    a27 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a04:	c7 45 f0 e0 0d 00 00 	movl   $0xde0,-0x10(%ebp)
 a0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0e:	a3 e8 0d 00 00       	mov    %eax,0xde8
 a13:	a1 e8 0d 00 00       	mov    0xde8,%eax
 a18:	a3 e0 0d 00 00       	mov    %eax,0xde0
    base.s.size = 0;
 a1d:	c7 05 e4 0d 00 00 00 	movl   $0x0,0xde4
 a24:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a27:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2a:	8b 00                	mov    (%eax),%eax
 a2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a32:	8b 40 04             	mov    0x4(%eax),%eax
 a35:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a38:	72 4d                	jb     a87 <malloc+0xa6>
      if(p->s.size == nunits)
 a3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3d:	8b 40 04             	mov    0x4(%eax),%eax
 a40:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a43:	75 0c                	jne    a51 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a48:	8b 10                	mov    (%eax),%edx
 a4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a4d:	89 10                	mov    %edx,(%eax)
 a4f:	eb 26                	jmp    a77 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a54:	8b 40 04             	mov    0x4(%eax),%eax
 a57:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a5a:	89 c2                	mov    %eax,%edx
 a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a65:	8b 40 04             	mov    0x4(%eax),%eax
 a68:	c1 e0 03             	shl    $0x3,%eax
 a6b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a71:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a74:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a77:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a7a:	a3 e8 0d 00 00       	mov    %eax,0xde8
      return (void*)(p + 1);
 a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a82:	83 c0 08             	add    $0x8,%eax
 a85:	eb 38                	jmp    abf <malloc+0xde>
    }
    if(p == freep)
 a87:	a1 e8 0d 00 00       	mov    0xde8,%eax
 a8c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a8f:	75 1b                	jne    aac <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a91:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a94:	89 04 24             	mov    %eax,(%esp)
 a97:	e8 ed fe ff ff       	call   989 <morecore>
 a9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 aa3:	75 07                	jne    aac <malloc+0xcb>
        return 0;
 aa5:	b8 00 00 00 00       	mov    $0x0,%eax
 aaa:	eb 13                	jmp    abf <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aaf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ab2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab5:	8b 00                	mov    (%eax),%eax
 ab7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 aba:	e9 70 ff ff ff       	jmp    a2f <malloc+0x4e>
}
 abf:	c9                   	leave  
 ac0:	c3                   	ret    
