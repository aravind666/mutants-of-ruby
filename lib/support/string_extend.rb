# frozen_string_literal: true

# This helper is opening up core Ruby String class
# in order to add new methods to all strings
class String
  # Allows to capitalize the first letter of word
  def titleize
    split(' ').collect(&:capitalize).join(' ')
  end

  # Allows us to test if a string contains only whitespace characters
  def blank?
    /\A[[:space:]]*\z/ === self
  end
end
