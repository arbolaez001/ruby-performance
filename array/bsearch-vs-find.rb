require 'benchmark/ips'

ARRAY = (0..100_000_000).to_a
RANDOM_DATA = (0..1_000_000).to_a.shuffle

# ONLY WHEN IS SORTED

def fast
  ARRAY.bsearch { |num| num > 80_000_000 }
end

def slowest
  ARRAY.find { |num| num > 80_000_000 }
end

def slow
  RANDOM_DATA.sort.bsearch { |num| num > 80_000_000 }
end

Benchmark.ips do |x|
  x.report('bsearch') { fast }
  x.report('sort.bsearch') { slow } # - 147202.06x  slow
  x.report('find')    { slowest } # - 3547951.32x  slower
  x.compare!
end