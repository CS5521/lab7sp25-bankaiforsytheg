
_tickettest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  printf(1, "parent pid: %d; tickets should be 10\n", getpid());
   9:	e8 36 05 00 00       	call   544 <getpid>
   e:	89 44 24 08          	mov    %eax,0x8(%esp)
  12:	c7 44 24 04 20 0a 00 	movl   $0xa20,0x4(%esp)
  19:	00 
  1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  21:	e8 2e 06 00 00       	call   654 <printf>
  ps();
  26:	e8 6d 03 00 00       	call   398 <ps>
  int pid = fork();
  2b:	e8 8c 04 00 00       	call   4bc <fork>
  30:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  34:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  39:	75 27                	jne    62 <main+0x62>
  {
     printf(1, "first child pid: %d; tickets should be 10\n", getpid());
  3b:	e8 04 05 00 00       	call   544 <getpid>
  40:	89 44 24 08          	mov    %eax,0x8(%esp)
  44:	c7 44 24 04 48 0a 00 	movl   $0xa48,0x4(%esp)
  4b:	00 
  4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  53:	e8 fc 05 00 00       	call   654 <printf>
     ps();
  58:	e8 3b 03 00 00       	call   398 <ps>
     exit();
  5d:	e8 62 04 00 00       	call   4c4 <exit>
  }
  wait();
  62:	e8 65 04 00 00       	call   4cc <wait>
  printf(1, "parent pid: %d; setting tickets to 20\n", getpid());
  67:	e8 d8 04 00 00       	call   544 <getpid>
  6c:	89 44 24 08          	mov    %eax,0x8(%esp)
  70:	c7 44 24 04 74 0a 00 	movl   $0xa74,0x4(%esp)
  77:	00 
  78:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7f:	e8 d0 05 00 00       	call   654 <printf>
  settickets(20);
  84:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  8b:	e8 dc 04 00 00       	call   56c <settickets>
  ps();
  90:	e8 03 03 00 00       	call   398 <ps>
  pid = fork();
  95:	e8 22 04 00 00       	call   4bc <fork>
  9a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  9e:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  a3:	0f 85 85 00 00 00    	jne    12e <main+0x12e>
  {
     printf(1, "second child pid: %d; tickets should be 20\n", getpid());
  a9:	e8 96 04 00 00       	call   544 <getpid>
  ae:	89 44 24 08          	mov    %eax,0x8(%esp)
  b2:	c7 44 24 04 9c 0a 00 	movl   $0xa9c,0x4(%esp)
  b9:	00 
  ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c1:	e8 8e 05 00 00       	call   654 <printf>
     ps();
  c6:	e8 cd 02 00 00       	call   398 <ps>
     settickets(30);
  cb:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
  d2:	e8 95 04 00 00       	call   56c <settickets>
     printf(1, "second child pid: %d; tickets should now be 30\n");
  d7:	c7 44 24 04 c8 0a 00 	movl   $0xac8,0x4(%esp)
  de:	00 
  df:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e6:	e8 69 05 00 00       	call   654 <printf>
     ps();
  eb:	e8 a8 02 00 00       	call   398 <ps>
     pid = fork();
  f0:	e8 c7 03 00 00       	call   4bc <fork>
  f5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     if (pid == 0)
  f9:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  fe:	75 24                	jne    124 <main+0x124>
     {
        printf(1, "child of second child pid: %d; tickets should be 30\n", getpid());
 100:	e8 3f 04 00 00       	call   544 <getpid>
 105:	89 44 24 08          	mov    %eax,0x8(%esp)
 109:	c7 44 24 04 f8 0a 00 	movl   $0xaf8,0x4(%esp)
 110:	00 
 111:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 118:	e8 37 05 00 00       	call   654 <printf>
        ps();
 11d:	e8 76 02 00 00       	call   398 <ps>
 122:	eb 0a                	jmp    12e <main+0x12e>
     } else
     {
        wait();
 124:	e8 a3 03 00 00       	call   4cc <wait>
        exit();
 129:	e8 96 03 00 00       	call   4c4 <exit>
     }
  }
  wait();
 12e:	e8 99 03 00 00       	call   4cc <wait>
  exit();
 133:	e8 8c 03 00 00       	call   4c4 <exit>

00000138 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	57                   	push   %edi
 13c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 13d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 140:	8b 55 10             	mov    0x10(%ebp),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	89 cb                	mov    %ecx,%ebx
 148:	89 df                	mov    %ebx,%edi
 14a:	89 d1                	mov    %edx,%ecx
 14c:	fc                   	cld    
 14d:	f3 aa                	rep stos %al,%es:(%edi)
 14f:	89 ca                	mov    %ecx,%edx
 151:	89 fb                	mov    %edi,%ebx
 153:	89 5d 08             	mov    %ebx,0x8(%ebp)
 156:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 159:	5b                   	pop    %ebx
 15a:	5f                   	pop    %edi
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    

