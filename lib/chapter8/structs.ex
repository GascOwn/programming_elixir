# Structs are wrapped in modules

defmodule Subscriber do
  defstruct name: "", paid: false , over_18: false
end

defmodule Attendee do
  defstruct name: "", paid: false , over_18: false

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts "Very cheap badge for #{name}"
  end
  def print_vip_badge(%Attendee{}), do: raise "missing name for badge"
end

# Structs can be nested

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

report = %{owner: %{name: "Daniele", company: "COSCO", severity: 1}}
updated = put_in(report[:owner][:company], "COSCO Shipping Italy")

IO.puts report[:owner][:company]
IO.puts updated[:owner][:company]

IO.inspect get_in(updated, [:owner, :name])

# The Access module provides functions to use as parameterstoget and get_and_update_in. These are simple filters.

# all and at work on lists.
cast = [
  %{ character: "Buttercup", actor: %{ first: "Robin", last: "Wright" }, role: "princess" },
  %{ character: "Westley", actor: %{ first: "Cary", last: "Elwes" }, role: "farm boy" }
]

IO.inspect get_in(cast, [Access.all(), :character])
IO.inspect get_in(cast, [Access.at(1), :role])


cast_with_tuples = [
  %{ character: "Buttercup", actor: { "Robin", "Wright" }, role: "princess" },
  %{ character: "Westley", actor: { "Cary", "Elwes" }, role: "farm boy" }
]

IO.inspect get_in(cast_with_tuples, [Access.all(), :actor, Access.elem(1)])
IO.inspect get_and_update_in(cast_with_tuples, [Access.all(), :actor, Access.elem(0)], fn (val) -> {val, String.reverse(val)} end)
