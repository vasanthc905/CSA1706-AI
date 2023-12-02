% Rules
ancestor(john,mary).
ancestor(mary,joseph).

% Queries
query_backward(X,Y) :-
   ( X = Y ->
     write('Yes, '), write(X), write(' is an ancestor of '), write(Y), nl, !
   ; X \= Y,
     ( ancestor(X,Y) ->
       write('Yes, '), write(X), write(' is an ancestor of '), write(Y), nl, !
     ; not_an_ancestor(X,Y)
     )
   ).

not_an_ancestor(X,Y) :-
   \+ ancestor(X,Y),
   write('No, '), write(X), write(' is not an ancestor of '), write(Y), nl.
