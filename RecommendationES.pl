/*---------------------------*/
/* MEDIA RECOMMENDATION TOOL */
/*---------------------------*/

/*-----------------*/
/* DRIVE PREDICATE */
/*-----------------*/ 

start:-					
	instructions,
	rule(Number,Key,Rec),
	write('Your recommendation is:'),nl,nl,
	write(Rec),nl,nl,
	write('The rule used was number '),
	write(Number),nl,nl,
	retractall(data(_)).			
				
start:-
	write('Sorry, there is no recommendation for your choices.'),nl,nl,
	retractall(data(_)).


/*--------------*/
/* INSTRUCTIONS */
/*--------------*/ 

instructions:-
	write('*** Media Recommendation Tool ***'),nl,nl,
	write('*** This system will give you recommendations for either: ***'),nl,nl,
	write('1 - Movies'),nl,
	write('2 - Music'),nl,nl,
	write('*** Enter the chosen type below by typing the corresponding number ***'),nl,nl,
	read(X),
	option(X).

/*--------*/
/* MOVIES */
/*--------*/

option(1):-
	write('*** WIP ***'),nl.
	
/*-------*/
/* MUSIC */
/*-------*/

option(2):-
	write('*** You have selcted; Music ***'),nl,nl,
	get_musicinfo.

/*--------------------------------------------*/
/* ASK MOVIE QUESTIONS AND GATHER INFORMATION */
/*--------------------------------------------*/

%Dylan

/*--------------------------------------------*/
/* ASK MUSIC QUESTIONS AND GATHER INFORMATION */
/*--------------------------------------------*/

get_musicinfo:-
	musicquestion(Question,Info),	
	write(Question),nl,
	getcorrectans(Ans),nl,
	(Ans='y'),		
	assertz(data(Info)),
	(Ans='n'),			
	retract(data(Info)),  		
	fail.

get_musicinfo.

/*-----------------*/
/* MOVIE QUESTIONS */
/*-----------------*/

%Dylan

/*-----------------*/
/* MUSIC QUESTIONS */
/*-----------------*/

musicquestion('Do you like Rock?',rock).
musicquestion('Do you like Electronic?',electronic).
musicquestion('Do you like Hardcore?',hardcore).
musicquestion('Do you like Ambient?',ambient).
musicquestion('Do you like Experimental?',experimental).
musicquestion('Do you want an album from the Seventies?',seventies).
musicquestion('Do you want an album from the Eighties?',eighties).
musicquestion('Do you want an album from the Nineties?',nineties).
musicquestion('Do you want an album from the Noughties?',noughties).
musicquestion('Do you want an album from the Tens?',tens).

/*--------------------------------*/
/* CHECK WHETERER INPUT IS Y OR N */
/*--------------------------------*/

getcorrectans(X):-
	repeat,
	write('Please answer y or n:'),nl,
	read(Z),nl,
	check(Z),
	X=Z,!.				
					
check('y').
check('n').

/*----------------*/
/* KNOWLEDGE BASE */
/*----------------*/

rule(1,tree, 'David Sylvian - Brilliant Trees, as you chose: Rock, Ambient, and Eighties.'):-	
	data(rock),data(ambient),data(eighties).
	
rule(2,confield, 'Autechre - Confield, as you chose: Electronic, Experimental, and Noughties.'):-
	data(electronic),data(experimental),data(noughties).

rule(3,care, 'Aphex Twin - I Care Because You Do, as you chose: Electronic and Nineties.'):-
	data(electronic),data(nineties).

rule(4,daydream, 'Sonic Youth - Daydream Nation, as you chose: Rock and Eighties.'):-	
	data(rock),data(eighties).
	
rule(5,decline, 'Stars of the Lid - And Their Refinement of the Decline, as you chose: Ambient and Noughties.'):-
	data(ambient),data(noughties).

rule(6,germ, 'Germs - GI, as you chose: Hardcore and Seventies.'):-
	data(hardcore),data(seventies).
	
rule(7,trilogy, 'Eliane Radigue - Trilogie de la Mort, as you chose: Experimental and Nineties.'):-
	data(experimental),data(nineties).

rule(8,strangers, 'Andy Stott - Faith in Strangers, as you chose: Electronic and Tens.'):-	
	data(electronic),data(tens).

rule(9,medicine, 'Fugazi - Red Medicine, as you chose: Hardcore and Nineties.'):-
	data(hardcore),data(nineties).
	
rule(10,diary, 'Sunny Day Real Estate - Diary, as you chose: Rock and Nineties.'):-
	data(rock),data(nineties).

rule(11,kesto, 'Panasonic - Kesto (234.48:4), as you chose: Experimental and Noughties.'):-	
	data(experimental),data(noughties).

rule(12,fresh, 'Dead Kennedys - Fresh Fruit for Rotting Vegetables, as you chose: Hardcore and Eighties.'):-
	data(hardcore),data(eighties).

rule(13,unknown).




