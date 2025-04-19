
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	8b 45 08             	mov    0x8(%ebp),%eax
   a:	89 04 24             	mov    %eax,(%esp)
   d:	e8 dd 03 00 00       	call   3ef <strlen>
  12:	8b 55 08             	mov    0x8(%ebp),%edx
  15:	01 d0                	add    %edx,%eax
  17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1a:	eb 04                	jmp    20 <fmtname+0x20>
  1c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  23:	3b 45 08             	cmp    0x8(%ebp),%eax
  26:	72 0a                	jb     32 <fmtname+0x32>
  28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2b:	0f b6 00             	movzbl (%eax),%eax
  2e:	3c 2f                	cmp    $0x2f,%al
  30:	75 ea                	jne    1c <fmtname+0x1c>
    ;
  p++;
  32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  39:	89 04 24             	mov    %eax,(%esp)
  3c:	e8 ae 03 00 00       	call   3ef <strlen>
  41:	83 f8 0d             	cmp    $0xd,%eax
  44:	76 05                	jbe    4b <fmtname+0x4b>
    return p;
  46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  49:	eb 5f                	jmp    aa <fmtname+0xaa>
  memmove(buf, p, strlen(p));
  4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 99 03 00 00       	call   3ef <strlen>
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  61:	c7 04 24 9c 0f 00 00 	movl   $0xf9c,(%esp)
  68:	e8 11 05 00 00       	call   57e <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  70:	89 04 24             	mov    %eax,(%esp)
  73:	e8 77 03 00 00       	call   3ef <strlen>
  78:	ba 0e 00 00 00       	mov    $0xe,%edx
  7d:	89 d3                	mov    %edx,%ebx
  7f:	29 c3                	sub    %eax,%ebx
  81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 63 03 00 00       	call   3ef <strlen>
  8c:	05 9c 0f 00 00       	add    $0xf9c,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 71 03 00 00       	call   416 <memset>
  return buf;
  a5:	b8 9c 0f 00 00       	mov    $0xf9c,%eax
}
  aa:	83 c4 24             	add    $0x24,%esp
  ad:	5b                   	pop    %ebx
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <ls>:

void
ls(char *path)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c3:	00 
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	89 04 24             	mov    %eax,(%esp)
  ca:	e8 58 06 00 00       	call   727 <open>
  cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d6:	79 20                	jns    f8 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 43 0c 00 	movl   $0xc43,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 84 07 00 00       	call   877 <printf>
    return;
  f3:	e9 01 02 00 00       	jmp    2f9 <ls+0x249>
  }

  if(fstat(fd, &st) < 0){
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 105:	89 04 24             	mov    %eax,(%esp)
 108:	e8 32 06 00 00       	call   73f <fstat>
 10d:	85 c0                	test   %eax,%eax
 10f:	79 2b                	jns    13c <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 57 0c 00 	movl   $0xc57,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 4b 07 00 00       	call   877 <printf>
    close(fd);
 12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12f:	89 04 24             	mov    %eax,(%esp)
 132:	e8 d8 05 00 00       	call   70f <close>
    return;
 137:	e9 bd 01 00 00       	jmp    2f9 <ls+0x249>
  }

  switch(st.type){
 13c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 143:	98                   	cwtl   
 144:	83 f8 01             	cmp    $0x1,%eax
 147:	74 53                	je     19c <ls+0xec>
 149:	83 f8 02             	cmp    $0x2,%eax
 14c:	0f 85 9c 01 00 00    	jne    2ee <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 158:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15e:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 165:	0f bf d8             	movswl %ax,%ebx
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	89 04 24             	mov    %eax,(%esp)
 16e:	e8 8d fe ff ff       	call   0 <fmtname>
 173:	89 7c 24 14          	mov    %edi,0x14(%esp)
 177:	89 74 24 10          	mov    %esi,0x10(%esp)
 17b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17f:	89 44 24 08          	mov    %eax,0x8(%esp)
 183:	c7 44 24 04 6b 0c 00 	movl   $0xc6b,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 e0 06 00 00       	call   877 <printf>
    break;
 197:	e9 52 01 00 00       	jmp    2ee <ls+0x23e>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 48 02 00 00       	call   3ef <strlen>
 1a7:	83 c0 10             	add    $0x10,%eax
 1aa:	3d 00 02 00 00       	cmp    $0x200,%eax
 1af:	76 19                	jbe    1ca <ls+0x11a>
      printf(1, "ls: path too long\n");
 1b1:	c7 44 24 04 78 0c 00 	movl   $0xc78,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 b2 06 00 00       	call   877 <printf>
      break;
 1c5:	e9 24 01 00 00       	jmp    2ee <ls+0x23e>
    }
    strcpy(buf, path);
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d7:	89 04 24             	mov    %eax,(%esp)
 1da:	e8 a1 01 00 00       	call   380 <strcpy>
    p = buf+strlen(buf);
 1df:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 02 02 00 00       	call   3ef <strlen>
 1ed:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f3:	01 d0                	add    %edx,%eax
 1f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fb:	8d 50 01             	lea    0x1(%eax),%edx
 1fe:	89 55 e0             	mov    %edx,-0x20(%ebp)
 201:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 204:	e9 be 00 00 00       	jmp    2c7 <ls+0x217>
      if(de.inum == 0)
 209:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 210:	66 85 c0             	test   %ax,%ax
 213:	75 05                	jne    21a <ls+0x16a>
        continue;
 215:	e9 ad 00 00 00       	jmp    2c7 <ls+0x217>
      memmove(p, de.name, DIRSIZ);
 21a:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 221:	00 
 222:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 228:	83 c0 02             	add    $0x2,%eax
 22b:	89 44 24 04          	mov    %eax,0x4(%esp)
 22f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 232:	89 04 24             	mov    %eax,(%esp)
 235:	e8 44 03 00 00       	call   57e <memmove>
      p[DIRSIZ] = 0;
 23a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23d:	83 c0 0e             	add    $0xe,%eax
 240:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 243:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 88 02 00 00       	call   4e3 <stat>
 25b:	85 c0                	test   %eax,%eax
 25d:	79 20                	jns    27f <ls+0x1cf>
        printf(1, "ls: cannot stat %s\n", buf);
 25f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 265:	89 44 24 08          	mov    %eax,0x8(%esp)
 269:	c7 44 24 04 57 0c 00 	movl   $0xc57,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 fa 05 00 00       	call   877 <printf>
        continue;
 27d:	eb 48                	jmp    2c7 <ls+0x217>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27f:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 285:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 28b:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 292:	0f bf d8             	movswl %ax,%ebx
 295:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 29b:	89 04 24             	mov    %eax,(%esp)
 29e:	e8 5d fd ff ff       	call   0 <fmtname>
 2a3:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a7:	89 74 24 10          	mov    %esi,0x10(%esp)
 2ab:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	c7 44 24 04 6b 0c 00 	movl   $0xc6b,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 b0 05 00 00       	call   877 <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2ce:	00 
 2cf:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 1b 04 00 00       	call   6ff <read>
 2e4:	83 f8 10             	cmp    $0x10,%eax
 2e7:	0f 84 1c ff ff ff    	je     209 <ls+0x159>
    }
    break;
 2ed:	90                   	nop
  }
  close(fd);
 2ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 16 04 00 00       	call   70f <close>
}
 2f9:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <main>:

