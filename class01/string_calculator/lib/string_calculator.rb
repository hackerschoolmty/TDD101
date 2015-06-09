class StringCalculator  
  def self.add(string)
    return 0 if string.empty?
    
    numbers = string.gsub("\n",",").split(",").map(&:to_i)
    return numbers.reduce(:+)
  end
end