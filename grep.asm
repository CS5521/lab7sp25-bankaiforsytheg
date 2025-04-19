
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;

  m = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
   d:	e9 c6 00 00 00       	jmp    d8 <grep+0xd8>
    m += n;
  12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  15:	01 45 f4             	add    %eax,-0xc(%ebp)
    buf[m] = '\0';
  18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1b:	05 e0 0f 00 00       	add    $0xfe0,%eax
  20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
  23:	c7 45 f0 e0 0f 00 00 	movl   $0xfe0,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  2a:	eb 51                	jmp    7d <grep+0x7d>
      *q = 0;
  2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2f:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  35:	89 44 24 04          	mov    %eax,0x4(%esp)
  39:	8b 45 08             	mov    0x8(%ebp),%eax
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 bc 01 00 00       	call   200 <match>
  44:	85 c0                	test   %eax,%eax
  46:	74 2c                	je     74 <grep+0x74>
        *q = '\n';
  48:	8b 45 e8             	mov    -0x18(%ebp),%eax
  4b:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  51:	83 c0 01             	add    $0x1,%eax
  54:	89 c2                	mov    %eax,%edx
  56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  59:	29 c2                	sub    %eax,%edx
  5b:	89 d0                	mov    %edx,%eax
  5d:	89 44 24 08          	mov    %eax,0x8(%esp)
  61:	8b 45 f0             	mov    -0x10(%ebp),%eax
  64:	89 44 24 04          	mov    %eax,0x4(%esp)
  68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6f:	e8 98 06 00 00       	call   70c <write>
      }
      p = q+1;
  74:	8b 45 e8             	mov    -0x18(%ebp),%eax
  77:	83 c0 01             	add    $0x1,%eax
  7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  7d:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  84:	00 
  85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  88:	89 04 24             	mov    %eax,(%esp)
  8b:	e8 af 03 00 00       	call   43f <strchr>
  90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  93:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  97:	75 93                	jne    2c <grep+0x2c>
    }
    if(p == buf)
  99:	81 7d f0 e0 0f 00 00 	cmpl   $0xfe0,-0x10(%ebp)
  a0:	75 07                	jne    a9 <grep+0xa9>
      m = 0;
  a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  ad:	7e 29                	jle    d8 <grep+0xd8>
      m -= p - buf;
  af:	ba e0 0f 00 00       	mov    $0xfe0,%edx
  b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  b7:	29 c2                	sub    %eax,%edx
  b9:	89 d0                	mov    %edx,%eax
  bb:	01 45 f4             	add    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c1:	89 44 24 08          	mov    %eax,0x8(%esp)
  c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  cc:	c7 04 24 e0 0f 00 00 	movl   $0xfe0,(%esp)
  d3:	e8 ab 04 00 00       	call   583 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
  d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  db:	ba ff 03 00 00       	mov    $0x3ff,%edx
  e0:	29 c2                	sub    %eax,%edx
  e2:	89 d0                	mov    %edx,%eax
  e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e7:	81 c2 e0 0f 00 00    	add    $0xfe0,%edx
  ed:	89 44 24 08          	mov    %eax,0x8(%esp)
  f1:	89 54 24 04          	mov    %edx,0x4(%esp)
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	89 04 24             	mov    %eax,(%esp)
  fb:	e8 04 06 00 00       	call   704 <read>
 100:	89 45 ec             	mov    %eax,-0x14(%ebp)
 103:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 107:	0f 8f 05 ff ff ff    	jg     12 <grep+0x12>
    }
  }
}
 10d:	c9                   	leave  
 10e:	c3                   	ret    

0000010f <main>:

