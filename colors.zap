

	.FUNCT	INTRO
	PRINTI	"
You drove west from London all day in your new little British "
	PRINTD	CAR
	PRINTI	". Now at last you've arrived in the storied land of Cornwall.

Dusk has fallen as you pull up in front of "
	PRINTD	CASTLE
	PRINTI	". A ghostly "
	PRINTD	MOON
	PRINTI	" is rising, and a tall iron gate between two pillars bars the way into the "
	PRINTD	COURTYARD
	PRINTI	".
"
	RTRUE	


	.FUNCT	YOUR-COLOR-F
	CALL	REMOTE-VERB?
	ZERO?	STACK \FALSE
	EQUAL?	HERE,YOUR-ROOM /?PRG11
	CALL	VISIBLE?,CAR
	ZERO?	STACK \?PRG11
	CALL	VISIBLE?,EXERCISE-OUTFIT
	ZERO?	STACK \?PRG11
	CALL	VISIBLE?,DINNER-OUTFIT
	ZERO?	STACK \?PRG11
	CALL	VISIBLE?,SLEEP-OUTFIT
	ZERO?	STACK \?PRG11
	CALL	NOT-HERE,YOUR-COLOR
	RSTACK	
?PRG11:	PRINTI	"It's "
	PRINTD	YOUR-COLOR
	PRINTR	"!"


	.FUNCT	GET-COLOR,NUM,N,WD,SUM=0,X,?TMP1
	PUTB	P-INBUF,0,30
?PRG1:	PRINTC	62
	READ	P-INBUF,P-LEXV
	GETB	P-LEXV,P-LEXWORDS >NUM
	ZERO?	NUM \?CND5
	PRINTC	34
	PRINT	BEG-PARDON
	PRINTI	""" "
	JUMP	?PRG1
?CND5:	SET	'N,P-LEXSTART
?PRG9:	GET	P-LEXV,N >WD
	CALL	ZMEMQ,WD,COLOR-WORDS >X
	ZERO?	X /?CCL13
	SET	'VARIATION,X
?REP10:	GETB	P-LEXV,P-LEXWORDS
	SUB	STACK,1
	MUL	P-LEXELEN,STACK
	ADD	P-LEXSTART,STACK >WD
	GET	P-LEXV,WD
	EQUAL?	STACK,W?PERIOD,W?!,W?? \?CND16
	SUB	WD,P-LEXELEN >WD
?CND16:	ADD	WD,1
	MUL	2,STACK >N
	GETB	P-LEXV,N >?TMP1
	ADD	1,N
	GETB	P-LEXV,STACK
	ADD	?TMP1,STACK
	ADD	-1,STACK >WD
	ADD	P-INBUF,1
	CALL	NON-BLANK-STUFF,FAVE-COLOR,STACK,WD
	PRINTI	"""Did you say "
	PRINTD	YOUR-COLOR
	PRINTI	" is "
	CALL	PRINT-COLOR,TRUE-VALUE
	PRINTI	"?"""
	CALL	YES?
	ZERO?	STACK /?PRG32
	ZERO?	VARIATION \?CND25
	GETB	P-LEXV,5
	GETB	P-INBUF,STACK >SUM
	CALL	ZMEMQ,SUM,COLOR-LETTERS >X
	ZERO?	X /?CCL29
	SET	'VARIATION,X
	JUMP	?CND27
?CCL13:	DLESS?	'NUM,1 /?REP10
	ADD	N,P-LEXELEN >N
	JUMP	?PRG9
?CCL29:	EQUAL?	SUM,112 \?CCL31
	SET	'VARIATION,PAINTER-C
	JUMP	?CND27
?CCL31:	MOD	SUM,MAX-VARS
	ADD	1,STACK >VARIATION
?CND27:	GET	COLOR-WORDS,VARIATION >COLOR-FORCED
?CND25:	CALL	DO-VARIATION
	PUTB	P-INBUF,0,80
	RTRUE	