0000015d <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 15d:	55                   	push   %ebp
 15e:	89 e5                	mov    %esp,%ebp
 160:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 169:	90                   	nop
 16a:	8b 45 08             	mov    0x8(%ebp),%eax
 16d:	8d 50 01             	lea    0x1(%eax),%edx
 170:	89 55 08             	mov    %edx,0x8(%ebp)
 173:	8b 55 0c             	mov    0xc(%ebp),%edx
 176:	8d 4a 01             	lea    0x1(%edx),%ecx
 179:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17c:	0f b6 12             	movzbl (%edx),%edx
 17f:	88 10                	mov    %dl,(%eax)
 181:	0f b6 00             	movzbl (%eax),%eax
 184:	84 c0                	test   %al,%al
 186:	75 e2                	jne    16a <strcpy+0xd>
    ;
  return os;
 188:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18b:	c9                   	leave  
 18c:	c3                   	ret    

0000018d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 18d:	55                   	push   %ebp
 18e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 190:	eb 08                	jmp    19a <strcmp+0xd>
    p++, q++;
 192:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 196:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	0f b6 00             	movzbl (%eax),%eax
 1a0:	84 c0                	test   %al,%al
 1a2:	74 10                	je     1b4 <strcmp+0x27>
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	0f b6 10             	movzbl (%eax),%edx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	0f b6 00             	movzbl (%eax),%eax
 1b0:	38 c2                	cmp    %al,%dl
 1b2:	74 de                	je     192 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	0f b6 00             	movzbl (%eax),%eax
 1ba:	0f b6 d0             	movzbl %al,%edx
 1bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c0:	0f b6 00             	movzbl (%eax),%eax
 1c3:	0f b6 c0             	movzbl %al,%eax
 1c6:	29 c2                	sub    %eax,%edx
 1c8:	89 d0                	mov    %edx,%eax
}
 1ca:	5d                   	pop    %ebp
 1cb:	c3                   	ret    

000001cc <strlen>:

uint
strlen(const char *s)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1d9:	eb 04                	jmp    1df <strlen+0x13>
 1db:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1df:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	01 d0                	add    %edx,%eax
 1e7:	0f b6 00             	movzbl (%eax),%eax
 1ea:	84 c0                	test   %al,%al
 1ec:	75 ed                	jne    1db <strlen+0xf>
    ;
  return n;
 1ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f1:	c9                   	leave  
 1f2:	c3                   	ret    

000001f3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1f9:	8b 45 10             	mov    0x10(%ebp),%eax
 1fc:	89 44 24 08          	mov    %eax,0x8(%esp)
 200:	8b 45 0c             	mov    0xc(%ebp),%eax
 203:	89 44 24 04          	mov    %eax,0x4(%esp)
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	89 04 24             	mov    %eax,(%esp)
 20d:	e8 26 ff ff ff       	call   138 <stosb>
  return dst;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <strchr>:

char*
strchr(const char *s, char c)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 04             	sub    $0x4,%esp
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 223:	eb 14                	jmp    239 <strchr+0x22>
    if(*s == c)
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 22e:	75 05                	jne    235 <strchr+0x1e>
      return (char*)s;
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	eb 13                	jmp    248 <strchr+0x31>
  for(; *s; s++)
 235:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	0f b6 00             	movzbl (%eax),%eax
 23f:	84 c0                	test   %al,%al
 241:	75 e2                	jne    225 <strchr+0xe>
  return 0;
 243:	b8 00 00 00 00       	mov    $0x0,%eax
}
 248:	c9                   	leave  
 249:	c3                   	ret    

0000024a <gets>:

char*
gets(char *buf, int max)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 250:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 257:	eb 4c                	jmp    2a5 <gets+0x5b>
    cc = read(0, &c, 1);
 259:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 260:	00 
 261:	8d 45 ef             	lea    -0x11(%ebp),%eax
 264:	89 44 24 04          	mov    %eax,0x4(%esp)
 268:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 26f:	e8 68 02 00 00       	call   4dc <read>
 274:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 277:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27b:	7f 02                	jg     27f <gets+0x35>
      break;
 27d:	eb 31                	jmp    2b0 <gets+0x66>
    buf[i++] = c;
 27f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 282:	8d 50 01             	lea    0x1(%eax),%edx
 285:	89 55 f4             	mov    %edx,-0xc(%ebp)
 288:	89 c2                	mov    %eax,%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 c2                	add    %eax,%edx
 28f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 293:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 295:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 299:	3c 0a                	cmp    $0xa,%al
 29b:	74 13                	je     2b0 <gets+0x66>
 29d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a1:	3c 0d                	cmp    $0xd,%al
 2a3:	74 0b                	je     2b0 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a8:	83 c0 01             	add    $0x1,%eax
 2ab:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2ae:	7c a9                	jl     259 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	01 d0                	add    %edx,%eax
 2b8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2be:	c9                   	leave  
 2bf:	c3                   	ret    

