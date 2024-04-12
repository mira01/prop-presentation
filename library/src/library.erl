-module(library).

-export([ common/2
        , sort_tuples/1
        ]).

-spec common([term()], [term()]) -> [term()].
common([], _) ->
  [];
common(_, []) ->
  [];
common([L1 | Left], [R1 | Right]) when L1 == R1 ->
  [L1 | common(Left, Right)];
common([_L1 | _], [_R1 | _]) ->
  [].

-spec sort_tuples([{term(), term()}]) -> [{term(), term()}].
sort_tuples([]) ->
  [];
sort_tuples([H | T]) -> 
  IsLessOrEqual = fun({_, A}, {_, B}) -> A =< B end,  % compare second elements of tuple
  sort_tuples([ X || X <- T, IsLessOrEqual(X, H) ])
               ++ [H]
               ++ sort_tuples([ X || X <- T, not IsLessOrEqual(X, H)
              ]).
