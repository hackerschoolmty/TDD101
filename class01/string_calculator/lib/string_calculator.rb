class StringCalculator  
  def self.add(string)
    return 0 if string.empty?

    delimeter = string.include?("//") ? string[2] : ","

    numbers = string.gsub("\n", delimeter).split(delimeter).map(&:to_i)

    negatives = numbers.select{ |number| number < 0 }

    raise("negatives not allowed: #{negatives.join(',')}") unless negatives.empty?

    return numbers.reduce(:+)
  end
end