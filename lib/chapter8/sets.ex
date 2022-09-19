# Sets are implemented using MapSet

set1 = 1..5 |> Enum.into(MapSet.new())
set2 = 2..10 |> Enum.into(MapSet.new())

IO.puts(MapSet.member?(set1, 4))
_set3 = MapSet.union(set1, set2)
_set4 = MapSet.intersection(set1, set2)
