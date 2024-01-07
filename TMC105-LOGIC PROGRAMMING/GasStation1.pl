/* SPIDER -- a sample adventure game, by David Matuszek.
   Consult this file and issue the command:   start.  */

:- dynamic at/2, i_am_at/1.   /* Needed by SWI-Prolog. */
:- retractall(at(_, _)), retractall(i_am_at(_)).

/* This defines my current location. */

i_am_at(car).


/* These facts describe how the rooms are connected. */
path( car, out, road).
path(road, cross, gas_entrance).
path(gas_entrance, gin, gas_station).
path(gas_station, gout, gas_entrance):- at(soda, in_hand).
path(gas_station, gout, gas_entrance) :-
				write('don’t forget take the listed item'), nl,
        !, fail.


path(gas_entrance, crossag, road).

path(road, in, car).



/* These facts tell where the various objects in the game
   are located. */

at(soda, gas_station).



/* These rules describe how to pick up an object. */

take(X) :-
        at(X, in_hand),
        write('You''re already holding it!'),
        nl, !.

take(X) :-
        i_am_at(Place),
        at(X, Place),
        retract(at(X, Place)),
        assert(at(X, in_hand)),
        write('Thank you for your purchase.'),
        nl, !.

take(_) :-
        write('I don''t see it here.'),
        nl.



/* These rules define the six direction letters as calls to go/1. */

out  :- go(out).

cross :- go(cross).

gin :- go(gin).

gout :- go(gout).

crossag :- go(crossag).

in :- go(in).


/* This rule tells how to move in a given direction. */

go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assert(i_am_at(There)),
        look, !.

go(_) :-
        write('You can''t go that way.').


/* This rule tells how to look about you. */

look :-
        i_am_at(Place),
        describe(Place),
        nl,
        notice_objects_at(Place),
        nl.


/* These rules set up a loop to mention all the objects
   in your vicinity. */

notice_objects_at(Place) :-
        at(X, Place),
        write('There is a '), write(X), write(' here.'), nl,
        fail.

notice_objects_at(_).

        

/* Under UNIX, the   halt.  command quits Prolog but does not
   remove the output window. On a PC, however, the window
   disappears before the final output can be seen. Hence this
   routine requests the user to perform the final  halt.  */

finish :-
        nl,
        write('The game is over. Please enter the   halt.   command.'),
        nl, !.


/* This rule just writes out game instructions. */

instructions :-
        nl,
        write('Enter commands using standard Prolog syntax.'), nl,
        write('Available commands are:'), nl,
        write('start.                   -- to start the game.'), nl,
        write('out.cross.gin.gout.crossag.in.   -- to go there.'), nl,
        write('take(Object).            -- to pick up an object.'), nl,     	  write('open.                    -- to open doors.'), nl,
        write('look.                    -- to look around you again.'), nl,
        write('instructions.            -- to see this message again.'), nl,
        write('halt.                    -- to end the game and quit.'), nl,
        nl.


/* This rule prints out instructions and tells where you are. */

start :-
        instructions,
        look.


/* These rules describe the various rooms.  Depending on
   circumstances, a room may have more than one description. */

describe(car) :-
        at(soda, in_hand),
        write('Congratulations!!  You have didn’t forget the can'), nl,
        write(' soda and won the game.'), nl,
        finish, !.

describe(car) :-
        write('You are in a car.  Cross the road'), nl,
        write('enter the gas station;'), nl,
        write('take a can of soda '), nl,
        write('rand come back in'), nl,
        write('this car.'), nl.

describe(road) :-
        at(soda, in_hand),
        write('Aaah  time to get in the car '), nl,
        write('and drive away'), nl.


describe(road) :-
        write('You are on the road cross it.'), nl,
        write('And go towards the gas station'), nl.


describe(gas_entrance) :-
        at(soda, in_hand),
        write('Let’s go.'), nl.

        

describe(gas_entrance) :-
        write('You are here, not many people inside just'), nl,
        write('open the door.  Don’t waste time!'), nl.

describe(gas_station) :-
        at(soda, in_hand),
        write('You got what we needed lets go,'), nl,
        write(' that’s was fast. '), nl.



describe(gas_station) :-
        write('Oh look there is the shelve with  drinks.'), nl.




