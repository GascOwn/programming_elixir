defmodule Chop do
  def guess(actual, range) do
    a..b = range
    current_guess = div(a + b, 2)
    IO.puts("Is it #{current_guess}?")
    guess_helper(actual, range, current_guess)
  end

  def guess_helper(actual, _, actual), do: IO.puts(actual)

  def guess_helper(actual, a.._, guess) when guess > actual do
    guess(actual, a..(guess - 1))
  end

  def guess_helper(actual, _..b, guess) when guess < actual do
    guess(actual, (guess + 1)..b)
  end
end

defmodule PipeMath do
  def pipe_range(range) do
    range |> Enum.map(&(&1 * 2)) |> Enum.filter(&(&1 <= 30))
  end
end

defmodule Example do
  #  def compile_and_go(source) do
  #    alias My.Other.Module.Parser, as: Parser
  #    alias My.Other.Module.Runner, as: Runner
  #    source
  #    |> Parser.parse()
  #    |> Runner.execute()
  #  end
  @author "Dave Thomas"
  def func1 do
    List.flatten([1, [2, 3], 4])
  end

  def func2 do
    import List, only: [flatten: 1]
    flatten([5, [6, 7], 8])
  end

  def get_author do
    @author
  end
end
