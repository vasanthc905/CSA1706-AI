% Facts about fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(strawberry, red).
fruit_color(blueberry, blue).

% Predicate to find the color of a fruit using backtracking
find_color(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Example usage:
% ?- find_color(apple, Color).
% Color = red ;
% false.

% ?- find_color(grape, Color).
% Color = purple ;
% false.

% ?- find_color(pear, Color).
% false.
