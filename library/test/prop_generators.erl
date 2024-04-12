-module(prop_generators).
-compile(export_all).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_test() ->
    ?FORALL(Type, mytype(),
        begin
            boolean(Type)
        end).

%%%%%%%%%%%%%%%
%%% Helpers %%%
%%%%%%%%%%%%%%%
boolean(_) -> true.

%%%%%%%%%%%%%%%%%%
%%% Generators %%%
%%%%%%%%%%%%%%%%%%
%proper_gen:pick(prop_generators:sorted_list(proper_types:number())).
sorted_list(T) ->
  ?LET(L, list(T), lists:sort(L)).