?PRG32:	PRINTI	"""What, then?"""
	CRLF	
	SET	'VARIATION,0
	JUMP	?PRG1


	.FUNCT	FIX-COLOR-ADJ,OBJ,PT,N
	GETPT	OBJ,P?ADJECTIVE >PT
	ZERO?	PT /FALSE
	PTSIZE	PT
	SUB	STACK,1
	CALL	ZMEMQB,A?F.C,PT,STACK >N
	ZERO?	N /FALSE
	GET	COLOR-ADJS,VARIATION
	PUTB	PT,N,STACK
	RTRUE	


	.FUNCT	DO-VARIATION,C
	CALL	FIX-COLOR-ADJ,YOUR-COLOR
	CALL	FIX-COLOR-ADJ,YOUR-ROOM
	CALL	FIX-COLOR-ADJ,CAR
	CALL	FIX-COLOR-ADJ,SLEEP-OUTFIT
	CALL	FIX-COLOR-ADJ,EXERCISE-OUTFIT
	CALL	FIX-COLOR-ADJ,DINNER-OUTFIT
	EQUAL?	VARIATION,LORD-C \?CCL3
	LOC	LOVER >C
	JUMP	?CND1
?CCL3:	EQUAL?	VARIATION,FRIEND-C \?CCL5
	SET	'C,IRIS-CLOSET
	JUMP	?CND1
?CCL5:	EQUAL?	VARIATION,PAINTER-C \?CCL7
	SET	'C,VIVIEN-BOX
	JUMP	?CND1
?CCL7:	SET	'C,WENDISH-KIT
?CND1:	SET	'HIDING-PLACE,C
	MOVE	COSTUME,C
	MOVE	BLOWGUN,C
	EQUAL?	VARIATION,LORD-C \?CCL10
	SET	'VILLAIN-PER,LOVER
	MOVE	NECKLACE-OF-D,JACK-ROOM
	MOVE	JEWEL,LOCAL-GLOBALS
	SET	'TREASURE,WAR-CLUB
	MOVE	CLUE-2,PAINTER
	FSET	STAINED-WINDOW,CONTBIT
	MOVE	CLUE-3,STAINED-WINDOW
	MOVE	CLUE-4,GARDEN
	MOVE	CANE,UMBRELLA-STAND
	JUMP	?CND8
?CCL10:	EQUAL?	VARIATION,FRIEND-C \?CCL13
	SET	'VILLAIN-PER,FRIEND
	MOVE	TAMARA-EVIDENCE,TAMARA-BED
	GETPT	FRIEND,P?WEST
	PUT	STACK,NEXITSTR,STR?212
	MOVE	JOURNAL,TAMARA-BED
	FSET	JOURNAL,NDESCBIT
	MOVE	EARRING,JEWELRY-CASE
	MOVE	JEWEL,LOCAL-GLOBALS
	SET	'TREASURE,NECKLACE
	MOVE	NECKLACE,SKELETON
	MOVE	CLUE-4,COFFIN
	FCLEAR	CLUE-4,NDESCBIT
	FSET	CLUE-4,TAKEBIT
	MOVE	CLUE-3,BELL
	MOVE	BRICKS,BASEMENT
	JUMP	?CND8
?CCL13:	EQUAL?	VARIATION,DOCTOR-C \?CCL15
	SET	'VILLAIN-PER,DOCTOR
	MOVE	WENDISH-BOOK,BOOKCASE
	MOVE	LENS-BOX,WENDISH-KIT
	FCLEAR	LENS-BOX,NDESCBIT
	FSET	LENS-BOX,TAKEBIT
	MOVE	JOURNAL,DESK
	MOVE	LETTER-DEE,STUDY
	SET	'TREASURE,MOONMIST
	FSET	MOONMIST,SECRETBIT
	MOVE	CLUE-3,RHINO-HEAD
	MOVE	CLUE-4,GALLERY-CORNER
	FCLEAR	CLUE-4,NDESCBIT
	FSET	CLUE-4,TAKEBIT
	MOVE	MOONMIST,INKWELL
	JUMP	?CND8
?CCL15:	EQUAL?	VARIATION,PAINTER-C \?CND8
	SET	'VILLAIN-PER,PAINTER
	MOVE	VIVIEN-DIARY,VIVIEN-BOX
	MOVE	LENS-BOX,VIVIEN-BOX
	FCLEAR	LENS-BOX,NDESCBIT
	FSET	LENS-BOX,TAKEBIT
	SET	'TREASURE,SKULL
	MOVE	SKULL,BELL
	FSET	MUSIC,SECRETBIT
	MOVE	CLUE-3,ARMOR
