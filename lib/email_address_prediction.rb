require_relative "contact"

class EmailAddressPrediction

  attr_reader :domain, :contacts

  def initialize(name, domain, reference_contacts)
    @domain = domain
    @contacts = Contact.parse(reference_contacts)
  end

  # It must be included after the `initialize`
  include NameParser

  def email!
    pattern = contact_by_reference_domain.get_email_pattern

    pattern.new(first_name, last_name, domain).get_email
  end

  protected

  def contact_by_reference_domain
    contacts.each do |contact|
      return contact if contact.domain == domain
    end
    raise 'No reference is found'
  end



end
