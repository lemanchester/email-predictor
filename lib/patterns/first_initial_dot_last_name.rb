class FirstInitialDotLastName < Struct.new(:first_name, :last_name, :domain)

  def get_email
    "#{first_name[0]}.#{last_name}@#{domain}".downcase
  end

end
