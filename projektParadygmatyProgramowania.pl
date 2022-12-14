coord(a, 1).
coord(b, 2).
coord(c, 3).
coord(d, 4).
coord(e, 5).
coord(f, 6).
coord(g, 7).
coord(h, 8).

queen(c, 3).
queen(h, 6).

%rule checking if square requested is on the same row/colum as a queen
isThreatened(X1, Y1):-
    queen(X1, Y2);
    queen(X1, Y1);
    queen(X2, Y1),
    Y1<9,
    Y1>0,
    coord(X1, NumValX1),
    NumValX1<9,
    NumValX1>0.

%rule checking diagonals
isThreatened(X1, Y1):-
    queen(X2, Y2),
    coord(CheckX1, Y1),
    coord(CheckX2, Y2),
    Y1 =\= Y2,
    coord(X1, NumVal1),
    coord(X2, NumVal2),
    NumVal1<9,
    NumVal2<9,
    Y1<9,
    Y2<9,
    Y1>0,
    Y2>0,
    %assigning DivVal 'direction' of a vector between
    %queen on the board and chosen square
    DivVal is (abs(NumVal1-NumVal2)/abs(Y1-Y2)),
    %if absolute value of 'direction' is 1 then chosen square 
    %and the queen are on the same diagonal - square is threatened
    DivVal == 1.