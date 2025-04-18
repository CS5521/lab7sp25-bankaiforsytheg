
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
  61:	c7 04 24 94 0f 00 00 	movl   $0xf94,(%esp)
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
  8c:	05 94 0f 00 00       	add    $0xf94,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 71 03 00 00       	call   416 <memset>
  return buf;
  a5:	b8 94 0f 00 00       	mov    $0xf94,%eax
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
  df:	c7 44 24 04 3b 0c 00 	movl   $0xc3b,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 7c 07 00 00       	call   86f <printf>
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
 118:	c7 44 24 04 4f 0c 00 	movl   $0xc4f,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 43 07 00 00       	call   86f <printf>
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
 183:	c7 44 24 04 63 0c 00 	movl   $0xc63,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 d8 06 00 00       	call   86f <printf>
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
 1b1:	c7 44 24 04 70 0c 00 	movl   $0xc70,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 aa 06 00 00       	call   86f <printf>
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
 269:	c7 44 24 04 4f 0c 00 	movl   $0xc4f,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 f2 05 00 00       	call   86f <printf>
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
 2b3:	c7 44 24 04 63 0c 00 	movl   $0xc63,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 a8 05 00 00       	call   86f <printf>
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
 313:	c7 04 24 83 0c 00 00 	movl   $0xc83,(%esp)
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

  // Print the information TODOWHAT

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 5d5:	c7 44 24 04 85 0c 00 	movl   $0xc85,0x4(%esp)
 5dc:	00 
 5dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5e4:	e8 86 02 00 00       	call   86f <printf>

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
 6b2:	c7 44 24 04 9e 0c 00 	movl   $0xc9e,0x4(%esp)
 6b9:	00 
 6ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6c1:	e8 a9 01 00 00       	call   86f <printf>
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

0000078f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 78f:	55                   	push   %ebp
 790:	89 e5                	mov    %esp,%ebp
 792:	83 ec 18             	sub    $0x18,%esp
 795:	8b 45 0c             	mov    0xc(%ebp),%eax
 798:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 79b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7a2:	00 
 7a3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 7a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7aa:	8b 45 08             	mov    0x8(%ebp),%eax
 7ad:	89 04 24             	mov    %eax,(%esp)
 7b0:	e8 52 ff ff ff       	call   707 <write>
}
 7b5:	c9                   	leave  
 7b6:	c3                   	ret    

000007b7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7b7:	55                   	push   %ebp
 7b8:	89 e5                	mov    %esp,%ebp
 7ba:	56                   	push   %esi
 7bb:	53                   	push   %ebx
 7bc:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 7c6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7ca:	74 17                	je     7e3 <printint+0x2c>
 7cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7d0:	79 11                	jns    7e3 <printint+0x2c>
    neg = 1;
 7d2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 7dc:	f7 d8                	neg    %eax
 7de:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7e1:	eb 06                	jmp    7e9 <printint+0x32>
  } else {
    x = xx;
 7e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7f0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 7f3:	8d 41 01             	lea    0x1(%ecx),%eax
 7f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7f9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ff:	ba 00 00 00 00       	mov    $0x0,%edx
 804:	f7 f3                	div    %ebx
 806:	89 d0                	mov    %edx,%eax
 808:	0f b6 80 80 0f 00 00 	movzbl 0xf80(%eax),%eax
 80f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 813:	8b 75 10             	mov    0x10(%ebp),%esi
 816:	8b 45 ec             	mov    -0x14(%ebp),%eax
 819:	ba 00 00 00 00       	mov    $0x0,%edx
 81e:	f7 f6                	div    %esi
 820:	89 45 ec             	mov    %eax,-0x14(%ebp)
 823:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 827:	75 c7                	jne    7f0 <printint+0x39>
  if(neg)
 829:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 82d:	74 10                	je     83f <printint+0x88>
    buf[i++] = '-';
 82f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 832:	8d 50 01             	lea    0x1(%eax),%edx
 835:	89 55 f4             	mov    %edx,-0xc(%ebp)
 838:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 83d:	eb 1f                	jmp    85e <printint+0xa7>
 83f:	eb 1d                	jmp    85e <printint+0xa7>
    putc(fd, buf[i]);
 841:	8d 55 dc             	lea    -0x24(%ebp),%edx
 844:	8b 45 f4             	mov    -0xc(%ebp),%eax
 847:	01 d0                	add    %edx,%eax
 849:	0f b6 00             	movzbl (%eax),%eax
 84c:	0f be c0             	movsbl %al,%eax
 84f:	89 44 24 04          	mov    %eax,0x4(%esp)
 853:	8b 45 08             	mov    0x8(%ebp),%eax
 856:	89 04 24             	mov    %eax,(%esp)
 859:	e8 31 ff ff ff       	call   78f <putc>
  while(--i >= 0)
 85e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 862:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 866:	79 d9                	jns    841 <printint+0x8a>
}
 868:	83 c4 30             	add    $0x30,%esp
 86b:	5b                   	pop    %ebx
 86c:	5e                   	pop    %esi
 86d:	5d                   	pop    %ebp
 86e:	c3                   	ret    

