class StringCalculator  
  def self.add(string)
    return 0 if string.empty?
    return 1 if string == '1'
    numbers = string.split(",").map(&:to_i)

    sum = 0
    numbers.each { |number| sum += number }
    sum
  end
end