?CND8:	EQUAL?	VILLAIN-PER,LOVER \?CCL21
	SET	'SEARCHER,LORD
	JUMP	?CND19
?CCL21:	SET	'SEARCHER,VILLAIN-PER
?CND19:	FSET?	VILLAIN-PER,FEMALE \FALSE
	FSET	GHOST-NEW,FEMALE
	RTRUE	


	.FUNCT	CANE-F,P
	CALL	ATTACK-VERB?
	ZERO?	STACK /?CCL3
	CALL	NO-VIOLENCE?,CANE
	RTRUE	
?CCL3:	CALL	DISCOVER-WAR-CLUB,CANE
	RSTACK	


	.FUNCT	PAINT-F
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	PRINTR	"It seems to be hiding something."
?CCL3:	EQUAL?	PRSA,V?TAKE-OFF,V?RUB /?CTR6
	EQUAL?	PRSA,V?REMOVE,V?LOOK-UNDER,V?BRUSH /?CTR6
	EQUAL?	PRSA,V?TAKE \?CCL7
	ZERO?	PRSI /?CCL7
?CTR6:	CALL	DISCOVER-WAR-CLUB,CANE,TRUE-VALUE
	RTRUE	
?CCL7:	CALL	DIVESTMENT?,PAINT
	ZERO?	STACK /FALSE
	CALL	HAR-HAR
	RSTACK	


	.FUNCT	DISCOVER-WAR-CLUB,OBJ,DO-IT=0,PER
	EQUAL?	PRSA,V?RUB,V?BRUSH /?CTR2
	ZERO?	DO-IT /?CCL3
?CTR2:	FSET?	WAR-CLUB,SECRETBIT \FALSE
	CALL	DISCOVER,WAR-CLUB,PAINT
	LOC	OBJ
	MOVE	WAR-CLUB,STACK
	LOC	OBJ
	CALL	ROB,OBJ,STACK
	MOVE	OBJ,LOCAL-GLOBALS
	MOVE	PAINT,LOCAL-GLOBALS
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?SEARCH,V?EXAMINE \FALSE
	FSET?	WAR-CLUB,SECRETBIT \FALSE
	FCLEAR	PAINT,SECRETBIT
	PRINTI	"There's something strange about this "
	PRINTD	OBJ
	PRINTI	". It's shaped like a baseball bat, but with hard, faceted bumps all over it. It has a new "
	PRINTD	PAINT
	PRINTR	"."


	.FUNCT	ATTACK-VERB?,SHOOT=0
	EQUAL?	PRSA,V?SLAP,V?KILL,V?ATTACK \?CCL3
	FSET?	PRSO,PERSONBIT /TRUE
	RFALSE	
?CCL3:	EQUAL?	PRSA,V?SHOOT \?CCL8
	ZERO?	SHOOT /FALSE
	FSET?	PRSO,PERSONBIT /TRUE
	RFALSE	
?CCL8:	EQUAL?	PRSA,V?PUT,V?RING \?CCL15
	ZERO?	SHOOT /FALSE
	ZERO?	PRSI /TRUE
	FSET?	PRSI,PERSONBIT /TRUE
	RFALSE	
?CCL15:	EQUAL?	PRSA,V?USE \FALSE
	ZERO?	PRSI /TRUE
	FSET?	PRSI,PERSONBIT /TRUE
	RFALSE	


	.FUNCT	WAR-CLUB-F
	EQUAL?	PRSA,V?COMPARE \?CCL3
	EQUAL?	JEWEL,PRSO,PRSI \FALSE
	CALL	START-SENTENCE,WAR-CLUB
	PRINTI	" has no "
	PRINTD	JEWEL
	PRINTR	" like this one."
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL10
	CALL	DESCRIBE-WAR-CLUB
	RSTACK	
?CCL10:	CALL	ATTACK-VERB?
	ZERO?	STACK /FALSE
	CALL	NO-VIOLENCE?,WAR-CLUB
	RTRUE	


	.FUNCT	DESCRIBE-WAR-CLUB
	PRINTI	"It's a "
	PRINTD	WAR-CLUB
	PRINTR	" that once belonged to the Zulu king Dingaan -- and it's studded with large diamonds!"


	.FUNCT	SKULL-F
	EQUAL?	PRSA,V?SEARCH,V?LOOK-INSIDE,V?EXAMINE \FALSE
	PRINTR	"This staring skull is frightfully old -- even older than the castle."


	.FUNCT	MOONMIST-F
	EQUAL?	PRSA,V?READ,V?PLAY /?CTR2
	EQUAL?	PRSA,V?FIND,V?EXAMINE \?CCL3
	IN?	MOONMIST,GLOBAL-OBJECTS \?CCL3
