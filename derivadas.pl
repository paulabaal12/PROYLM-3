% Derivadas básicas
derivada(C, _, 0) :- number(C).  % Derivada de constantes
derivada(x, _, 1).  % Derivada de la variable x

% Regla de la suma
derivada(F + G, X, DF + DG) :- 
    derivada(F, X, DF), 
    derivada(G, X, DG).

% Regla de la resta
derivada(F - G, X, DF - DG) :- 
    derivada(F, X, DF), 
    derivada(G, X, DG).

% Regla del producto
derivada(F * G, X, F * DG + G * DF) :- 
    derivada(F, X, DF), 
    derivada(G, X, DG).

% Regla del cociente
derivada(F / G, X, (DF * G - F * DG) / (G * G)) :- 
    derivada(F, X, DF), 
    derivada(G, X, DG).

% Función exponencial
derivada(exp(F), X, exp(F) * DF) :-
    derivada(F, X, DF).

% Función logaritmo natural
derivada(ln(F), X, DF / F) :-
    derivada(F, X, DF).

% Función seno
derivada(sen(F), X, cos(F) * DF) :-
    derivada(F, X, DF).

% Función coseno
derivada(cos(F), X, -sen(F) * DF) :-
    derivada(F, X, DF).

% Derivada de la función tangente
derivada(tan(F), X, sec(F) * sec(F) * DF) :- 
    derivada(F, X, DF).

% Derivada de la función arcotangente
derivada(atan(F), X, DF / (1 + F * F)) :-
    derivada(F, X, DF).

% Derivada de una potencia (F^N)
derivada(F ** N, X, N * F ** (N - 1) * DF) :-
    derivada(F, X, DF).