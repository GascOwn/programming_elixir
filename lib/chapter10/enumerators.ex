defmodule MyEnum do
  defp do_all( [head | tail], func) do
    case func.(head) do
      true -> do_all(tail, func)
      false -> false
    end
  end
  defp do_all([], _ ), do: true

  def all?(list, func) when is_list(list) and is_function(func)  do
    do_all(list, func)
  end
end

list = Enum.to_list(1..5)

Enum.concat([1,2,3], [4,5,6])

Enum.map(list, &(&1 * 10))

list_words = ["this", "is", "a", "list", "of", "random", "words"]

sorted = Enum.sort(list_words, &(String.length(&1) >= String.length(&2)))

for word <- sorted, do: IO.puts word

IO.puts MyEnum.all?([1,2,3,4,5,6], &(&1 != 10))