?CTR2:	SET	'CLOCK-WAIT,TRUE-VALUE
	PRINTR	"[You're playing it now!]"
?CCL3:	CALL	REMOTE-VERB?
	ZERO?	STACK \FALSE
	EQUAL?	PRSA,V?TAKE \?CCL13
	IN?	MOONMIST,GLOBAL-OBJECTS /?CCL16
	CALL	VISIBLE?,MOONMIST
	ZERO?	STACK /?CCL16
	LOC	MOONMIST
	CALL	PERFORM,PRSA,STACK,PRSI
	RTRUE	
?CCL16:	CALL	YOU-CANT
	RSTACK	
?CCL13:	CALL	NOT-HOLDING?,PRSO
	ZERO?	STACK \TRUE
	EQUAL?	PRSA,V?PUT,V?POUR \?CCL22
	ZERO?	PRSI /?CND23
	FSET?	PRSI,PERSONBIT \?CND23
	CALL	SHOOTING,MOONMIST
	ZERO?	STACK /?CND23
	RETURN	2
?CND23:	MOVE	MOONMIST,LOCAL-GLOBALS
	CALL	START-SENTENCE,MOONMIST
	PRINTI	" dribbles "
	ZERO?	PRSI \?CCL34
	CALL	GROUND-DESC
	PRINT	STACK
	JUMP	?PRG43
?CCL34:	FSET?	PRSI,SURFACEBIT /?PRG41
	PRINTI	"into"
	CALL	PRINTT,PRSI
	JUMP	?PRG43
?PRG41:	PRINTI	"on"
	CALL	PRINTT,PRSI
?PRG43:	PRINTR	", sizzles, and evaporates."
?CCL22:	CALL	DIVESTMENT?,MOONMIST
	ZERO?	STACK /?CCL46
	CALL	PERFORM,PRSA,INKWELL,PRSI
	RTRUE	
?CCL46:	EQUAL?	PRSA,V?EAT,V?DRINK \?CCL49
	EQUAL?	WINNER,PLAYER \FALSE
	PRINTI	"First it puts your tongue to sleep. Then your tummy. Then your brain."
	CALL	FINISH
	RSTACK	
?CCL49:	EQUAL?	PRSA,V?SMELL,V?EXAMINE \?CCL56
	PRINTR	"It's a greenish liquid with a strong odor."
?CCL56:	CALL	SHOOTING,MOONMIST
	RSTACK	


	.FUNCT	CLUE-1-F
	EQUAL?	PRSA,V?COMPARE \?CCL3
	EQUAL?	TREASURE,PRSO,PRSI \FALSE
	CALL	START-SENTENCE,TREASURE
	EQUAL?	VARIATION,LORD-C \?PRG16
	FSET?	PLAYER,FEMALE /?PRG16
	PRINTI	" looks just like the one on"
	JUMP	?PRG18
?PRG16:	PRINTI	" seems to match"
?PRG18:	PRINTI	" the "
	PRINTD	CLUE-1
	PRINTR	"!"
?CCL3:	EQUAL?	PRSA,V?READ,V?EXAMINE \FALSE
	FSET?	CLUE-1,TOUCHBIT /?CND22
	PRINTR	"You can't see its face."
?CND22:	CALL	NOT-HOLDING?,PRSO
	ZERO?	STACK \TRUE
	PRINTI	"The "
	PRINTD	CLUE-1
	PRINTI	" shows "
	EQUAL?	VARIATION,LORD-C \?CCL32
	PRINTI	"the King of "
	FSET?	PLAYER,FEMALE \?PRG40
	PRINTR	"Spades, holding a sceptre."
?PRG40:	PRINTI	"Clubs in one corner, with a picture of an African chief holding a "
	PRINTD	WAR-CLUB
	PRINTR	"; in the other corner is the King of Diamonds, with a picture of a crowned vulture clutching a diamond."
