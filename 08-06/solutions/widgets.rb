require "yaml"

# Add a .sum method to all arrays, for convenience
class Array
  def sum
    self.reduce(&:+) # & is `to_proc`
    # self.reduce(:+) works here, but not for all functions taking a block
    # self.reduce { |a,b| a + b }
  end
end


path = ARGV.first || raise("Please specify a file to load")
widgets = YAML.load_file path

puts "The most expensive widget:"
puts widgets.max_by { |w| w[:price] }
puts

puts "The least expensive widget:"
puts widgets.min_by { |w| w[:price] }
puts

puts "Total revenue:"
revenue = widgets.map { |w| w[:price] * w[:sold] }.sum
puts "$#{revenue}"
puts

puts "Total profit:"
profit = widgets.map do |w|
  profit_per = w[:price] - w[:cost_to_make]
  profit_per * w[:sold]
end.sum # Note: this works the same as the same as the sum above
puts "$#{profit}"
puts

puts "Best sellers:"
widgets.sort_by { |w| -w[:sold] }.first(10).each_with_index do |w,i|
  puts "#{i+1}) #{w[:name]}"
end
puts

require "pry"
binding.pry

puts "Department stats:"
# Overly clever solution
breakdown = widgets.
  group_by { |w| w[:department] }.
  map      { |d,ws| [d, ws.map { |w| w[:sold] }.sum] }

# Probably better
breakdown = widgets.each_with_object({}) do |widget, hash|
  department = widget[:department]
  hash[department] ||= 0
  hash[department]  += widget[:sold]
end
breakdown.sort_by { |_,count| -count }.each do |department, count|
  puts "#{department} sold #{count} widgets"
end
