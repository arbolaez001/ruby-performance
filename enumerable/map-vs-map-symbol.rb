require 'benchmark/ips'

User  = Struct.new(:name)
ARRAY = Array.new(100_000) do
  User.new(rand(1_000_000_000))
end

def fast
  ARRAY.map(&:name)
end

def slow
  ARRAY.map { |user| user.name }
end


Benchmark.ips do |x|
  x.report('map(&:)') { fast }
  x.report('map') { slow } # - 1.23x  slower
  x.compare!
end