int
main(int argc, char *argv[])
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	83 e4 f0             	and    $0xfffffff0,%esp
 115:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;

  if(argc <= 1){
 118:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 11c:	7f 19                	jg     137 <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
 11e:	c7 44 24 04 48 0c 00 	movl   $0xc48,0x4(%esp)
 125:	00 
 126:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 12d:	e8 4a 07 00 00       	call   87c <printf>
    exit();
 132:	e8 b5 05 00 00       	call   6ec <exit>
  }
  pattern = argv[1];
 137:	8b 45 0c             	mov    0xc(%ebp),%eax
 13a:	8b 40 04             	mov    0x4(%eax),%eax
 13d:	89 44 24 18          	mov    %eax,0x18(%esp)

  if(argc <= 2){
 141:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 145:	7f 19                	jg     160 <main+0x51>
    grep(pattern, 0);
 147:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 14e:	00 
 14f:	8b 44 24 18          	mov    0x18(%esp),%eax
 153:	89 04 24             	mov    %eax,(%esp)
 156:	e8 a5 fe ff ff       	call   0 <grep>
    exit();
 15b:	e8 8c 05 00 00       	call   6ec <exit>
  }

  for(i = 2; i < argc; i++){
 160:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
 167:	00 
 168:	e9 81 00 00 00       	jmp    1ee <main+0xdf>
    if((fd = open(argv[i], 0)) < 0){
 16d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 171:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 178:	8b 45 0c             	mov    0xc(%ebp),%eax
 17b:	01 d0                	add    %edx,%eax
 17d:	8b 00                	mov    (%eax),%eax
 17f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 186:	00 
 187:	89 04 24             	mov    %eax,(%esp)
 18a:	e8 9d 05 00 00       	call   72c <open>
 18f:	89 44 24 14          	mov    %eax,0x14(%esp)
 193:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 198:	79 2f                	jns    1c9 <main+0xba>
      printf(1, "grep: cannot open %s\n", argv[i]);
 19a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 19e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 1a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a8:	01 d0                	add    %edx,%eax
 1aa:	8b 00                	mov    (%eax),%eax
 1ac:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b0:	c7 44 24 04 68 0c 00 	movl   $0xc68,0x4(%esp)
 1b7:	00 
 1b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bf:	e8 b8 06 00 00       	call   87c <printf>
      exit();
 1c4:	e8 23 05 00 00       	call   6ec <exit>
    }
    grep(pattern, fd);
 1c9:	8b 44 24 14          	mov    0x14(%esp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8b 44 24 18          	mov    0x18(%esp),%eax
 1d5:	89 04 24             	mov    %eax,(%esp)
 1d8:	e8 23 fe ff ff       	call   0 <grep>
    close(fd);
 1dd:	8b 44 24 14          	mov    0x14(%esp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 2b 05 00 00       	call   714 <close>
  for(i = 2; i < argc; i++){
 1e9:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1ee:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1f2:	3b 45 08             	cmp    0x8(%ebp),%eax
 1f5:	0f 8c 72 ff ff ff    	jl     16d <main+0x5e>
  }
  exit();
 1fb:	e8 ec 04 00 00       	call   6ec <exit>

00000200 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	0f b6 00             	movzbl (%eax),%eax
 20c:	3c 5e                	cmp    $0x5e,%al
 20e:	75 17                	jne    227 <match+0x27>
    return matchhere(re+1, text);
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	8d 50 01             	lea    0x1(%eax),%edx
 216:	8b 45 0c             	mov    0xc(%ebp),%eax
 219:	89 44 24 04          	mov    %eax,0x4(%esp)
 21d:	89 14 24             	mov    %edx,(%esp)
 220:	e8 36 00 00 00       	call   25b <matchhere>
 225:	eb 32                	jmp    259 <match+0x59>
  do{  // must look at empty string
    if(matchhere(re, text))
 227:	8b 45 0c             	mov    0xc(%ebp),%eax
 22a:	89 44 24 04          	mov    %eax,0x4(%esp)
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	89 04 24             	mov    %eax,(%esp)
 234:	e8 22 00 00 00       	call   25b <matchhere>
 239:	85 c0                	test   %eax,%eax
 23b:	74 07                	je     244 <match+0x44>
      return 1;
 23d:	b8 01 00 00 00       	mov    $0x1,%eax
 242:	eb 15                	jmp    259 <match+0x59>
  }while(*text++ != '\0');
 244:	8b 45 0c             	mov    0xc(%ebp),%eax
 247:	8d 50 01             	lea    0x1(%eax),%edx
 24a:	89 55 0c             	mov    %edx,0xc(%ebp)
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 d3                	jne    227 <match+0x27>
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	0f b6 00             	movzbl (%eax),%eax
 267:	84 c0                	test   %al,%al
 269:	75 0a                	jne    275 <matchhere+0x1a>
    return 1;
 26b:	b8 01 00 00 00       	mov    $0x1,%eax
 270:	e9 9b 00 00 00       	jmp    310 <matchhere+0xb5>
  if(re[1] == '*')
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	83 c0 01             	add    $0x1,%eax
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	3c 2a                	cmp    $0x2a,%al
 280:	75 24                	jne    2a6 <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 48 02             	lea    0x2(%eax),%ecx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	8b 55 0c             	mov    0xc(%ebp),%edx
 294:	89 54 24 08          	mov    %edx,0x8(%esp)
 298:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 29c:	89 04 24             	mov    %eax,(%esp)
 29f:	e8 6e 00 00 00       	call   312 <matchstar>
 2a4:	eb 6a                	jmp    310 <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 00             	movzbl (%eax),%eax
 2ac:	3c 24                	cmp    $0x24,%al
 2ae:	75 1d                	jne    2cd <matchhere+0x72>
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	83 c0 01             	add    $0x1,%eax
 2b6:	0f b6 00             	movzbl (%eax),%eax
 2b9:	84 c0                	test   %al,%al
 2bb:	75 10                	jne    2cd <matchhere+0x72>
    return *text == '\0';
 2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	84 c0                	test   %al,%al
 2c5:	0f 94 c0             	sete   %al
 2c8:	0f b6 c0             	movzbl %al,%eax
 2cb:	eb 43                	jmp    310 <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d0:	0f b6 00             	movzbl (%eax),%eax
 2d3:	84 c0                	test   %al,%al
 2d5:	74 34                	je     30b <matchhere+0xb0>
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	0f b6 00             	movzbl (%eax),%eax
 2dd:	3c 2e                	cmp    $0x2e,%al
 2df:	74 10                	je     2f1 <matchhere+0x96>
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	0f b6 10             	movzbl (%eax),%edx
 2e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	38 c2                	cmp    %al,%dl
 2ef:	75 1a                	jne    30b <matchhere+0xb0>
    return matchhere(re+1, text+1);
 2f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	8b 45 08             	mov    0x8(%ebp),%eax
 2fa:	83 c0 01             	add    $0x1,%eax
 2fd:	89 54 24 04          	mov    %edx,0x4(%esp)
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 52 ff ff ff       	call   25b <matchhere>
 309:	eb 05                	jmp    310 <matchhere+0xb5>
  return 0;
 30b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 310:	c9                   	leave  
 311:	c3                   	ret    

00000312 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 312:	55                   	push   %ebp
 313:	89 e5                	mov    %esp,%ebp
 315:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 318:	8b 45 10             	mov    0x10(%ebp),%eax
 31b:	89 44 24 04          	mov    %eax,0x4(%esp)
 31f:	8b 45 0c             	mov    0xc(%ebp),%eax
 322:	89 04 24             	mov    %eax,(%esp)
 325:	e8 31 ff ff ff       	call   25b <matchhere>
 32a:	85 c0                	test   %eax,%eax
 32c:	74 07                	je     335 <matchstar+0x23>
      return 1;
 32e:	b8 01 00 00 00       	mov    $0x1,%eax
 333:	eb 29                	jmp    35e <matchstar+0x4c>
  }while(*text!='\0' && (*text++==c || c=='.'));
 335:	8b 45 10             	mov    0x10(%ebp),%eax
 338:	0f b6 00             	movzbl (%eax),%eax
 33b:	84 c0                	test   %al,%al
 33d:	74 1a                	je     359 <matchstar+0x47>
 33f:	8b 45 10             	mov    0x10(%ebp),%eax
 342:	8d 50 01             	lea    0x1(%eax),%edx
 345:	89 55 10             	mov    %edx,0x10(%ebp)
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	0f be c0             	movsbl %al,%eax
 34e:	3b 45 08             	cmp    0x8(%ebp),%eax
 351:	74 c5                	je     318 <matchstar+0x6>
 353:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 357:	74 bf                	je     318 <matchstar+0x6>
  return 0;
 359:	b8 00 00 00 00       	mov    $0x0,%eax
}
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 365:	8b 4d 08             	mov    0x8(%ebp),%ecx
 368:	8b 55 10             	mov    0x10(%ebp),%edx
 36b:	8b 45 0c             	mov    0xc(%ebp),%eax
 36e:	89 cb                	mov    %ecx,%ebx
 370:	89 df                	mov    %ebx,%edi
 372:	89 d1                	mov    %edx,%ecx
 374:	fc                   	cld    
 375:	f3 aa                	rep stos %al,%es:(%edi)
 377:	89 ca                	mov    %ecx,%edx
 379:	89 fb                	mov    %edi,%ebx
 37b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 37e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 381:	5b                   	pop    %ebx
 382:	5f                   	pop    %edi
 383:	5d                   	pop    %ebp
 384:	c3                   	ret    

00000385 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 391:	90                   	nop
 392:	8b 45 08             	mov    0x8(%ebp),%eax
 395:	8d 50 01             	lea    0x1(%eax),%edx
 398:	89 55 08             	mov    %edx,0x8(%ebp)
 39b:	8b 55 0c             	mov    0xc(%ebp),%edx
 39e:	8d 4a 01             	lea    0x1(%edx),%ecx
 3a1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3a4:	0f b6 12             	movzbl (%edx),%edx
 3a7:	88 10                	mov    %dl,(%eax)
 3a9:	0f b6 00             	movzbl (%eax),%eax
 3ac:	84 c0                	test   %al,%al
 3ae:	75 e2                	jne    392 <strcpy+0xd>
    ;
  return os;
 3b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    

000003b5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b8:	eb 08                	jmp    3c2 <strcmp+0xd>
    p++, q++;
 3ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3be:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	84 c0                	test   %al,%al
 3ca:	74 10                	je     3dc <strcmp+0x27>
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	0f b6 10             	movzbl (%eax),%edx
 3d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	38 c2                	cmp    %al,%dl
 3da:	74 de                	je     3ba <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	0f b6 00             	movzbl (%eax),%eax
 3e2:	0f b6 d0             	movzbl %al,%edx
 3e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e8:	0f b6 00             	movzbl (%eax),%eax
 3eb:	0f b6 c0             	movzbl %al,%eax
 3ee:	29 c2                	sub    %eax,%edx
 3f0:	89 d0                	mov    %edx,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    

000003f4 <strlen>:

uint
strlen(const char *s)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 401:	eb 04                	jmp    407 <strlen+0x13>
 403:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 407:	8b 55 fc             	mov    -0x4(%ebp),%edx
 40a:	8b 45 08             	mov    0x8(%ebp),%eax
 40d:	01 d0                	add    %edx,%eax
 40f:	0f b6 00             	movzbl (%eax),%eax
 412:	84 c0                	test   %al,%al
 414:	75 ed                	jne    403 <strlen+0xf>
    ;
  return n;
 416:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 419:	c9                   	leave  
 41a:	c3                   	ret    

0000041b <memset>:

void*
memset(void *dst, int c, uint n)
{
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 421:	8b 45 10             	mov    0x10(%ebp),%eax
 424:	89 44 24 08          	mov    %eax,0x8(%esp)
 428:	8b 45 0c             	mov    0xc(%ebp),%eax
 42b:	89 44 24 04          	mov    %eax,0x4(%esp)
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
 432:	89 04 24             	mov    %eax,(%esp)
 435:	e8 26 ff ff ff       	call   360 <stosb>
  return dst;
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43d:	c9                   	leave  
 43e:	c3                   	ret    

0000043f <strchr>:

char*
strchr(const char *s, char c)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 04             	sub    $0x4,%esp
 445:	8b 45 0c             	mov    0xc(%ebp),%eax
 448:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 44b:	eb 14                	jmp    461 <strchr+0x22>
    if(*s == c)
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
 450:	0f b6 00             	movzbl (%eax),%eax
 453:	3a 45 fc             	cmp    -0x4(%ebp),%al
 456:	75 05                	jne    45d <strchr+0x1e>
      return (char*)s;
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	eb 13                	jmp    470 <strchr+0x31>
  for(; *s; s++)
 45d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 461:	8b 45 08             	mov    0x8(%ebp),%eax
 464:	0f b6 00             	movzbl (%eax),%eax
 467:	84 c0                	test   %al,%al
 469:	75 e2                	jne    44d <strchr+0xe>
  return 0;
 46b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 470:	c9                   	leave  
 471:	c3                   	ret    

00000472 <gets>:

char*
gets(char *buf, int max)
{
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47f:	eb 4c                	jmp    4cd <gets+0x5b>
    cc = read(0, &c, 1);
 481:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 488:	00 
 489:	8d 45 ef             	lea    -0x11(%ebp),%eax
 48c:	89 44 24 04          	mov    %eax,0x4(%esp)
 490:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 497:	e8 68 02 00 00       	call   704 <read>
 49c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a3:	7f 02                	jg     4a7 <gets+0x35>
      break;
 4a5:	eb 31                	jmp    4d8 <gets+0x66>
    buf[i++] = c;
 4a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4aa:	8d 50 01             	lea    0x1(%eax),%edx
 4ad:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b0:	89 c2                	mov    %eax,%edx
 4b2:	8b 45 08             	mov    0x8(%ebp),%eax
 4b5:	01 c2                	add    %eax,%edx
 4b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bb:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4bd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c1:	3c 0a                	cmp    $0xa,%al
 4c3:	74 13                	je     4d8 <gets+0x66>
 4c5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c9:	3c 0d                	cmp    $0xd,%al
 4cb:	74 0b                	je     4d8 <gets+0x66>
  for(i=0; i+1 < max; ){
 4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d0:	83 c0 01             	add    $0x1,%eax
 4d3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d6:	7c a9                	jl     481 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	01 d0                	add    %edx,%eax
 4e0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e6:	c9                   	leave  
 4e7:	c3                   	ret    

000004e8 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f5:	00 
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	89 04 24             	mov    %eax,(%esp)
 4fc:	e8 2b 02 00 00       	call   72c <open>
 501:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 504:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 508:	79 07                	jns    511 <stat+0x29>
    return -1;
 50a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50f:	eb 23                	jmp    534 <stat+0x4c>
  r = fstat(fd, st);
 511:	8b 45 0c             	mov    0xc(%ebp),%eax
 514:	89 44 24 04          	mov    %eax,0x4(%esp)
 518:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51b:	89 04 24             	mov    %eax,(%esp)
 51e:	e8 21 02 00 00       	call   744 <fstat>
 523:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 526:	8b 45 f4             	mov    -0xc(%ebp),%eax
 529:	89 04 24             	mov    %eax,(%esp)
 52c:	e8 e3 01 00 00       	call   714 <close>
  return r;
 531:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 534:	c9                   	leave  
 535:	c3                   	ret    

00000536 <atoi>:

int
atoi(const char *s)
{
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 53c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 543:	eb 25                	jmp    56a <atoi+0x34>
    n = n*10 + *s++ - '0';
 545:	8b 55 fc             	mov    -0x4(%ebp),%edx
 548:	89 d0                	mov    %edx,%eax
 54a:	c1 e0 02             	shl    $0x2,%eax
 54d:	01 d0                	add    %edx,%eax
 54f:	01 c0                	add    %eax,%eax
 551:	89 c1                	mov    %eax,%ecx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	8d 50 01             	lea    0x1(%eax),%edx
 559:	89 55 08             	mov    %edx,0x8(%ebp)
 55c:	0f b6 00             	movzbl (%eax),%eax
 55f:	0f be c0             	movsbl %al,%eax
 562:	01 c8                	add    %ecx,%eax
 564:	83 e8 30             	sub    $0x30,%eax
 567:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	0f b6 00             	movzbl (%eax),%eax
 570:	3c 2f                	cmp    $0x2f,%al
 572:	7e 0a                	jle    57e <atoi+0x48>
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	0f b6 00             	movzbl (%eax),%eax
 57a:	3c 39                	cmp    $0x39,%al
 57c:	7e c7                	jle    545 <atoi+0xf>
  return n;
 57e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 581:	c9                   	leave  
 582:	c3                   	ret    

00000583 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58f:	8b 45 0c             	mov    0xc(%ebp),%eax
 592:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 595:	eb 17                	jmp    5ae <memmove+0x2b>
    *dst++ = *src++;
 597:	8b 45 fc             	mov    -0x4(%ebp),%eax
 59a:	8d 50 01             	lea    0x1(%eax),%edx
 59d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5a3:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a9:	0f b6 12             	movzbl (%edx),%edx
 5ac:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5ae:	8b 45 10             	mov    0x10(%ebp),%eax
 5b1:	8d 50 ff             	lea    -0x1(%eax),%edx
 5b4:	89 55 10             	mov    %edx,0x10(%ebp)
 5b7:	85 c0                	test   %eax,%eax
 5b9:	7f dc                	jg     597 <memmove+0x14>
  return vdst;
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5be:	c9                   	leave  
 5bf:	c3                   	ret    

000005c0 <ps>:

void ps(void) {
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 5cc:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 5d2:	89 04 24             	mov    %eax,(%esp)
 5d5:	e8 b2 01 00 00       	call   78c <getpinfo>

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 5da:	c7 44 24 04 7e 0c 00 	movl   $0xc7e,0x4(%esp)
 5e1:	00 
 5e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5e9:	e8 8e 02 00 00       	call   87c <printf>

  int i = 0;
 5ee:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 5f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5fc:	e9 ce 00 00 00       	jmp    6cf <ps+0x10f>
    if (pstat[i].inuse) {
 601:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 604:	89 d0                	mov    %edx,%eax
 606:	c1 e0 03             	shl    $0x3,%eax
 609:	01 d0                	add    %edx,%eax
 60b:	c1 e0 02             	shl    $0x2,%eax
 60e:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 611:	01 d8                	add    %ebx,%eax
 613:	2d 04 09 00 00       	sub    $0x904,%eax
 618:	8b 00                	mov    (%eax),%eax
 61a:	85 c0                	test   %eax,%eax
 61c:	0f 84 a9 00 00 00    	je     6cb <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 622:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 628:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 62b:	89 d0                	mov    %edx,%eax
 62d:	c1 e0 03             	shl    $0x3,%eax
 630:	01 d0                	add    %edx,%eax
 632:	c1 e0 02             	shl    $0x2,%eax
 635:	83 c0 10             	add    $0x10,%eax
 638:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 63b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 63e:	89 d0                	mov    %edx,%eax
 640:	c1 e0 03             	shl    $0x3,%eax
 643:	01 d0                	add    %edx,%eax
 645:	c1 e0 02             	shl    $0x2,%eax
 648:	8d 75 e8             	lea    -0x18(%ebp),%esi
 64b:	01 f0                	add    %esi,%eax
 64d:	2d e4 08 00 00       	sub    $0x8e4,%eax
 652:	0f b6 00             	movzbl (%eax),%eax
 655:	0f be f0             	movsbl %al,%esi
 658:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 65b:	89 d0                	mov    %edx,%eax
 65d:	c1 e0 03             	shl    $0x3,%eax
 660:	01 d0                	add    %edx,%eax
 662:	c1 e0 02             	shl    $0x2,%eax
 665:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 668:	01 c8                	add    %ecx,%eax
 66a:	2d f8 08 00 00       	sub    $0x8f8,%eax
 66f:	8b 18                	mov    (%eax),%ebx
 671:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 674:	89 d0                	mov    %edx,%eax
 676:	c1 e0 03             	shl    $0x3,%eax
 679:	01 d0                	add    %edx,%eax
 67b:	c1 e0 02             	shl    $0x2,%eax
 67e:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 681:	01 c8                	add    %ecx,%eax
 683:	2d 00 09 00 00       	sub    $0x900,%eax
 688:	8b 08                	mov    (%eax),%ecx
 68a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 68d:	89 d0                	mov    %edx,%eax
 68f:	c1 e0 03             	shl    $0x3,%eax
 692:	01 d0                	add    %edx,%eax
 694:	c1 e0 02             	shl    $0x2,%eax
 697:	8d 55 e8             	lea    -0x18(%ebp),%edx
 69a:	01 d0                	add    %edx,%eax
 69c:	2d fc 08 00 00       	sub    $0x8fc,%eax
 6a1:	8b 00                	mov    (%eax),%eax
 6a3:	89 7c 24 18          	mov    %edi,0x18(%esp)
 6a7:	89 74 24 14          	mov    %esi,0x14(%esp)
 6ab:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 6af:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 6b3:	89 44 24 08          	mov    %eax,0x8(%esp)
 6b7:	c7 44 24 04 97 0c 00 	movl   $0xc97,0x4(%esp)
 6be:	00 
 6bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6c6:	e8 b1 01 00 00       	call   87c <printf>
  for (i = 0; i < NPROC; ++i) {
 6cb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6cf:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 6d3:	0f 8e 28 ff ff ff    	jle    601 <ps+0x41>
    }
  }
 6d9:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 6df:	5b                   	pop    %ebx
 6e0:	5e                   	pop    %esi
 6e1:	5f                   	pop    %edi
 6e2:	5d                   	pop    %ebp
 6e3:	c3                   	ret    

000006e4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6e4:	b8 01 00 00 00       	mov    $0x1,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <exit>:
SYSCALL(exit)
 6ec:	b8 02 00 00 00       	mov    $0x2,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <wait>:
SYSCALL(wait)
 6f4:	b8 03 00 00 00       	mov    $0x3,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <pipe>:
SYSCALL(pipe)
 6fc:	b8 04 00 00 00       	mov    $0x4,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <read>:
SYSCALL(read)
 704:	b8 05 00 00 00       	mov    $0x5,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <write>:
SYSCALL(write)
 70c:	b8 10 00 00 00       	mov    $0x10,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <close>:
SYSCALL(close)
 714:	b8 15 00 00 00       	mov    $0x15,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <kill>:
SYSCALL(kill)
 71c:	b8 06 00 00 00       	mov    $0x6,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <exec>:
SYSCALL(exec)
 724:	b8 07 00 00 00       	mov    $0x7,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <open>:
SYSCALL(open)
 72c:	b8 0f 00 00 00       	mov    $0xf,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    

00000734 <mknod>:
SYSCALL(mknod)
 734:	b8 11 00 00 00       	mov    $0x11,%eax
 739:	cd 40                	int    $0x40
 73b:	c3                   	ret    

0000073c <unlink>:
SYSCALL(unlink)
 73c:	b8 12 00 00 00       	mov    $0x12,%eax
 741:	cd 40                	int    $0x40
 743:	c3                   	ret    

00000744 <fstat>:
SYSCALL(fstat)
 744:	b8 08 00 00 00       	mov    $0x8,%eax
 749:	cd 40                	int    $0x40
 74b:	c3                   	ret    

0000074c <link>:
SYSCALL(link)
 74c:	b8 13 00 00 00       	mov    $0x13,%eax
 751:	cd 40                	int    $0x40
 753:	c3                   	ret    

00000754 <mkdir>:
SYSCALL(mkdir)
 754:	b8 14 00 00 00       	mov    $0x14,%eax
 759:	cd 40                	int    $0x40
 75b:	c3                   	ret    

0000075c <chdir>:
SYSCALL(chdir)
 75c:	b8 09 00 00 00       	mov    $0x9,%eax
 761:	cd 40                	int    $0x40
 763:	c3                   	ret    

00000764 <dup>:
SYSCALL(dup)
 764:	b8 0a 00 00 00       	mov    $0xa,%eax
 769:	cd 40                	int    $0x40
 76b:	c3                   	ret    

0000076c <getpid>:
SYSCALL(getpid)
 76c:	b8 0b 00 00 00       	mov    $0xb,%eax
 771:	cd 40                	int    $0x40
 773:	c3                   	ret    

00000774 <sbrk>:
SYSCALL(sbrk)
 774:	b8 0c 00 00 00       	mov    $0xc,%eax
 779:	cd 40                	int    $0x40
 77b:	c3                   	ret    

0000077c <sleep>:
SYSCALL(sleep)
 77c:	b8 0d 00 00 00       	mov    $0xd,%eax
 781:	cd 40                	int    $0x40
 783:	c3                   	ret    

00000784 <uptime>:
SYSCALL(uptime)
 784:	b8 0e 00 00 00       	mov    $0xe,%eax
 789:	cd 40                	int    $0x40
 78b:	c3                   	ret    

0000078c <getpinfo>:
SYSCALL(getpinfo)
 78c:	b8 16 00 00 00       	mov    $0x16,%eax
 791:	cd 40                	int    $0x40
 793:	c3                   	ret    

00000794 <settickets>:
 794:	b8 17 00 00 00       	mov    $0x17,%eax
 799:	cd 40                	int    $0x40
 79b:	c3                   	ret    

0000079c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 79c:	55                   	push   %ebp
 79d:	89 e5                	mov    %esp,%ebp
 79f:	83 ec 18             	sub    $0x18,%esp
 7a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 7a5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 7a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7af:	00 
 7b0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 7b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ba:	89 04 24             	mov    %eax,(%esp)
 7bd:	e8 4a ff ff ff       	call   70c <write>
}
 7c2:	c9                   	leave  
 7c3:	c3                   	ret    

000007c4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7c4:	55                   	push   %ebp
 7c5:	89 e5                	mov    %esp,%ebp
 7c7:	56                   	push   %esi
 7c8:	53                   	push   %ebx
 7c9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7cc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 7d3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7d7:	74 17                	je     7f0 <printint+0x2c>
 7d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7dd:	79 11                	jns    7f0 <printint+0x2c>
    neg = 1;
 7df:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e9:	f7 d8                	neg    %eax
 7eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7ee:	eb 06                	jmp    7f6 <printint+0x32>
  } else {
    x = xx;
 7f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 7f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7fd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 800:	8d 41 01             	lea    0x1(%ecx),%eax
 803:	89 45 f4             	mov    %eax,-0xc(%ebp)
 806:	8b 5d 10             	mov    0x10(%ebp),%ebx
 809:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80c:	ba 00 00 00 00       	mov    $0x0,%edx
 811:	f7 f3                	div    %ebx
 813:	89 d0                	mov    %edx,%eax
 815:	0f b6 80 a4 0f 00 00 	movzbl 0xfa4(%eax),%eax
 81c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 820:	8b 75 10             	mov    0x10(%ebp),%esi
 823:	8b 45 ec             	mov    -0x14(%ebp),%eax
 826:	ba 00 00 00 00       	mov    $0x0,%edx
 82b:	f7 f6                	div    %esi
 82d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 830:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 834:	75 c7                	jne    7fd <printint+0x39>
  if(neg)
 836:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 83a:	74 10                	je     84c <printint+0x88>
    buf[i++] = '-';
 83c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83f:	8d 50 01             	lea    0x1(%eax),%edx
 842:	89 55 f4             	mov    %edx,-0xc(%ebp)
 845:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 84a:	eb 1f                	jmp    86b <printint+0xa7>
 84c:	eb 1d                	jmp    86b <printint+0xa7>
    putc(fd, buf[i]);
 84e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 851:	8b 45 f4             	mov    -0xc(%ebp),%eax
 854:	01 d0                	add    %edx,%eax
 856:	0f b6 00             	movzbl (%eax),%eax
 859:	0f be c0             	movsbl %al,%eax
 85c:	89 44 24 04          	mov    %eax,0x4(%esp)
 860:	8b 45 08             	mov    0x8(%ebp),%eax
 863:	89 04 24             	mov    %eax,(%esp)
 866:	e8 31 ff ff ff       	call   79c <putc>
  while(--i >= 0)
 86b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 86f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 873:	79 d9                	jns    84e <printint+0x8a>
}
 875:	83 c4 30             	add    $0x30,%esp
 878:	5b                   	pop    %ebx
 879:	5e                   	pop    %esi
 87a:	5d                   	pop    %ebp
 87b:	c3                   	ret    

0000087c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 87c:	55                   	push   %ebp
 87d:	89 e5                	mov    %esp,%ebp
 87f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 882:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 889:	8d 45 0c             	lea    0xc(%ebp),%eax
 88c:	83 c0 04             	add    $0x4,%eax
 88f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 892:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 899:	e9 7c 01 00 00       	jmp    a1a <printf+0x19e>
    c = fmt[i] & 0xff;
 89e:	8b 55 0c             	mov    0xc(%ebp),%edx
 8a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a4:	01 d0                	add    %edx,%eax
 8a6:	0f b6 00             	movzbl (%eax),%eax
 8a9:	0f be c0             	movsbl %al,%eax
 8ac:	25 ff 00 00 00       	and    $0xff,%eax
 8b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 8b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8b8:	75 2c                	jne    8e6 <printf+0x6a>
      if(c == '%'){
 8ba:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8be:	75 0c                	jne    8cc <printf+0x50>
        state = '%';
 8c0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 8c7:	e9 4a 01 00 00       	jmp    a16 <printf+0x19a>
      } else {
        putc(fd, c);
 8cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8cf:	0f be c0             	movsbl %al,%eax
 8d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 8d6:	8b 45 08             	mov    0x8(%ebp),%eax
 8d9:	89 04 24             	mov    %eax,(%esp)
 8dc:	e8 bb fe ff ff       	call   79c <putc>
 8e1:	e9 30 01 00 00       	jmp    a16 <printf+0x19a>
      }
    } else if(state == '%'){
 8e6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8ea:	0f 85 26 01 00 00    	jne    a16 <printf+0x19a>
      if(c == 'd'){
 8f0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8f4:	75 2d                	jne    923 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8f9:	8b 00                	mov    (%eax),%eax
 8fb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 902:	00 
 903:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 90a:	00 
 90b:	89 44 24 04          	mov    %eax,0x4(%esp)
 90f:	8b 45 08             	mov    0x8(%ebp),%eax
 912:	89 04 24             	mov    %eax,(%esp)
 915:	e8 aa fe ff ff       	call   7c4 <printint>
        ap++;
 91a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 91e:	e9 ec 00 00 00       	jmp    a0f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 923:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 927:	74 06                	je     92f <printf+0xb3>
 929:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 92d:	75 2d                	jne    95c <printf+0xe0>
        printint(fd, *ap, 16, 0);
 92f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 932:	8b 00                	mov    (%eax),%eax
 934:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 93b:	00 
 93c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 943:	00 
 944:	89 44 24 04          	mov    %eax,0x4(%esp)
 948:	8b 45 08             	mov    0x8(%ebp),%eax
 94b:	89 04 24             	mov    %eax,(%esp)
 94e:	e8 71 fe ff ff       	call   7c4 <printint>
        ap++;
 953:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 957:	e9 b3 00 00 00       	jmp    a0f <printf+0x193>
      } else if(c == 's'){
 95c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 960:	75 45                	jne    9a7 <printf+0x12b>
        s = (char*)*ap;
 962:	8b 45 e8             	mov    -0x18(%ebp),%eax
 965:	8b 00                	mov    (%eax),%eax
 967:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 96a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 96e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 972:	75 09                	jne    97d <printf+0x101>
          s = "(null)";
 974:	c7 45 f4 a7 0c 00 00 	movl   $0xca7,-0xc(%ebp)
        while(*s != 0){
 97b:	eb 1e                	jmp    99b <printf+0x11f>
 97d:	eb 1c                	jmp    99b <printf+0x11f>
          putc(fd, *s);
 97f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 982:	0f b6 00             	movzbl (%eax),%eax
 985:	0f be c0             	movsbl %al,%eax
 988:	89 44 24 04          	mov    %eax,0x4(%esp)
 98c:	8b 45 08             	mov    0x8(%ebp),%eax
 98f:	89 04 24             	mov    %eax,(%esp)
 992:	e8 05 fe ff ff       	call   79c <putc>
          s++;
 997:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 99b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99e:	0f b6 00             	movzbl (%eax),%eax
 9a1:	84 c0                	test   %al,%al
 9a3:	75 da                	jne    97f <printf+0x103>
 9a5:	eb 68                	jmp    a0f <printf+0x193>
        }
      } else if(c == 'c'){
 9a7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 9ab:	75 1d                	jne    9ca <printf+0x14e>
        putc(fd, *ap);
 9ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9b0:	8b 00                	mov    (%eax),%eax
 9b2:	0f be c0             	movsbl %al,%eax
 9b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 9b9:	8b 45 08             	mov    0x8(%ebp),%eax
 9bc:	89 04 24             	mov    %eax,(%esp)
 9bf:	e8 d8 fd ff ff       	call   79c <putc>
        ap++;
 9c4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9c8:	eb 45                	jmp    a0f <printf+0x193>
      } else if(c == '%'){
 9ca:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9ce:	75 17                	jne    9e7 <printf+0x16b>
        putc(fd, c);
 9d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9d3:	0f be c0             	movsbl %al,%eax
 9d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 9da:	8b 45 08             	mov    0x8(%ebp),%eax
 9dd:	89 04 24             	mov    %eax,(%esp)
 9e0:	e8 b7 fd ff ff       	call   79c <putc>
 9e5:	eb 28                	jmp    a0f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9e7:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9ee:	00 
 9ef:	8b 45 08             	mov    0x8(%ebp),%eax
 9f2:	89 04 24             	mov    %eax,(%esp)
 9f5:	e8 a2 fd ff ff       	call   79c <putc>
        putc(fd, c);
 9fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9fd:	0f be c0             	movsbl %al,%eax
 a00:	89 44 24 04          	mov    %eax,0x4(%esp)
 a04:	8b 45 08             	mov    0x8(%ebp),%eax
 a07:	89 04 24             	mov    %eax,(%esp)
 a0a:	e8 8d fd ff ff       	call   79c <putc>
      }
      state = 0;
 a0f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 a16:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a1a:	8b 55 0c             	mov    0xc(%ebp),%edx
 a1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a20:	01 d0                	add    %edx,%eax
 a22:	0f b6 00             	movzbl (%eax),%eax
 a25:	84 c0                	test   %al,%al
 a27:	0f 85 71 fe ff ff    	jne    89e <printf+0x22>
    }
  }
}
 a2d:	c9                   	leave  
 a2e:	c3                   	ret    

00000a2f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a2f:	55                   	push   %ebp
 a30:	89 e5                	mov    %esp,%ebp
 a32:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a35:	8b 45 08             	mov    0x8(%ebp),%eax
 a38:	83 e8 08             	sub    $0x8,%eax
 a3b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a3e:	a1 c8 0f 00 00       	mov    0xfc8,%eax
 a43:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a46:	eb 24                	jmp    a6c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a48:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a4b:	8b 00                	mov    (%eax),%eax
 a4d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a50:	77 12                	ja     a64 <free+0x35>
 a52:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a55:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a58:	77 24                	ja     a7e <free+0x4f>
 a5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a5d:	8b 00                	mov    (%eax),%eax
 a5f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a62:	77 1a                	ja     a7e <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a64:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a67:	8b 00                	mov    (%eax),%eax
 a69:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a6c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a6f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a72:	76 d4                	jbe    a48 <free+0x19>
 a74:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a77:	8b 00                	mov    (%eax),%eax
 a79:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a7c:	76 ca                	jbe    a48 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a7e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a81:	8b 40 04             	mov    0x4(%eax),%eax
 a84:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a8b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a8e:	01 c2                	add    %eax,%edx
 a90:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a93:	8b 00                	mov    (%eax),%eax
 a95:	39 c2                	cmp    %eax,%edx
 a97:	75 24                	jne    abd <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a99:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a9c:	8b 50 04             	mov    0x4(%eax),%edx
 a9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa2:	8b 00                	mov    (%eax),%eax
 aa4:	8b 40 04             	mov    0x4(%eax),%eax
 aa7:	01 c2                	add    %eax,%edx
 aa9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aac:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 aaf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab2:	8b 00                	mov    (%eax),%eax
 ab4:	8b 10                	mov    (%eax),%edx
 ab6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ab9:	89 10                	mov    %edx,(%eax)
 abb:	eb 0a                	jmp    ac7 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 abd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac0:	8b 10                	mov    (%eax),%edx
 ac2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ac5:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 ac7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aca:	8b 40 04             	mov    0x4(%eax),%eax
 acd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 ad4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad7:	01 d0                	add    %edx,%eax
 ad9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 adc:	75 20                	jne    afe <free+0xcf>
    p->s.size += bp->s.size;
 ade:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae1:	8b 50 04             	mov    0x4(%eax),%edx
 ae4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ae7:	8b 40 04             	mov    0x4(%eax),%eax
 aea:	01 c2                	add    %eax,%edx
 aec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 af2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 af5:	8b 10                	mov    (%eax),%edx
 af7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 afa:	89 10                	mov    %edx,(%eax)
 afc:	eb 08                	jmp    b06 <free+0xd7>
  } else
    p->s.ptr = bp;
 afe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b01:	8b 55 f8             	mov    -0x8(%ebp),%edx
 b04:	89 10                	mov    %edx,(%eax)
  freep = p;
 b06:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b09:	a3 c8 0f 00 00       	mov    %eax,0xfc8
}
 b0e:	c9                   	leave  
 b0f:	c3                   	ret    

