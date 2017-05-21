require 'benchmark/ips'

ARRAY = (1..100).to_a

def fast
  ARRAY[0]
end

def slow # - 1.18x
  ARRAY.first
end

Benchmark.ips do |x|
  x.report('ARRAY[0]') { fast }
  x.report('ARRAY.first') { slow }
  x.compare!
end