?CCL32:	EQUAL?	VARIATION,FRIEND-C \?CCL43
	FSET?	PLAYER,FEMALE \?PRG49
	PRINTR	"a Polynesian diver, holding a knife and plunging through black water."
?PRG49:	PRINTR	"a photo of singer Pearl Bailey."
?CCL43:	EQUAL?	VARIATION,DOCTOR-C \?CCL52
	FSET?	PLAYER,FEMALE \?PRG58
	PRINTD	CASTLE
	PRINTI	", with a cloud of mist hiding the "
	PRINTD	MOON
	PRINTR	"."
?PRG58:	PRINTI	"an Amazon hunter, aiming a "
	PRINTD	BLOWGUN
	PRINTR	" at the tree tops."
?CCL52:	EQUAL?	VARIATION,PAINTER-C \FALSE
	PRINTI	"a "
	PRINTD	SKELETON
	PRINTR	" in Chinese mandarin costume."


	.FUNCT	CLUE-2-F
	EQUAL?	PRSA,V?READ,V?EXAMINE \FALSE
	CALL	NOT-HOLDING?,PRSO
	ZERO?	STACK \TRUE
	FSET	CLUE-2,TOUCHBIT
	CALL	HE-SHE-IT,CLUE-2,TRUE-VALUE
	PRINTI	" says,"
	CRLF	
	EQUAL?	VARIATION,LORD-C \?CCL10
	SET	'CLUE-LOC,CHAPEL
	PRINTR	"""Forbidden fruit tempted the very first lass.
'Twas once in a garden but now in a glass."""
?CCL10:	EQUAL?	VARIATION,PAINTER-C \?CCL15
	FSET?	MUSIC,TOUCHBIT /?CCL18
	SET	'CLUE-LOC,SITTING-ROOM
	JUMP	?PRG21
?CCL18:	FSET?	BOTTLE,TOUCHBIT /?CCL20
	SET	'CLUE-LOC,BASEMENT
	JUMP	?PRG21
?CCL20:	SET	'CLUE-LOC,DRAWING-ROOM
?PRG21:	PRINTR	"""Three fellows argued about life:
1. 'Using this motto, no chap can go wrong:
    Leave the wench and the grape, but go with a ____!'
2. 'On the seas of my life sails a ship that is laden
    Not with bottles or tunes, but with innocent ______s!'
3. 'Women and singing are both very fine,
    But for me there is nothing to equal good ____!'"""
?CCL15:	EQUAL?	VARIATION,DOCTOR-C \?CCL24
	SET	'CLUE-LOC,GAME-ROOM
	PRINTR	"""My first is an 'I,' but find an 'eye' that sees not."""
?CCL24:	SET	'CLUE-LOC,DECK
	PRINTR	"""... Yet the ear distinctly tells,...
How the danger sinks and swells,
By the sinking or the swelling in the anger of the ____s..."""


	.FUNCT	CLUE-3-F
	EQUAL?	PRSA,V?READ,V?EXAMINE \FALSE
	CALL	NOT-HOLDING?,PRSO
	ZERO?	STACK \TRUE
	FSET	CLUE-3,TOUCHBIT
	FSET	CLUE-3,TAKEBIT
	CALL	HE-SHE-IT,CLUE-3,TRUE-VALUE
	PRINTI	" says,
"
	EQUAL?	VARIATION,LORD-C \?CCL10
	SET	'CLUE-LOC,GARDEN
	PRINTR	"""Despite its appearance, the fruit was quite sour.
One bite of the apple drove Eve from her bower."""
?CCL10:	EQUAL?	VARIATION,FRIEND-C \?CCL14
	SET	'CLUE-LOC,0
	PRINTR	"""... And so, all the night-tide, I lie down by the side
Of my darling -- my darling -- my life and my bride,...
In her tomb by the sounding sea."""
?CCL14:	EQUAL?	VARIATION,DOCTOR-C \?CCL18
	SET	'CLUE-LOC,GALLERY
	PRINTR	"""My second is in never but not in ever, and lies in a hidden 'end'."""
?CCL18:	SET	'CLUE-LOC,DECK
	PRINTR	"""My al___ has no glamour;
Its '____e' tones do clam___.
Can you find me?"""


	.FUNCT	CLUE-4-F
	EQUAL?	PRSA,V?READ,V?EXAMINE \FALSE
	CALL	NOT-HOLDING?,PRSO
	ZERO?	STACK \TRUE
	FSET	CLUE-4,TOUCHBIT
	FSET	CLUE-4,TAKEBIT
	CALL	HE-SHE-IT,CLUE-4,TRUE-VALUE
	PRINTI	" says,