00000b10 <morecore>:

static Header*
morecore(uint nu)
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
 b13:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b16:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b1d:	77 07                	ja     b26 <morecore+0x16>
    nu = 4096;
 b1f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b26:	8b 45 08             	mov    0x8(%ebp),%eax
 b29:	c1 e0 03             	shl    $0x3,%eax
 b2c:	89 04 24             	mov    %eax,(%esp)
 b2f:	e8 40 fc ff ff       	call   774 <sbrk>
 b34:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b37:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b3b:	75 07                	jne    b44 <morecore+0x34>
    return 0;
 b3d:	b8 00 00 00 00       	mov    $0x0,%eax
 b42:	eb 22                	jmp    b66 <morecore+0x56>
  hp = (Header*)p;
 b44:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b47:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b4d:	8b 55 08             	mov    0x8(%ebp),%edx
 b50:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b53:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b56:	83 c0 08             	add    $0x8,%eax
 b59:	89 04 24             	mov    %eax,(%esp)
 b5c:	e8 ce fe ff ff       	call   a2f <free>
  return freep;
 b61:	a1 c8 0f 00 00       	mov    0xfc8,%eax
}
 b66:	c9                   	leave  
 b67:	c3                   	ret    

00000b68 <malloc>:

void*
malloc(uint nbytes)
{
 b68:	55                   	push   %ebp
 b69:	89 e5                	mov    %esp,%ebp
 b6b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b6e:	8b 45 08             	mov    0x8(%ebp),%eax
 b71:	83 c0 07             	add    $0x7,%eax
 b74:	c1 e8 03             	shr    $0x3,%eax
 b77:	83 c0 01             	add    $0x1,%eax
 b7a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b7d:	a1 c8 0f 00 00       	mov    0xfc8,%eax
 b82:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b85:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b89:	75 23                	jne    bae <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b8b:	c7 45 f0 c0 0f 00 00 	movl   $0xfc0,-0x10(%ebp)
 b92:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b95:	a3 c8 0f 00 00       	mov    %eax,0xfc8
 b9a:	a1 c8 0f 00 00       	mov    0xfc8,%eax
 b9f:	a3 c0 0f 00 00       	mov    %eax,0xfc0
    base.s.size = 0;
 ba4:	c7 05 c4 0f 00 00 00 	movl   $0x0,0xfc4
 bab:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bb1:	8b 00                	mov    (%eax),%eax
 bb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 bb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb9:	8b 40 04             	mov    0x4(%eax),%eax
 bbc:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bbf:	72 4d                	jb     c0e <malloc+0xa6>
      if(p->s.size == nunits)
 bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc4:	8b 40 04             	mov    0x4(%eax),%eax
 bc7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bca:	75 0c                	jne    bd8 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 bcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bcf:	8b 10                	mov    (%eax),%edx
 bd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bd4:	89 10                	mov    %edx,(%eax)
 bd6:	eb 26                	jmp    bfe <malloc+0x96>
      else {
        p->s.size -= nunits;
 bd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bdb:	8b 40 04             	mov    0x4(%eax),%eax
 bde:	2b 45 ec             	sub    -0x14(%ebp),%eax
 be1:	89 c2                	mov    %eax,%edx
 be3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bec:	8b 40 04             	mov    0x4(%eax),%eax
 bef:	c1 e0 03             	shl    $0x3,%eax
 bf2:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf8:	8b 55 ec             	mov    -0x14(%ebp),%edx
 bfb:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 bfe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c01:	a3 c8 0f 00 00       	mov    %eax,0xfc8
      return (void*)(p + 1);
 c06:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c09:	83 c0 08             	add    $0x8,%eax
 c0c:	eb 38                	jmp    c46 <malloc+0xde>
    }
    if(p == freep)
 c0e:	a1 c8 0f 00 00       	mov    0xfc8,%eax
 c13:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c16:	75 1b                	jne    c33 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c18:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c1b:	89 04 24             	mov    %eax,(%esp)
 c1e:	e8 ed fe ff ff       	call   b10 <morecore>
 c23:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c26:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c2a:	75 07                	jne    c33 <malloc+0xcb>
        return 0;
 c2c:	b8 00 00 00 00       	mov    $0x0,%eax
 c31:	eb 13                	jmp    c46 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c33:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c36:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c39:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c3c:	8b 00                	mov    (%eax),%eax
 c3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c41:	e9 70 ff ff ff       	jmp    bb6 <malloc+0x4e>
}
 c46:	c9                   	leave  
 c47:	c3                   	ret    
