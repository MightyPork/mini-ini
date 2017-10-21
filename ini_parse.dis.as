
build/ini_parse.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <ini_parse_reset_partial>:
static char valbuf[INI_VALUE_MAX];

// See header for doxygen!

void ini_parse_reset_partial(void)
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
	buff_i = 0;
   4:	c7 05 00 00 00 00 00 	movl   $0x0,0x0(%rip)        # e <ini_parse_reset_partial+0xe>
   b:	00 00 00 
	value_quote = 0;
   e:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 15 <ini_parse_reset_partial+0x15>
	value_nextesc = false;
  15:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 1c <ini_parse_reset_partial+0x1c>
}
  1c:	90                   	nop
  1d:	5d                   	pop    %rbp
  1e:	c3                   	retq   

000000000000001f <ini_parse_reset>:

void ini_parse_reset(void)
{
  1f:	55                   	push   %rbp
  20:	48 89 e5             	mov    %rsp,%rbp
	ini_parse_reset_partial();
  23:	e8 00 00 00 00       	callq  28 <ini_parse_reset+0x9>
	keybuf[0] = secbuf[0] = valbuf[0] = 0;
  28:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 2f <ini_parse_reset+0x10>
  2f:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 36 <ini_parse_reset+0x17>
  36:	88 05 00 00 00 00    	mov    %al,0x0(%rip)        # 3c <ini_parse_reset+0x1d>
  3c:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 43 <ini_parse_reset+0x24>
  43:	88 05 00 00 00 00    	mov    %al,0x0(%rip)        # 49 <ini_parse_reset+0x2a>
	
/* #line 68 "src/ini_parse.c" */
	{
	cs = ini_start;
  49:	b8 01 00 00 00       	mov    $0x1,%eax
  4e:	88 05 00 00 00 00    	mov    %al,0x0(%rip)        # 54 <ini_parse_reset+0x35>
	}

/* #line 42 "src/ini_parse.rl" */
}
  54:	90                   	nop
  55:	5d                   	pop    %rbp
  56:	c3                   	retq   

0000000000000057 <ini_parser_error>:

void ini_parser_error(const char* msg)
{
  57:	55                   	push   %rbp
  58:	48 89 e5             	mov    %rsp,%rbp
  5b:	48 83 ec 10          	sub    $0x10,%rsp
  5f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
	ini_error("Parser error: %s", msg);
  63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  67:	48 89 c6             	mov    %rax,%rsi
  6a:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 71 <ini_parser_error+0x1a>
  71:	b8 00 00 00 00       	mov    $0x0,%eax
  76:	e8 00 00 00 00       	callq  7b <ini_parser_error+0x24>
  7b:	bf 0a 00 00 00       	mov    $0xa,%edi
  80:	e8 00 00 00 00       	callq  85 <ini_parser_error+0x2e>
	ini_parse_reset_partial();
  85:	e8 00 00 00 00       	callq  8a <ini_parser_error+0x33>
}
  8a:	90                   	nop
  8b:	c9                   	leaveq 
  8c:	c3                   	retq   

000000000000008d <ini_parse_begin>:


void ini_parse_begin(IniParserCallback callback, void *userData)
{
  8d:	55                   	push   %rbp
  8e:	48 89 e5             	mov    %rsp,%rbp
  91:	48 83 ec 10          	sub    $0x10,%rsp
  95:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  99:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
	keyCallback = callback;
  9d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  a1:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # a8 <ini_parse_begin+0x1b>
	userdata = userData;
  a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  ac:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # b3 <ini_parse_begin+0x26>
	ini_parse_reset();
  b3:	e8 00 00 00 00       	callq  b8 <ini_parse_begin+0x2b>
}
  b8:	90                   	nop
  b9:	c9                   	leaveq 
  ba:	c3                   	retq   

00000000000000bb <ini_parse_end>:


