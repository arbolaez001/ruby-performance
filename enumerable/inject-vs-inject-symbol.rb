require 'benchmark/ips'

ARRAY = (1..100_000).to_a

def fastest
  ARRAY.inject(:+)
end

def fast
  ARRAY.inject { |a, e| a + e }
end

def slow
  ARRAY.inject(&:+)
end

Benchmark.ips do |x|
  x.report('inject (:+)')  { fastest }
  x.report('inject') { fast }
  x.report('inject (&:+)') { slow } # - 1.20x  slower
  x.compare!
end