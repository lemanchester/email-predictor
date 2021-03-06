class FirstNameDotLastInitial < Struct.new(:first_name, :last_name, :domain)

  def get_email
    "#{first_name}.#{last_name[0]}@#{domain}".downcase
  end

end
