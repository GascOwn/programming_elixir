Chop.guess 273, 1..1000
PipeMath.pipe_range 1..10
IO.puts "Example was written by #{Example.get_author}"
MyList.mymap [1, 2, 3, 4], &{&1 + 1}
IO.puts MyList.reduce([1,2,3,4,5], 0, &(&1 + &2)) #this is a fold
