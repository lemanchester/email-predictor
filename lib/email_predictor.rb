require_relative "contact"


class EmailPredictor

  attr_reader :domain, :contacts

  def initialize(name, domain, reference_contacts)
    @domain = domain
    @contacts = Contact.parse(reference_contacts)
  end

  # It must be included after the `initialize`
  include NameParser

  # @return [String] it tries to prodect the email address
  # given the name, domain and the contacts as references
  def predict!
    find_contact_by_domain.get_email_pattern
      .new(first_name,
           last_name,
           domain
          ).get_email
  end

  protected

  def find_contact_by_domain
    contacts.find do |contact|
      return contact if contact.domain == domain
    end
    raise 'No contact found'
  end



end
