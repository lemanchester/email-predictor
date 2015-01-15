class FirstNameDotLastName < Struct.new(:first_name, :last_name, :domain)

  def get_email
    "#{first_name}.#{last_name}@#{domain}".downcase
  end

end
