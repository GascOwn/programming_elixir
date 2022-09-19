defmodule HotelRoom do
  def book(%{name: name, height: height}) when height > 1.9 do
    IO.puts("Need extra-long bed for #{name}")
  end

  def book(%{name: name, height: height}) when height < 1.3 do
    IO.puts("Need low shower controls for #{name}")
  end

  def book(person) do
    IO.puts("Need regular bed for #{person.name}")
  end
end

# MAPS

# maps are key/value pairs

map = %{name: "Daniele", likes: "Programming", where: "Genova"}

Map.keys(map)
Map.values(map)

# PATTERN MATCHING FOR MAPS

# is there a  key entry for name? If so assign to variable
%{name: name} = map

# is there a key for name and likes?
%{name: _, likes: _} = map

people = [
  %{name: "Grumpy", height: 1.24},
  %{name: "Dave", height: 1.88},
  %{name: "Dopey", height: 1.32},
  %{name: "Shaquille", height: 2.16},
  %{name: "Sneezy", height: 1.28}
]

# Filtering by feeding a list of maps to a comprehension
IO.inspect(for person = %{height: height} <- people, height > 1.5, do: person)

people |> Enum.each(&HotelRoom.book/1)

data = %{name: "Daniele", city: "Genova", likes: "Elixir"}

for key <- [:name, :likes] do
  %{^key => value} = data
  value
end

# UPDATING A MAP

# replacing an existing key
new_map = %{data | city: "Rapallo", likes: "Programming"}

# creating a new key
Map.put_new(new_map, :age, 31)