000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2cd:	00 
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	89 04 24             	mov    %eax,(%esp)
 2d4:	e8 2b 02 00 00       	call   504 <open>
 2d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e0:	79 07                	jns    2e9 <stat+0x29>
    return -1;
 2e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e7:	eb 23                	jmp    30c <stat+0x4c>
  r = fstat(fd, st);
 2e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f3:	89 04 24             	mov    %eax,(%esp)
 2f6:	e8 21 02 00 00       	call   51c <fstat>
 2fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 e3 01 00 00       	call   4ec <close>
  return r;
 309:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30c:	c9                   	leave  
 30d:	c3                   	ret    

0000030e <atoi>:

int
atoi(const char *s)
{
 30e:	55                   	push   %ebp
 30f:	89 e5                	mov    %esp,%ebp
 311:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 314:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31b:	eb 25                	jmp    342 <atoi+0x34>
    n = n*10 + *s++ - '0';
 31d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 320:	89 d0                	mov    %edx,%eax
 322:	c1 e0 02             	shl    $0x2,%eax
 325:	01 d0                	add    %edx,%eax
 327:	01 c0                	add    %eax,%eax
 329:	89 c1                	mov    %eax,%ecx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	8d 50 01             	lea    0x1(%eax),%edx
 331:	89 55 08             	mov    %edx,0x8(%ebp)
 334:	0f b6 00             	movzbl (%eax),%eax
 337:	0f be c0             	movsbl %al,%eax
 33a:	01 c8                	add    %ecx,%eax
 33c:	83 e8 30             	sub    $0x30,%eax
 33f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 342:	8b 45 08             	mov    0x8(%ebp),%eax
 345:	0f b6 00             	movzbl (%eax),%eax
 348:	3c 2f                	cmp    $0x2f,%al
 34a:	7e 0a                	jle    356 <atoi+0x48>
 34c:	8b 45 08             	mov    0x8(%ebp),%eax
 34f:	0f b6 00             	movzbl (%eax),%eax
 352:	3c 39                	cmp    $0x39,%al
 354:	7e c7                	jle    31d <atoi+0xf>
  return n;
 356:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 359:	c9                   	leave  
 35a:	c3                   	ret    

0000035b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 361:	8b 45 08             	mov    0x8(%ebp),%eax
 364:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 367:	8b 45 0c             	mov    0xc(%ebp),%eax
 36a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 36d:	eb 17                	jmp    386 <memmove+0x2b>
    *dst++ = *src++;
 36f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 372:	8d 50 01             	lea    0x1(%eax),%edx
 375:	89 55 fc             	mov    %edx,-0x4(%ebp)
 378:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37b:	8d 4a 01             	lea    0x1(%edx),%ecx
 37e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 381:	0f b6 12             	movzbl (%edx),%edx
 384:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 386:	8b 45 10             	mov    0x10(%ebp),%eax
 389:	8d 50 ff             	lea    -0x1(%eax),%edx
 38c:	89 55 10             	mov    %edx,0x10(%ebp)
 38f:	85 c0                	test   %eax,%eax
 391:	7f dc                	jg     36f <memmove+0x14>
  return vdst;
 393:	8b 45 08             	mov    0x8(%ebp),%eax
}
 396:	c9                   	leave  
 397:	c3                   	ret    

00000398 <ps>:

