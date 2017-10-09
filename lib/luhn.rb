class Luhn
  attr_accessor :number
  def initialize(number)
    @number = number
  end

  def addends
    results = @number.digits.map.with_index do |value, index|
      if index.odd? && value * 2 < 10
        value * 2
      elsif index.odd? && value * 2 > 10
        (value * 2) - 9
      else
        value
      end
    end
    results.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(num)
    luhn = Luhn.new(num)
    luhn.number *= 10
    luhn.number += 1 until luhn.valid?
    luhn.number
  end
end
