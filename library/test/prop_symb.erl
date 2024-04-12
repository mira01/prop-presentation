-module(prop_symb).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_test() ->
    ?FORALL(D, dict(term()),
        begin
            dict:size(D) < 5
        end).

%%%%%%%%%%%%%%%%%%
%%% Generators %%%
%%%%%%%%%%%%%%%%%%
dict(T) ->
  ?LET(L, list({T, T}), dict:from_list(L)).
