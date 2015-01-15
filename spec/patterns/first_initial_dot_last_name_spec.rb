require "spec_helper"

describe FirstInitialDotLastName do
  let(:first_name) { "Gabriel" }
  let(:last_name)  { "Medina"  }
  let(:domain)     { "asp.com" }

  subject { described_class.new(first_name, last_name, domain) }

  describe "#get_email" do
    it "returns the right email pattern" do
      expect(subject.get_email).to eql("g.medina@asp.com")
    end
  end
end
