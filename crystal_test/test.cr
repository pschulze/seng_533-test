require "benchmark"
require "flexo"

start_time = Time::Format.new("%H:%M:%S").format(Time.local)

file_path_one = ARGV[0]
file_path_two = ARGV[1]

res = Flexo::Result.new(0.1)

Benchmark.bm do |x|
  x.report("comparison") { res = Flexo.compare(file_path_one, file_path_two) }
  x.report("saving") { res.save("./output/comparison_result-#{start_time}.png") }
end