void *ini_parse_end(void)
{
  bb:	55                   	push   %rbp
  bc:	48 89 e5             	mov    %rsp,%rbp
  bf:	48 83 ec 10          	sub    $0x10,%rsp
	ini_parse("\n", 1);
  c3:	be 01 00 00 00       	mov    $0x1,%esi
  c8:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # cf <ini_parse_end+0x14>
  cf:	e8 00 00 00 00       	callq  d4 <ini_parse_end+0x19>
	if (keyCallback) {
  d4:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # db <ini_parse_end+0x20>
  db:	48 85 c0             	test   %rax,%rax
  de:	74 0b                	je     eb <ini_parse_end+0x30>
		keyCallback = NULL;
  e0:	48 c7 05 00 00 00 00 	movq   $0x0,0x0(%rip)        # eb <ini_parse_end+0x30>
  e7:	00 00 00 00 
	}

	void *ud = userdata;
  eb:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # f2 <ini_parse_end+0x37>
  f2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
	userdata = NULL;
  f6:	48 c7 05 00 00 00 00 	movq   $0x0,0x0(%rip)        # 101 <ini_parse_end+0x46>
  fd:	00 00 00 00 
	return ud;
 101:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
 105:	c9                   	leaveq 
 106:	c3                   	retq   

0000000000000107 <ini_parse_file>:


void ini_parse_file(const char *text, size_t len, IniParserCallback callback, void *userData)
{
 107:	55                   	push   %rbp
 108:	48 89 e5             	mov    %rsp,%rbp
 10b:	48 83 ec 20          	sub    $0x20,%rsp
 10f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 113:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 117:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
 11b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
	ini_parse_begin(callback, userData);
 11f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
 123:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 127:	48 89 d6             	mov    %rdx,%rsi
 12a:	48 89 c7             	mov    %rax,%rdi
 12d:	e8 00 00 00 00       	callq  132 <ini_parse_file+0x2b>
	ini_parse(text, len);
 132:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 136:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 13a:	48 89 d6             	mov    %rdx,%rsi
 13d:	48 89 c7             	mov    %rax,%rdi
 140:	e8 00 00 00 00       	callq  145 <ini_parse_file+0x3e>
	ini_parse_end();
 145:	e8 00 00 00 00       	callq  14a <ini_parse_file+0x43>
}
 14a:	90                   	nop
 14b:	c9                   	leaveq 
 14c:	c3                   	retq   

000000000000014d <rtrim_buf>:

static void rtrim_buf(char *buf, int32_t end)
{
 14d:	55                   	push   %rbp
 14e:	48 89 e5             	mov    %rsp,%rbp
 151:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 155:	89 75 f4             	mov    %esi,-0xc(%rbp)
	if (end > 0) {
 158:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
 15c:	7e 1c                	jle    17a <rtrim_buf+0x2d>
		while ((uint8_t)buf[--end] < 33);
 15e:	83 6d f4 01          	subl   $0x1,-0xc(%rbp)
 162:	8b 45 f4             	mov    -0xc(%rbp),%eax
 165:	48 63 d0             	movslq %eax,%rdx
 168:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 16c:	48 01 d0             	add    %rdx,%rax
 16f:	0f b6 00             	movzbl (%rax),%eax
 172:	3c 20                	cmp    $0x20,%al
 174:	76 e8                	jbe    15e <rtrim_buf+0x11>
		end++; // go past the last character
 176:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
	}

	buf[end] = 0;
 17a:	8b 45 f4             	mov    -0xc(%rbp),%eax
 17d:	48 63 d0             	movslq %eax,%rdx
 180:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 184:	48 01 d0             	add    %rdx,%rax
 187:	c6 00 00             	movb   $0x0,(%rax)
}
 18a:	90                   	nop
 18b:	5d                   	pop    %rbp
 18c:	c3                   	retq   

000000000000018d <ini_parse>:


void ini_parse(const char *newstr, size_t len)
{
 18d:	55                   	push   %rbp
 18e:	48 89 e5             	mov    %rsp,%rbp
 191:	48 83 ec 50          	sub    $0x50,%rsp
 195:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
 199:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
	// Load new data to Ragel vars
	const uint8_t *p;
	const uint8_t *eof;
	const uint8_t *pe;

	if (len == 0) while(newstr[++len] != 0); // alternative to strlen
 19d:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
 1a2:	75 17                	jne    1bb <ini_parse+0x2e>
 1a4:	48 83 45 b0 01       	addq   $0x1,-0x50(%rbp)
 1a9:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
 1ad:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 1b1:	48 01 d0             	add    %rdx,%rax
 1b4:	0f b6 00             	movzbl (%rax),%eax
 1b7:	84 c0                	test   %al,%al
 1b9:	75 e9                	jne    1a4 <ini_parse+0x17>

	p = (const uint8_t *) newstr;
 1bb:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
 1bf:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
	eof = NULL;
 1c3:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
 1ca:	00 
	pe = (const uint8_t *) (newstr + len);
 1cb:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
 1cf:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 1d3:	48 01 d0             	add    %rdx,%rax
 1d6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)

	// Init Ragel on the first run
	if (cs == -1) {
 1da:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 1e1 <ini_parse+0x54>
 1e1:	3c ff                	cmp    $0xff,%al
 1e3:	75 05                	jne    1ea <ini_parse+0x5d>
		ini_parse_reset();
 1e5:	e8 00 00 00 00       	callq  1ea <ini_parse+0x5d>
/* #line 147 "src/ini_parse.c" */
	{
	const char *_acts;
	unsigned int _nacts;

	if ( p == pe )
 1ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 1ee:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
 1f2:	0f 84 5d 09 00 00    	je     b55 <ini_parse+0x9c8>
		goto _test_eof;
	if ( cs == 0 )
 1f8:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 1ff <ini_parse+0x72>
 1ff:	84 c0                	test   %al,%al
 201:	0f 84 f8 0a 00 00    	je     cff <ini_parse+0xb72>
		goto _out;
_resume:
 207:	90                   	nop
 208:	eb 01                	jmp    20b <ini_parse+0x7e>

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
 20a:	90                   	nop
	switch ( cs ) {
 20b:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 212 <ini_parse+0x85>
 212:	0f be c0             	movsbl %al,%eax
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 87 4b 02 00 00    	ja     469 <ini_parse+0x2dc>
 21e:	89 c0                	mov    %eax,%eax
 220:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 227:	00 
 228:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 22f <ini_parse+0xa2>
 22f:	8b 04 02             	mov    (%rdx,%rax,1),%eax
 232:	48 63 d0             	movslq %eax,%rdx
 235:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 23c <ini_parse+0xaf>
 23c:	48 01 d0             	add    %rdx,%rax
 23f:	ff e0                	jmpq   *%rax
	switch( (*p) ) {
 241:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 245:	0f b6 00             	movzbl (%rax),%eax
 248:	0f b6 c0             	movzbl %al,%eax
 24b:	83 e8 20             	sub    $0x20,%eax
 24e:	83 f8 3b             	cmp    $0x3b,%eax
 251:	77 23                	ja     276 <ini_parse+0xe9>
 253:	89 c0                	mov    %eax,%eax
 255:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 25c:	00 
 25d:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 264 <ini_parse+0xd7>
 264:	8b 04 02             	mov    (%rdx,%rax,1),%eax
 267:	48 63 d0             	movslq %eax,%rdx
 26a:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 271 <ini_parse+0xe4>
 271:	48 01 d0             	add    %rdx,%rax
 274:	ff e0                	jmpq   *%rax
	if ( (*p) < 9u ) {
 276:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 27a:	0f b6 00             	movzbl (%rax),%eax
 27d:	3c 08                	cmp    $0x8,%al
 27f:	77 14                	ja     295 <ini_parse+0x108>
		if ( (*p) <= 8u )
 281:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 285:	0f b6 00             	movzbl (%rax),%eax
 288:	3c 08                	cmp    $0x8,%al
 28a:	0f 87 f9 02 00 00    	ja     589 <ini_parse+0x3fc>
			goto tr0;
 290:	e9 e4 01 00 00       	jmpq   479 <ini_parse+0x2ec>
	} else if ( (*p) > 13u ) {
 295:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 299:	0f b6 00             	movzbl (%rax),%eax
 29c:	3c 0d                	cmp    $0xd,%al
 29e:	0f 86 4a 02 00 00    	jbe    4ee <ini_parse+0x361>
		if ( 14u <= (*p) && (*p) <= 31u )
 2a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 2a8:	0f b6 00             	movzbl (%rax),%eax
 2ab:	3c 0d                	cmp    $0xd,%al
 2ad:	0f 86 d6 02 00 00    	jbe    589 <ini_parse+0x3fc>
 2b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 2b7:	0f b6 00             	movzbl (%rax),%eax
 2ba:	3c 1f                	cmp    $0x1f,%al
 2bc:	0f 87 c7 02 00 00    	ja     589 <ini_parse+0x3fc>
			goto tr0;
 2c2:	e9 b2 01 00 00       	jmpq   479 <ini_parse+0x2ec>
	switch( (*p) ) {
 2c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 2cb:	0f b6 00             	movzbl (%rax),%eax
 2ce:	0f b6 c0             	movzbl %al,%eax
 2d1:	83 f8 20             	cmp    $0x20,%eax
 2d4:	0f 84 21 02 00 00    	je     4fb <ini_parse+0x36e>
 2da:	83 f8 5d             	cmp    $0x5d,%eax
 2dd:	0f 84 b1 01 00 00    	je     494 <ini_parse+0x307>
 2e3:	83 f8 09             	cmp    $0x9,%eax
 2e6:	0f 84 12 02 00 00    	je     4fe <ini_parse+0x371>
	if ( (*p) <= 31u )
 2ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 2f0:	0f b6 00             	movzbl (%rax),%eax
 2f3:	3c 1f                	cmp    $0x1f,%al
 2f5:	0f 87 10 02 00 00    	ja     50b <ini_parse+0x37e>
		goto tr5;
 2fb:	e9 98 01 00 00       	jmpq   498 <ini_parse+0x30b>
	if ( (*p) == 93u )
 300:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 304:	0f b6 00             	movzbl (%rax),%eax
 307:	3c 5d                	cmp    $0x5d,%al
 309:	0f 84 bf 02 00 00    	je     5ce <ini_parse+0x441>
	if ( (*p) > 8u ) {
 30f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 313:	0f b6 00             	movzbl (%rax),%eax
 316:	3c 08                	cmp    $0x8,%al
 318:	0f 86 79 01 00 00    	jbe    497 <ini_parse+0x30a>
		if ( 10u <= (*p) && (*p) <= 31u )
 31e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 322:	0f b6 00             	movzbl (%rax),%eax
 325:	3c 09                	cmp    $0x9,%al
 327:	0f 86 e1 01 00 00    	jbe    50e <ini_parse+0x381>
 32d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 331:	0f b6 00             	movzbl (%rax),%eax
 334:	3c 1f                	cmp    $0x1f,%al
 336:	0f 87 d2 01 00 00    	ja     50e <ini_parse+0x381>
			goto tr5;
 33c:	e9 57 01 00 00       	jmpq   498 <ini_parse+0x30b>
	switch( (*p) ) {
 341:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 345:	0f b6 00             	movzbl (%rax),%eax
 348:	0f b6 c0             	movzbl %al,%eax
 34b:	83 f8 3a             	cmp    $0x3a,%eax
 34e:	0f 84 e3 01 00 00    	je     537 <ini_parse+0x3aa>
 354:	83 f8 3d             	cmp    $0x3d,%eax
 357:	0f 84 dd 01 00 00    	je     53a <ini_parse+0x3ad>
 35d:	83 f8 0a             	cmp    $0xa,%eax
 360:	0f 84 4d 01 00 00    	je     4b3 <ini_parse+0x326>
	goto tr9;
 366:	90                   	nop
	tr9: cs = 4; goto f8;
 367:	c6 05 00 00 00 00 04 	movb   $0x4,0x0(%rip)        # 36e <ini_parse+0x1e1>
 36e:	90                   	nop
	f8: _acts = _ini_actions + 9; goto execFuncs;
 36f:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 376 <ini_parse+0x1e9>
 376:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 37a:	e9 ad 02 00 00       	jmpq   62c <ini_parse+0x49f>
	switch( (*p) ) {
 37f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 383:	0f b6 00             	movzbl (%rax),%eax
 386:	0f b6 c0             	movzbl %al,%eax
 389:	83 f8 0a             	cmp    $0xa,%eax
 38c:	0f 84 52 02 00 00    	je     5e4 <ini_parse+0x457>
 392:	83 f8 0a             	cmp    $0xa,%eax
 395:	7f 0e                	jg     3a5 <ini_parse+0x218>
 397:	83 f8 09             	cmp    $0x9,%eax
 39a:	0f 84 87 01 00 00    	je     527 <ini_parse+0x39a>
	goto tr12;
 3a0:	e9 ae 01 00 00       	jmpq   553 <ini_parse+0x3c6>
	switch( (*p) ) {
 3a5:	83 f8 0d             	cmp    $0xd,%eax
 3a8:	0f 84 b1 01 00 00    	je     55f <ini_parse+0x3d2>
 3ae:	83 f8 20             	cmp    $0x20,%eax
 3b1:	0f 84 73 01 00 00    	je     52a <ini_parse+0x39d>
	goto tr12;
 3b7:	e9 97 01 00 00       	jmpq   553 <ini_parse+0x3c6>
	switch( (*p) ) {
 3bc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 3c0:	0f b6 00             	movzbl (%rax),%eax
 3c3:	0f b6 c0             	movzbl %al,%eax
 3c6:	83 f8 0a             	cmp    $0xa,%eax
 3c9:	0f 84 18 02 00 00    	je     5e7 <ini_parse+0x45a>
 3cf:	83 f8 0d             	cmp    $0xd,%eax
 3d2:	0f 84 8a 01 00 00    	je     562 <ini_parse+0x3d5>
	goto tr12;
 3d8:	e9 76 01 00 00       	jmpq   553 <ini_parse+0x3c6>
	if ( (*p) == 10u )
 3dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 3e1:	0f b6 00             	movzbl (%rax),%eax
 3e4:	3c 0a                	cmp    $0xa,%al
 3e6:	0f 85 ca 00 00 00    	jne    4b6 <ini_parse+0x329>
		goto tr14;
 3ec:	e9 f7 01 00 00       	jmpq   5e8 <ini_parse+0x45b>
	switch( (*p) ) {
 3f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 3f5:	0f b6 00             	movzbl (%rax),%eax
 3f8:	0f b6 c0             	movzbl %al,%eax
 3fb:	83 f8 0a             	cmp    $0xa,%eax
 3fe:	0f 84 ed 01 00 00    	je     5f1 <ini_parse+0x464>
 404:	83 f8 0d             	cmp    $0xd,%eax
 407:	0f 84 62 01 00 00    	je     56f <ini_parse+0x3e2>
	goto tr16;
 40d:	90                   	nop
	tr16: cs = 8; goto _again;
 40e:	c6 05 00 00 00 00 08 	movb   $0x8,0x0(%rip)        # 415 <ini_parse+0x288>
 415:	e9 17 07 00 00       	jmpq   b31 <ini_parse+0x9a4>
	if ( (*p) == 10u )
 41a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 41e:	0f b6 00             	movzbl (%rax),%eax
 421:	3c 0a                	cmp    $0xa,%al
 423:	0f 85 a9 00 00 00    	jne    4d2 <ini_parse+0x345>
		goto tr17;
 429:	e9 c4 01 00 00       	jmpq   5f2 <ini_parse+0x465>
	switch( (*p) ) {
 42e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 432:	0f b6 00             	movzbl (%rax),%eax
 435:	0f b6 c0             	movzbl %al,%eax
 438:	83 f8 0a             	cmp    $0xa,%eax
 43b:	0f 84 c6 01 00 00    	je     607 <ini_parse+0x47a>
 441:	83 f8 0d             	cmp    $0xd,%eax
 444:	0f 84 32 01 00 00    	je     57c <ini_parse+0x3ef>
	goto tr20;
 44a:	90                   	nop
	tr20: cs = 10; goto _again;
 44b:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # 452 <ini_parse+0x2c5>
 452:	e9 da 06 00 00       	jmpq   b31 <ini_parse+0x9a4>
	if ( (*p) == 10u )
 457:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 45b:	0f b6 00             	movzbl (%rax),%eax
 45e:	3c 0a                	cmp    $0xa,%al
 460:	0f 84 a4 01 00 00    	je     60a <ini_parse+0x47d>
	goto tr23;
 466:	eb 01                	jmp    469 <ini_parse+0x2dc>
	goto tr23;
 468:	90                   	nop
	tr23: cs = 0; goto _again;
 469:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 470 <ini_parse+0x2e3>
 470:	e9 bc 06 00 00       	jmpq   b31 <ini_parse+0x9a4>
	goto tr0;
 475:	90                   	nop
 476:	eb 01                	jmp    479 <ini_parse+0x2ec>
		case 58u: goto tr0;
 478:	90                   	nop
	tr0: cs = 0; goto f0;
 479:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 480 <ini_parse+0x2f3>
 480:	90                   	nop
	f0: _acts = _ini_actions + 23; goto execFuncs;
 481:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 488 <ini_parse+0x2fb>
 488:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 48c:	e9 9b 01 00 00       	jmpq   62c <ini_parse+0x49f>
	goto tr5;
 491:	90                   	nop
 492:	eb 04                	jmp    498 <ini_parse+0x30b>
		case 93u: goto tr5;
 494:	90                   	nop
 495:	eb 01                	jmp    498 <ini_parse+0x30b>
		goto tr5;
 497:	90                   	nop
	tr5: cs = 0; goto f4;
 498:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 49f <ini_parse+0x312>
 49f:	90                   	nop
	f4: _acts = _ini_actions + 5; goto execFuncs;
 4a0:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 4a7 <ini_parse+0x31a>
 4a7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 4ab:	e9 7c 01 00 00       	jmpq   62c <ini_parse+0x49f>
	goto tr10;
 4b0:	90                   	nop
 4b1:	eb 04                	jmp    4b7 <ini_parse+0x32a>
		case 10u: goto tr10;
 4b3:	90                   	nop
 4b4:	eb 01                	jmp    4b7 <ini_parse+0x32a>
	goto tr10;
 4b6:	90                   	nop
	tr10: cs = 0; goto f7;
 4b7:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 4be <ini_parse+0x331>
 4be:	90                   	nop
	f7: _acts = _ini_actions + 15; goto execFuncs;
 4bf:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 4c6 <ini_parse+0x339>
 4c6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 4ca:	e9 5d 01 00 00       	jmpq   62c <ini_parse+0x49f>
	goto tr19;
 4cf:	90                   	nop
 4d0:	eb 01                	jmp    4d3 <ini_parse+0x346>
	goto tr19;
 4d2:	90                   	nop
	tr19: cs = 0; goto f11;
 4d3:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 4da <ini_parse+0x34d>
 4da:	90                   	nop
	f11: _acts = _ini_actions + 19; goto execFuncs;
 4db:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 4e2 <ini_parse+0x355>
 4e2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 4e6:	e9 41 01 00 00       	jmpq   62c <ini_parse+0x49f>
		case 32u: goto tr1;
 4eb:	90                   	nop
 4ec:	eb 01                	jmp    4ef <ini_parse+0x362>
		goto tr1;
 4ee:	90                   	nop
	tr1: cs = 1; goto _again;
 4ef:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 4f6 <ini_parse+0x369>
 4f6:	e9 36 06 00 00       	jmpq   b31 <ini_parse+0x9a4>
		case 32u: goto tr6;
 4fb:	90                   	nop
 4fc:	eb 01                	jmp    4ff <ini_parse+0x372>
		case 9u: goto tr6;
 4fe:	90                   	nop
	tr6: cs = 2; goto _again;
 4ff:	c6 05 00 00 00 00 02 	movb   $0x2,0x0(%rip)        # 506 <ini_parse+0x379>
 506:	e9 26 06 00 00       	jmpq   b31 <ini_parse+0x9a4>
	goto tr7;
 50b:	90                   	nop
 50c:	eb 01                	jmp    50f <ini_parse+0x382>
	goto tr7;
 50e:	90                   	nop
	tr7: cs = 3; goto f5;
 50f:	c6 05 00 00 00 00 03 	movb   $0x3,0x0(%rip)        # 516 <ini_parse+0x389>
 516:	90                   	nop
	f5: _acts = _ini_actions + 1; goto execFuncs;
 517:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 51e <ini_parse+0x391>
 51e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 522:	e9 05 01 00 00       	jmpq   62c <ini_parse+0x49f>
		case 9u: goto tr13;
 527:	90                   	nop
 528:	eb 01                	jmp    52b <ini_parse+0x39e>
		case 32u: goto tr13;
 52a:	90                   	nop
	tr13: cs = 5; goto _again;
 52b:	c6 05 00 00 00 00 05 	movb   $0x5,0x0(%rip)        # 532 <ini_parse+0x3a5>
 532:	e9 fa 05 00 00       	jmpq   b31 <ini_parse+0x9a4>
		case 58u: goto tr11;
 537:	90                   	nop
 538:	eb 01                	jmp    53b <ini_parse+0x3ae>
		case 61u: goto tr11;
 53a:	90                   	nop
	tr11: cs = 5; goto f9;
 53b:	c6 05 00 00 00 00 05 	movb   $0x5,0x0(%rip)        # 542 <ini_parse+0x3b5>
 542:	90                   	nop
	f9: _acts = _ini_actions + 11; goto execFuncs;
 543:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 54a <ini_parse+0x3bd>
 54a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 54e:	e9 d9 00 00 00       	jmpq   62c <ini_parse+0x49f>
	tr12: cs = 6; goto f10;
 553:	c6 05 00 00 00 00 06 	movb   $0x6,0x0(%rip)        # 55a <ini_parse+0x3cd>
 55a:	e9 c1 00 00 00       	jmpq   620 <ini_parse+0x493>
		case 13u: goto tr15;
 55f:	90                   	nop
 560:	eb 01                	jmp    563 <ini_parse+0x3d6>
		case 13u: goto tr15;
 562:	90                   	nop
	tr15: cs = 7; goto _again;
 563:	c6 05 00 00 00 00 07 	movb   $0x7,0x0(%rip)        # 56a <ini_parse+0x3dd>
 56a:	e9 c2 05 00 00       	jmpq   b31 <ini_parse+0x9a4>
		case 13u: goto tr18;
 56f:	90                   	nop
	tr18: cs = 9; goto _again;
 570:	c6 05 00 00 00 00 09 	movb   $0x9,0x0(%rip)        # 577 <ini_parse+0x3ea>
 577:	e9 b5 05 00 00       	jmpq   b31 <ini_parse+0x9a4>
		case 13u: goto tr22;
 57c:	90                   	nop
	tr22: cs = 11; goto _again;
 57d:	c6 05 00 00 00 00 0b 	movb   $0xb,0x0(%rip)        # 584 <ini_parse+0x3f7>
 584:	e9 a8 05 00 00       	jmpq   b31 <ini_parse+0x9a4>
	goto tr2;
 589:	90                   	nop
	tr2: cs = 12; goto f1;
 58a:	c6 05 00 00 00 00 0c 	movb   $0xc,0x0(%rip)        # 591 <ini_parse+0x404>
 591:	90                   	nop
	f1: _acts = _ini_actions + 7; goto execFuncs;
 592:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 599 <ini_parse+0x40c>
 599:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 59d:	e9 8a 00 00 00       	jmpq   62c <ini_parse+0x49f>
		case 35u: goto tr3;
 5a2:	90                   	nop
	tr3: cs = 12; goto f2;
 5a3:	c6 05 00 00 00 00 0c 	movb   $0xc,0x0(%rip)        # 5aa <ini_parse+0x41d>
 5aa:	90                   	nop
	f2: _acts = _ini_actions + 28; goto execFuncs;
 5ab:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 5b2 <ini_parse+0x425>
 5b2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 5b6:	eb 74                	jmp    62c <ini_parse+0x49f>
		case 91u: goto tr4;
 5b8:	90                   	nop
	tr4: cs = 12; goto f3;
 5b9:	c6 05 00 00 00 00 0c 	movb   $0xc,0x0(%rip)        # 5c0 <ini_parse+0x433>
 5c0:	90                   	nop
	f3: _acts = _ini_actions + 25; goto execFuncs;
 5c1:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 5c8 <ini_parse+0x43b>
 5c8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 5cc:	eb 5e                	jmp    62c <ini_parse+0x49f>
		goto tr8;
 5ce:	90                   	nop
	tr8: cs = 13; goto f6;
 5cf:	c6 05 00 00 00 00 0d 	movb   $0xd,0x0(%rip)        # 5d6 <ini_parse+0x449>
 5d6:	90                   	nop
	f6: _acts = _ini_actions + 3; goto execFuncs;
 5d7:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 5de <ini_parse+0x451>
 5de:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 5e2:	eb 48                	jmp    62c <ini_parse+0x49f>
		case 10u: goto tr14;
 5e4:	90                   	nop
 5e5:	eb 01                	jmp    5e8 <ini_parse+0x45b>
		case 10u: goto tr14;
 5e7:	90                   	nop
	tr14: cs = 14; goto f10;
 5e8:	c6 05 00 00 00 00 0e 	movb   $0xe,0x0(%rip)        # 5ef <ini_parse+0x462>
 5ef:	eb 2f                	jmp    620 <ini_parse+0x493>
		case 10u: goto tr17;
 5f1:	90                   	nop
	tr17: cs = 15; goto f12;
 5f2:	c6 05 00 00 00 00 0f 	movb   $0xf,0x0(%rip)        # 5f9 <ini_parse+0x46c>
 5f9:	90                   	nop
	f12: _acts = _ini_actions + 17; goto execFuncs;
 5fa:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 601 <ini_parse+0x474>
 601:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 605:	eb 25                	jmp    62c <ini_parse+0x49f>
		case 10u: goto tr21;
 607:	90                   	nop
 608:	eb 01                	jmp    60b <ini_parse+0x47e>
		goto tr21;
 60a:	90                   	nop
	tr21: cs = 16; goto f13;
 60b:	c6 05 00 00 00 00 10 	movb   $0x10,0x0(%rip)        # 612 <ini_parse+0x485>
 612:	90                   	nop
	f13: _acts = _ini_actions + 21; goto execFuncs;
 613:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 61a <ini_parse+0x48d>
 61a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 61e:	eb 0c                	jmp    62c <ini_parse+0x49f>
	f10: _acts = _ini_actions + 13; goto execFuncs;
 620:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 627 <ini_parse+0x49a>
 627:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 62b:	90                   	nop
	_nacts = *_acts++;
 62c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 630:	48 8d 50 01          	lea    0x1(%rax),%rdx
 634:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
 638:	0f b6 00             	movzbl (%rax),%eax
 63b:	0f be c0             	movsbl %al,%eax
 63e:	89 45 d0             	mov    %eax,-0x30(%rbp)
	while ( _nacts-- > 0 ) {
 641:	e9 c4 04 00 00       	jmpq   b0a <ini_parse+0x97d>
		switch ( *_acts++ ) {
 646:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 64a:	48 8d 50 01          	lea    0x1(%rax),%rdx
 64e:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
 652:	0f b6 00             	movzbl (%rax),%eax
 655:	0f be c0             	movsbl %al,%eax
 658:	83 f8 0d             	cmp    $0xd,%eax
 65b:	0f 87 a9 04 00 00    	ja     b0a <ini_parse+0x97d>
 661:	89 c0                	mov    %eax,%eax
 663:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 66a:	00 
 66b:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 672 <ini_parse+0x4e5>
 672:	8b 04 02             	mov    (%rdx,%rax,1),%eax
 675:	48 63 d0             	movslq %eax,%rdx
 678:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 67f <ini_parse+0x4f2>
 67f:	48 01 d0             	add    %rdx,%rax
 682:	ff e0                	jmpq   *%rax
			buff_i = 0;
 684:	c7 05 00 00 00 00 00 	movl   $0x0,0x0(%rip)        # 68e <ini_parse+0x501>
 68b:	00 00 00 
			{cs = 2;goto _again;}
 68e:	c6 05 00 00 00 00 02 	movb   $0x2,0x0(%rip)        # 695 <ini_parse+0x508>
 695:	e9 97 04 00 00       	jmpq   b31 <ini_parse+0x9a4>
			if (buff_i >= INI_KEY_MAX) {
 69a:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 6a0 <ini_parse+0x513>
 6a0:	83 f8 3f             	cmp    $0x3f,%eax
 6a3:	76 18                	jbe    6bd <ini_parse+0x530>
				ini_parser_error("Section name too long");
 6a5:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 6ac <ini_parse+0x51f>
 6ac:	e8 00 00 00 00       	callq  6b1 <ini_parse+0x524>
				{cs = 10;goto _again;}
 6b1:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # 6b8 <ini_parse+0x52b>
 6b8:	e9 74 04 00 00       	jmpq   b31 <ini_parse+0x9a4>
			keybuf[buff_i++] = (*p);
 6bd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 6c1:	0f b6 08             	movzbl (%rax),%ecx
 6c4:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 6ca <ini_parse+0x53d>
 6ca:	8d 50 01             	lea    0x1(%rax),%edx
 6cd:	89 15 00 00 00 00    	mov    %edx,0x0(%rip)        # 6d3 <ini_parse+0x546>
 6d3:	89 c2                	mov    %eax,%edx
 6d5:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 6dc <ini_parse+0x54f>
 6dc:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
	break;
 6df:	e9 26 04 00 00       	jmpq   b0a <ini_parse+0x97d>
			rtrim_buf(keybuf, buff_i);
 6e4:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 6ea <ini_parse+0x55d>
 6ea:	89 c6                	mov    %eax,%esi
 6ec:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 6f3 <ini_parse+0x566>
 6f3:	e8 55 fa ff ff       	callq  14d <rtrim_buf>
			for (i = 0; (c = keybuf[i]) != 0; i++) secbuf[i] = c;
 6f8:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
 6ff:	eb 18                	jmp    719 <ini_parse+0x58c>
 701:	8b 45 cc             	mov    -0x34(%rbp),%eax
 704:	48 63 d0             	movslq %eax,%rdx
 707:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 70e <ini_parse+0x581>
 70e:	0f b6 4d c9          	movzbl -0x37(%rbp),%ecx
 712:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
 715:	83 45 cc 01          	addl   $0x1,-0x34(%rbp)
 719:	8b 45 cc             	mov    -0x34(%rbp),%eax
 71c:	48 63 d0             	movslq %eax,%rdx
 71f:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 726 <ini_parse+0x599>
 726:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
 72a:	88 45 c9             	mov    %al,-0x37(%rbp)
 72d:	80 7d c9 00          	cmpb   $0x0,-0x37(%rbp)
 731:	75 ce                	jne    701 <ini_parse+0x574>
			secbuf[i] = 0;
 733:	8b 45 cc             	mov    -0x34(%rbp),%eax
 736:	48 63 d0             	movslq %eax,%rdx
 739:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 740 <ini_parse+0x5b3>
 740:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
			{cs = 1;goto _again;}
 744:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 74b <ini_parse+0x5be>
 74b:	e9 e1 03 00 00       	jmpq   b31 <ini_parse+0x9a4>
				ini_parser_error("Syntax error in [section]");
 750:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 757 <ini_parse+0x5ca>
 757:	e8 00 00 00 00       	callq  75c <ini_parse+0x5cf>
				if((*p) == '\n') {cs = 1;goto _again;} else {cs = 10;goto _again;}
 75c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 760:	0f b6 00             	movzbl (%rax),%eax
 763:	3c 0a                	cmp    $0xa,%al
 765:	75 0c                	jne    773 <ini_parse+0x5e6>
 767:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 76e <ini_parse+0x5e1>
 76e:	e9 be 03 00 00       	jmpq   b31 <ini_parse+0x9a4>
 773:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # 77a <ini_parse+0x5ed>
 77a:	e9 b2 03 00 00       	jmpq   b31 <ini_parse+0x9a4>
			buff_i = 0;
 77f:	c7 05 00 00 00 00 00 	movl   $0x0,0x0(%rip)        # 789 <ini_parse+0x5fc>
 786:	00 00 00 
			keybuf[buff_i++] = (*p); // add the first char
 789:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 78d:	0f b6 08             	movzbl (%rax),%ecx
 790:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 796 <ini_parse+0x609>
 796:	8d 50 01             	lea    0x1(%rax),%edx
 799:	89 15 00 00 00 00    	mov    %edx,0x0(%rip)        # 79f <ini_parse+0x612>
 79f:	89 c2                	mov    %eax,%edx
 7a1:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 7a8 <ini_parse+0x61b>
 7a8:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
			{cs = 4;goto _again;}
 7ab:	c6 05 00 00 00 00 04 	movb   $0x4,0x0(%rip)        # 7b2 <ini_parse+0x625>
 7b2:	e9 7a 03 00 00       	jmpq   b31 <ini_parse+0x9a4>
			if (buff_i >= INI_KEY_MAX) {
 7b7:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 7bd <ini_parse+0x630>
 7bd:	83 f8 3f             	cmp    $0x3f,%eax
 7c0:	76 18                	jbe    7da <ini_parse+0x64d>
				ini_parser_error("Key too long");
 7c2:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 7c9 <ini_parse+0x63c>
 7c9:	e8 00 00 00 00       	callq  7ce <ini_parse+0x641>
				{cs = 10;goto _again;}
 7ce:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # 7d5 <ini_parse+0x648>
 7d5:	e9 57 03 00 00       	jmpq   b31 <ini_parse+0x9a4>
			keybuf[buff_i++] = (*p);
 7da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 7de:	0f b6 08             	movzbl (%rax),%ecx
 7e1:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 7e7 <ini_parse+0x65a>
 7e7:	8d 50 01             	lea    0x1(%rax),%edx
 7ea:	89 15 00 00 00 00    	mov    %edx,0x0(%rip)        # 7f0 <ini_parse+0x663>
 7f0:	89 c2                	mov    %eax,%edx
 7f2:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 7f9 <ini_parse+0x66c>
 7f9:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
	break;
 7fc:	e9 09 03 00 00       	jmpq   b0a <ini_parse+0x97d>
			rtrim_buf(keybuf, buff_i);
 801:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 807 <ini_parse+0x67a>
 807:	89 c6                	mov    %eax,%esi
 809:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 810 <ini_parse+0x683>
 810:	e8 38 f9 ff ff       	callq  14d <rtrim_buf>
			buff_i = 0;
 815:	c7 05 00 00 00 00 00 	movl   $0x0,0x0(%rip)        # 81f <ini_parse+0x692>
 81c:	00 00 00 
			value_quote = 0;
 81f:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 826 <ini_parse+0x699>
			value_nextesc = false;
 826:	c6 05 00 00 00 00 00 	movb   $0x0,0x0(%rip)        # 82d <ini_parse+0x6a0>
	break;
 82d:	e9 d8 02 00 00       	jmpq   b0a <ini_parse+0x97d>
			isnl = ((*p) == '\r' || (*p) == '\n');
 832:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 836:	0f b6 00             	movzbl (%rax),%eax
 839:	3c 0d                	cmp    $0xd,%al
 83b:	74 0b                	je     848 <ini_parse+0x6bb>
 83d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 841:	0f b6 00             	movzbl (%rax),%eax
 844:	3c 0a                	cmp    $0xa,%al
 846:	75 07                	jne    84f <ini_parse+0x6c2>
 848:	b8 01 00 00 00       	mov    $0x1,%eax
 84d:	eb 05                	jmp    854 <ini_parse+0x6c7>
 84f:	b8 00 00 00 00       	mov    $0x0,%eax
 854:	88 45 ca             	mov    %al,-0x36(%rbp)
 857:	80 65 ca 01          	andb   $0x1,-0x36(%rbp)
			isquot = ((*p) == '\'' || (*p) == '"');
 85b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 85f:	0f b6 00             	movzbl (%rax),%eax
 862:	3c 27                	cmp    $0x27,%al
 864:	74 0b                	je     871 <ini_parse+0x6e4>
 866:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 86a:	0f b6 00             	movzbl (%rax),%eax
 86d:	3c 22                	cmp    $0x22,%al
 86f:	75 07                	jne    878 <ini_parse+0x6eb>
 871:	b8 01 00 00 00       	mov    $0x1,%eax
 876:	eb 05                	jmp    87d <ini_parse+0x6f0>
 878:	b8 00 00 00 00       	mov    $0x0,%eax
 87d:	88 45 cb             	mov    %al,-0x35(%rbp)
 880:	80 65 cb 01          	andb   $0x1,-0x35(%rbp)
			if (isquot && !value_nextesc && buff_i == 0 && value_quote == 0) {
 884:	80 7d cb 00          	cmpb   $0x0,-0x35(%rbp)
 888:	74 35                	je     8bf <ini_parse+0x732>
 88a:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 891 <ini_parse+0x704>
 891:	83 f0 01             	xor    $0x1,%eax
 894:	84 c0                	test   %al,%al
 896:	74 27                	je     8bf <ini_parse+0x732>
 898:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 89e <ini_parse+0x711>
 89e:	85 c0                	test   %eax,%eax
 8a0:	75 1d                	jne    8bf <ini_parse+0x732>
 8a2:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 8a9 <ini_parse+0x71c>
 8a9:	84 c0                	test   %al,%al
 8ab:	75 12                	jne    8bf <ini_parse+0x732>
				value_quote = (*p);
 8ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 8b1:	0f b6 00             	movzbl (%rax),%eax
 8b4:	88 05 00 00 00 00    	mov    %al,0x0(%rip)        # 8ba <ini_parse+0x72d>
				goto valueCharDone;
 8ba:	e9 be 01 00 00       	jmpq   a7d <ini_parse+0x8f0>
			if (buff_i >= INI_VALUE_MAX) {
 8bf:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 8c5 <ini_parse+0x738>
 8c5:	3d ff 00 00 00       	cmp    $0xff,%eax
 8ca:	76 18                	jbe    8e4 <ini_parse+0x757>
				ini_parser_error("Value too long");
 8cc:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 8d3 <ini_parse+0x746>
 8d3:	e8 00 00 00 00       	callq  8d8 <ini_parse+0x74b>
				{cs = 10;goto _again;}
 8d8:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # 8df <ini_parse+0x752>
 8df:	e9 4d 02 00 00       	jmpq   b31 <ini_parse+0x9a4>
			if ((!value_nextesc && (*p) == value_quote) || isnl) {
 8e4:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 8eb <ini_parse+0x75e>
 8eb:	83 f0 01             	xor    $0x1,%eax
 8ee:	84 c0                	test   %al,%al
 8f0:	74 18                	je     90a <ini_parse+0x77d>
 8f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 8f6:	0f b6 00             	movzbl (%rax),%eax
 8f9:	0f b6 d0             	movzbl %al,%edx
 8fc:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 903 <ini_parse+0x776>
 903:	0f be c0             	movsbl %al,%eax
 906:	39 c2                	cmp    %eax,%edx
 908:	74 0a                	je     914 <ini_parse+0x787>
 90a:	80 7d ca 00          	cmpb   $0x0,-0x36(%rbp)
 90e:	0f 84 af 00 00 00    	je     9c3 <ini_parse+0x836>
				if (isnl && value_quote) {
 914:	80 7d ca 00          	cmpb   $0x0,-0x36(%rbp)
 918:	74 23                	je     93d <ini_parse+0x7b0>
 91a:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 921 <ini_parse+0x794>
 921:	84 c0                	test   %al,%al
 923:	74 18                	je     93d <ini_parse+0x7b0>
					ini_parser_error("Unterminated string");
 925:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 92c <ini_parse+0x79f>
 92c:	e8 00 00 00 00       	callq  931 <ini_parse+0x7a4>
					{cs = 1;goto _again;}
 931:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 938 <ini_parse+0x7ab>
 938:	e9 f4 01 00 00       	jmpq   b31 <ini_parse+0x9a4>
				if (!value_quote) {
 93d:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 944 <ini_parse+0x7b7>
 944:	84 c0                	test   %al,%al
 946:	75 16                	jne    95e <ini_parse+0x7d1>
					rtrim_buf(valbuf, buff_i);
 948:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 94e <ini_parse+0x7c1>
 94e:	89 c6                	mov    %eax,%esi
 950:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 957 <ini_parse+0x7ca>
 957:	e8 f1 f7 ff ff       	callq  14d <rtrim_buf>
 95c:	eb 13                	jmp    971 <ini_parse+0x7e4>
					valbuf[buff_i] = 0;
 95e:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 964 <ini_parse+0x7d7>
 964:	89 c2                	mov    %eax,%edx
 966:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 96d <ini_parse+0x7e0>
 96d:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
				if (keyCallback) {
 971:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 978 <ini_parse+0x7eb>
 978:	48 85 c0             	test   %rax,%rax
 97b:	74 28                	je     9a5 <ini_parse+0x818>
					keyCallback(secbuf, keybuf, valbuf, userdata);
 97d:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 984 <ini_parse+0x7f7>
 984:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 98b <ini_parse+0x7fe>
 98b:	48 89 d1             	mov    %rdx,%rcx
 98e:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 995 <ini_parse+0x808>
 995:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 99c <ini_parse+0x80f>
 99c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 9a3 <ini_parse+0x816>
 9a3:	ff d0                	callq  *%rax
				if (isnl) {cs = 1;goto _again;} else {cs = 10;goto _again;}
 9a5:	80 7d ca 00          	cmpb   $0x0,-0x36(%rbp)
 9a9:	74 0c                	je     9b7 <ini_parse+0x82a>
 9ab:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 9b2 <ini_parse+0x825>
 9b2:	e9 7a 01 00 00       	jmpq   b31 <ini_parse+0x9a4>
 9b7:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # 9be <ini_parse+0x831>
 9be:	e9 6e 01 00 00       	jmpq   b31 <ini_parse+0x9a4>
			c = (*p);
 9c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 9c7:	0f b6 00             	movzbl (%rax),%eax
 9ca:	88 45 c9             	mov    %al,-0x37(%rbp)
			if (value_nextesc) {
 9cd:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # 9d4 <ini_parse+0x847>
 9d4:	84 c0                	test   %al,%al
 9d6:	74 42                	je     a1a <ini_parse+0x88d>
				if ((*p) == 'n') c = '\n';
 9d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 9dc:	0f b6 00             	movzbl (%rax),%eax
 9df:	3c 6e                	cmp    $0x6e,%al
 9e1:	75 06                	jne    9e9 <ini_parse+0x85c>
 9e3:	c6 45 c9 0a          	movb   $0xa,-0x37(%rbp)
 9e7:	eb 31                	jmp    a1a <ini_parse+0x88d>
				else if ((*p) == 'r') c = '\r';
 9e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 9ed:	0f b6 00             	movzbl (%rax),%eax
 9f0:	3c 72                	cmp    $0x72,%al
 9f2:	75 06                	jne    9fa <ini_parse+0x86d>
 9f4:	c6 45 c9 0d          	movb   $0xd,-0x37(%rbp)
 9f8:	eb 20                	jmp    a1a <ini_parse+0x88d>
				else if ((*p) == 't') c = '\t';
 9fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 9fe:	0f b6 00             	movzbl (%rax),%eax
 a01:	3c 74                	cmp    $0x74,%al
 a03:	75 06                	jne    a0b <ini_parse+0x87e>
 a05:	c6 45 c9 09          	movb   $0x9,-0x37(%rbp)
 a09:	eb 0f                	jmp    a1a <ini_parse+0x88d>
				else if ((*p) == 'e') c = '\033';
 a0b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 a0f:	0f b6 00             	movzbl (%rax),%eax
 a12:	3c 65                	cmp    $0x65,%al
 a14:	75 04                	jne    a1a <ini_parse+0x88d>
 a16:	c6 45 c9 1b          	movb   $0x1b,-0x37(%rbp)
			if (value_nextesc || (*p) != '\\') { // is quoted, or is not a quoting backslash - literal character
 a1a:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # a21 <ini_parse+0x894>
 a21:	84 c0                	test   %al,%al
 a23:	75 0b                	jne    a30 <ini_parse+0x8a3>
 a25:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 a29:	0f b6 00             	movzbl (%rax),%eax
 a2c:	3c 5c                	cmp    $0x5c,%al
 a2e:	74 1f                	je     a4f <ini_parse+0x8c2>
				valbuf[buff_i++] = c;
 a30:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # a36 <ini_parse+0x8a9>
 a36:	8d 50 01             	lea    0x1(%rax),%edx
 a39:	89 15 00 00 00 00    	mov    %edx,0x0(%rip)        # a3f <ini_parse+0x8b2>
 a3f:	89 c1                	mov    %eax,%ecx
 a41:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # a48 <ini_parse+0x8bb>
 a48:	0f b6 55 c9          	movzbl -0x37(%rbp),%edx
 a4c:	88 14 01             	mov    %dl,(%rcx,%rax,1)
			value_nextesc = (!value_nextesc && (*p) == '\\');
 a4f:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # a56 <ini_parse+0x8c9>
 a56:	83 f0 01             	xor    $0x1,%eax
 a59:	84 c0                	test   %al,%al
 a5b:	74 12                	je     a6f <ini_parse+0x8e2>
 a5d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 a61:	0f b6 00             	movzbl (%rax),%eax
 a64:	3c 5c                	cmp    $0x5c,%al
 a66:	75 07                	jne    a6f <ini_parse+0x8e2>
 a68:	b8 01 00 00 00       	mov    $0x1,%eax
 a6d:	eb 05                	jmp    a74 <ini_parse+0x8e7>
 a6f:	b8 00 00 00 00       	mov    $0x0,%eax
 a74:	83 e0 01             	and    $0x1,%eax
 a77:	88 05 00 00 00 00    	mov    %al,0x0(%rip)        # a7d <ini_parse+0x8f0>
	break;
 a7d:	e9 88 00 00 00       	jmpq   b0a <ini_parse+0x97d>
				ini_parser_error("Syntax error in key=value");
 a82:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # a89 <ini_parse+0x8fc>
 a89:	e8 00 00 00 00       	callq  a8e <ini_parse+0x901>
				if((*p) == '\n') {cs = 1;goto _again;} else {cs = 10;goto _again;}
 a8e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 a92:	0f b6 00             	movzbl (%rax),%eax
 a95:	3c 0a                	cmp    $0xa,%al
 a97:	75 0c                	jne    aa5 <ini_parse+0x918>
 a99:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # aa0 <ini_parse+0x913>
 aa0:	e9 8c 00 00 00       	jmpq   b31 <ini_parse+0x9a4>
 aa5:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # aac <ini_parse+0x91f>
 aac:	e9 80 00 00 00       	jmpq   b31 <ini_parse+0x9a4>
	{ {cs = 1;goto _again;} }
 ab1:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # ab8 <ini_parse+0x92b>
 ab8:	eb 77                	jmp    b31 <ini_parse+0x9a4>
				ini_parser_error("Syntax error in comment");
 aba:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # ac1 <ini_parse+0x934>
 ac1:	e8 00 00 00 00       	callq  ac6 <ini_parse+0x939>
				if((*p) == '\n') {cs = 1;goto _again;} else {cs = 10;goto _again;}
 ac6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 aca:	0f b6 00             	movzbl (%rax),%eax
 acd:	3c 0a                	cmp    $0xa,%al
 acf:	75 09                	jne    ada <ini_parse+0x94d>
 ad1:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # ad8 <ini_parse+0x94b>
 ad8:	eb 57                	jmp    b31 <ini_parse+0x9a4>
 ada:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # ae1 <ini_parse+0x954>
 ae1:	eb 4e                	jmp    b31 <ini_parse+0x9a4>
	{ {cs = 1;goto _again;} }
 ae3:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # aea <ini_parse+0x95d>
 aea:	eb 45                	jmp    b31 <ini_parse+0x9a4>
	{ {cs = 8;goto _again;} }
 aec:	c6 05 00 00 00 00 08 	movb   $0x8,0x0(%rip)        # af3 <ini_parse+0x966>
 af3:	eb 3c                	jmp    b31 <ini_parse+0x9a4>
				ini_parser_error("Syntax error in root");
 af5:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # afc <ini_parse+0x96f>
 afc:	e8 00 00 00 00       	callq  b01 <ini_parse+0x974>
				{cs = 10;goto _again;}
 b01:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # b08 <ini_parse+0x97b>
 b08:	eb 27                	jmp    b31 <ini_parse+0x9a4>
	while ( _nacts-- > 0 ) {
 b0a:	8b 45 d0             	mov    -0x30(%rbp),%eax
 b0d:	8d 50 ff             	lea    -0x1(%rax),%edx
 b10:	89 55 d0             	mov    %edx,-0x30(%rbp)
 b13:	85 c0                	test   %eax,%eax
 b15:	0f 85 2b fb ff ff    	jne    646 <ini_parse+0x4b9>
	goto _again;
 b1b:	90                   	nop
 b1c:	eb 13                	jmp    b31 <ini_parse+0x9a4>
/* #line 150 "src/ini_parse.rl" */
	{
				ini_parser_error("Syntax error in [section]");
				if((*p) == '\n') {cs = 1;	if ( p == pe )
		goto _test_eof;
goto _again;} else {cs = 10;	if ( p == pe )
 b1e:	90                   	nop
 b1f:	eb 10                	jmp    b31 <ini_parse+0x9a4>
		goto _test_eof;
goto _again;}
 b21:	90                   	nop
 b22:	eb 0d                	jmp    b31 <ini_parse+0x9a4>
/* #line 242 "src/ini_parse.rl" */
	{
				ini_parser_error("Syntax error in key=value");
				if((*p) == '\n') {cs = 1;	if ( p == pe )
		goto _test_eof;
goto _again;} else {cs = 10;	if ( p == pe )
 b24:	90                   	nop
 b25:	eb 0a                	jmp    b31 <ini_parse+0x9a4>
		goto _test_eof;
goto _again;}
 b27:	90                   	nop
 b28:	eb 07                	jmp    b31 <ini_parse+0x9a4>
/* #line 253 "src/ini_parse.rl" */
	{
				ini_parser_error("Syntax error in comment");
				if((*p) == '\n') {cs = 1;	if ( p == pe )
		goto _test_eof;
goto _again;} else {cs = 10;	if ( p == pe )
 b2a:	90                   	nop
 b2b:	eb 04                	jmp    b31 <ini_parse+0x9a4>
		goto _test_eof;
goto _again;}
 b2d:	90                   	nop
 b2e:	eb 01                	jmp    b31 <ini_parse+0x9a4>
/* #line 271 "src/ini_parse.rl" */
	{
				ini_parser_error("Syntax error in root");
				{cs = 10;	if ( p == pe )
		goto _test_eof;
goto _again;}
 b30:	90                   	nop
	if ( cs == 0 )
 b31:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # b38 <ini_parse+0x9ab>
 b38:	84 c0                	test   %al,%al
 b3a:	0f 84 c5 01 00 00    	je     d05 <ini_parse+0xb78>
	if ( ++p != pe )
 b40:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
 b45:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 b49:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
 b4d:	0f 85 b7 f6 ff ff    	jne    20a <ini_parse+0x7d>
	_test_eof: {}
 b53:	eb 01                	jmp    b56 <ini_parse+0x9c9>
		goto _test_eof;
 b55:	90                   	nop
	if ( p == eof )
 b56:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 b5a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
 b5e:	0f 85 a4 01 00 00    	jne    d08 <ini_parse+0xb7b>
	const char *__acts = _ini_actions + _ini_eof_actions[cs];
 b64:	0f b6 05 00 00 00 00 	movzbl 0x0(%rip),%eax        # b6b <ini_parse+0x9de>
 b6b:	0f be c0             	movsbl %al,%eax
 b6e:	48 63 d0             	movslq %eax,%rdx
 b71:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # b78 <ini_parse+0x9eb>
 b78:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
 b7c:	48 0f be d0          	movsbq %al,%rdx
 b80:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # b87 <ini_parse+0x9fa>
 b87:	48 01 d0             	add    %rdx,%rax
 b8a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	unsigned int __nacts = (unsigned int) *__acts++;
 b8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 b92:	48 8d 50 01          	lea    0x1(%rax),%rdx
 b96:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
 b9a:	0f b6 00             	movzbl (%rax),%eax
 b9d:	0f be c0             	movsbl %al,%eax
 ba0:	89 45 d4             	mov    %eax,-0x2c(%rbp)
	while ( __nacts-- > 0 ) {
 ba3:	e9 44 01 00 00       	jmpq   cec <ini_parse+0xb5f>
		switch ( *__acts++ ) {
 ba8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 bac:	48 8d 50 01          	lea    0x1(%rax),%rdx
 bb0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
 bb4:	0f b6 00             	movzbl (%rax),%eax
 bb7:	0f be c0             	movsbl %al,%eax
 bba:	83 f8 08             	cmp    $0x8,%eax
 bbd:	74 71                	je     c30 <ini_parse+0xaa3>
 bbf:	83 f8 08             	cmp    $0x8,%eax
 bc2:	7f 0a                	jg     bce <ini_parse+0xa41>
 bc4:	83 f8 03             	cmp    $0x3,%eax
 bc7:	74 1c                	je     be5 <ini_parse+0xa58>
 bc9:	e9 1e 01 00 00       	jmpq   cec <ini_parse+0xb5f>
 bce:	83 f8 0a             	cmp    $0xa,%eax
 bd1:	0f 84 a4 00 00 00    	je     c7b <ini_parse+0xaee>
 bd7:	83 f8 0d             	cmp    $0xd,%eax
 bda:	0f 84 e6 00 00 00    	je     cc6 <ini_parse+0xb39>
 be0:	e9 07 01 00 00       	jmpq   cec <ini_parse+0xb5f>
				ini_parser_error("Syntax error in [section]");
 be5:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # bec <ini_parse+0xa5f>
 bec:	e8 00 00 00 00       	callq  bf1 <ini_parse+0xa64>
				if((*p) == '\n') {cs = 1;	if ( p == pe )
 bf1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 bf5:	0f b6 00             	movzbl (%rax),%eax
 bf8:	3c 0a                	cmp    $0xa,%al
 bfa:	75 1a                	jne    c16 <ini_parse+0xa89>
 bfc:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # c03 <ini_parse+0xa76>
 c03:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 c07:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
 c0b:	0f 85 0d ff ff ff    	jne    b1e <ini_parse+0x991>
		goto _test_eof;
 c11:	e9 40 ff ff ff       	jmpq   b56 <ini_parse+0x9c9>
goto _again;} else {cs = 10;	if ( p == pe )
 c16:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # c1d <ini_parse+0xa90>
 c1d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 c21:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
 c25:	0f 85 f6 fe ff ff    	jne    b21 <ini_parse+0x994>
		goto _test_eof;
 c2b:	e9 26 ff ff ff       	jmpq   b56 <ini_parse+0x9c9>
				ini_parser_error("Syntax error in key=value");
 c30:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # c37 <ini_parse+0xaaa>
 c37:	e8 00 00 00 00       	callq  c3c <ini_parse+0xaaf>
				if((*p) == '\n') {cs = 1;	if ( p == pe )
 c3c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 c40:	0f b6 00             	movzbl (%rax),%eax
 c43:	3c 0a                	cmp    $0xa,%al
 c45:	75 1a                	jne    c61 <ini_parse+0xad4>
 c47:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # c4e <ini_parse+0xac1>
 c4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 c52:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
 c56:	0f 85 c8 fe ff ff    	jne    b24 <ini_parse+0x997>
		goto _test_eof;
 c5c:	e9 f5 fe ff ff       	jmpq   b56 <ini_parse+0x9c9>
goto _again;} else {cs = 10;	if ( p == pe )
 c61:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # c68 <ini_parse+0xadb>
 c68:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 c6c:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
 c70:	0f 85 b1 fe ff ff    	jne    b27 <ini_parse+0x99a>
		goto _test_eof;
 c76:	e9 db fe ff ff       	jmpq   b56 <ini_parse+0x9c9>
				ini_parser_error("Syntax error in comment");
 c7b:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # c82 <ini_parse+0xaf5>
 c82:	e8 00 00 00 00       	callq  c87 <ini_parse+0xafa>
				if((*p) == '\n') {cs = 1;	if ( p == pe )
 c87:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 c8b:	0f b6 00             	movzbl (%rax),%eax
 c8e:	3c 0a                	cmp    $0xa,%al
 c90:	75 1a                	jne    cac <ini_parse+0xb1f>
 c92:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # c99 <ini_parse+0xb0c>
 c99:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 c9d:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
 ca1:	0f 85 83 fe ff ff    	jne    b2a <ini_parse+0x99d>
		goto _test_eof;
 ca7:	e9 aa fe ff ff       	jmpq   b56 <ini_parse+0x9c9>
goto _again;} else {cs = 10;	if ( p == pe )
 cac:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # cb3 <ini_parse+0xb26>
 cb3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 cb7:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
 cbb:	0f 85 6c fe ff ff    	jne    b2d <ini_parse+0x9a0>
		goto _test_eof;
 cc1:	e9 90 fe ff ff       	jmpq   b56 <ini_parse+0x9c9>
				ini_parser_error("Syntax error in root");
 cc6:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # ccd <ini_parse+0xb40>
 ccd:	e8 00 00 00 00       	callq  cd2 <ini_parse+0xb45>
				{cs = 10;	if ( p == pe )
 cd2:	c6 05 00 00 00 00 0a 	movb   $0xa,0x0(%rip)        # cd9 <ini_parse+0xb4c>
 cd9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 cdd:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
 ce1:	0f 85 49 fe ff ff    	jne    b30 <ini_parse+0x9a3>
		goto _test_eof;
 ce7:	e9 6a fe ff ff       	jmpq   b56 <ini_parse+0x9c9>
	while ( __nacts-- > 0 ) {
 cec:	8b 45 d4             	mov    -0x2c(%rbp),%eax
 cef:	8d 50 ff             	lea    -0x1(%rax),%edx
 cf2:	89 55 d4             	mov    %edx,-0x2c(%rbp)
 cf5:	85 c0                	test   %eax,%eax
 cf7:	0f 85 ab fe ff ff    	jne    ba8 <ini_parse+0xa1b>
/* #line 512 "src/ini_parse.c" */
		}
	}
	}

	_out: {}
 cfd:	eb 09                	jmp    d08 <ini_parse+0xb7b>
		goto _out;
 cff:	90                   	nop
 d00:	eb 07                	jmp    d09 <ini_parse+0xb7c>
	goto _out;
 d02:	90                   	nop
 d03:	eb 04                	jmp    d09 <ini_parse+0xb7c>
		goto _out;
 d05:	90                   	nop
 d06:	eb 01                	jmp    d09 <ini_parse+0xb7c>
	_out: {}
 d08:	90                   	nop
	}

/* #line 278 "src/ini_parse.rl" */

}
 d09:	90                   	nop
 d0a:	c9                   	leaveq 
 d0b:	c3                   	retq   
