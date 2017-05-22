require 'benchmark/ips'

User  = Struct.new(:name)
ARRAY = Array.new(100_000) do
  User.new(rand(1_000_000_000))
end

def fastest
  ARRAY.sort_by(&:name)
end

def fast
  ARRAY.sort_by { |user| user.name }
end

def slow
  ARRAY.sort { |a, b| a.name <=> b.name }
end

Benchmark.ips do |x|
  x.report('sort_by(&:)') { fastest }
  x.report('sort_by') { fast }
  x.report('sort') { slow } # - 2.32x  slower
  x.compare!
end