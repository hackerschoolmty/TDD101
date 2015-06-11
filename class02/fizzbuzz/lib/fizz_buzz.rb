class FizzBuzz
  def initialize    
  end  

  def self.play(number)
    if (number % 3) == 0 && (number % 5) == 0
      return 'FizzBuzz'
    elsif number.to_s.include?('3') && number.to_s.include?('3')
    end
    return 'Fizz' if (number % 3) == 0 || number.to_s.include?('3')
    return 'Buzz' if (number % 5) == 0 || number.to_s.include?('5')
    number = number.to_s
  end
end