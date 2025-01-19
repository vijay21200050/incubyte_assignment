class StringCalculator

  def add(numbers)
    return 0 if numbers.strip.empty?
    if numbers.split(',').size == 1
      numbers.to_i
    else
      num_array = numbers.split(',')
      num_array[0].to_i + num_array[1].to_i
    end
  end

end