void ps(void) {
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	57                   	push   %edi
 39c:	56                   	push   %esi
 39d:	53                   	push   %ebx
 39e:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 3a4:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 3aa:	89 04 24             	mov    %eax,(%esp)
 3ad:	e8 b2 01 00 00       	call   564 <getpinfo>

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 3b2:	c7 44 24 04 2d 0b 00 	movl   $0xb2d,0x4(%esp)
 3b9:	00 
 3ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3c1:	e8 8e 02 00 00       	call   654 <printf>

  int i = 0;
 3c6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 3cd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3d4:	e9 ce 00 00 00       	jmp    4a7 <ps+0x10f>
    if (pstat[i].inuse) {
 3d9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3dc:	89 d0                	mov    %edx,%eax
 3de:	c1 e0 03             	shl    $0x3,%eax
 3e1:	01 d0                	add    %edx,%eax
 3e3:	c1 e0 02             	shl    $0x2,%eax
 3e6:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3e9:	01 d8                	add    %ebx,%eax
 3eb:	2d 04 09 00 00       	sub    $0x904,%eax
 3f0:	8b 00                	mov    (%eax),%eax
 3f2:	85 c0                	test   %eax,%eax
 3f4:	0f 84 a9 00 00 00    	je     4a3 <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 3fa:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 400:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 403:	89 d0                	mov    %edx,%eax
 405:	c1 e0 03             	shl    $0x3,%eax
 408:	01 d0                	add    %edx,%eax
 40a:	c1 e0 02             	shl    $0x2,%eax
 40d:	83 c0 10             	add    $0x10,%eax
 410:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 413:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 416:	89 d0                	mov    %edx,%eax
 418:	c1 e0 03             	shl    $0x3,%eax
 41b:	01 d0                	add    %edx,%eax
 41d:	c1 e0 02             	shl    $0x2,%eax
 420:	8d 75 e8             	lea    -0x18(%ebp),%esi
 423:	01 f0                	add    %esi,%eax
 425:	2d e4 08 00 00       	sub    $0x8e4,%eax
 42a:	0f b6 00             	movzbl (%eax),%eax
 42d:	0f be f0             	movsbl %al,%esi
 430:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 433:	89 d0                	mov    %edx,%eax
 435:	c1 e0 03             	shl    $0x3,%eax
 438:	01 d0                	add    %edx,%eax
 43a:	c1 e0 02             	shl    $0x2,%eax
 43d:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 440:	01 c8                	add    %ecx,%eax
 442:	2d f8 08 00 00       	sub    $0x8f8,%eax
 447:	8b 18                	mov    (%eax),%ebx
 449:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 44c:	89 d0                	mov    %edx,%eax
 44e:	c1 e0 03             	shl    $0x3,%eax
 451:	01 d0                	add    %edx,%eax
 453:	c1 e0 02             	shl    $0x2,%eax
 456:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 459:	01 c8                	add    %ecx,%eax
 45b:	2d 00 09 00 00       	sub    $0x900,%eax
 460:	8b 08                	mov    (%eax),%ecx
 462:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 465:	89 d0                	mov    %edx,%eax
 467:	c1 e0 03             	shl    $0x3,%eax
 46a:	01 d0                	add    %edx,%eax
 46c:	c1 e0 02             	shl    $0x2,%eax
 46f:	8d 55 e8             	lea    -0x18(%ebp),%edx
 472:	01 d0                	add    %edx,%eax
 474:	2d fc 08 00 00       	sub    $0x8fc,%eax
 479:	8b 00                	mov    (%eax),%eax
 47b:	89 7c 24 18          	mov    %edi,0x18(%esp)
 47f:	89 74 24 14          	mov    %esi,0x14(%esp)
 483:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 487:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 48b:	89 44 24 08          	mov    %eax,0x8(%esp)
 48f:	c7 44 24 04 46 0b 00 	movl   $0xb46,0x4(%esp)
 496:	00 
 497:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 49e:	e8 b1 01 00 00       	call   654 <printf>
  for (i = 0; i < NPROC; ++i) {
 4a3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 4a7:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 4ab:	0f 8e 28 ff ff ff    	jle    3d9 <ps+0x41>
    }
  }
 4b1:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 4b7:	5b                   	pop    %ebx
 4b8:	5e                   	pop    %esi
 4b9:	5f                   	pop    %edi
 4ba:	5d                   	pop    %ebp
 4bb:	c3                   	ret    

000004bc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4bc:	b8 01 00 00 00       	mov    $0x1,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <exit>:
SYSCALL(exit)
 4c4:	b8 02 00 00 00       	mov    $0x2,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <wait>:
SYSCALL(wait)
 4cc:	b8 03 00 00 00       	mov    $0x3,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <pipe>:
SYSCALL(pipe)
 4d4:	b8 04 00 00 00       	mov    $0x4,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <read>:
SYSCALL(read)
 4dc:	b8 05 00 00 00       	mov    $0x5,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <write>:
SYSCALL(write)
 4e4:	b8 10 00 00 00       	mov    $0x10,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <close>:
SYSCALL(close)
 4ec:	b8 15 00 00 00       	mov    $0x15,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <kill>:
SYSCALL(kill)
 4f4:	b8 06 00 00 00       	mov    $0x6,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <exec>:
SYSCALL(exec)
 4fc:	b8 07 00 00 00       	mov    $0x7,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <open>:
SYSCALL(open)
 504:	b8 0f 00 00 00       	mov    $0xf,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <mknod>:
SYSCALL(mknod)
 50c:	b8 11 00 00 00       	mov    $0x11,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <unlink>:
SYSCALL(unlink)
 514:	b8 12 00 00 00       	mov    $0x12,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <fstat>:
SYSCALL(fstat)
 51c:	b8 08 00 00 00       	mov    $0x8,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <link>:
SYSCALL(link)
 524:	b8 13 00 00 00       	mov    $0x13,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <mkdir>:
SYSCALL(mkdir)
 52c:	b8 14 00 00 00       	mov    $0x14,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <chdir>:
SYSCALL(chdir)
 534:	b8 09 00 00 00       	mov    $0x9,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <dup>:
SYSCALL(dup)
 53c:	b8 0a 00 00 00       	mov    $0xa,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <getpid>:
SYSCALL(getpid)
 544:	b8 0b 00 00 00       	mov    $0xb,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <sbrk>:
SYSCALL(sbrk)
 54c:	b8 0c 00 00 00       	mov    $0xc,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <sleep>:
SYSCALL(sleep)
 554:	b8 0d 00 00 00       	mov    $0xd,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <uptime>:
SYSCALL(uptime)
 55c:	b8 0e 00 00 00       	mov    $0xe,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <getpinfo>:
SYSCALL(getpinfo)
 564:	b8 16 00 00 00       	mov    $0x16,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <settickets>:
 56c:	b8 17 00 00 00       	mov    $0x17,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	83 ec 18             	sub    $0x18,%esp
 57a:	8b 45 0c             	mov    0xc(%ebp),%eax
 57d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 580:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 587:	00 
 588:	8d 45 f4             	lea    -0xc(%ebp),%eax
 58b:	89 44 24 04          	mov    %eax,0x4(%esp)
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	89 04 24             	mov    %eax,(%esp)
 595:	e8 4a ff ff ff       	call   4e4 <write>
}
 59a:	c9                   	leave  
 59b:	c3                   	ret    

