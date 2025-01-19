class StringCalculator

  def add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = ","

    if numbers.start_with?('//')
      match = numbers.match(%r{^//\[(.*?)\]\n(.*)})
      if match
        delimiter = match[1]
        numbers = match[2]
      else
        match = numbers.match(%r{^//(.*?)\n(.*)})
        delimiter = match[1] if match
        numbers = match[2] if match
      end
    end

    numbers.gsub!("\n", delimiter)
    num_array = numbers.split(delimiter).map(&:to_i)
    negatives = num_array.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
    num_array.reject! { |n| n > 1000 }
    num_array.sum
  end

end