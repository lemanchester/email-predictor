require "spec_helper"

describe FirstNameDotLastName do
  let(:first_name) { "Gabriel" }
  let(:last_name)  { "Medina"  }
  let(:domain)     { "asp.com" }

  subject { described_class.new(first_name, last_name, domain) }

  describe "#get_email" do
    it "returns the right email pattern" do
      expect(subject.get_email).to eql("gabriel.medina@asp.com")
    end
  end
end