0000059c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 59c:	55                   	push   %ebp
 59d:	89 e5                	mov    %esp,%ebp
 59f:	56                   	push   %esi
 5a0:	53                   	push   %ebx
 5a1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5a4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5ab:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5af:	74 17                	je     5c8 <printint+0x2c>
 5b1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5b5:	79 11                	jns    5c8 <printint+0x2c>
    neg = 1;
 5b7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5be:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c1:	f7 d8                	neg    %eax
 5c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5c6:	eb 06                	jmp    5ce <printint+0x32>
  } else {
    x = xx;
 5c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 5cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5d5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5d8:	8d 41 01             	lea    0x1(%ecx),%eax
 5db:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5de:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5e4:	ba 00 00 00 00       	mov    $0x0,%edx
 5e9:	f7 f3                	div    %ebx
 5eb:	89 d0                	mov    %edx,%eax
 5ed:	0f b6 80 d4 0d 00 00 	movzbl 0xdd4(%eax),%eax
 5f4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5f8:	8b 75 10             	mov    0x10(%ebp),%esi
 5fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5fe:	ba 00 00 00 00       	mov    $0x0,%edx
 603:	f7 f6                	div    %esi
 605:	89 45 ec             	mov    %eax,-0x14(%ebp)
 608:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 60c:	75 c7                	jne    5d5 <printint+0x39>
  if(neg)
 60e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 612:	74 10                	je     624 <printint+0x88>
    buf[i++] = '-';
 614:	8b 45 f4             	mov    -0xc(%ebp),%eax
 617:	8d 50 01             	lea    0x1(%eax),%edx
 61a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 61d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 622:	eb 1f                	jmp    643 <printint+0xa7>
 624:	eb 1d                	jmp    643 <printint+0xa7>
    putc(fd, buf[i]);
 626:	8d 55 dc             	lea    -0x24(%ebp),%edx
 629:	8b 45 f4             	mov    -0xc(%ebp),%eax
 62c:	01 d0                	add    %edx,%eax
 62e:	0f b6 00             	movzbl (%eax),%eax
 631:	0f be c0             	movsbl %al,%eax
 634:	89 44 24 04          	mov    %eax,0x4(%esp)
 638:	8b 45 08             	mov    0x8(%ebp),%eax
 63b:	89 04 24             	mov    %eax,(%esp)
 63e:	e8 31 ff ff ff       	call   574 <putc>
  while(--i >= 0)
 643:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 647:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 64b:	79 d9                	jns    626 <printint+0x8a>
}
 64d:	83 c4 30             	add    $0x30,%esp
 650:	5b                   	pop    %ebx
 651:	5e                   	pop    %esi
 652:	5d                   	pop    %ebp
 653:	c3                   	ret    

