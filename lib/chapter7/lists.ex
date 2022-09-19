defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  def mymap([], _), do: []
  def mymap([head | tail], func), do: [func.(head) | mymap(tail, func)]

  def reduce([], value, _), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  def mapsum([], _), do: 0

  def mapsum([head | tail], func) when is_integer(head) do
    func.(head) + mapsum(tail, func)
  end

  def bigger(a, b) when a > b, do: a
  def bigger(a, b) when a <= b, do: b
  def max([head | tail]), do: reduce(tail, head, &bigger/2)

  def span(from, to) when from != to, do: [from | span(from + 1, to)]
end
