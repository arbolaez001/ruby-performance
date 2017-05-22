require 'benchmark/ips'

ARRAY = (1..100_000).to_a

def fastest
  i = 0
  while i < ARRAY.size
    i
    i += 1;
  end
end

def fast
  ARRAY.each do |number|
    number
  end
end

def slow
  for number in ARRAY do
    number
  end
end

Benchmark.ips do |x|
  x.report('while loop')  { fastest }
  x.report('each loop')   { fast }
  x.report('for loop')    { slow }
  x.compare!
end