int
main(int argc, char *argv[])
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 e4 f0             	and    $0xfffffff0,%esp
 30a:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 311:	7f 11                	jg     324 <main+0x20>
    ls(".");
 313:	c7 04 24 8b 0c 00 00 	movl   $0xc8b,(%esp)
 31a:	e8 91 fd ff ff       	call   b0 <ls>
    exit();
 31f:	e8 c3 03 00 00       	call   6e7 <exit>
  }
  for(i=1; i<argc; i++)
 324:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 32b:	00 
 32c:	eb 1f                	jmp    34d <main+0x49>
    ls(argv[i]);
 32e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 332:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 339:	8b 45 0c             	mov    0xc(%ebp),%eax
 33c:	01 d0                	add    %edx,%eax
 33e:	8b 00                	mov    (%eax),%eax
 340:	89 04 24             	mov    %eax,(%esp)
 343:	e8 68 fd ff ff       	call   b0 <ls>
  for(i=1; i<argc; i++)
 348:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 34d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 351:	3b 45 08             	cmp    0x8(%ebp),%eax
 354:	7c d8                	jl     32e <main+0x2a>
  exit();
 356:	e8 8c 03 00 00       	call   6e7 <exit>

0000035b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	57                   	push   %edi
 35f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 360:	8b 4d 08             	mov    0x8(%ebp),%ecx
 363:	8b 55 10             	mov    0x10(%ebp),%edx
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	89 cb                	mov    %ecx,%ebx
 36b:	89 df                	mov    %ebx,%edi
 36d:	89 d1                	mov    %edx,%ecx
 36f:	fc                   	cld    
 370:	f3 aa                	rep stos %al,%es:(%edi)
 372:	89 ca                	mov    %ecx,%edx
 374:	89 fb                	mov    %edi,%ebx
 376:	89 5d 08             	mov    %ebx,0x8(%ebp)
 379:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 37c:	5b                   	pop    %ebx
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 38c:	90                   	nop
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	8d 50 01             	lea    0x1(%eax),%edx
 393:	89 55 08             	mov    %edx,0x8(%ebp)
 396:	8b 55 0c             	mov    0xc(%ebp),%edx
 399:	8d 4a 01             	lea    0x1(%edx),%ecx
 39c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 39f:	0f b6 12             	movzbl (%edx),%edx
 3a2:	88 10                	mov    %dl,(%eax)
 3a4:	0f b6 00             	movzbl (%eax),%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	75 e2                	jne    38d <strcpy+0xd>
    ;
  return os;
 3ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ae:	c9                   	leave  
 3af:	c3                   	ret    

000003b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b3:	eb 08                	jmp    3bd <strcmp+0xd>
    p++, q++;
 3b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	84 c0                	test   %al,%al
 3c5:	74 10                	je     3d7 <strcmp+0x27>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 10             	movzbl (%eax),%edx
 3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d0:	0f b6 00             	movzbl (%eax),%eax
 3d3:	38 c2                	cmp    %al,%dl
 3d5:	74 de                	je     3b5 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	0f b6 d0             	movzbl %al,%edx
 3e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e3:	0f b6 00             	movzbl (%eax),%eax
 3e6:	0f b6 c0             	movzbl %al,%eax
 3e9:	29 c2                	sub    %eax,%edx
 3eb:	89 d0                	mov    %edx,%eax
}
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    

000003ef <strlen>:

