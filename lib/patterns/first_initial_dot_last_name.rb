class FirstInitialDotLastName < Struct.new(:first_name, :last_name, :domain)

  def get_email
    "#{first_name[0].downcase}.#{last_name.downcase}@#{domain.downcase}"
  end

end
