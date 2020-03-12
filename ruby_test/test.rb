# frozen_string_literal: true

require 'benchmark'
require 'imatcher'

start_time = Time.now.strftime('%H:%M:%S')

file_path_one = ARGV[0]
file_path_two = ARGV[1]

cmp = Imatcher::Matcher.new
res = nil

Benchmark.bm do |x|
  x.report('comparison:') { res = cmp.compare(file_path_one, file_path_two) }
  x.report('saving:') do
    res.difference_image.save("./output/comparison_result-#{start_time}.png")
  end
end
