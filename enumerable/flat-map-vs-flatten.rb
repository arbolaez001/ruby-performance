require 'benchmark/ips'

ARRAY = (1..100_000).to_a

def fast
  ARRAY.flat_map do |num|
    [num, (num * num)]
  end
end

def slow
  ARRAY.map do |num|
    [num, (num * num)]
  end.flatten
end

Benchmark.ips do |x|
  x.report('flat_map')    { fast }
  x.report('map.flatten') { slow } # - 2.16x  slower
  x.compare!
end