require 'benchmark/ips'

ARRAY = (1..100_000).to_a

def fast
  i = 0
  while i < ARRAY.size
    ARRAY[i] + i
    i += 1;
  end
end

def slow
  ARRAY.each_with_index do |number, ix|
    number + ix
  end
end

Benchmark.ips do |x|
  x.report('while loop') { fast }
  x.report('each_with_index') { slow } # - 1.78x  slower
  x.compare!
end