uint
strlen(const char *s)
{
 3ef:	55                   	push   %ebp
 3f0:	89 e5                	mov    %esp,%ebp
 3f2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3fc:	eb 04                	jmp    402 <strlen+0x13>
 3fe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 402:	8b 55 fc             	mov    -0x4(%ebp),%edx
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	01 d0                	add    %edx,%eax
 40a:	0f b6 00             	movzbl (%eax),%eax
 40d:	84 c0                	test   %al,%al
 40f:	75 ed                	jne    3fe <strlen+0xf>
    ;
  return n;
 411:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memset>:

void*
memset(void *dst, int c, uint n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 41c:	8b 45 10             	mov    0x10(%ebp),%eax
 41f:	89 44 24 08          	mov    %eax,0x8(%esp)
 423:	8b 45 0c             	mov    0xc(%ebp),%eax
 426:	89 44 24 04          	mov    %eax,0x4(%esp)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	89 04 24             	mov    %eax,(%esp)
 430:	e8 26 ff ff ff       	call   35b <stosb>
  return dst;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
}
 438:	c9                   	leave  
 439:	c3                   	ret    

0000043a <strchr>:

char*
strchr(const char *s, char c)
{
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	83 ec 04             	sub    $0x4,%esp
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 446:	eb 14                	jmp    45c <strchr+0x22>
    if(*s == c)
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 451:	75 05                	jne    458 <strchr+0x1e>
      return (char*)s;
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	eb 13                	jmp    46b <strchr+0x31>
  for(; *s; s++)
 458:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 45c:	8b 45 08             	mov    0x8(%ebp),%eax
 45f:	0f b6 00             	movzbl (%eax),%eax
 462:	84 c0                	test   %al,%al
 464:	75 e2                	jne    448 <strchr+0xe>
  return 0;
 466:	b8 00 00 00 00       	mov    $0x0,%eax
}
 46b:	c9                   	leave  
 46c:	c3                   	ret    

0000046d <gets>:

char*
gets(char *buf, int max)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 473:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47a:	eb 4c                	jmp    4c8 <gets+0x5b>
    cc = read(0, &c, 1);
 47c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 483:	00 
 484:	8d 45 ef             	lea    -0x11(%ebp),%eax
 487:	89 44 24 04          	mov    %eax,0x4(%esp)
 48b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 492:	e8 68 02 00 00       	call   6ff <read>
 497:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 49e:	7f 02                	jg     4a2 <gets+0x35>
      break;
 4a0:	eb 31                	jmp    4d3 <gets+0x66>
    buf[i++] = c;
 4a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a5:	8d 50 01             	lea    0x1(%eax),%edx
 4a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ab:	89 c2                	mov    %eax,%edx
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
 4b0:	01 c2                	add    %eax,%edx
 4b2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b6:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bc:	3c 0a                	cmp    $0xa,%al
 4be:	74 13                	je     4d3 <gets+0x66>
 4c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c4:	3c 0d                	cmp    $0xd,%al
 4c6:	74 0b                	je     4d3 <gets+0x66>
  for(i=0; i+1 < max; ){
 4c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4cb:	83 c0 01             	add    $0x1,%eax
 4ce:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d1:	7c a9                	jl     47c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	01 d0                	add    %edx,%eax
 4db:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e1:	c9                   	leave  
 4e2:	c3                   	ret    

000004e3 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f0:	00 
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	89 04 24             	mov    %eax,(%esp)
 4f7:	e8 2b 02 00 00       	call   727 <open>
 4fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 503:	79 07                	jns    50c <stat+0x29>
    return -1;
 505:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50a:	eb 23                	jmp    52f <stat+0x4c>
  r = fstat(fd, st);
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	89 44 24 04          	mov    %eax,0x4(%esp)
 513:	8b 45 f4             	mov    -0xc(%ebp),%eax
 516:	89 04 24             	mov    %eax,(%esp)
 519:	e8 21 02 00 00       	call   73f <fstat>
 51e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
 524:	89 04 24             	mov    %eax,(%esp)
 527:	e8 e3 01 00 00       	call   70f <close>
  return r;
 52c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 52f:	c9                   	leave  
 530:	c3                   	ret    

00000531 <atoi>:

int
atoi(const char *s)
{
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 537:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 53e:	eb 25                	jmp    565 <atoi+0x34>
    n = n*10 + *s++ - '0';
 540:	8b 55 fc             	mov    -0x4(%ebp),%edx
 543:	89 d0                	mov    %edx,%eax
 545:	c1 e0 02             	shl    $0x2,%eax
 548:	01 d0                	add    %edx,%eax
 54a:	01 c0                	add    %eax,%eax
 54c:	89 c1                	mov    %eax,%ecx
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	8d 50 01             	lea    0x1(%eax),%edx
 554:	89 55 08             	mov    %edx,0x8(%ebp)
 557:	0f b6 00             	movzbl (%eax),%eax
 55a:	0f be c0             	movsbl %al,%eax
 55d:	01 c8                	add    %ecx,%eax
 55f:	83 e8 30             	sub    $0x30,%eax
 562:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	0f b6 00             	movzbl (%eax),%eax
 56b:	3c 2f                	cmp    $0x2f,%al
 56d:	7e 0a                	jle    579 <atoi+0x48>
 56f:	8b 45 08             	mov    0x8(%ebp),%eax
 572:	0f b6 00             	movzbl (%eax),%eax
 575:	3c 39                	cmp    $0x39,%al
 577:	7e c7                	jle    540 <atoi+0xf>
  return n;
 579:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 57c:	c9                   	leave  
 57d:	c3                   	ret    

0000057e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 57e:	55                   	push   %ebp
 57f:	89 e5                	mov    %esp,%ebp
 581:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58a:	8b 45 0c             	mov    0xc(%ebp),%eax
 58d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 590:	eb 17                	jmp    5a9 <memmove+0x2b>
    *dst++ = *src++;
 592:	8b 45 fc             	mov    -0x4(%ebp),%eax
 595:	8d 50 01             	lea    0x1(%eax),%edx
 598:	89 55 fc             	mov    %edx,-0x4(%ebp)
 59b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 59e:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a4:	0f b6 12             	movzbl (%edx),%edx
 5a7:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5a9:	8b 45 10             	mov    0x10(%ebp),%eax
 5ac:	8d 50 ff             	lea    -0x1(%eax),%edx
 5af:	89 55 10             	mov    %edx,0x10(%ebp)
 5b2:	85 c0                	test   %eax,%eax
 5b4:	7f dc                	jg     592 <memmove+0x14>
  return vdst;
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5b9:	c9                   	leave  
 5ba:	c3                   	ret    

000005bb <ps>:

void ps(void) {
 5bb:	55                   	push   %ebp
 5bc:	89 e5                	mov    %esp,%ebp
 5be:	57                   	push   %edi
 5bf:	56                   	push   %esi
 5c0:	53                   	push   %ebx
 5c1:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  getpinfo(&pstat);
 5c7:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 5cd:	89 04 24             	mov    %eax,(%esp)
 5d0:	e8 b2 01 00 00       	call   787 <getpinfo>

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 5d5:	c7 44 24 04 8d 0c 00 	movl   $0xc8d,0x4(%esp)
 5dc:	00 
 5dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5e4:	e8 8e 02 00 00       	call   877 <printf>

  int i = 0;
 5e9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for (i = 0; i < NPROC; ++i) {
 5f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5f7:	e9 ce 00 00 00       	jmp    6ca <ps+0x10f>
    if (pstat[i].inuse) {
 5fc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 5ff:	89 d0                	mov    %edx,%eax
 601:	c1 e0 03             	shl    $0x3,%eax
 604:	01 d0                	add    %edx,%eax
 606:	c1 e0 02             	shl    $0x2,%eax
 609:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 60c:	01 d8                	add    %ebx,%eax
 60e:	2d 04 09 00 00       	sub    $0x904,%eax
 613:	8b 00                	mov    (%eax),%eax
 615:	85 c0                	test   %eax,%eax
 617:	0f 84 a9 00 00 00    	je     6c6 <ps+0x10b>
      printf(1, "%d\t%d\t%d\t%c\t%s\n", pstat[i].pid, pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 61d:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 623:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 626:	89 d0                	mov    %edx,%eax
 628:	c1 e0 03             	shl    $0x3,%eax
 62b:	01 d0                	add    %edx,%eax
 62d:	c1 e0 02             	shl    $0x2,%eax
 630:	83 c0 10             	add    $0x10,%eax
 633:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 636:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 639:	89 d0                	mov    %edx,%eax
 63b:	c1 e0 03             	shl    $0x3,%eax
 63e:	01 d0                	add    %edx,%eax
 640:	c1 e0 02             	shl    $0x2,%eax
 643:	8d 75 e8             	lea    -0x18(%ebp),%esi
 646:	01 f0                	add    %esi,%eax
 648:	2d e4 08 00 00       	sub    $0x8e4,%eax
 64d:	0f b6 00             	movzbl (%eax),%eax
 650:	0f be f0             	movsbl %al,%esi
 653:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 656:	89 d0                	mov    %edx,%eax
 658:	c1 e0 03             	shl    $0x3,%eax
 65b:	01 d0                	add    %edx,%eax
 65d:	c1 e0 02             	shl    $0x2,%eax
 660:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 663:	01 c8                	add    %ecx,%eax
 665:	2d f8 08 00 00       	sub    $0x8f8,%eax
 66a:	8b 18                	mov    (%eax),%ebx
 66c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 66f:	89 d0                	mov    %edx,%eax
 671:	c1 e0 03             	shl    $0x3,%eax
 674:	01 d0                	add    %edx,%eax
 676:	c1 e0 02             	shl    $0x2,%eax
 679:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 67c:	01 c8                	add    %ecx,%eax
 67e:	2d 00 09 00 00       	sub    $0x900,%eax
 683:	8b 08                	mov    (%eax),%ecx
 685:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 688:	89 d0                	mov    %edx,%eax
 68a:	c1 e0 03             	shl    $0x3,%eax
 68d:	01 d0                	add    %edx,%eax
 68f:	c1 e0 02             	shl    $0x2,%eax
 692:	8d 55 e8             	lea    -0x18(%ebp),%edx
 695:	01 d0                	add    %edx,%eax
 697:	2d fc 08 00 00       	sub    $0x8fc,%eax
 69c:	8b 00                	mov    (%eax),%eax
 69e:	89 7c 24 18          	mov    %edi,0x18(%esp)
 6a2:	89 74 24 14          	mov    %esi,0x14(%esp)
 6a6:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 6aa:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 6ae:	89 44 24 08          	mov    %eax,0x8(%esp)
 6b2:	c7 44 24 04 a6 0c 00 	movl   $0xca6,0x4(%esp)
 6b9:	00 
 6ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6c1:	e8 b1 01 00 00       	call   877 <printf>
  for (i = 0; i < NPROC; ++i) {
 6c6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6ca:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 6ce:	0f 8e 28 ff ff ff    	jle    5fc <ps+0x41>
    }
  }
 6d4:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 6da:	5b                   	pop    %ebx
 6db:	5e                   	pop    %esi
 6dc:	5f                   	pop    %edi
 6dd:	5d                   	pop    %ebp
 6de:	c3                   	ret    

000006df <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6df:	b8 01 00 00 00       	mov    $0x1,%eax
 6e4:	cd 40                	int    $0x40
 6e6:	c3                   	ret    

000006e7 <exit>:
SYSCALL(exit)
 6e7:	b8 02 00 00 00       	mov    $0x2,%eax
 6ec:	cd 40                	int    $0x40
 6ee:	c3                   	ret    

000006ef <wait>:
SYSCALL(wait)
 6ef:	b8 03 00 00 00       	mov    $0x3,%eax
 6f4:	cd 40                	int    $0x40
 6f6:	c3                   	ret    

000006f7 <pipe>:
SYSCALL(pipe)
 6f7:	b8 04 00 00 00       	mov    $0x4,%eax
 6fc:	cd 40                	int    $0x40
 6fe:	c3                   	ret    

000006ff <read>:
SYSCALL(read)
 6ff:	b8 05 00 00 00       	mov    $0x5,%eax
 704:	cd 40                	int    $0x40
 706:	c3                   	ret    

00000707 <write>:
SYSCALL(write)
 707:	b8 10 00 00 00       	mov    $0x10,%eax
 70c:	cd 40                	int    $0x40
 70e:	c3                   	ret    

0000070f <close>:
SYSCALL(close)
 70f:	b8 15 00 00 00       	mov    $0x15,%eax
 714:	cd 40                	int    $0x40
 716:	c3                   	ret    

00000717 <kill>:
SYSCALL(kill)
 717:	b8 06 00 00 00       	mov    $0x6,%eax
 71c:	cd 40                	int    $0x40
 71e:	c3                   	ret    

0000071f <exec>:
SYSCALL(exec)
 71f:	b8 07 00 00 00       	mov    $0x7,%eax
 724:	cd 40                	int    $0x40
 726:	c3                   	ret    

00000727 <open>:
SYSCALL(open)
 727:	b8 0f 00 00 00       	mov    $0xf,%eax
 72c:	cd 40                	int    $0x40
 72e:	c3                   	ret    

0000072f <mknod>:
SYSCALL(mknod)
 72f:	b8 11 00 00 00       	mov    $0x11,%eax
 734:	cd 40                	int    $0x40
 736:	c3                   	ret    

00000737 <unlink>:
SYSCALL(unlink)
 737:	b8 12 00 00 00       	mov    $0x12,%eax
 73c:	cd 40                	int    $0x40
 73e:	c3                   	ret    

0000073f <fstat>:
SYSCALL(fstat)
 73f:	b8 08 00 00 00       	mov    $0x8,%eax
 744:	cd 40                	int    $0x40
 746:	c3                   	ret    

00000747 <link>:
SYSCALL(link)
 747:	b8 13 00 00 00       	mov    $0x13,%eax
 74c:	cd 40                	int    $0x40
 74e:	c3                   	ret    

0000074f <mkdir>:
SYSCALL(mkdir)
 74f:	b8 14 00 00 00       	mov    $0x14,%eax
 754:	cd 40                	int    $0x40
 756:	c3                   	ret    

00000757 <chdir>:
SYSCALL(chdir)
 757:	b8 09 00 00 00       	mov    $0x9,%eax
 75c:	cd 40                	int    $0x40
 75e:	c3                   	ret    

0000075f <dup>:
SYSCALL(dup)
 75f:	b8 0a 00 00 00       	mov    $0xa,%eax
 764:	cd 40                	int    $0x40
 766:	c3                   	ret    

00000767 <getpid>:
SYSCALL(getpid)
 767:	b8 0b 00 00 00       	mov    $0xb,%eax
 76c:	cd 40                	int    $0x40
 76e:	c3                   	ret    

0000076f <sbrk>:
SYSCALL(sbrk)
 76f:	b8 0c 00 00 00       	mov    $0xc,%eax
 774:	cd 40                	int    $0x40
 776:	c3                   	ret    

00000777 <sleep>:
SYSCALL(sleep)
 777:	b8 0d 00 00 00       	mov    $0xd,%eax
 77c:	cd 40                	int    $0x40
 77e:	c3                   	ret    

0000077f <uptime>:
SYSCALL(uptime)
 77f:	b8 0e 00 00 00       	mov    $0xe,%eax
 784:	cd 40                	int    $0x40
 786:	c3                   	ret    

00000787 <getpinfo>:
SYSCALL(getpinfo)
 787:	b8 16 00 00 00       	mov    $0x16,%eax
 78c:	cd 40                	int    $0x40
 78e:	c3                   	ret    

0000078f <settickets>:
 78f:	b8 17 00 00 00       	mov    $0x17,%eax
 794:	cd 40                	int    $0x40
 796:	c3                   	ret    

00000797 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 797:	55                   	push   %ebp
 798:	89 e5                	mov    %esp,%ebp
 79a:	83 ec 18             	sub    $0x18,%esp
 79d:	8b 45 0c             	mov    0xc(%ebp),%eax
 7a0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 7a3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7aa:	00 
 7ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
 7ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b2:	8b 45 08             	mov    0x8(%ebp),%eax
 7b5:	89 04 24             	mov    %eax,(%esp)
 7b8:	e8 4a ff ff ff       	call   707 <write>
}
 7bd:	c9                   	leave  
 7be:	c3                   	ret    

000007bf <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7bf:	55                   	push   %ebp
 7c0:	89 e5                	mov    %esp,%ebp
 7c2:	56                   	push   %esi
 7c3:	53                   	push   %ebx
 7c4:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 7ce:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7d2:	74 17                	je     7eb <printint+0x2c>
 7d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7d8:	79 11                	jns    7eb <printint+0x2c>
    neg = 1;
 7da:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e4:	f7 d8                	neg    %eax
 7e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7e9:	eb 06                	jmp    7f1 <printint+0x32>
  } else {
    x = xx;
 7eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 7ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7f8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 7fb:	8d 41 01             	lea    0x1(%ecx),%eax
 7fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
 801:	8b 5d 10             	mov    0x10(%ebp),%ebx
 804:	8b 45 ec             	mov    -0x14(%ebp),%eax
 807:	ba 00 00 00 00       	mov    $0x0,%edx
 80c:	f7 f3                	div    %ebx
 80e:	89 d0                	mov    %edx,%eax
 810:	0f b6 80 88 0f 00 00 	movzbl 0xf88(%eax),%eax
 817:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 81b:	8b 75 10             	mov    0x10(%ebp),%esi
 81e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 821:	ba 00 00 00 00       	mov    $0x0,%edx
 826:	f7 f6                	div    %esi
 828:	89 45 ec             	mov    %eax,-0x14(%ebp)
 82b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 82f:	75 c7                	jne    7f8 <printint+0x39>
  if(neg)
 831:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 835:	74 10                	je     847 <printint+0x88>
    buf[i++] = '-';
 837:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83a:	8d 50 01             	lea    0x1(%eax),%edx
 83d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 840:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 845:	eb 1f                	jmp    866 <printint+0xa7>
 847:	eb 1d                	jmp    866 <printint+0xa7>
    putc(fd, buf[i]);
 849:	8d 55 dc             	lea    -0x24(%ebp),%edx
 84c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84f:	01 d0                	add    %edx,%eax
 851:	0f b6 00             	movzbl (%eax),%eax
 854:	0f be c0             	movsbl %al,%eax
 857:	89 44 24 04          	mov    %eax,0x4(%esp)
 85b:	8b 45 08             	mov    0x8(%ebp),%eax
 85e:	89 04 24             	mov    %eax,(%esp)
 861:	e8 31 ff ff ff       	call   797 <putc>
  while(--i >= 0)
 866:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 86a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 86e:	79 d9                	jns    849 <printint+0x8a>
}
 870:	83 c4 30             	add    $0x30,%esp
 873:	5b                   	pop    %ebx
 874:	5e                   	pop    %esi
 875:	5d                   	pop    %ebp
 876:	c3                   	ret    

00000877 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 877:	55                   	push   %ebp
 878:	89 e5                	mov    %esp,%ebp
 87a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 87d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 884:	8d 45 0c             	lea    0xc(%ebp),%eax
 887:	83 c0 04             	add    $0x4,%eax
 88a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 88d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 894:	e9 7c 01 00 00       	jmp    a15 <printf+0x19e>
    c = fmt[i] & 0xff;
 899:	8b 55 0c             	mov    0xc(%ebp),%edx
 89c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89f:	01 d0                	add    %edx,%eax
 8a1:	0f b6 00             	movzbl (%eax),%eax
 8a4:	0f be c0             	movsbl %al,%eax
 8a7:	25 ff 00 00 00       	and    $0xff,%eax
 8ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 8af:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8b3:	75 2c                	jne    8e1 <printf+0x6a>
      if(c == '%'){
 8b5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8b9:	75 0c                	jne    8c7 <printf+0x50>
        state = '%';
 8bb:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 8c2:	e9 4a 01 00 00       	jmp    a11 <printf+0x19a>
      } else {
        putc(fd, c);
 8c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ca:	0f be c0             	movsbl %al,%eax
 8cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8d1:	8b 45 08             	mov    0x8(%ebp),%eax
 8d4:	89 04 24             	mov    %eax,(%esp)
 8d7:	e8 bb fe ff ff       	call   797 <putc>
 8dc:	e9 30 01 00 00       	jmp    a11 <printf+0x19a>
      }
    } else if(state == '%'){
 8e1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8e5:	0f 85 26 01 00 00    	jne    a11 <printf+0x19a>
      if(c == 'd'){
 8eb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8ef:	75 2d                	jne    91e <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8f4:	8b 00                	mov    (%eax),%eax
 8f6:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8fd:	00 
 8fe:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 905:	00 
 906:	89 44 24 04          	mov    %eax,0x4(%esp)
 90a:	8b 45 08             	mov    0x8(%ebp),%eax
 90d:	89 04 24             	mov    %eax,(%esp)
 910:	e8 aa fe ff ff       	call   7bf <printint>
        ap++;
 915:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 919:	e9 ec 00 00 00       	jmp    a0a <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 91e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 922:	74 06                	je     92a <printf+0xb3>
 924:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 928:	75 2d                	jne    957 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 92a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 92d:	8b 00                	mov    (%eax),%eax
 92f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 936:	00 
 937:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 93e:	00 
 93f:	89 44 24 04          	mov    %eax,0x4(%esp)
 943:	8b 45 08             	mov    0x8(%ebp),%eax
 946:	89 04 24             	mov    %eax,(%esp)
 949:	e8 71 fe ff ff       	call   7bf <printint>
        ap++;
 94e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 952:	e9 b3 00 00 00       	jmp    a0a <printf+0x193>
      } else if(c == 's'){
 957:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 95b:	75 45                	jne    9a2 <printf+0x12b>
        s = (char*)*ap;
 95d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 960:	8b 00                	mov    (%eax),%eax
 962:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 965:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 969:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 96d:	75 09                	jne    978 <printf+0x101>
          s = "(null)";
 96f:	c7 45 f4 b6 0c 00 00 	movl   $0xcb6,-0xc(%ebp)
        while(*s != 0){
 976:	eb 1e                	jmp    996 <printf+0x11f>
 978:	eb 1c                	jmp    996 <printf+0x11f>
          putc(fd, *s);
 97a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97d:	0f b6 00             	movzbl (%eax),%eax
 980:	0f be c0             	movsbl %al,%eax
 983:	89 44 24 04          	mov    %eax,0x4(%esp)
 987:	8b 45 08             	mov    0x8(%ebp),%eax
 98a:	89 04 24             	mov    %eax,(%esp)
 98d:	e8 05 fe ff ff       	call   797 <putc>
          s++;
 992:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 996:	8b 45 f4             	mov    -0xc(%ebp),%eax
 999:	0f b6 00             	movzbl (%eax),%eax
 99c:	84 c0                	test   %al,%al
 99e:	75 da                	jne    97a <printf+0x103>
 9a0:	eb 68                	jmp    a0a <printf+0x193>
        }
      } else if(c == 'c'){
 9a2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 9a6:	75 1d                	jne    9c5 <printf+0x14e>
        putc(fd, *ap);
 9a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9ab:	8b 00                	mov    (%eax),%eax
 9ad:	0f be c0             	movsbl %al,%eax
 9b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 9b4:	8b 45 08             	mov    0x8(%ebp),%eax
 9b7:	89 04 24             	mov    %eax,(%esp)
 9ba:	e8 d8 fd ff ff       	call   797 <putc>
        ap++;
 9bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9c3:	eb 45                	jmp    a0a <printf+0x193>
      } else if(c == '%'){
 9c5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9c9:	75 17                	jne    9e2 <printf+0x16b>
        putc(fd, c);
 9cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9ce:	0f be c0             	movsbl %al,%eax
 9d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 9d5:	8b 45 08             	mov    0x8(%ebp),%eax
 9d8:	89 04 24             	mov    %eax,(%esp)
 9db:	e8 b7 fd ff ff       	call   797 <putc>
 9e0:	eb 28                	jmp    a0a <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9e2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9e9:	00 
 9ea:	8b 45 08             	mov    0x8(%ebp),%eax
 9ed:	89 04 24             	mov    %eax,(%esp)
 9f0:	e8 a2 fd ff ff       	call   797 <putc>
        putc(fd, c);
 9f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9f8:	0f be c0             	movsbl %al,%eax
 9fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 9ff:	8b 45 08             	mov    0x8(%ebp),%eax
 a02:	89 04 24             	mov    %eax,(%esp)
 a05:	e8 8d fd ff ff       	call   797 <putc>
      }
      state = 0;
 a0a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 a11:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a15:	8b 55 0c             	mov    0xc(%ebp),%edx
 a18:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a1b:	01 d0                	add    %edx,%eax
 a1d:	0f b6 00             	movzbl (%eax),%eax
 a20:	84 c0                	test   %al,%al
 a22:	0f 85 71 fe ff ff    	jne    899 <printf+0x22>
    }
  }
}
 a28:	c9                   	leave  
 a29:	c3                   	ret    

00000a2a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a2a:	55                   	push   %ebp
 a2b:	89 e5                	mov    %esp,%ebp
 a2d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a30:	8b 45 08             	mov    0x8(%ebp),%eax
 a33:	83 e8 08             	sub    $0x8,%eax
 a36:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a39:	a1 b4 0f 00 00       	mov    0xfb4,%eax
 a3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a41:	eb 24                	jmp    a67 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a43:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a46:	8b 00                	mov    (%eax),%eax
 a48:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a4b:	77 12                	ja     a5f <free+0x35>
 a4d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a50:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a53:	77 24                	ja     a79 <free+0x4f>
 a55:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a58:	8b 00                	mov    (%eax),%eax
 a5a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a5d:	77 1a                	ja     a79 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a62:	8b 00                	mov    (%eax),%eax
 a64:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a67:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a6a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a6d:	76 d4                	jbe    a43 <free+0x19>
 a6f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a72:	8b 00                	mov    (%eax),%eax
 a74:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a77:	76 ca                	jbe    a43 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a79:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a7c:	8b 40 04             	mov    0x4(%eax),%eax
 a7f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a86:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a89:	01 c2                	add    %eax,%edx
 a8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a8e:	8b 00                	mov    (%eax),%eax
 a90:	39 c2                	cmp    %eax,%edx
 a92:	75 24                	jne    ab8 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a94:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a97:	8b 50 04             	mov    0x4(%eax),%edx
 a9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a9d:	8b 00                	mov    (%eax),%eax
 a9f:	8b 40 04             	mov    0x4(%eax),%eax
 aa2:	01 c2                	add    %eax,%edx
 aa4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aa7:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 aaa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aad:	8b 00                	mov    (%eax),%eax
 aaf:	8b 10                	mov    (%eax),%edx
 ab1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ab4:	89 10                	mov    %edx,(%eax)
 ab6:	eb 0a                	jmp    ac2 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 ab8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 abb:	8b 10                	mov    (%eax),%edx
 abd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ac0:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 ac2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac5:	8b 40 04             	mov    0x4(%eax),%eax
 ac8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 acf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad2:	01 d0                	add    %edx,%eax
 ad4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ad7:	75 20                	jne    af9 <free+0xcf>
    p->s.size += bp->s.size;
 ad9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 adc:	8b 50 04             	mov    0x4(%eax),%edx
 adf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ae2:	8b 40 04             	mov    0x4(%eax),%eax
 ae5:	01 c2                	add    %eax,%edx
 ae7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aea:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 aed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 af0:	8b 10                	mov    (%eax),%edx
 af2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af5:	89 10                	mov    %edx,(%eax)
 af7:	eb 08                	jmp    b01 <free+0xd7>
  } else
    p->s.ptr = bp;
 af9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 afc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 aff:	89 10                	mov    %edx,(%eax)
  freep = p;
 b01:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b04:	a3 b4 0f 00 00       	mov    %eax,0xfb4
}
 b09:	c9                   	leave  
 b0a:	c3                   	ret    

