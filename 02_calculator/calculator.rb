def add a, b
  a + b
end

def subtract a, b
  a - b
end

def sum numbers
  count = 0
  sum_of_numbers = 0

  if numbers == []
    return 0
  elsif numbers.length == 1
    return numbers[0]
  else
    while count < numbers.length
      sum_of_numbers += numbers[count]
      count += 1
    end
  end

  sum_of_numbers
end

def multiply a, b, *x
  product = a * b
  x.each {|number| product *= number}
  product
end

def power a, b
  a**b
end

def factorial number
  if number == 0 || number == 1
    return 1
  else
    count = 2
    product = 1
    while count <= number
      product *= count
      count += 1
    end
  end
  product
end
