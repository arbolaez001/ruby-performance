require 'benchmark/ips'

def fast
  (1..100).to_a
end

def slow
  [*1..100]
end

def slower
  Array.new(100) { |i| (i + 1) }
end

Benchmark.ips do |x|
  x.report('(1..100).to_a') { fast }
  x.report('[*1..100]') { slow }
  x.report('Array.new(100)') { slower }
  x.compare!
end