00000b0b <morecore>:

static Header*
morecore(uint nu)
{
 b0b:	55                   	push   %ebp
 b0c:	89 e5                	mov    %esp,%ebp
 b0e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b11:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b18:	77 07                	ja     b21 <morecore+0x16>
    nu = 4096;
 b1a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b21:	8b 45 08             	mov    0x8(%ebp),%eax
 b24:	c1 e0 03             	shl    $0x3,%eax
 b27:	89 04 24             	mov    %eax,(%esp)
 b2a:	e8 40 fc ff ff       	call   76f <sbrk>
 b2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b32:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b36:	75 07                	jne    b3f <morecore+0x34>
    return 0;
 b38:	b8 00 00 00 00       	mov    $0x0,%eax
 b3d:	eb 22                	jmp    b61 <morecore+0x56>
  hp = (Header*)p;
 b3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b42:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b45:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b48:	8b 55 08             	mov    0x8(%ebp),%edx
 b4b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b51:	83 c0 08             	add    $0x8,%eax
 b54:	89 04 24             	mov    %eax,(%esp)
 b57:	e8 ce fe ff ff       	call   a2a <free>
  return freep;
 b5c:	a1 b4 0f 00 00       	mov    0xfb4,%eax
}
 b61:	c9                   	leave  
 b62:	c3                   	ret    

