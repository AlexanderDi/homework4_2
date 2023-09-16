-module(lesson3_task01_2).
-export([first_word/1]).
-import(lesson2_task05, [reverse/1]).

first_word(Bintext) ->
    first_word(Bintext,<<"">>).
first_word(<<" ",_/binary>>,Acc) ->
    Acc;
first_word(<<X:1/binary, T/binary>> ,Acc) ->
    io:format("~p~n", [X]),
    first_word(T, <<Acc/binary, X/binary>>).
