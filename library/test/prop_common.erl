-module(prop_common).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_test() ->
    ?FORALL( {Common, {Suffix1, Suffix2}}
           , {list(number()), two_lists_starting_with_different_element()}
           , begin
               ComputedCommon = library:common(Common ++ Suffix1, Common ++ Suffix2),
               ComputedCommon =:= Common
               %collect(length(Common), true)
             end).

%%%%%%%%%%%%%%%
%%% Helpers %%%
%%%%%%%%%%%%%%%
boolean(_) -> true.

%%%%%%%%%%%%%%%%%%
%%% Generators %%%
%%%%%%%%%%%%%%%%%%

two_lists_starting_with_different_element() ->
 ?SUCHTHAT( {List1, List2}
          , {list(number()), list(number())}
          , case {List1, List2} of
              {[First1 | _], [First1 | _]} -> false;
              _ -> true
            end
          ).