"
	EQUAL?	VARIATION,LORD-C \?CCL10
	SET	'CLUE-LOC,FOYER
	PRINTR	"""Out of the sunshine, into the rain...
The end of the story is... Abel and CAIN.""
The last word is underlined."
?CCL10:	EQUAL?	VARIATION,FRIEND-C \?CCL14
	SET	'CLUE-LOC,BASEMENT
	PRINTR	"""If you search for 'A Cask of Amontillado,' don't get trapped!"""
?CCL14:	SET	'CLUE-LOC,OFFICE
	PRINTR	"""My third is the silent side of knight.
All together I am what you could use for poison-pen letters."""


	.FUNCT	PRINT-COLOR,X=0
	ZERO?	VARIATION \?CCL3
	ZERO?	X /FALSE
?CCL3:	GETB	FAVE-COLOR,0
	CALL	WORD-PRINT,STACK,1,FAVE-COLOR
	ZERO?	COLOR-FORCED /TRUE
	PRINTI	" and "
	PRINTB	COLOR-FORCED
	RTRUE	


	.FUNCT	TELL-SUFFIX,I,J=1
	GETB	SUFFIX,0 >I
	ZERO?	I /FALSE
	PRINTI	", "
	EQUAL?	JUNIOR-C,I \?CCL7
	PRINTI	"Junior"
	RTRUE	
?CCL7:	EQUAL?	SENIOR-C,I \?PRG13
	PRINTI	"Senior"
	RTRUE	
?PRG13:	GETB	SUFFIX,J
	PRINTC	STACK
	DLESS?	'I,1 /TRUE
	INC	'J
	JUMP	?PRG13


	.FUNCT	TITLE-NAME
	CALL	TITLE
	EQUAL?	TITLE-WORD,W?MRS,W?MS,W?MISS /?PRG7
	EQUAL?	TITLE-WORD,W?MISTER,W?MR /?PRG7
	EQUAL?	TITLE-WORD,W?DOCTOR,W?DR \?PRG9
?PRG7:	CALL	PRINT-NAME,LAST-NAME
	RSTACK	
?PRG9:	CALL	PRINT-NAME,FIRST-NAME
	RSTACK	


	.FUNCT	TITLE
	EQUAL?	TITLE-WORD,W?MRS \?CCL3
	PRINTI	"Mrs. "
	RTRUE	
?CCL3:	EQUAL?	TITLE-WORD,W?MS \?CCL7
	PRINTI	"Ms. "
	RTRUE	
?CCL7:	EQUAL?	TITLE-WORD,W?MISS \?CCL11
	PRINTI	"Miss "
	RTRUE	
?CCL11:	EQUAL?	TITLE-WORD,W?LADY \?CCL15
	PRINTI	"Lady "
	RTRUE	
?CCL15:	EQUAL?	TITLE-WORD,W?DAME \?CCL19
	PRINTI	"Dame "
	RTRUE	
?CCL19:	EQUAL?	TITLE-WORD,W?MADAME,W?MADAM \?CCL23
	PRINTI	"Madame "
	RTRUE	
?CCL23:	EQUAL?	TITLE-WORD,W?DOCTOR,W?DR \?CCL27
	PRINTI	"Dr. "
	RTRUE	
?CCL27:	EQUAL?	TITLE-WORD,W?LORD \?CCL31
	PRINTI	"Lord "
	RTRUE	
?CCL31:	EQUAL?	TITLE-WORD,W?SIR \?CCL35
	PRINTI	"Sir "
	RTRUE	
?CCL35:	EQUAL?	TITLE-WORD,W?MISTER,W?MR \?CCL39
	PRINTI	"Mr. "
	RTRUE	
?CCL39:	EQUAL?	TITLE-WORD,W?MASTER \FALSE
	PRINTI	"Master "
	RTRUE	


	.FUNCT	NON-BLANK-STUFF,DEST,SRC,CNT,ND=1,NS=0,B,OB=32
	DEC	'CNT
