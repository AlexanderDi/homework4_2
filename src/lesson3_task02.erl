-module(lesson3_task02).
-export([words/1]).
-import(lesson2_task05, [reverse/1]).

words(Bintext) ->
    words(Bintext,<<"">>,[]).
words(<<"">>,Acc,Acc2) ->
    reverse([Acc|Acc2]);
words(<<" ",T/binary>>,Acc,Acc2) ->
    words(T,<<"">>, [<<Acc/binary>>|Acc2]);
words(<<X:1/binary, T/binary>> ,Acc, Acc2) ->
    io:format("~p~n", [X]),
    words(T, <<Acc/binary, X/binary>>, Acc2).
