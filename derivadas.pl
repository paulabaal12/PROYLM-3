% Derivadas básicas
derivada(C, _, 0) :- number(C).  % Derivada de constantes
derivada(x, X, 1).  % Derivada de la variable X

% Regla de la suma

% Regla de la resta

% Regla del producto
derivada(F * G, X, F * DG + G * DF) :- 
    derivada(F, X, DF), 
    derivada(G, X, DG).

% Regla del cociente
derivada(F / G, X, (DF * G - F * DG) / (G * G)) :- 
    derivada(F, X, DF), 
    derivada(G, X, DG).

% Derivada de la función tangente
derivada(tan(F), X, sec(F) * sec(F) * DF) :- 
    derivada(F, X, DF).

% Derivada de la función cotangente
derivada(cot(F), X, -csc(F) * csc(F) * DF) :- 
    derivada(F, X, DF).


% Derivada de la función arcotangente
derivada(atan(F), X, DF / (1 + F * F)) :-
    derivada(F, X, DF).
