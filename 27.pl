% Define the graph as a list of edges
edge(a, b, 3).
edge(a, c, 5).
edge(b, d, 2).
edge(c, d, 8).
edge(d, e, 4).
edge(b, e, 7).

% best_first_search/4: Best First Search algorithm
best_first_search(Start, Goal, Path, Cost) :-
    best_first_search_helper([node(Start, [])], Goal, Path, Cost).

% Base case: Goal is the current node, return the path
best_first_search_helper([node(Goal, Path) | _], Goal, Path, 0).

% Recursive case: Expand the current node and continue the search
best_first_search_helper([node(Current, CurrentPath) | Rest], Goal, Path, Cost) :-
    expand(Current, CurrentPath, Children),
    insert_all(Children, Rest, NewOpen),
    best_first_search_helper(NewOpen, Goal, Path, Cost).

% expand/3: Generate the children of a node
expand(Current, CurrentPath, Children) :-
    findall(node(Next, [Next | CurrentPath]),
            (edge(Current, Next, _), \+ member(Next, CurrentPath)),
            Children).

% insert_all/3: Insert a list of nodes into the open list
insert_all([], Open, Open).
insert_all([H | T], Open, NewOpen) :-
    insert_node(H, Open, TempOpen),
    insert_all(T, TempOpen, NewOpen).

% insert_node/3: Insert a node into the open list based on the heuristic value
insert_node(Node, [], [Node]).
insert_node(node(State, Path), [node(State2, Path2) | Rest], [node(State, Path) | [node(State2, Path2) | Rest]]) :-
    heuristic(State, H1),
    heuristic(State2, H2),
    H1 =< H2.
insert_node(node(State, Path), [node(State2, Path2) | Rest], [node(State2, Path2) | NewRest]) :-
    heuristic(State, H1),
    heuristic(State2, H2),
    H1 > H2,
    insert_node(node(State, Path), Rest, NewRest).

% heuristic/2: Simple heuristic function (replace with your own heuristic)
heuristic(State, H) :-
    % In this example, the heuristic is the straight-line distance to the goal
    goal(Goal),
    distance(State, Goal, H).

% distance/3: Calculate the straight-line distance between two nodes
distance(X/Y, X1/Y1, D) :-
    Dx is X1 - X,
    Dy is Y1 - Y,
    D is sqrt(Dx*Dx + Dy*Dy).

% goal/1: Define the goal state
goal(X/Y) :- X = 5, Y = 5.
%?- best_first_search(a, e, Path, Cost).