?PRG1:	GETB	SRC,NS >B
	EQUAL?	B,32 \?CCL4
	EQUAL?	NS,CNT /?CND3
	EQUAL?	OB,32 /?CND3
?CCL4:	PUTB	DEST,ND,B
	INC	'ND
	SET	'OB,B
?CND3:	IGRTR?	'NS,CNT \?PRG1
	SUB	ND,1
	PUTB	DEST,0,STACK
	RTRUE	


	.FUNCT	FULL-NAME,NO-TELL=0
	PUTB	SUFFIX,0,0
	PUTB	LAST-NAME,0,0
	SET	'MIDDLE-WORD,0
	SET	'TITLE-WORD,0
	ZERO?	NO-TELL \TRUE
	PRINTR	"""I said: Please state your full name."""


	.FUNCT	GET-NAME,NUM,N,M,I,BEG,END,?TMP1
	PUTB	P-INBUF,0,30
?PRG1:	PRINTC	62
	READ	P-INBUF,P-LEXV
	GETB	P-LEXV,P-LEXWORDS >NUM
	ZERO?	NUM \?CND5
	PRINTC	34
	PRINT	BEG-PARDON
	PRINTI	""" "
	JUMP	?PRG1
?CND5:	SET	'N,P-LEXSTART
	GET	P-LEXV,N >BEG
	CALL	TITLE-NOUN?,BEG
	ZERO?	STACK /?CND9
	DEC	'NUM
	ADD	N,P-LEXELEN >N
	SET	'TITLE-WORD,BEG
	EQUAL?	BEG,W?DOCTOR,W?DR,W?DETECT /?CND11
	SET	'GENDER-KNOWN,TRUE-VALUE
?CND11:	EQUAL?	BEG,W?MR,W?MISTER,W?MASTER /?CCL15
	EQUAL?	BEG,W?LORD,W?SIR \?PRG18
?CCL15:	FCLEAR	PLAYER,FEMALE
?PRG18:	GET	P-LEXV,N
	EQUAL?	STACK,W?PERIOD \?CND9
	DEC	'NUM
	ADD	N,P-LEXELEN >N
	JUMP	?PRG18
?CND9:	LESS?	NUM,2 \?CND23
	EQUAL?	BEG,W?QUIT,W?Q \?CCL27
	CALL	V-QUIT
	JUMP	?CND25
?CCL27:	EQUAL?	BEG,W?RESTART \?CCL29
	CALL	V-RESTART
	JUMP	?CND25
?CCL29:	EQUAL?	BEG,W?RESTORE \?CND25
	CALL	V-RESTORE
?CND25:	CALL	FULL-NAME
	JUMP	?PRG1
?CND23:	SET	'BEG,N
	SUB	NUM,1
	MUL	P-LEXELEN,STACK
	ADD	N,STACK >END
?PRG31:	GET	P-LEXV,END
	EQUAL?	STACK,W?PERIOD,W?!,W?? \?REP32
	SUB	END,P-LEXELEN >END
	JUMP	?PRG31
?REP32:	LESS?	BEG,END /?CND36
	CALL	FULL-NAME
	JUMP	?PRG1
?CND36:	GET	P-LEXV,END
	EQUAL?	STACK,W?SR,W?SENIOR \?CCL40
	SUB	END,P-LEXELEN >END
	PUTB	SUFFIX,0,SENIOR-C
	JUMP	?PRG51
?CCL40:	GET	P-LEXV,END
	EQUAL?	STACK,W?JR,W?JUNIOR \?CCL42
	SUB	END,P-LEXELEN >END
	PUTB	SUFFIX,0,JUNIOR-C
	JUMP	?PRG51
?CCL42:	ADD	END,1
	MUL	2,STACK >N
	GETB	P-LEXV,N >NUM
	LESS?	NUM,6 \?PRG51
	ADD	1,N
	GETB	P-LEXV,STACK >M
	SET	'I,0
?PRG44:	DLESS?	'NUM,0 /?CCL48
	GETB	P-INBUF,M
	EQUAL?	STACK,105,118,120 \?PRG51
	INC	'I
	GETB	P-INBUF,M
	SUB	STACK,32
	PUTB	SUFFIX,I,STACK
	INC	'M
	JUMP	?PRG44
?CCL48:	PUTB	SUFFIX,0,I
	SUB	END,P-LEXELEN >END
?PRG51:	GET	P-LEXV,END
	EQUAL?	STACK,W?PERIOD,W?COMMA,W?THE \?REP52
	SUB	END,P-LEXELEN >END
	JUMP	?PRG51
?REP52:	LESS?	BEG,END /?CND56
	CALL	FULL-NAME
	JUMP	?PRG1
?CND56:	ADD	END,1
	MUL	2,STACK >N
	GETB	P-LEXV,N >NUM
	SUB	END,P-LEXELEN >END
	GET	P-LEXV,END
	EQUAL?	STACK,W?APOSTROPHE \?CND58
	SUB	END,P-LEXELEN >END
	ADD	END,1
	MUL	2,STACK >N
	GETB	P-LEXV,N
	ADD	NUM,STACK >NUM
	INC	'NUM
?CND58:	GRTR?	BEG,END \?CND60
	CALL	FULL-NAME
	JUMP	?PRG1
?CND60:	ADD	BEG,P-LEXELEN >I
?PRG62:	GRTR?	I,END \?CCL66
	SET	'MIDDLE-WORD,0
	JUMP	?REP63
?CCL66:	GET	P-LEXV,I >M
	EQUAL?	M,W?THE,W?OF,W?COMMA /?CCL68
	ADD	I,P-LEXELEN >I
	JUMP	?PRG62
?CCL68:	SET	'MIDDLE-WORD,M
	ADD	I,P-LEXELEN
	ADD	1,STACK
	MUL	2,STACK >M
	ADD	1,N
	GETB	P-LEXV,STACK >?TMP1
	ADD	1,M
	GETB	P-LEXV,STACK
	SUB	?TMP1,STACK
	ADD	NUM,STACK >NUM
	SET	'N,M
?REP63:	ADD	1,N
	GETB	P-LEXV,STACK
	ADD	P-INBUF,STACK
	CALL	NON-BLANK-STUFF,LAST-NAME,STACK,NUM
	SUB	N,P-WORDLEN >N
	ZERO?	MIDDLE-WORD /?CND69
	SUB	N,P-WORDLEN >N
?CND69:	MUL	2,BEG
	ADD	3,STACK
	GETB	P-LEXV,STACK >BEG
	GETB	P-LEXV,N >?TMP1
	ADD	1,N
	GETB	P-LEXV,STACK
	ADD	?TMP1,STACK
	ADD	-1,STACK >END
	SUB	END,BEG
	ADD	1,STACK >N
	ADD	P-INBUF,BEG
	CALL	NON-BLANK-STUFF,FIRST-NAME,STACK,N
	PRINTI	"""Did you say your name is "
	CALL	TELL-FULL-NAME
	PRINTI	"?"""
	CALL	YES?
	ZERO?	STACK /?PRG78
	PUTB	P-INBUF,0,80
	RTRUE	
