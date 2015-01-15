require_relative "contact"

class EmailAddressPrediction

  attr_reader :first_name, :last_name, :domain, :contacts

  def initialize(name, domain, reference_contacts)
    full_name = name.split(" ")
    @first_name = full_name.first
    @last_name = full_name.last
    @domain = domain
    @contacts = parse_contacts(reference_contacts)
  end

  def email
    pattern = contact_by_reference_domain.get_email_pattern

    pattern.new(first_name, last_name, domain).get_email
  end

  def parse_contacts(reference_contacts)
    reference_contacts.map do |name, email|
      Contact.new(name, email)
    end
  end

  def contact_by_reference_domain
    contacts.each do |contact|
      return contact if contact.domain == domain
    end
    raise 'No reference is found'
  end



end
