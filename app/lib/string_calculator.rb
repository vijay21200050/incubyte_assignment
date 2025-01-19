class StringCalculator

  def add(numbers)
    return 0 if numbers.strip.empty?

    num_array = numbers.split(',').map(&:to_i)
    num_array.sum
  end

end