00000b63 <malloc>:

void*
malloc(uint nbytes)
{
 b63:	55                   	push   %ebp
 b64:	89 e5                	mov    %esp,%ebp
 b66:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b69:	8b 45 08             	mov    0x8(%ebp),%eax
 b6c:	83 c0 07             	add    $0x7,%eax
 b6f:	c1 e8 03             	shr    $0x3,%eax
 b72:	83 c0 01             	add    $0x1,%eax
 b75:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b78:	a1 b4 0f 00 00       	mov    0xfb4,%eax
 b7d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b80:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b84:	75 23                	jne    ba9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b86:	c7 45 f0 ac 0f 00 00 	movl   $0xfac,-0x10(%ebp)
 b8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b90:	a3 b4 0f 00 00       	mov    %eax,0xfb4
 b95:	a1 b4 0f 00 00       	mov    0xfb4,%eax
 b9a:	a3 ac 0f 00 00       	mov    %eax,0xfac
    base.s.size = 0;
 b9f:	c7 05 b0 0f 00 00 00 	movl   $0x0,0xfb0
 ba6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ba9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bac:	8b 00                	mov    (%eax),%eax
 bae:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb4:	8b 40 04             	mov    0x4(%eax),%eax
 bb7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bba:	72 4d                	jb     c09 <malloc+0xa6>
      if(p->s.size == nunits)
 bbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bbf:	8b 40 04             	mov    0x4(%eax),%eax
 bc2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bc5:	75 0c                	jne    bd3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bca:	8b 10                	mov    (%eax),%edx
 bcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bcf:	89 10                	mov    %edx,(%eax)
 bd1:	eb 26                	jmp    bf9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 bd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd6:	8b 40 04             	mov    0x4(%eax),%eax
 bd9:	2b 45 ec             	sub    -0x14(%ebp),%eax
 bdc:	89 c2                	mov    %eax,%edx
 bde:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 be4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be7:	8b 40 04             	mov    0x4(%eax),%eax
 bea:	c1 e0 03             	shl    $0x3,%eax
 bed:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 bf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 bf6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 bf9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bfc:	a3 b4 0f 00 00       	mov    %eax,0xfb4
      return (void*)(p + 1);
 c01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c04:	83 c0 08             	add    $0x8,%eax
 c07:	eb 38                	jmp    c41 <malloc+0xde>
    }
    if(p == freep)
 c09:	a1 b4 0f 00 00       	mov    0xfb4,%eax
 c0e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c11:	75 1b                	jne    c2e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c13:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c16:	89 04 24             	mov    %eax,(%esp)
 c19:	e8 ed fe ff ff       	call   b0b <morecore>
 c1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c21:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c25:	75 07                	jne    c2e <malloc+0xcb>
        return 0;
 c27:	b8 00 00 00 00       	mov    $0x0,%eax
 c2c:	eb 13                	jmp    c41 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c31:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c34:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c37:	8b 00                	mov    (%eax),%eax
 c39:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c3c:	e9 70 ff ff ff       	jmp    bb1 <malloc+0x4e>
}
 c41:	c9                   	leave  
 c42:	c3                   	ret    
