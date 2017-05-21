require 'benchmark/ips'

ARRAY = (1..1000).to_a

Benchmark.ips do |x|
  x.report("Array.size")    { ARRAY.size }    # fast
  x.report("Array.length")  { ARRAY.length }  # slow
  x.report("Array.count")   { ARRAY.count }   # slower
  x.compare!
end