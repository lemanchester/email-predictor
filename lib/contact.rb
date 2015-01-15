require_relative "check_email_pattern"

class Contact

  attr_reader :first_name, :last_name, :domain, :email

  def initialize(name, email)
    full_name = name.split(" ")
    @first_name = full_name.first
    @last_name = full_name.last
    @domain = email[/@(.*?)\z/].gsub('@','')
    @email = email
  end

  def get_email_pattern
    CheckEmailPattern.new(first_name, last_name,
      domain, email).get_email_pattern!
  end

end
