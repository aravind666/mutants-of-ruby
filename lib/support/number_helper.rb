# This module exposes a method to convert a number to currency
# with various options
module NumberHelper
  def number_to_currency(number, options = {})
    assign_default_options(options)
    unit      = options[:unit]
    precision = options[:precision]
    delimiter = options[:delimiter]
    separator = options[:separator]

    separator = '' if precision.zero?
    integer, decimal = number.to_s.split('.')

    i = integer.length
    until i <= 3
      i -= 3
      integer = integer.insert(i, delimiter)
    end

    if precision.zero?
      precise_decimal = ''
    else
      # make sure decimal is not nil
      decimal ||= '0'
      # make sure the decimal is not too large
      decimal = decimal[0, precision]
      # make sure the decimal is not too short
      precise_decimal = decimal.ljust(precision, '0')
    end

    unit + integer + separator + precise_decimal
  end

  def assign_default_options(options)
    options[:unit] = options[:unit] || '$'
    options[:precision] = options[:precision] || 2
    options[:delimiter] = options[:delimiter] || ','
    options[:separator] = options[:separator] || '.'
  end
end
