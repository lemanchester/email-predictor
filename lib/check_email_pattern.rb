require 'patterns/first_initial_dot_last_initial'
require 'patterns/first_initial_dot_last_name'
require 'patterns/first_name_dot_last_initial'
require 'patterns/first_name_dot_last_name'

class CheckEmailPattern < Struct.new(:first_name, :last_name, :domain,
  :reference_email)

  EMAIL_PATTERNS = [ FirstNameDotLastName, FirstNameDotLastInitial,
    FirstInitialDotLastName, FirstInitialDotLastInitial ]

  def get_email_pattern!
    EMAIL_PATTERNS.each do |pattern|
      return pattern if pattern.new(first_name, last_name, domain).get_email == reference_email
    end
    raise "Unknow Email Pattern"
  end

end