0000086f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 86f:	55                   	push   %ebp
 870:	89 e5                	mov    %esp,%ebp
 872:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 875:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 87c:	8d 45 0c             	lea    0xc(%ebp),%eax
 87f:	83 c0 04             	add    $0x4,%eax
 882:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 885:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 88c:	e9 7c 01 00 00       	jmp    a0d <printf+0x19e>
    c = fmt[i] & 0xff;
 891:	8b 55 0c             	mov    0xc(%ebp),%edx
 894:	8b 45 f0             	mov    -0x10(%ebp),%eax
 897:	01 d0                	add    %edx,%eax
 899:	0f b6 00             	movzbl (%eax),%eax
 89c:	0f be c0             	movsbl %al,%eax
 89f:	25 ff 00 00 00       	and    $0xff,%eax
 8a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 8a7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8ab:	75 2c                	jne    8d9 <printf+0x6a>
      if(c == '%'){
 8ad:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8b1:	75 0c                	jne    8bf <printf+0x50>
        state = '%';
 8b3:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 8ba:	e9 4a 01 00 00       	jmp    a09 <printf+0x19a>
      } else {
        putc(fd, c);
 8bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c2:	0f be c0             	movsbl %al,%eax
 8c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c9:	8b 45 08             	mov    0x8(%ebp),%eax
 8cc:	89 04 24             	mov    %eax,(%esp)
 8cf:	e8 bb fe ff ff       	call   78f <putc>
 8d4:	e9 30 01 00 00       	jmp    a09 <printf+0x19a>
      }
    } else if(state == '%'){
 8d9:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8dd:	0f 85 26 01 00 00    	jne    a09 <printf+0x19a>
      if(c == 'd'){
 8e3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8e7:	75 2d                	jne    916 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8ec:	8b 00                	mov    (%eax),%eax
 8ee:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8f5:	00 
 8f6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8fd:	00 
 8fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 902:	8b 45 08             	mov    0x8(%ebp),%eax
 905:	89 04 24             	mov    %eax,(%esp)
 908:	e8 aa fe ff ff       	call   7b7 <printint>
        ap++;
 90d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 911:	e9 ec 00 00 00       	jmp    a02 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 916:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 91a:	74 06                	je     922 <printf+0xb3>
 91c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 920:	75 2d                	jne    94f <printf+0xe0>
        printint(fd, *ap, 16, 0);
 922:	8b 45 e8             	mov    -0x18(%ebp),%eax
 925:	8b 00                	mov    (%eax),%eax
 927:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 92e:	00 
 92f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 936:	00 
 937:	89 44 24 04          	mov    %eax,0x4(%esp)
 93b:	8b 45 08             	mov    0x8(%ebp),%eax
 93e:	89 04 24             	mov    %eax,(%esp)
 941:	e8 71 fe ff ff       	call   7b7 <printint>
        ap++;
 946:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 94a:	e9 b3 00 00 00       	jmp    a02 <printf+0x193>
      } else if(c == 's'){
 94f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 953:	75 45                	jne    99a <printf+0x12b>
        s = (char*)*ap;
 955:	8b 45 e8             	mov    -0x18(%ebp),%eax
 958:	8b 00                	mov    (%eax),%eax
 95a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 95d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 961:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 965:	75 09                	jne    970 <printf+0x101>
          s = "(null)";
 967:	c7 45 f4 ae 0c 00 00 	movl   $0xcae,-0xc(%ebp)
        while(*s != 0){
 96e:	eb 1e                	jmp    98e <printf+0x11f>
 970:	eb 1c                	jmp    98e <printf+0x11f>
          putc(fd, *s);
 972:	8b 45 f4             	mov    -0xc(%ebp),%eax
 975:	0f b6 00             	movzbl (%eax),%eax
 978:	0f be c0             	movsbl %al,%eax
 97b:	89 44 24 04          	mov    %eax,0x4(%esp)
 97f:	8b 45 08             	mov    0x8(%ebp),%eax
 982:	89 04 24             	mov    %eax,(%esp)
 985:	e8 05 fe ff ff       	call   78f <putc>
          s++;
 98a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 98e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 991:	0f b6 00             	movzbl (%eax),%eax
 994:	84 c0                	test   %al,%al
 996:	75 da                	jne    972 <printf+0x103>
 998:	eb 68                	jmp    a02 <printf+0x193>
        }
      } else if(c == 'c'){
 99a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 99e:	75 1d                	jne    9bd <printf+0x14e>
        putc(fd, *ap);
 9a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9a3:	8b 00                	mov    (%eax),%eax
 9a5:	0f be c0             	movsbl %al,%eax
 9a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 9ac:	8b 45 08             	mov    0x8(%ebp),%eax
 9af:	89 04 24             	mov    %eax,(%esp)
 9b2:	e8 d8 fd ff ff       	call   78f <putc>
        ap++;
 9b7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9bb:	eb 45                	jmp    a02 <printf+0x193>
      } else if(c == '%'){
 9bd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9c1:	75 17                	jne    9da <printf+0x16b>
        putc(fd, c);
 9c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9c6:	0f be c0             	movsbl %al,%eax
 9c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 9cd:	8b 45 08             	mov    0x8(%ebp),%eax
 9d0:	89 04 24             	mov    %eax,(%esp)
 9d3:	e8 b7 fd ff ff       	call   78f <putc>
 9d8:	eb 28                	jmp    a02 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9da:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9e1:	00 
 9e2:	8b 45 08             	mov    0x8(%ebp),%eax
 9e5:	89 04 24             	mov    %eax,(%esp)
 9e8:	e8 a2 fd ff ff       	call   78f <putc>
        putc(fd, c);
 9ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9f0:	0f be c0             	movsbl %al,%eax
 9f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 9f7:	8b 45 08             	mov    0x8(%ebp),%eax
 9fa:	89 04 24             	mov    %eax,(%esp)
 9fd:	e8 8d fd ff ff       	call   78f <putc>
      }
      state = 0;
 a02:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 a09:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a0d:	8b 55 0c             	mov    0xc(%ebp),%edx
 a10:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a13:	01 d0                	add    %edx,%eax
 a15:	0f b6 00             	movzbl (%eax),%eax
 a18:	84 c0                	test   %al,%al
 a1a:	0f 85 71 fe ff ff    	jne    891 <printf+0x22>
    }
  }
}
 a20:	c9                   	leave  
 a21:	c3                   	ret    

