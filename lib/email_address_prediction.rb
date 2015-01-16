require_relative "contact"

class EmailAddressPrediction

  attr_reader :domain, :contacts

  def initialize(name, domain, reference_contacts)
    @domain = domain
    @contacts = parse_contacts(reference_contacts)
  end

  # It must be included after the `initialize`
  include NameParser

  def email!
    pattern = contact_by_reference_domain.get_email_pattern

    pattern.new(first_name, last_name, domain).get_email
  end

  def parse_contacts(reference_contacts)
    reference_contacts.map do |name, email|
      Contact.new(name, email)
    end
  end

  protected

  def contact_by_reference_domain
    contacts.each do |contact|
      return contact if contact.domain == domain
    end
    raise 'No reference is found'
  end



end
