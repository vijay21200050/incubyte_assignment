class StringCalculator

  def add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = ","
    delimiters = [delimiter]

    if numbers.start_with?("//")
      match = numbers.match(%r{^//(\[.*\])\n(.*)})
      if match
        delimiters = match[1].scan(/\[(.*?)\]/).flatten
        numbers = match[2]  # Extract numbers part
      else
        match = numbers.match(%r{^//(.*?)\n(.*)})
        delimiters = [match[1]] if match
        numbers = match[2] if match
      end
    end

    numbers = delimiters.reduce(numbers) { |str, delim| str.gsub("\n", delim) }
    num_array = numbers.split(Regexp.union(delimiters)).map(&:to_i)
    negatives = num_array.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
    num_array.reject! { |n| n > 1000 }
    num_array.sum
  end

end