00000a22 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a22:	55                   	push   %ebp
 a23:	89 e5                	mov    %esp,%ebp
 a25:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a28:	8b 45 08             	mov    0x8(%ebp),%eax
 a2b:	83 e8 08             	sub    $0x8,%eax
 a2e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a31:	a1 ac 0f 00 00       	mov    0xfac,%eax
 a36:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a39:	eb 24                	jmp    a5f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a3e:	8b 00                	mov    (%eax),%eax
 a40:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a43:	77 12                	ja     a57 <free+0x35>
 a45:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a48:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a4b:	77 24                	ja     a71 <free+0x4f>
 a4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a50:	8b 00                	mov    (%eax),%eax
 a52:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a55:	77 1a                	ja     a71 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a57:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a5a:	8b 00                	mov    (%eax),%eax
 a5c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a5f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a62:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a65:	76 d4                	jbe    a3b <free+0x19>
 a67:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a6a:	8b 00                	mov    (%eax),%eax
 a6c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a6f:	76 ca                	jbe    a3b <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a71:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a74:	8b 40 04             	mov    0x4(%eax),%eax
 a77:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a7e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a81:	01 c2                	add    %eax,%edx
 a83:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a86:	8b 00                	mov    (%eax),%eax
 a88:	39 c2                	cmp    %eax,%edx
 a8a:	75 24                	jne    ab0 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a8c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a8f:	8b 50 04             	mov    0x4(%eax),%edx
 a92:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a95:	8b 00                	mov    (%eax),%eax
 a97:	8b 40 04             	mov    0x4(%eax),%eax
 a9a:	01 c2                	add    %eax,%edx
 a9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a9f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 aa2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa5:	8b 00                	mov    (%eax),%eax
 aa7:	8b 10                	mov    (%eax),%edx
 aa9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aac:	89 10                	mov    %edx,(%eax)
 aae:	eb 0a                	jmp    aba <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 ab0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab3:	8b 10                	mov    (%eax),%edx
 ab5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ab8:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 aba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 abd:	8b 40 04             	mov    0x4(%eax),%eax
 ac0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 ac7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aca:	01 d0                	add    %edx,%eax
 acc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 acf:	75 20                	jne    af1 <free+0xcf>
    p->s.size += bp->s.size;
 ad1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad4:	8b 50 04             	mov    0x4(%eax),%edx
 ad7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ada:	8b 40 04             	mov    0x4(%eax),%eax
 add:	01 c2                	add    %eax,%edx
 adf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 ae5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ae8:	8b 10                	mov    (%eax),%edx
 aea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aed:	89 10                	mov    %edx,(%eax)
 aef:	eb 08                	jmp    af9 <free+0xd7>
  } else
    p->s.ptr = bp;
 af1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 af7:	89 10                	mov    %edx,(%eax)
  freep = p;
 af9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 afc:	a3 ac 0f 00 00       	mov    %eax,0xfac
}
 b01:	c9                   	leave  
 b02:	c3                   	ret    