?PRG78:	PRINTI	"""Then please speak up.""
"
	CALL	FULL-NAME,TRUE-VALUE
	JUMP	?PRG1


	.FUNCT	PRINT-NAME,TBL,PTR=0,LEN,CH,OCH,SP?=1
	GETB	TBL,0 >LEN
?PRG1:	IGRTR?	'PTR,LEN /?REP2
	SET	'OCH,CH
	GETB	TBL,PTR >CH
	LESS?	CH,97 /?CTR6
	GRTR?	CH,122 \?CCL7
?CTR6:	PRINTC	CH
	JUMP	?CND5
?CCL7:	ZERO?	SP? /?CCL11
	SUB	CH,32
	PRINTC	STACK
	JUMP	?CND5
?CCL11:	EQUAL?	OCH,39 \?CTR12
	EQUAL?	PTR,LEN /?CTR12
	ADD	1,PTR
	GETB	TBL,STACK
	EQUAL?	32,STACK \?CCL13
?CTR12:	PRINTC	CH
	JUMP	?CND5
?CCL13:	SUB	CH,32
	PRINTC	STACK
?CND5:	EQUAL?	CH,32,46 /?CTR18
	EQUAL?	CH,45,38 \?CCL19
?CTR18:	SET	'SP?,TRUE-VALUE
	JUMP	?PRG1
?CCL19:	SET	'SP?,FALSE-VALUE
	JUMP	?PRG1
?REP2:	EQUAL?	CH,46 /FALSE
	RTRUE	

	.ENDI