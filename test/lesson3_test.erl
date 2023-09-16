-module(lesson3_test).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

lesson2_test_() -> [
  ?_assert(lesson3_task01_2:first_word(<<"Some Text">>) =:= <<"Some">>),
  ?_assert(lesson3_task01_2:first_word(<<"Text Some">>) =:= <<"Text">>),
  ?_assert(lesson3_task01_2:first_word(<<"Test Some Text">>) =:= <<"Test">>),
  ?_assert(lesson3_task02:words(<<"Test Some Text">>) =:= [<<"Test">>, <<"Some">>, <<"Text">>]),
  ?_assert(lesson3_task02:words(<<"Text with four words">>) =:= [<<"Text">>, <<"with">>, <<"four">>, <<"words">>]),
  ?_assert(lesson3_task02:words(<<"Text with words">>) =:= [<<"Text">>, <<"with">>, <<"words">>]),
  ?_assert(lesson3_task03:split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, <<"-:-">>) =:= [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>]),
  ?_assert(lesson3_task03:split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-") =:= [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>]),
  ?_assert(lesson3_task03:split(<<"Col112345Col212345Col312345Col412345Col5">>, <<"12345">>) =:= [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>])
  ].

-endif.