require_relative('restaurant_file')

class Restaurant
  attr_accessor :name, :cuisine, :price

  @@file = nil
  def self.file
    @@file
  end

  def self.load_file(filepath)
    # locate the restaurant text file at path
    @@file = RestaurantFile.new(filepath: filepath)
    unless @@file.usable?
      puts "Restaurant file is not usable.\n\n"
      @@file = nil
    end
  end

  def self.all
    !@@file.nil? ? @@file.read : []
  end

  def initialize(options = {})
    @name    = options[:name]    || ''
    @cuisine = options[:cuisine] || 'unknown'
    @price   = options[:price]
  end

  def save
    !@@file.nil? && valid? ? @@file.append(self) : false
  end

  def valid?
    present = ->(val) { val.nil? || val.blank? }
    return false if present.call(name)
    return false if present.call(cuisine)
    return false if price.nil? || price.to_i <= 0

    true
  end
end
