%Diagrama de Hasse %

%Divisores de un numero%

divisores(N,Divisores):-
	findall(D, (between(1,N,D), N mod D =:=0),Divisores).
	
%Relacion de divisibilidad%

relacion_divisivilidad(X,Y):-
	X\=Y,
	Y mod X =:= 0.
	
%relacion diercta en el diagrama% %\+ significa: "no es cierto que:" %	
relacion_hasse(X,Y,Divisores):-
	relacion_divisivilidad(X,Y),
	\+ (member(Z,Divisores),Z\=X,Z\=Y,relacion_divisivilidad(X,Z),relacion_divisivilidad(Z,Y)).

%Diagrama de Hasse%

diagrama_hasse(N,Hasse):-
	divisores(N,Divisores),
	findall((X,Y),(member(X,Divisores),member(Y,Divisores),relacion_hasse(X,Y,Divisores)),Hasse).
	
%Mostrar Diagrama de Hasse%
mostrar_diagrama_hasse([]).
mostrar_diagrama_hasse([(X,Y)|T]):-
	format("[~w] -> [~w]~n",[X,Y]),
	mostrar_diagrama_hasse(T).
	
%Funcion Hasse%
hasse_divisores(N):-
	diagrama_hasse(N,Hasse),
	format("Diagrama de Hasse de los divisores de ~w:~n",[N]),
	mostrar_diagrama_hasse(Hasse).