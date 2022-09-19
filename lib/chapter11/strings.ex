# Single quoted strings are lists of character codes, so they are basically a list of integers

str = 'wombat'
for s <- str, do: IO.puts(s)

# Double quotes strings are binaries

_str2 = "wombat"
