# Control flow isn't used a lot in Elixir, more functional alternatives are preferred

if 1 == 1, do: "tua madre", else: "puttana"

unless 1 == 1, do: "ti puzza la vita"

# ase expressions are actually useful
case File.open("case.ex") do
  {:ok, file} -> IO.puts("First line: #{IO.read(file, :line)}")
  {:error, reason} -> IO.puts("Failed to open file: #{reason}")
end

# Nested pattern matching works well with case expressions
defmodule Users do
  dave = %{name: "Dave", state: "TX", likes: "programming"}

  case dave do
    %{state: some_state} = person -> IO.puts("#{person.name} lives in #{some_state}")
    _ -> IO.puts("No matches")
  end
end

# Guard clauses futher refine case expressions
dave2 = %{name: "Dave", age: 27}

case dave2 do
  person = %{age: age} when is_number(age) and age >= 21 ->
    IO.puts("You are cleared to enter the Foo Bar, #{person.name}")

  _ ->
    IO.puts("Sorry, no admission")
end
