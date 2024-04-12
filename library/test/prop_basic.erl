-module(prop_basic).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_is_permutation_test() ->
    ?FORALL(TupleList, tuples(),
        begin
            Result = library:sort_tuples(TupleList),
            is_same_length(TupleList, Result)
            andalso contains_same_elements(TupleList, Result)
        end).

prop_idempotency_test() ->
    ?FORALL(TupleList, tuples(),
        begin
            Result = library:sort_tuples(TupleList),
            SecondResult = library:sort_tuples(Result),
            Result =:= SecondResult
        end).

%%%%%%%%%%%%%%%
%%% Helpers %%%
%%%%%%%%%%%%%%%
is_same_length(A, B) ->
  length(A) =:= length(B).

contains_same_elements(A, B) ->
  SetA = sets:from_list(A),
  SetB = sets:from_list(B),
  sets:is_subset(SetA, SetB) andalso sets:is_subset(SetB, SetA).

%%%%%%%%%%%%%%%%%%
%%% Generators %%%
%%%%%%%%%%%%%%%%%%
tuples() -> list({term(), term()}).
