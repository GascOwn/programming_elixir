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
