def smash(string)
  string.scan(/^[A-z]+$/).join(' ')
end

p smash("hello, world!")