00000654 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 65a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 661:	8d 45 0c             	lea    0xc(%ebp),%eax
 664:	83 c0 04             	add    $0x4,%eax
 667:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 66a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 671:	e9 7c 01 00 00       	jmp    7f2 <printf+0x19e>
    c = fmt[i] & 0xff;
 676:	8b 55 0c             	mov    0xc(%ebp),%edx
 679:	8b 45 f0             	mov    -0x10(%ebp),%eax
 67c:	01 d0                	add    %edx,%eax
 67e:	0f b6 00             	movzbl (%eax),%eax
 681:	0f be c0             	movsbl %al,%eax
 684:	25 ff 00 00 00       	and    $0xff,%eax
 689:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 68c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 690:	75 2c                	jne    6be <printf+0x6a>
      if(c == '%'){
 692:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 696:	75 0c                	jne    6a4 <printf+0x50>
        state = '%';
 698:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 69f:	e9 4a 01 00 00       	jmp    7ee <printf+0x19a>
      } else {
        putc(fd, c);
 6a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a7:	0f be c0             	movsbl %al,%eax
 6aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	89 04 24             	mov    %eax,(%esp)
 6b4:	e8 bb fe ff ff       	call   574 <putc>
 6b9:	e9 30 01 00 00       	jmp    7ee <printf+0x19a>
      }
    } else if(state == '%'){
 6be:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6c2:	0f 85 26 01 00 00    	jne    7ee <printf+0x19a>
      if(c == 'd'){
 6c8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6cc:	75 2d                	jne    6fb <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d1:	8b 00                	mov    (%eax),%eax
 6d3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6da:	00 
 6db:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6e2:	00 
 6e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	89 04 24             	mov    %eax,(%esp)
 6ed:	e8 aa fe ff ff       	call   59c <printint>
        ap++;
 6f2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6f6:	e9 ec 00 00 00       	jmp    7e7 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6fb:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6ff:	74 06                	je     707 <printf+0xb3>
 701:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 705:	75 2d                	jne    734 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 707:	8b 45 e8             	mov    -0x18(%ebp),%eax
 70a:	8b 00                	mov    (%eax),%eax
 70c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 713:	00 
 714:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 71b:	00 
 71c:	89 44 24 04          	mov    %eax,0x4(%esp)
 720:	8b 45 08             	mov    0x8(%ebp),%eax
 723:	89 04 24             	mov    %eax,(%esp)
 726:	e8 71 fe ff ff       	call   59c <printint>
        ap++;
 72b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 72f:	e9 b3 00 00 00       	jmp    7e7 <printf+0x193>
      } else if(c == 's'){
 734:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 738:	75 45                	jne    77f <printf+0x12b>
        s = (char*)*ap;
 73a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 73d:	8b 00                	mov    (%eax),%eax
 73f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 742:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 746:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 74a:	75 09                	jne    755 <printf+0x101>
          s = "(null)";
 74c:	c7 45 f4 56 0b 00 00 	movl   $0xb56,-0xc(%ebp)
        while(*s != 0){
 753:	eb 1e                	jmp    773 <printf+0x11f>
 755:	eb 1c                	jmp    773 <printf+0x11f>
          putc(fd, *s);
 757:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75a:	0f b6 00             	movzbl (%eax),%eax
 75d:	0f be c0             	movsbl %al,%eax
 760:	89 44 24 04          	mov    %eax,0x4(%esp)
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	89 04 24             	mov    %eax,(%esp)
 76a:	e8 05 fe ff ff       	call   574 <putc>
          s++;
 76f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 773:	8b 45 f4             	mov    -0xc(%ebp),%eax
 776:	0f b6 00             	movzbl (%eax),%eax
 779:	84 c0                	test   %al,%al
 77b:	75 da                	jne    757 <printf+0x103>
 77d:	eb 68                	jmp    7e7 <printf+0x193>
        }
      } else if(c == 'c'){
 77f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 783:	75 1d                	jne    7a2 <printf+0x14e>
        putc(fd, *ap);
 785:	8b 45 e8             	mov    -0x18(%ebp),%eax
 788:	8b 00                	mov    (%eax),%eax
 78a:	0f be c0             	movsbl %al,%eax
 78d:	89 44 24 04          	mov    %eax,0x4(%esp)
 791:	8b 45 08             	mov    0x8(%ebp),%eax
 794:	89 04 24             	mov    %eax,(%esp)
 797:	e8 d8 fd ff ff       	call   574 <putc>
        ap++;
 79c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7a0:	eb 45                	jmp    7e7 <printf+0x193>
      } else if(c == '%'){
 7a2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7a6:	75 17                	jne    7bf <printf+0x16b>
        putc(fd, c);
 7a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ab:	0f be c0             	movsbl %al,%eax
 7ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b2:	8b 45 08             	mov    0x8(%ebp),%eax
 7b5:	89 04 24             	mov    %eax,(%esp)
 7b8:	e8 b7 fd ff ff       	call   574 <putc>
 7bd:	eb 28                	jmp    7e7 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7bf:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7c6:	00 
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	89 04 24             	mov    %eax,(%esp)
 7cd:	e8 a2 fd ff ff       	call   574 <putc>
        putc(fd, c);
 7d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d5:	0f be c0             	movsbl %al,%eax
 7d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 7dc:	8b 45 08             	mov    0x8(%ebp),%eax
 7df:	89 04 24             	mov    %eax,(%esp)
 7e2:	e8 8d fd ff ff       	call   574 <putc>
      }
      state = 0;
 7e7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7ee:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7f2:	8b 55 0c             	mov    0xc(%ebp),%edx
 7f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f8:	01 d0                	add    %edx,%eax
 7fa:	0f b6 00             	movzbl (%eax),%eax
 7fd:	84 c0                	test   %al,%al
 7ff:	0f 85 71 fe ff ff    	jne    676 <printf+0x22>
    }
  }
}
 805:	c9                   	leave  
 806:	c3                   	ret    

