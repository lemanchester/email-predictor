require_relative "check_email_pattern"
require_relative "name_parser"

class Contact

  attr_reader :domain, :email

  def initialize(name, email)
    @domain = email[/@(.*?)\z/].gsub('@','')
    @email = email
  end

  # It must be included after the `initialize`
  include NameParser

  def get_email_pattern
    CheckEmailPattern.new(first_name, last_name,
      domain, email).get_email_pattern!
  end

end
