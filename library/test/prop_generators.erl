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

text_not_starting_with_dash() ->
  ?SUCHTHAT(Text, string(), begin
                              case Text of
                                [$- | _] -> false;
                                _ -> true
                              end
                            end).

tree(Type) -> ?SIZED(S,
                     ?LET( Value
                         , frequency([ {1, undefined}
                                     , {S, [{Type, ?LAZY(tree(Type))}]}
                                     , {S, [{?LAZY(tree(Type)), Type}]}
                                     ])
                         , Value
                         )
                    ).
