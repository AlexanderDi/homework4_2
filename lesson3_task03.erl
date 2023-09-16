-module(lesson3_task03).
-export([split/2]).
-import(lesson2_task05, [reverse/1]).


split(Bintext, Chars) when is_binary(Chars) ->
    split(Bintext,Chars,chars(Chars),<<"">>,[]);
split(Bintext, Chars) when is_list(Chars) ->
    XX = list_to_binary(Chars),
    split(Bintext, XX,chars(XX),<<"">>,[]).


chars(Chars) ->
    chars(Chars,0).
chars(<<"">>, Acc) ->
    Acc;
chars(<<_:1/binary, T/binary>>,Acc) ->
    chars(T,Acc+1).

split(<<"">>,_,_,Acc,Acc2) ->
    reverse([Acc|Acc2]);
split(_,_, Chars,_,_) when Chars>5 ->
    "The separator is too big";
split(<<Chars:1/binary,T/binary>>,Chars,CharsSize,Acc,Acc2) when CharsSize==1 ->
    split(T,Chars,CharsSize,<<"">>, [<<Acc/binary>>|Acc2]);
split(<<Chars:2/binary,T/binary>>,Chars,CharsSize,Acc,Acc2) when CharsSize==2 ->
    split(T,Chars,CharsSize,<<"">>, [<<Acc/binary>>|Acc2]); 
split(<<Chars:3/binary,T/binary>>,Chars,CharsSize,Acc,Acc2) when CharsSize==3 ->
    split(T,Chars,CharsSize,<<"">>, [<<Acc/binary>>|Acc2]);
split(<<Chars:4/binary,T/binary>>,Chars,CharsSize,Acc,Acc2) when CharsSize==4 ->
    split(T,Chars,CharsSize,<<"">>, [<<Acc/binary>>|Acc2]);
split(<<Chars:5/binary,T/binary>>,Chars,CharsSize,Acc,Acc2) when CharsSize==5 ->
    split(T,Chars,CharsSize,<<"">>, [<<Acc/binary>>|Acc2]);                         
split(<<X:1/binary, T/binary>> ,Chars,CharsSize, Acc, Acc2) ->
    split(T,Chars,CharsSize, <<Acc/binary, X/binary>>, Acc2).