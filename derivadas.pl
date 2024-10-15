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