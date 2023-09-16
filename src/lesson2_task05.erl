-module(lesson2_task05).
-export([reverse/1]).

reverse(List) ->
    reverse(List,[]).
reverse([],RL) ->
    RL;
reverse([H|T],RL) ->
    reverse(T,[H|RL]).