00000807 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 807:	55                   	push   %ebp
 808:	89 e5                	mov    %esp,%ebp
 80a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 80d:	8b 45 08             	mov    0x8(%ebp),%eax
 810:	83 e8 08             	sub    $0x8,%eax
 813:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 816:	a1 f0 0d 00 00       	mov    0xdf0,%eax
 81b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 81e:	eb 24                	jmp    844 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 820:	8b 45 fc             	mov    -0x4(%ebp),%eax
 823:	8b 00                	mov    (%eax),%eax
 825:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 828:	77 12                	ja     83c <free+0x35>
 82a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 830:	77 24                	ja     856 <free+0x4f>
 832:	8b 45 fc             	mov    -0x4(%ebp),%eax
 835:	8b 00                	mov    (%eax),%eax
 837:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 83a:	77 1a                	ja     856 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 83c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83f:	8b 00                	mov    (%eax),%eax
 841:	89 45 fc             	mov    %eax,-0x4(%ebp)
 844:	8b 45 f8             	mov    -0x8(%ebp),%eax
 847:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 84a:	76 d4                	jbe    820 <free+0x19>
 84c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84f:	8b 00                	mov    (%eax),%eax
 851:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 854:	76 ca                	jbe    820 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 856:	8b 45 f8             	mov    -0x8(%ebp),%eax
 859:	8b 40 04             	mov    0x4(%eax),%eax
 85c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 863:	8b 45 f8             	mov    -0x8(%ebp),%eax
 866:	01 c2                	add    %eax,%edx
 868:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86b:	8b 00                	mov    (%eax),%eax
 86d:	39 c2                	cmp    %eax,%edx
 86f:	75 24                	jne    895 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 871:	8b 45 f8             	mov    -0x8(%ebp),%eax
 874:	8b 50 04             	mov    0x4(%eax),%edx
 877:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87a:	8b 00                	mov    (%eax),%eax
 87c:	8b 40 04             	mov    0x4(%eax),%eax
 87f:	01 c2                	add    %eax,%edx
 881:	8b 45 f8             	mov    -0x8(%ebp),%eax
 884:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 887:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88a:	8b 00                	mov    (%eax),%eax
 88c:	8b 10                	mov    (%eax),%edx
 88e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 891:	89 10                	mov    %edx,(%eax)
 893:	eb 0a                	jmp    89f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 895:	8b 45 fc             	mov    -0x4(%ebp),%eax
 898:	8b 10                	mov    (%eax),%edx
 89a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 89d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 89f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a2:	8b 40 04             	mov    0x4(%eax),%eax
 8a5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8af:	01 d0                	add    %edx,%eax
 8b1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8b4:	75 20                	jne    8d6 <free+0xcf>
    p->s.size += bp->s.size;
 8b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b9:	8b 50 04             	mov    0x4(%eax),%edx
 8bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bf:	8b 40 04             	mov    0x4(%eax),%eax
 8c2:	01 c2                	add    %eax,%edx
 8c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cd:	8b 10                	mov    (%eax),%edx
 8cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d2:	89 10                	mov    %edx,(%eax)
 8d4:	eb 08                	jmp    8de <free+0xd7>
  } else
    p->s.ptr = bp;
 8d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8dc:	89 10                	mov    %edx,(%eax)
  freep = p;
 8de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e1:	a3 f0 0d 00 00       	mov    %eax,0xdf0
}
 8e6:	c9                   	leave  
 8e7:	c3                   	ret    