00000b03 <morecore>:

static Header*
morecore(uint nu)
{
 b03:	55                   	push   %ebp
 b04:	89 e5                	mov    %esp,%ebp
 b06:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b09:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b10:	77 07                	ja     b19 <morecore+0x16>
    nu = 4096;
 b12:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b19:	8b 45 08             	mov    0x8(%ebp),%eax
 b1c:	c1 e0 03             	shl    $0x3,%eax
 b1f:	89 04 24             	mov    %eax,(%esp)
 b22:	e8 48 fc ff ff       	call   76f <sbrk>
 b27:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b2a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b2e:	75 07                	jne    b37 <morecore+0x34>
    return 0;
 b30:	b8 00 00 00 00       	mov    $0x0,%eax
 b35:	eb 22                	jmp    b59 <morecore+0x56>
  hp = (Header*)p;
 b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b40:	8b 55 08             	mov    0x8(%ebp),%edx
 b43:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b46:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b49:	83 c0 08             	add    $0x8,%eax
 b4c:	89 04 24             	mov    %eax,(%esp)
 b4f:	e8 ce fe ff ff       	call   a22 <free>
  return freep;
 b54:	a1 ac 0f 00 00       	mov    0xfac,%eax
}
 b59:	c9                   	leave  
 b5a:	c3                   	ret    

00000b5b <malloc>:

void*
malloc(uint nbytes)
{
 b5b:	55                   	push   %ebp
 b5c:	89 e5                	mov    %esp,%ebp
 b5e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b61:	8b 45 08             	mov    0x8(%ebp),%eax
 b64:	83 c0 07             	add    $0x7,%eax
 b67:	c1 e8 03             	shr    $0x3,%eax
 b6a:	83 c0 01             	add    $0x1,%eax
 b6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b70:	a1 ac 0f 00 00       	mov    0xfac,%eax
 b75:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b78:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b7c:	75 23                	jne    ba1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b7e:	c7 45 f0 a4 0f 00 00 	movl   $0xfa4,-0x10(%ebp)
 b85:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b88:	a3 ac 0f 00 00       	mov    %eax,0xfac
 b8d:	a1 ac 0f 00 00       	mov    0xfac,%eax
 b92:	a3 a4 0f 00 00       	mov    %eax,0xfa4
    base.s.size = 0;
 b97:	c7 05 a8 0f 00 00 00 	movl   $0x0,0xfa8
 b9e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ba4:	8b 00                	mov    (%eax),%eax
 ba6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 ba9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bac:	8b 40 04             	mov    0x4(%eax),%eax
 baf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bb2:	72 4d                	jb     c01 <malloc+0xa6>
      if(p->s.size == nunits)
 bb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb7:	8b 40 04             	mov    0x4(%eax),%eax
 bba:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bbd:	75 0c                	jne    bcb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 bbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc2:	8b 10                	mov    (%eax),%edx
 bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bc7:	89 10                	mov    %edx,(%eax)
 bc9:	eb 26                	jmp    bf1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 bcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bce:	8b 40 04             	mov    0x4(%eax),%eax
 bd1:	2b 45 ec             	sub    -0x14(%ebp),%eax
 bd4:	89 c2                	mov    %eax,%edx
 bd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 bdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bdf:	8b 40 04             	mov    0x4(%eax),%eax
 be2:	c1 e0 03             	shl    $0x3,%eax
 be5:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 be8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 beb:	8b 55 ec             	mov    -0x14(%ebp),%edx
 bee:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 bf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bf4:	a3 ac 0f 00 00       	mov    %eax,0xfac
      return (void*)(p + 1);
 bf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bfc:	83 c0 08             	add    $0x8,%eax
 bff:	eb 38                	jmp    c39 <malloc+0xde>
    }
    if(p == freep)
 c01:	a1 ac 0f 00 00       	mov    0xfac,%eax
 c06:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c09:	75 1b                	jne    c26 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c0e:	89 04 24             	mov    %eax,(%esp)
 c11:	e8 ed fe ff ff       	call   b03 <morecore>
 c16:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c19:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c1d:	75 07                	jne    c26 <malloc+0xcb>
        return 0;
 c1f:	b8 00 00 00 00       	mov    $0x0,%eax
 c24:	eb 13                	jmp    c39 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c26:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c29:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c2f:	8b 00                	mov    (%eax),%eax
 c31:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c34:	e9 70 ff ff ff       	jmp    ba9 <malloc+0x4e>
}
 c39:	c9                   	leave  
 c3a:	c3                   	ret    
