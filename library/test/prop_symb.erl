-module(prop_symb).
-compile(export_all).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_test() ->
    ?FORALL(D, dict_symbolic(),
        begin
            dict:size(D) < 5
        end).

%%%%%%%%%%%%%%%%%%
%%% Generators %%%
%%%%%%%%%%%%%%%%%%
dict(T) ->
  ?LET(L, list({T, T}), dict:from_list(L)).

dict_symbolic() ->
  ?SIZED(Size, dict_symbolic(Size, {'$call', dict, new, []})).
dict_symbolic(0, Dict) -> Dict;
dict_symbolic(N, Dict) ->
  dict_symbolic(N-1, {'$call', dict, store, [integer(), integer(), Dict]}).
