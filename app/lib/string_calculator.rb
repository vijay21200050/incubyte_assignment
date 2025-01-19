class StringCalculator

  def add(numbers)
    return 0 if numbers.strip.empty?

    if numbers.start_with?('//')
      numbers = numbers.slice(2..-1).gsub(';', ',')
    end

    numbers.gsub!("\n", ',')
    num_array = numbers.split(',').map(&:to_i)
    negatives = num_array.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
    num_array.sum
  end

end