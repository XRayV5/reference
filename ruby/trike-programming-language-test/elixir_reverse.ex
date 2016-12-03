
 defmodule ReverseList  do

   def revsList(n, intlist) when n == "!" do
    IO.inspect myReverse(intlist)
   end

   def revsList(n, intlist) do
     IO.puts n
     intlist = [n | intlist]
     IO.inspect intlist
     IO.puts intlist
     revsList(intlist)
   end

   def revsList(intlist) do
    var = IO.gets "enter an integer or enter '!' to finish."
    var = String.trim(var, "\n")
    revsList(var,intlist)
   end

   def myReverse([]) do
     []
   end

   def myReverse(list) do
     do_reverse(list, [])
   end

   def do_reverse([], acc) do
     acc
   end

   def do_reverse([h|t], acc) do
     do_reverse(t, [h | acc])
   end
 end

 ReverseList.revsList([])
