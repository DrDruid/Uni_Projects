/*A simple adventure game , type instructions. , to get accustomed with the controls*/

:- dynamic curloc/1, loc/2.
:- retractcall(loc(_,_)),retactcall(curloc(_).


/*My starting location*/

curloc(car).

/*Room descriptions-connections*/

path(car,road) :- open(car_door).
path(car,road) :-
	      write('Do not forget to open the door'),nl,
	      !,fail.
path(road,gas_station).
path(gas_station,gas_station_in) :-open(gas_station_door).
path(gas_station,gas_station_in) :-
                                write('Try opening the door.'),nl,
   				!,fail.
path(gas_stastion_in,road) :- take(soda).
path(gas_station_in,road) :-
		 write('You forgot to buy the can of soda try again'),nl,
  		 !,fail.
path(road,car).

/*Now  we describe where are the items.*/

loc(soda,gas_station_in).

/*Rules as how to pick an object.*/

 take(X) :-
	loc(X, in_hand),
	write('You already got it !'),
	nl,!.

take(X) :-
	curloc(Place),
	loc(X,Place),
	retract(loc(X,Place)),
	assert(at(X,in_hand)),
	write('Thank you for your purchase'),
	nl, !.

take(_) :-
	write('I dont see it there! '),
	nl.

/*Rules for movement*/

goto(There):-
	        curloc(Here),
		path(Here,There),
		retract(curloc(Here)),
 		assert(curloc(There)),
		look, !.
goto(_) :- write( 'You can''t go there yet.').

/*Rule to look around*/

look :-
     curloc(Place),
     describe(Place),
     nl,
     notice_objects_here(Place),
     nl.

/* Check if there're any obejects around in the room*/

notice_objects_here(Place) :-
			    loc( X,Place),
			    write('There is a can of '), write(X), write(' in here. '),nl,
  		            fail.

notice_objects_here(_).

/*Rule to open the door.*/
     
open(car_door):-
          curloc(car),
	  write('Now you can move on. '),nl.

open(gast_station_door):-
			curloc(gas_station).
			write(' Time ot get in the Gas Station. '), nl.

open(_):-
	write('Hhmmm no door here), nl,
	!,fail.

/*How the game will end itself*/

drive:-
      !,end.

/*How end commands will work*.

 end :-
     loc(soda,in_hand),
     curloc(car),
     write(' The game is over. Please enter the halt. command'),
     nl,!.

/*The instruction rules*/

instructions:-
	    nl,
	    write('Enter coommands using standard Prolog syntax.'),nl,
	    write('Available commands are: '),nl,
	    write('start.    --to start the game. '), nl,
            write('goto(Direction).  --to go in that directions. '), nl,
	    write('Directions are as follow : car,road, gas_station, gas_station_in. '), nl,
            write('take(Object).    --to pick up an object. '), nl,
	    write(' Object is : soda'), nl,
	    write('open(Doorway). --to open a door if needed.'), nl,
	    write(' Doorway are: car_door, gas_station_door. '), nl,
            write('look.    --to look around you. '), nl,
            write('instructions.  --to see this message again. '), nl,
            write('halt.  --to end the game. '), nl,
            nl.

/*This rule prints out instructions and tells you where you are. */

start:-
	instructions.
      	look.


/*Describe the rooms,some rooms may have more than 1 description */

describe(car):-
	    loc(soda,in_hand),
	    write('Congrats!! You  completed successfully the task', nl,
            write(' and won the game.'),nl,
	    end, !.

describe(car):-
	     write('You are in your car and you'), nl,
	     write('want to buy a newspaper and a can), nl,
	     write(' of soda. Once you do it come back here.'),nl.

describe(road):-
	      write('Look here is the gas station just cross the road and open the door.'),nl.

describe(gats_station):-
		      write('What are you waiting for? Get inside! '), nl.

describe(gas_station_in):-
			loc(soda,in_hand),
			write('Now we can go back! '), nl.

describe(gas_station_in) :-
			 write('Dont forget to buy the stuff.'), nl.