000008e8 <morecore>:

static Header*
morecore(uint nu)
{
 8e8:	55                   	push   %ebp
 8e9:	89 e5                	mov    %esp,%ebp
 8eb:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8ee:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8f5:	77 07                	ja     8fe <morecore+0x16>
    nu = 4096;
 8f7:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8fe:	8b 45 08             	mov    0x8(%ebp),%eax
 901:	c1 e0 03             	shl    $0x3,%eax
 904:	89 04 24             	mov    %eax,(%esp)
 907:	e8 40 fc ff ff       	call   54c <sbrk>
 90c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 90f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 913:	75 07                	jne    91c <morecore+0x34>
    return 0;
 915:	b8 00 00 00 00       	mov    $0x0,%eax
 91a:	eb 22                	jmp    93e <morecore+0x56>
  hp = (Header*)p;
 91c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 922:	8b 45 f0             	mov    -0x10(%ebp),%eax
 925:	8b 55 08             	mov    0x8(%ebp),%edx
 928:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 92b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92e:	83 c0 08             	add    $0x8,%eax
 931:	89 04 24             	mov    %eax,(%esp)
 934:	e8 ce fe ff ff       	call   807 <free>
  return freep;
 939:	a1 f0 0d 00 00       	mov    0xdf0,%eax
}
 93e:	c9                   	leave  
 93f:	c3                   	ret    

00000940 <malloc>:

void*
malloc(uint nbytes)
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 946:	8b 45 08             	mov    0x8(%ebp),%eax
 949:	83 c0 07             	add    $0x7,%eax
 94c:	c1 e8 03             	shr    $0x3,%eax
 94f:	83 c0 01             	add    $0x1,%eax
 952:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 955:	a1 f0 0d 00 00       	mov    0xdf0,%eax
 95a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 95d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 961:	75 23                	jne    986 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 963:	c7 45 f0 e8 0d 00 00 	movl   $0xde8,-0x10(%ebp)
 96a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 96d:	a3 f0 0d 00 00       	mov    %eax,0xdf0
 972:	a1 f0 0d 00 00       	mov    0xdf0,%eax
 977:	a3 e8 0d 00 00       	mov    %eax,0xde8
    base.s.size = 0;
 97c:	c7 05 ec 0d 00 00 00 	movl   $0x0,0xdec
 983:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 986:	8b 45 f0             	mov    -0x10(%ebp),%eax
 989:	8b 00                	mov    (%eax),%eax
 98b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 98e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 991:	8b 40 04             	mov    0x4(%eax),%eax
 994:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 997:	72 4d                	jb     9e6 <malloc+0xa6>
      if(p->s.size == nunits)
 999:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99c:	8b 40 04             	mov    0x4(%eax),%eax
 99f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9a2:	75 0c                	jne    9b0 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a7:	8b 10                	mov    (%eax),%edx
 9a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ac:	89 10                	mov    %edx,(%eax)
 9ae:	eb 26                	jmp    9d6 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b3:	8b 40 04             	mov    0x4(%eax),%eax
 9b6:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9b9:	89 c2                	mov    %eax,%edx
 9bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9be:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c4:	8b 40 04             	mov    0x4(%eax),%eax
 9c7:	c1 e0 03             	shl    $0x3,%eax
 9ca:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d0:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9d3:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d9:	a3 f0 0d 00 00       	mov    %eax,0xdf0
      return (void*)(p + 1);
 9de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e1:	83 c0 08             	add    $0x8,%eax
 9e4:	eb 38                	jmp    a1e <malloc+0xde>
    }
    if(p == freep)
 9e6:	a1 f0 0d 00 00       	mov    0xdf0,%eax
 9eb:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9ee:	75 1b                	jne    a0b <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9f3:	89 04 24             	mov    %eax,(%esp)
 9f6:	e8 ed fe ff ff       	call   8e8 <morecore>
 9fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a02:	75 07                	jne    a0b <malloc+0xcb>
        return 0;
 a04:	b8 00 00 00 00       	mov    $0x0,%eax
 a09:	eb 13                	jmp    a1e <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a11:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a14:	8b 00                	mov    (%eax),%eax
 a16:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a19:	e9 70 ff ff ff       	jmp    98e <malloc+0x4e>
}
 a1e:	c9                   	leave  
 a1f:	c3                   	ret    
