require 'benchmark/ips'

ARRAY = (1..100).to_a

def fast
  ARRAY[-1]
end

def slow # - 1.18x
  ARRAY.last
end

Benchmark.ips do |x|
  x.report('ARRAY[-1]')   { fast }
  x.report('ARRAY.last')  { slow }
  x.compare!
end
