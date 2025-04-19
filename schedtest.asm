
_schedtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"
#include "pstat.h"

int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 38             	sub    $0x38,%esp
  14:	89 cb                	mov    %ecx,%ebx
    
    if (atoi(argv[1]) > 0 && argc > 2 && argc < 10) { // argv[1] is loops
  16:	8b 43 04             	mov    0x4(%ebx),%eax
  19:	83 c0 04             	add    $0x4,%eax
  1c:	8b 00                	mov    (%eax),%eax
  1e:	89 04 24             	mov    %eax,(%esp)
  21:	e8 69 04 00 00       	call   48f <atoi>
  26:	85 c0                	test   %eax,%eax
  28:	0f 8e 36 02 00 00    	jle    264 <main+0x264>
  2e:	83 3b 02             	cmpl   $0x2,(%ebx)
  31:	0f 8e 2d 02 00 00    	jle    264 <main+0x264>
  37:	83 3b 09             	cmpl   $0x9,(%ebx)
  3a:	0f 8f 24 02 00 00    	jg     264 <main+0x264>
  40:	89 e0                	mov    %esp,%eax
  42:	89 c6                	mov    %eax,%esi
        int loops = atoi(argv[1]);
  44:	8b 43 04             	mov    0x4(%ebx),%eax
  47:	83 c0 04             	add    $0x4,%eax
  4a:	8b 00                	mov    (%eax),%eax
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 3b 04 00 00       	call   48f <atoi>
  54:	89 45 e0             	mov    %eax,-0x20(%ebp)
        printf(1, "\n\nLOOPS: %d \n\n", loops);
  57:	8b 45 e0             	mov    -0x20(%ebp),%eax
  5a:	89 44 24 08          	mov    %eax,0x8(%esp)
  5e:	c7 44 24 04 a4 0b 00 	movl   $0xba4,0x4(%esp)
  65:	00 
  66:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6d:	e8 63 07 00 00       	call   7d5 <printf>
        int processes[argc - 2];
  72:	8b 03                	mov    (%ebx),%eax
  74:	83 e8 02             	sub    $0x2,%eax
  77:	8d 50 ff             	lea    -0x1(%eax),%edx
  7a:	89 55 dc             	mov    %edx,-0x24(%ebp)
  7d:	c1 e0 02             	shl    $0x2,%eax
  80:	8d 50 03             	lea    0x3(%eax),%edx
  83:	b8 10 00 00 00       	mov    $0x10,%eax
  88:	83 e8 01             	sub    $0x1,%eax
  8b:	01 d0                	add    %edx,%eax
  8d:	bf 10 00 00 00       	mov    $0x10,%edi
  92:	ba 00 00 00 00       	mov    $0x0,%edx
  97:	f7 f7                	div    %edi
  99:	6b c0 10             	imul   $0x10,%eax,%eax
  9c:	29 c4                	sub    %eax,%esp
  9e:	8d 44 24 0c          	lea    0xc(%esp),%eax
  a2:	83 c0 03             	add    $0x3,%eax
  a5:	c1 e8 02             	shr    $0x2,%eax
  a8:	c1 e0 02             	shl    $0x2,%eax
  ab:	89 45 d8             	mov    %eax,-0x28(%ebp)

        int i = 0;
  ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
        for (i = 0; i < argc - 2; ++i) {
  b5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  bc:	e9 12 01 00 00       	jmp    1d3 <main+0x1d3>
            int tickets = atoi(argv[i + 2]);
  c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c4:	83 c0 02             	add    $0x2,%eax
  c7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  ce:	8b 43 04             	mov    0x4(%ebx),%eax
  d1:	01 d0                	add    %edx,%eax
  d3:	8b 00                	mov    (%eax),%eax
  d5:	89 04 24             	mov    %eax,(%esp)
  d8:	e8 b2 03 00 00       	call   48f <atoi>
  dd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
            if (tickets < 10) {
  e0:	83 7d d4 09          	cmpl   $0x9,-0x2c(%ebp)
  e4:	7f 55                	jg     13b <main+0x13b>
                printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
  e6:	c7 44 24 04 b4 0b 00 	movl   $0xbb4,0x4(%esp)
  ed:	00 
  ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f5:	e8 db 06 00 00       	call   7d5 <printf>
                printf(1, "\tloops must be greater than 0\n");
  fa:	c7 44 24 04 f0 0b 00 	movl   $0xbf0,0x4(%esp)
 101:	00 
 102:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 109:	e8 c7 06 00 00       	call   7d5 <printf>
                printf(1, "\ttickets must be greater than or equal to 10\n");
 10e:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 115:	00 
 116:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 11d:	e8 b3 06 00 00       	call   7d5 <printf>
                printf(1, "\tup to 7 tickets can be provided\n");
 122:	c7 44 24 04 40 0c 00 	movl   $0xc40,0x4(%esp)
 129:	00 
 12a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 131:	e8 9f 06 00 00       	call   7d5 <printf>
                exit();
 136:	e8 0a 05 00 00       	call   645 <exit>
            }
            processes[i] = fork();
 13b:	e8 fd 04 00 00       	call   63d <fork>
 140:	8b 55 d8             	mov    -0x28(%ebp),%edx
 143:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 146:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
            if (processes[i] < 0) exit();
 149:	8b 45 d8             	mov    -0x28(%ebp),%eax
 14c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 14f:	8b 04 90             	mov    (%eax,%edx,4),%eax
 152:	85 c0                	test   %eax,%eax
 154:	79 05                	jns    15b <main+0x15b>
 156:	e8 ea 04 00 00       	call   645 <exit>
            else if (processes[i] == 0) {
 15b:	8b 45 d8             	mov    -0x28(%ebp),%eax
 15e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 161:	8b 04 90             	mov    (%eax,%edx,4),%eax
 164:	85 c0                	test   %eax,%eax
 166:	75 67                	jne    1cf <main+0x1cf>
                if (settickets(tickets) == -1) {
 168:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 16b:	89 04 24             	mov    %eax,(%esp)
 16e:	e8 7a 05 00 00       	call   6ed <settickets>
 173:	83 f8 ff             	cmp    $0xffffffff,%eax
 176:	75 55                	jne    1cd <main+0x1cd>
                    printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
 178:	c7 44 24 04 b4 0b 00 	movl   $0xbb4,0x4(%esp)
 17f:	00 
 180:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 187:	e8 49 06 00 00       	call   7d5 <printf>
                    printf(1, "\tloops must be greater than 0\n");
 18c:	c7 44 24 04 f0 0b 00 	movl   $0xbf0,0x4(%esp)
 193:	00 
 194:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 19b:	e8 35 06 00 00       	call   7d5 <printf>
                    printf(1, "\ttickets must be greater than or equal to 10\n");
 1a0:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 1a7:	00 
 1a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1af:	e8 21 06 00 00       	call   7d5 <printf>
                    printf(1, "\tup to 7 tickets can be provided\n");
 1b4:	c7 44 24 04 40 0c 00 	movl   $0xc40,0x4(%esp)
 1bb:	00 
 1bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c3:	e8 0d 06 00 00       	call   7d5 <printf>
                    exit();
 1c8:	e8 78 04 00 00       	call   645 <exit>
                }
                while (1);
 1cd:	eb fe                	jmp    1cd <main+0x1cd>
        for (i = 0; i < argc - 2; ++i) {
 1cf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 1d3:	8b 03                	mov    (%ebx),%eax
 1d5:	83 e8 02             	sub    $0x2,%eax
 1d8:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 1db:	0f 8f e0 fe ff ff    	jg     c1 <main+0xc1>
            }   
        }

        i = 0;
 1e1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
        for (i = 0; i < loops; ++i) {
 1e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1ef:	eb 15                	jmp    206 <main+0x206>
            ps();
 1f1:	e8 23 03 00 00       	call   519 <ps>
            sleep(3);
 1f6:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 1fd:	e8 d3 04 00 00       	call   6d5 <sleep>
        for (i = 0; i < loops; ++i) {
 202:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 206:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 209:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 20c:	7c e3                	jl     1f1 <main+0x1f1>
        }

        i = 0;
 20e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
        for (i = 0; i < argc - 2; ++i) {
 215:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 21c:	eb 15                	jmp    233 <main+0x233>
            kill(processes[i]);
 21e:	8b 45 d8             	mov    -0x28(%ebp),%eax
 221:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 224:	8b 04 90             	mov    (%eax,%edx,4),%eax
 227:	89 04 24             	mov    %eax,(%esp)
 22a:	e8 46 04 00 00       	call   675 <kill>
        for (i = 0; i < argc - 2; ++i) {
 22f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 233:	8b 03                	mov    (%ebx),%eax
 235:	83 e8 02             	sub    $0x2,%eax
 238:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 23b:	7f e1                	jg     21e <main+0x21e>
        }

        i = 0;
 23d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
        for (i = 0; i < argc - 2; ++i) {
 244:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 24b:	eb 09                	jmp    256 <main+0x256>
            wait();
 24d:	e8 fb 03 00 00       	call   64d <wait>
        for (i = 0; i < argc - 2; ++i) {
 252:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 256:	8b 03                	mov    (%ebx),%eax
 258:	83 e8 02             	sub    $0x2,%eax
 25b:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 25e:	7f ed                	jg     24d <main+0x24d>
 260:	89 f4                	mov    %esi,%esp
    if (atoi(argv[1]) > 0 && argc > 2 && argc < 10) { // argv[1] is loops
 262:	eb 50                	jmp    2b4 <main+0x2b4>
        }
    }
    else {
        printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
 264:	c7 44 24 04 b4 0b 00 	movl   $0xbb4,0x4(%esp)
 26b:	00 
 26c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 273:	e8 5d 05 00 00       	call   7d5 <printf>
        printf(1, "\tloops must be greater than 0\n");
 278:	c7 44 24 04 f0 0b 00 	movl   $0xbf0,0x4(%esp)
 27f:	00 
 280:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 287:	e8 49 05 00 00       	call   7d5 <printf>
        printf(1, "\ttickets must be greater than or equal to 10\n");
 28c:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 293:	00 
 294:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 29b:	e8 35 05 00 00       	call   7d5 <printf>
        printf(1, "\tup to 7 tickets can be provided\n");
 2a0:	c7 44 24 04 40 0c 00 	movl   $0xc40,0x4(%esp)
 2a7:	00 
 2a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2af:	e8 21 05 00 00       	call   7d5 <printf>
    }
    
    exit();
 2b4:	e8 8c 03 00 00       	call   645 <exit>

000002b9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 2b9:	55                   	push   %ebp
 2ba:	89 e5                	mov    %esp,%ebp
 2bc:	57                   	push   %edi
 2bd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 2be:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c1:	8b 55 10             	mov    0x10(%ebp),%edx
 2c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c7:	89 cb                	mov    %ecx,%ebx
 2c9:	89 df                	mov    %ebx,%edi
 2cb:	89 d1                	mov    %edx,%ecx
 2cd:	fc                   	cld    
 2ce:	f3 aa                	rep stos %al,%es:(%edi)
 2d0:	89 ca                	mov    %ecx,%edx
 2d2:	89 fb                	mov    %edi,%ebx
 2d4:	89 5d 08             	mov    %ebx,0x8(%ebp)
 2d7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 2da:	5b                   	pop    %ebx
 2db:	5f                   	pop    %edi
 2dc:	5d                   	pop    %ebp
 2dd:	c3                   	ret    

000002de <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 2ea:	90                   	nop
 2eb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ee:	8d 50 01             	lea    0x1(%eax),%edx
 2f1:	89 55 08             	mov    %edx,0x8(%ebp)
 2f4:	8b 55 0c             	mov    0xc(%ebp),%edx
 2f7:	8d 4a 01             	lea    0x1(%edx),%ecx
 2fa:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2fd:	0f b6 12             	movzbl (%edx),%edx
 300:	88 10                	mov    %dl,(%eax)
 302:	0f b6 00             	movzbl (%eax),%eax
 305:	84 c0                	test   %al,%al
 307:	75 e2                	jne    2eb <strcpy+0xd>
    ;
  return os;
 309:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 30c:	c9                   	leave  
 30d:	c3                   	ret    

0000030e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 30e:	55                   	push   %ebp
 30f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 311:	eb 08                	jmp    31b <strcmp+0xd>
    p++, q++;
 313:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 317:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	0f b6 00             	movzbl (%eax),%eax
 321:	84 c0                	test   %al,%al
 323:	74 10                	je     335 <strcmp+0x27>
 325:	8b 45 08             	mov    0x8(%ebp),%eax
 328:	0f b6 10             	movzbl (%eax),%edx
 32b:	8b 45 0c             	mov    0xc(%ebp),%eax
 32e:	0f b6 00             	movzbl (%eax),%eax
 331:	38 c2                	cmp    %al,%dl
 333:	74 de                	je     313 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 335:	8b 45 08             	mov    0x8(%ebp),%eax
 338:	0f b6 00             	movzbl (%eax),%eax
 33b:	0f b6 d0             	movzbl %al,%edx
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	0f b6 00             	movzbl (%eax),%eax
 344:	0f b6 c0             	movzbl %al,%eax
 347:	29 c2                	sub    %eax,%edx
 349:	89 d0                	mov    %edx,%eax
}
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    

0000034d <strlen>:

uint
strlen(const char *s)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 353:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 35a:	eb 04                	jmp    360 <strlen+0x13>
 35c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 360:	8b 55 fc             	mov    -0x4(%ebp),%edx
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	01 d0                	add    %edx,%eax
 368:	0f b6 00             	movzbl (%eax),%eax
 36b:	84 c0                	test   %al,%al
 36d:	75 ed                	jne    35c <strlen+0xf>
    ;
  return n;
 36f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 372:	c9                   	leave  
 373:	c3                   	ret    

00000374 <memset>:

void*
memset(void *dst, int c, uint n)
{
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 37a:	8b 45 10             	mov    0x10(%ebp),%eax
 37d:	89 44 24 08          	mov    %eax,0x8(%esp)
 381:	8b 45 0c             	mov    0xc(%ebp),%eax
 384:	89 44 24 04          	mov    %eax,0x4(%esp)
 388:	8b 45 08             	mov    0x8(%ebp),%eax
 38b:	89 04 24             	mov    %eax,(%esp)
 38e:	e8 26 ff ff ff       	call   2b9 <stosb>
  return dst;
 393:	8b 45 08             	mov    0x8(%ebp),%eax
}
 396:	c9                   	leave  
 397:	c3                   	ret    

00000398 <strchr>:

char*
strchr(const char *s, char c)
{
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	83 ec 04             	sub    $0x4,%esp
 39e:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3a4:	eb 14                	jmp    3ba <strchr+0x22>
    if(*s == c)
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	0f b6 00             	movzbl (%eax),%eax
 3ac:	3a 45 fc             	cmp    -0x4(%ebp),%al
 3af:	75 05                	jne    3b6 <strchr+0x1e>
      return (char*)s;
 3b1:	8b 45 08             	mov    0x8(%ebp),%eax
 3b4:	eb 13                	jmp    3c9 <strchr+0x31>
  for(; *s; s++)
 3b6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3ba:	8b 45 08             	mov    0x8(%ebp),%eax
 3bd:	0f b6 00             	movzbl (%eax),%eax
 3c0:	84 c0                	test   %al,%al
 3c2:	75 e2                	jne    3a6 <strchr+0xe>
  return 0;
 3c4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3c9:	c9                   	leave  
 3ca:	c3                   	ret    

000003cb <gets>:

char*
gets(char *buf, int max)
{
 3cb:	55                   	push   %ebp
 3cc:	89 e5                	mov    %esp,%ebp
 3ce:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 3d8:	eb 4c                	jmp    426 <gets+0x5b>
    cc = read(0, &c, 1);
 3da:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3e1:	00 
 3e2:	8d 45 ef             	lea    -0x11(%ebp),%eax
 3e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 3e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3f0:	e8 68 02 00 00       	call   65d <read>
 3f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 3f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3fc:	7f 02                	jg     400 <gets+0x35>
      break;
 3fe:	eb 31                	jmp    431 <gets+0x66>
    buf[i++] = c;
 400:	8b 45 f4             	mov    -0xc(%ebp),%eax
 403:	8d 50 01             	lea    0x1(%eax),%edx
 406:	89 55 f4             	mov    %edx,-0xc(%ebp)
 409:	89 c2                	mov    %eax,%edx
 40b:	8b 45 08             	mov    0x8(%ebp),%eax
 40e:	01 c2                	add    %eax,%edx
 410:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 414:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 416:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 41a:	3c 0a                	cmp    $0xa,%al
 41c:	74 13                	je     431 <gets+0x66>
 41e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 422:	3c 0d                	cmp    $0xd,%al
 424:	74 0b                	je     431 <gets+0x66>
  for(i=0; i+1 < max; ){
 426:	8b 45 f4             	mov    -0xc(%ebp),%eax
 429:	83 c0 01             	add    $0x1,%eax
 42c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 42f:	7c a9                	jl     3da <gets+0xf>
      break;
  }
  buf[i] = '\0';
 431:	8b 55 f4             	mov    -0xc(%ebp),%edx
 434:	8b 45 08             	mov    0x8(%ebp),%eax
 437:	01 d0                	add    %edx,%eax
 439:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 43c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43f:	c9                   	leave  
 440:	c3                   	ret    

00000441 <stat>:

int
stat(const char *n, struct stat *st)
{
 441:	55                   	push   %ebp
 442:	89 e5                	mov    %esp,%ebp
 444:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 447:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 44e:	00 
 44f:	8b 45 08             	mov    0x8(%ebp),%eax
 452:	89 04 24             	mov    %eax,(%esp)
 455:	e8 2b 02 00 00       	call   685 <open>
 45a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 45d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 461:	79 07                	jns    46a <stat+0x29>
    return -1;
 463:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 468:	eb 23                	jmp    48d <stat+0x4c>
  r = fstat(fd, st);
 46a:	8b 45 0c             	mov    0xc(%ebp),%eax
 46d:	89 44 24 04          	mov    %eax,0x4(%esp)
 471:	8b 45 f4             	mov    -0xc(%ebp),%eax
 474:	89 04 24             	mov    %eax,(%esp)
 477:	e8 21 02 00 00       	call   69d <fstat>
 47c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 47f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 482:	89 04 24             	mov    %eax,(%esp)
 485:	e8 e3 01 00 00       	call   66d <close>
  return r;
 48a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 48d:	c9                   	leave  
 48e:	c3                   	ret    

0000048f <atoi>:

int
atoi(const char *s)
{
 48f:	55                   	push   %ebp
 490:	89 e5                	mov    %esp,%ebp
 492:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 495:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 49c:	eb 25                	jmp    4c3 <atoi+0x34>
    n = n*10 + *s++ - '0';
 49e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4a1:	89 d0                	mov    %edx,%eax
 4a3:	c1 e0 02             	shl    $0x2,%eax
 4a6:	01 d0                	add    %edx,%eax
 4a8:	01 c0                	add    %eax,%eax
 4aa:	89 c1                	mov    %eax,%ecx
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
 4af:	8d 50 01             	lea    0x1(%eax),%edx
 4b2:	89 55 08             	mov    %edx,0x8(%ebp)
 4b5:	0f b6 00             	movzbl (%eax),%eax
 4b8:	0f be c0             	movsbl %al,%eax
 4bb:	01 c8                	add    %ecx,%eax
 4bd:	83 e8 30             	sub    $0x30,%eax
 4c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	0f b6 00             	movzbl (%eax),%eax
 4c9:	3c 2f                	cmp    $0x2f,%al
 4cb:	7e 0a                	jle    4d7 <atoi+0x48>
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
 4d0:	0f b6 00             	movzbl (%eax),%eax
 4d3:	3c 39                	cmp    $0x39,%al
 4d5:	7e c7                	jle    49e <atoi+0xf>
  return n;
 4d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4da:	c9                   	leave  
 4db:	c3                   	ret    

000004dc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4dc:	55                   	push   %ebp
 4dd:	89 e5                	mov    %esp,%ebp
 4df:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4eb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4ee:	eb 17                	jmp    507 <memmove+0x2b>
    *dst++ = *src++;
 4f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4f3:	8d 50 01             	lea    0x1(%eax),%edx
 4f6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4f9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4fc:	8d 4a 01             	lea    0x1(%edx),%ecx
 4ff:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 502:	0f b6 12             	movzbl (%edx),%edx
 505:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 507:	8b 45 10             	mov    0x10(%ebp),%eax
 50a:	8d 50 ff             	lea    -0x1(%eax),%edx
 50d:	89 55 10             	mov    %edx,0x10(%ebp)
 510:	85 c0                	test   %eax,%eax
 512:	7f dc                	jg     4f0 <memmove+0x14>
  return vdst;
 514:	8b 45 08             	mov    0x8(%ebp),%eax
}
 517:	c9                   	leave  
 518:	c3                   	ret    

00000519 <ps>:

void ps(void) {
 519:	55                   	push   %ebp
 51a:	89 e5                	mov    %esp,%ebp
 51c:	57                   	push   %edi
 51d:	56                   	push   %esi
 51e:	53                   	push   %ebx
 51f:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 525:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 52b:	89 04 24             	mov    %eax,(%esp)
 52e:	e8 b2 01 00 00       	call   6e5 <getpinfo>

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 533:	c7 44 24 04 62 0c 00 	movl   $0xc62,0x4(%esp)
 53a:	00 
 53b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 542:	e8 8e 02 00 00       	call   7d5 <printf>

  int i = 0;
 547:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 54e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 555:	e9 ce 00 00 00       	jmp    628 <ps+0x10f>
    if (pstat[i].inuse) {
 55a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 55d:	89 d0                	mov    %edx,%eax
 55f:	c1 e0 03             	shl    $0x3,%eax
 562:	01 d0                	add    %edx,%eax
 564:	c1 e0 02             	shl    $0x2,%eax
 567:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 56a:	01 d8                	add    %ebx,%eax
 56c:	2d 04 09 00 00       	sub    $0x904,%eax
 571:	8b 00                	mov    (%eax),%eax
 573:	85 c0                	test   %eax,%eax
 575:	0f 84 a9 00 00 00    	je     624 <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 57b:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 581:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 584:	89 d0                	mov    %edx,%eax
 586:	c1 e0 03             	shl    $0x3,%eax
 589:	01 d0                	add    %edx,%eax
 58b:	c1 e0 02             	shl    $0x2,%eax
 58e:	83 c0 10             	add    $0x10,%eax
 591:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 594:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 597:	89 d0                	mov    %edx,%eax
 599:	c1 e0 03             	shl    $0x3,%eax
 59c:	01 d0                	add    %edx,%eax
 59e:	c1 e0 02             	shl    $0x2,%eax
 5a1:	8d 75 e8             	lea    -0x18(%ebp),%esi
 5a4:	01 f0                	add    %esi,%eax
 5a6:	2d e4 08 00 00       	sub    $0x8e4,%eax
 5ab:	0f b6 00             	movzbl (%eax),%eax
 5ae:	0f be f0             	movsbl %al,%esi
 5b1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 5b4:	89 d0                	mov    %edx,%eax
 5b6:	c1 e0 03             	shl    $0x3,%eax
 5b9:	01 d0                	add    %edx,%eax
 5bb:	c1 e0 02             	shl    $0x2,%eax
 5be:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 5c1:	01 c8                	add    %ecx,%eax
 5c3:	2d f8 08 00 00       	sub    $0x8f8,%eax
 5c8:	8b 18                	mov    (%eax),%ebx
 5ca:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 5cd:	89 d0                	mov    %edx,%eax
 5cf:	c1 e0 03             	shl    $0x3,%eax
 5d2:	01 d0                	add    %edx,%eax
 5d4:	c1 e0 02             	shl    $0x2,%eax
 5d7:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 5da:	01 c8                	add    %ecx,%eax
 5dc:	2d 00 09 00 00       	sub    $0x900,%eax
 5e1:	8b 08                	mov    (%eax),%ecx
 5e3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 5e6:	89 d0                	mov    %edx,%eax
 5e8:	c1 e0 03             	shl    $0x3,%eax
 5eb:	01 d0                	add    %edx,%eax
 5ed:	c1 e0 02             	shl    $0x2,%eax
 5f0:	8d 55 e8             	lea    -0x18(%ebp),%edx
 5f3:	01 d0                	add    %edx,%eax
 5f5:	2d fc 08 00 00       	sub    $0x8fc,%eax
 5fa:	8b 00                	mov    (%eax),%eax
 5fc:	89 7c 24 18          	mov    %edi,0x18(%esp)
 600:	89 74 24 14          	mov    %esi,0x14(%esp)
 604:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 608:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 60c:	89 44 24 08          	mov    %eax,0x8(%esp)
 610:	c7 44 24 04 7b 0c 00 	movl   $0xc7b,0x4(%esp)
 617:	00 
 618:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 61f:	e8 b1 01 00 00       	call   7d5 <printf>
  for (i = 0; i < NPROC; ++i) {
 624:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 628:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 62c:	0f 8e 28 ff ff ff    	jle    55a <ps+0x41>
    }
  }
 632:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 638:	5b                   	pop    %ebx
 639:	5e                   	pop    %esi
 63a:	5f                   	pop    %edi
 63b:	5d                   	pop    %ebp
 63c:	c3                   	ret    

0000063d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 63d:	b8 01 00 00 00       	mov    $0x1,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <exit>:
SYSCALL(exit)
 645:	b8 02 00 00 00       	mov    $0x2,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <wait>:
SYSCALL(wait)
 64d:	b8 03 00 00 00       	mov    $0x3,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <pipe>:
SYSCALL(pipe)
 655:	b8 04 00 00 00       	mov    $0x4,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <read>:
SYSCALL(read)
 65d:	b8 05 00 00 00       	mov    $0x5,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <write>:
SYSCALL(write)
 665:	b8 10 00 00 00       	mov    $0x10,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <close>:
SYSCALL(close)
 66d:	b8 15 00 00 00       	mov    $0x15,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <kill>:
SYSCALL(kill)
 675:	b8 06 00 00 00       	mov    $0x6,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <exec>:
SYSCALL(exec)
 67d:	b8 07 00 00 00       	mov    $0x7,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <open>:
SYSCALL(open)
 685:	b8 0f 00 00 00       	mov    $0xf,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <mknod>:
SYSCALL(mknod)
 68d:	b8 11 00 00 00       	mov    $0x11,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <unlink>:
SYSCALL(unlink)
 695:	b8 12 00 00 00       	mov    $0x12,%eax
 69a:	cd 40                	int    $0x40
 69c:	c3                   	ret    

0000069d <fstat>:
SYSCALL(fstat)
 69d:	b8 08 00 00 00       	mov    $0x8,%eax
 6a2:	cd 40                	int    $0x40
 6a4:	c3                   	ret    

000006a5 <link>:
SYSCALL(link)
 6a5:	b8 13 00 00 00       	mov    $0x13,%eax
 6aa:	cd 40                	int    $0x40
 6ac:	c3                   	ret    

000006ad <mkdir>:
SYSCALL(mkdir)
 6ad:	b8 14 00 00 00       	mov    $0x14,%eax
 6b2:	cd 40                	int    $0x40
 6b4:	c3                   	ret    

000006b5 <chdir>:
SYSCALL(chdir)
 6b5:	b8 09 00 00 00       	mov    $0x9,%eax
 6ba:	cd 40                	int    $0x40
 6bc:	c3                   	ret    

000006bd <dup>:
SYSCALL(dup)
 6bd:	b8 0a 00 00 00       	mov    $0xa,%eax
 6c2:	cd 40                	int    $0x40
 6c4:	c3                   	ret    

000006c5 <getpid>:
SYSCALL(getpid)
 6c5:	b8 0b 00 00 00       	mov    $0xb,%eax
 6ca:	cd 40                	int    $0x40
 6cc:	c3                   	ret    

000006cd <sbrk>:
SYSCALL(sbrk)
 6cd:	b8 0c 00 00 00       	mov    $0xc,%eax
 6d2:	cd 40                	int    $0x40
 6d4:	c3                   	ret    

000006d5 <sleep>:
SYSCALL(sleep)
 6d5:	b8 0d 00 00 00       	mov    $0xd,%eax
 6da:	cd 40                	int    $0x40
 6dc:	c3                   	ret    

000006dd <uptime>:
SYSCALL(uptime)
 6dd:	b8 0e 00 00 00       	mov    $0xe,%eax
 6e2:	cd 40                	int    $0x40
 6e4:	c3                   	ret    

000006e5 <getpinfo>:
SYSCALL(getpinfo)
 6e5:	b8 16 00 00 00       	mov    $0x16,%eax
 6ea:	cd 40                	int    $0x40
 6ec:	c3                   	ret    

000006ed <settickets>:
 6ed:	b8 17 00 00 00       	mov    $0x17,%eax
 6f2:	cd 40                	int    $0x40
 6f4:	c3                   	ret    

000006f5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6f5:	55                   	push   %ebp
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	83 ec 18             	sub    $0x18,%esp
 6fb:	8b 45 0c             	mov    0xc(%ebp),%eax
 6fe:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 701:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 708:	00 
 709:	8d 45 f4             	lea    -0xc(%ebp),%eax
 70c:	89 44 24 04          	mov    %eax,0x4(%esp)
 710:	8b 45 08             	mov    0x8(%ebp),%eax
 713:	89 04 24             	mov    %eax,(%esp)
 716:	e8 4a ff ff ff       	call   665 <write>
}
 71b:	c9                   	leave  
 71c:	c3                   	ret    

0000071d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 71d:	55                   	push   %ebp
 71e:	89 e5                	mov    %esp,%ebp
 720:	56                   	push   %esi
 721:	53                   	push   %ebx
 722:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 725:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 72c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 730:	74 17                	je     749 <printint+0x2c>
 732:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 736:	79 11                	jns    749 <printint+0x2c>
    neg = 1;
 738:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 73f:	8b 45 0c             	mov    0xc(%ebp),%eax
 742:	f7 d8                	neg    %eax
 744:	89 45 ec             	mov    %eax,-0x14(%ebp)
 747:	eb 06                	jmp    74f <printint+0x32>
  } else {
    x = xx;
 749:	8b 45 0c             	mov    0xc(%ebp),%eax
 74c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 74f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 756:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 759:	8d 41 01             	lea    0x1(%ecx),%eax
 75c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 75f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 762:	8b 45 ec             	mov    -0x14(%ebp),%eax
 765:	ba 00 00 00 00       	mov    $0x0,%edx
 76a:	f7 f3                	div    %ebx
 76c:	89 d0                	mov    %edx,%eax
 76e:	0f b6 80 1c 0f 00 00 	movzbl 0xf1c(%eax),%eax
 775:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 779:	8b 75 10             	mov    0x10(%ebp),%esi
 77c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 77f:	ba 00 00 00 00       	mov    $0x0,%edx
 784:	f7 f6                	div    %esi
 786:	89 45 ec             	mov    %eax,-0x14(%ebp)
 789:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 78d:	75 c7                	jne    756 <printint+0x39>
  if(neg)
 78f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 793:	74 10                	je     7a5 <printint+0x88>
    buf[i++] = '-';
 795:	8b 45 f4             	mov    -0xc(%ebp),%eax
 798:	8d 50 01             	lea    0x1(%eax),%edx
 79b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 79e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 7a3:	eb 1f                	jmp    7c4 <printint+0xa7>
 7a5:	eb 1d                	jmp    7c4 <printint+0xa7>
    putc(fd, buf[i]);
 7a7:	8d 55 dc             	lea    -0x24(%ebp),%edx
 7aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ad:	01 d0                	add    %edx,%eax
 7af:	0f b6 00             	movzbl (%eax),%eax
 7b2:	0f be c0             	movsbl %al,%eax
 7b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
 7bc:	89 04 24             	mov    %eax,(%esp)
 7bf:	e8 31 ff ff ff       	call   6f5 <putc>
  while(--i >= 0)
 7c4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 7c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7cc:	79 d9                	jns    7a7 <printint+0x8a>
}
 7ce:	83 c4 30             	add    $0x30,%esp
 7d1:	5b                   	pop    %ebx
 7d2:	5e                   	pop    %esi
 7d3:	5d                   	pop    %ebp
 7d4:	c3                   	ret    

000007d5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7d5:	55                   	push   %ebp
 7d6:	89 e5                	mov    %esp,%ebp
 7d8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 7db:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 7e2:	8d 45 0c             	lea    0xc(%ebp),%eax
 7e5:	83 c0 04             	add    $0x4,%eax
 7e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 7eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 7f2:	e9 7c 01 00 00       	jmp    973 <printf+0x19e>
    c = fmt[i] & 0xff;
 7f7:	8b 55 0c             	mov    0xc(%ebp),%edx
 7fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fd:	01 d0                	add    %edx,%eax
 7ff:	0f b6 00             	movzbl (%eax),%eax
 802:	0f be c0             	movsbl %al,%eax
 805:	25 ff 00 00 00       	and    $0xff,%eax
 80a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 80d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 811:	75 2c                	jne    83f <printf+0x6a>
      if(c == '%'){
 813:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 817:	75 0c                	jne    825 <printf+0x50>
        state = '%';
 819:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 820:	e9 4a 01 00 00       	jmp    96f <printf+0x19a>
      } else {
        putc(fd, c);
 825:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 828:	0f be c0             	movsbl %al,%eax
 82b:	89 44 24 04          	mov    %eax,0x4(%esp)
 82f:	8b 45 08             	mov    0x8(%ebp),%eax
 832:	89 04 24             	mov    %eax,(%esp)
 835:	e8 bb fe ff ff       	call   6f5 <putc>
 83a:	e9 30 01 00 00       	jmp    96f <printf+0x19a>
      }
    } else if(state == '%'){
 83f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 843:	0f 85 26 01 00 00    	jne    96f <printf+0x19a>
      if(c == 'd'){
 849:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 84d:	75 2d                	jne    87c <printf+0xa7>
        printint(fd, *ap, 10, 1);
 84f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 852:	8b 00                	mov    (%eax),%eax
 854:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 85b:	00 
 85c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 863:	00 
 864:	89 44 24 04          	mov    %eax,0x4(%esp)
 868:	8b 45 08             	mov    0x8(%ebp),%eax
 86b:	89 04 24             	mov    %eax,(%esp)
 86e:	e8 aa fe ff ff       	call   71d <printint>
        ap++;
 873:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 877:	e9 ec 00 00 00       	jmp    968 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 87c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 880:	74 06                	je     888 <printf+0xb3>
 882:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 886:	75 2d                	jne    8b5 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 888:	8b 45 e8             	mov    -0x18(%ebp),%eax
 88b:	8b 00                	mov    (%eax),%eax
 88d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 894:	00 
 895:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 89c:	00 
 89d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a1:	8b 45 08             	mov    0x8(%ebp),%eax
 8a4:	89 04 24             	mov    %eax,(%esp)
 8a7:	e8 71 fe ff ff       	call   71d <printint>
        ap++;
 8ac:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8b0:	e9 b3 00 00 00       	jmp    968 <printf+0x193>
      } else if(c == 's'){
 8b5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 8b9:	75 45                	jne    900 <printf+0x12b>
        s = (char*)*ap;
 8bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8be:	8b 00                	mov    (%eax),%eax
 8c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 8c3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 8c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8cb:	75 09                	jne    8d6 <printf+0x101>
          s = "(null)";
 8cd:	c7 45 f4 8b 0c 00 00 	movl   $0xc8b,-0xc(%ebp)
        while(*s != 0){
 8d4:	eb 1e                	jmp    8f4 <printf+0x11f>
 8d6:	eb 1c                	jmp    8f4 <printf+0x11f>
          putc(fd, *s);
 8d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8db:	0f b6 00             	movzbl (%eax),%eax
 8de:	0f be c0             	movsbl %al,%eax
 8e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 8e5:	8b 45 08             	mov    0x8(%ebp),%eax
 8e8:	89 04 24             	mov    %eax,(%esp)
 8eb:	e8 05 fe ff ff       	call   6f5 <putc>
          s++;
 8f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 8f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f7:	0f b6 00             	movzbl (%eax),%eax
 8fa:	84 c0                	test   %al,%al
 8fc:	75 da                	jne    8d8 <printf+0x103>
 8fe:	eb 68                	jmp    968 <printf+0x193>
        }
      } else if(c == 'c'){
 900:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 904:	75 1d                	jne    923 <printf+0x14e>
        putc(fd, *ap);
 906:	8b 45 e8             	mov    -0x18(%ebp),%eax
 909:	8b 00                	mov    (%eax),%eax
 90b:	0f be c0             	movsbl %al,%eax
 90e:	89 44 24 04          	mov    %eax,0x4(%esp)
 912:	8b 45 08             	mov    0x8(%ebp),%eax
 915:	89 04 24             	mov    %eax,(%esp)
 918:	e8 d8 fd ff ff       	call   6f5 <putc>
        ap++;
 91d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 921:	eb 45                	jmp    968 <printf+0x193>
      } else if(c == '%'){
 923:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 927:	75 17                	jne    940 <printf+0x16b>
        putc(fd, c);
 929:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 92c:	0f be c0             	movsbl %al,%eax
 92f:	89 44 24 04          	mov    %eax,0x4(%esp)
 933:	8b 45 08             	mov    0x8(%ebp),%eax
 936:	89 04 24             	mov    %eax,(%esp)
 939:	e8 b7 fd ff ff       	call   6f5 <putc>
 93e:	eb 28                	jmp    968 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 940:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 947:	00 
 948:	8b 45 08             	mov    0x8(%ebp),%eax
 94b:	89 04 24             	mov    %eax,(%esp)
 94e:	e8 a2 fd ff ff       	call   6f5 <putc>
        putc(fd, c);
 953:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 956:	0f be c0             	movsbl %al,%eax
 959:	89 44 24 04          	mov    %eax,0x4(%esp)
 95d:	8b 45 08             	mov    0x8(%ebp),%eax
 960:	89 04 24             	mov    %eax,(%esp)
 963:	e8 8d fd ff ff       	call   6f5 <putc>
      }
      state = 0;
 968:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 96f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 973:	8b 55 0c             	mov    0xc(%ebp),%edx
 976:	8b 45 f0             	mov    -0x10(%ebp),%eax
 979:	01 d0                	add    %edx,%eax
 97b:	0f b6 00             	movzbl (%eax),%eax
 97e:	84 c0                	test   %al,%al
 980:	0f 85 71 fe ff ff    	jne    7f7 <printf+0x22>
    }
  }
}
 986:	c9                   	leave  
 987:	c3                   	ret    

00000988 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 988:	55                   	push   %ebp
 989:	89 e5                	mov    %esp,%ebp
 98b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 98e:	8b 45 08             	mov    0x8(%ebp),%eax
 991:	83 e8 08             	sub    $0x8,%eax
 994:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 997:	a1 38 0f 00 00       	mov    0xf38,%eax
 99c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 99f:	eb 24                	jmp    9c5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a4:	8b 00                	mov    (%eax),%eax
 9a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 9a9:	77 12                	ja     9bd <free+0x35>
 9ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ae:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 9b1:	77 24                	ja     9d7 <free+0x4f>
 9b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b6:	8b 00                	mov    (%eax),%eax
 9b8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9bb:	77 1a                	ja     9d7 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c0:	8b 00                	mov    (%eax),%eax
 9c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 9c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9c8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 9cb:	76 d4                	jbe    9a1 <free+0x19>
 9cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d0:	8b 00                	mov    (%eax),%eax
 9d2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9d5:	76 ca                	jbe    9a1 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9da:	8b 40 04             	mov    0x4(%eax),%eax
 9dd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9e7:	01 c2                	add    %eax,%edx
 9e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ec:	8b 00                	mov    (%eax),%eax
 9ee:	39 c2                	cmp    %eax,%edx
 9f0:	75 24                	jne    a16 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 9f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9f5:	8b 50 04             	mov    0x4(%eax),%edx
 9f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9fb:	8b 00                	mov    (%eax),%eax
 9fd:	8b 40 04             	mov    0x4(%eax),%eax
 a00:	01 c2                	add    %eax,%edx
 a02:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a05:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a08:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a0b:	8b 00                	mov    (%eax),%eax
 a0d:	8b 10                	mov    (%eax),%edx
 a0f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a12:	89 10                	mov    %edx,(%eax)
 a14:	eb 0a                	jmp    a20 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 a16:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a19:	8b 10                	mov    (%eax),%edx
 a1b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a1e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 a20:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a23:	8b 40 04             	mov    0x4(%eax),%eax
 a26:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a30:	01 d0                	add    %edx,%eax
 a32:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a35:	75 20                	jne    a57 <free+0xcf>
    p->s.size += bp->s.size;
 a37:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a3a:	8b 50 04             	mov    0x4(%eax),%edx
 a3d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a40:	8b 40 04             	mov    0x4(%eax),%eax
 a43:	01 c2                	add    %eax,%edx
 a45:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a48:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a4b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a4e:	8b 10                	mov    (%eax),%edx
 a50:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a53:	89 10                	mov    %edx,(%eax)
 a55:	eb 08                	jmp    a5f <free+0xd7>
  } else
    p->s.ptr = bp;
 a57:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a5a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 a5d:	89 10                	mov    %edx,(%eax)
  freep = p;
 a5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a62:	a3 38 0f 00 00       	mov    %eax,0xf38
}
 a67:	c9                   	leave  
 a68:	c3                   	ret    

00000a69 <morecore>:

static Header*
morecore(uint nu)
{
 a69:	55                   	push   %ebp
 a6a:	89 e5                	mov    %esp,%ebp
 a6c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 a6f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a76:	77 07                	ja     a7f <morecore+0x16>
    nu = 4096;
 a78:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a7f:	8b 45 08             	mov    0x8(%ebp),%eax
 a82:	c1 e0 03             	shl    $0x3,%eax
 a85:	89 04 24             	mov    %eax,(%esp)
 a88:	e8 40 fc ff ff       	call   6cd <sbrk>
 a8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a90:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a94:	75 07                	jne    a9d <morecore+0x34>
    return 0;
 a96:	b8 00 00 00 00       	mov    $0x0,%eax
 a9b:	eb 22                	jmp    abf <morecore+0x56>
  hp = (Header*)p;
 a9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 aa3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa6:	8b 55 08             	mov    0x8(%ebp),%edx
 aa9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 aac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aaf:	83 c0 08             	add    $0x8,%eax
 ab2:	89 04 24             	mov    %eax,(%esp)
 ab5:	e8 ce fe ff ff       	call   988 <free>
  return freep;
 aba:	a1 38 0f 00 00       	mov    0xf38,%eax
}
 abf:	c9                   	leave  
 ac0:	c3                   	ret    

00000ac1 <malloc>:

void*
malloc(uint nbytes)
{
 ac1:	55                   	push   %ebp
 ac2:	89 e5                	mov    %esp,%ebp
 ac4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ac7:	8b 45 08             	mov    0x8(%ebp),%eax
 aca:	83 c0 07             	add    $0x7,%eax
 acd:	c1 e8 03             	shr    $0x3,%eax
 ad0:	83 c0 01             	add    $0x1,%eax
 ad3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 ad6:	a1 38 0f 00 00       	mov    0xf38,%eax
 adb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ade:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 ae2:	75 23                	jne    b07 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 ae4:	c7 45 f0 30 0f 00 00 	movl   $0xf30,-0x10(%ebp)
 aeb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aee:	a3 38 0f 00 00       	mov    %eax,0xf38
 af3:	a1 38 0f 00 00       	mov    0xf38,%eax
 af8:	a3 30 0f 00 00       	mov    %eax,0xf30
    base.s.size = 0;
 afd:	c7 05 34 0f 00 00 00 	movl   $0x0,0xf34
 b04:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b07:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b0a:	8b 00                	mov    (%eax),%eax
 b0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b12:	8b 40 04             	mov    0x4(%eax),%eax
 b15:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b18:	72 4d                	jb     b67 <malloc+0xa6>
      if(p->s.size == nunits)
 b1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b1d:	8b 40 04             	mov    0x4(%eax),%eax
 b20:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b23:	75 0c                	jne    b31 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 b25:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b28:	8b 10                	mov    (%eax),%edx
 b2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b2d:	89 10                	mov    %edx,(%eax)
 b2f:	eb 26                	jmp    b57 <malloc+0x96>
      else {
        p->s.size -= nunits;
 b31:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b34:	8b 40 04             	mov    0x4(%eax),%eax
 b37:	2b 45 ec             	sub    -0x14(%ebp),%eax
 b3a:	89 c2                	mov    %eax,%edx
 b3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b3f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 b42:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b45:	8b 40 04             	mov    0x4(%eax),%eax
 b48:	c1 e0 03             	shl    $0x3,%eax
 b4b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 b4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b51:	8b 55 ec             	mov    -0x14(%ebp),%edx
 b54:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 b57:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b5a:	a3 38 0f 00 00       	mov    %eax,0xf38
      return (void*)(p + 1);
 b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b62:	83 c0 08             	add    $0x8,%eax
 b65:	eb 38                	jmp    b9f <malloc+0xde>
    }
    if(p == freep)
 b67:	a1 38 0f 00 00       	mov    0xf38,%eax
 b6c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 b6f:	75 1b                	jne    b8c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 b71:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b74:	89 04 24             	mov    %eax,(%esp)
 b77:	e8 ed fe ff ff       	call   a69 <morecore>
 b7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b7f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b83:	75 07                	jne    b8c <malloc+0xcb>
        return 0;
 b85:	b8 00 00 00 00       	mov    $0x0,%eax
 b8a:	eb 13                	jmp    b9f <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b92:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b95:	8b 00                	mov    (%eax),%eax
 b97:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 b9a:	e9 70 ff ff ff       	jmp    b0f <malloc+0x4e>
}
 b9f:	c9                   	leave  
 ba0:	c3                   	ret    
