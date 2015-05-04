require "spec_helper"

describe EmailPredictor do
  let(:name)   { "Filipe Costa" }
  let(:domain) { "mydomain.com" }
  let(:reference_contacts) do
    {
      'John Doe'    => 'john.doe@mydomain.com',
      'Joseph Wu'   => 'joseph.wu@mydomain.com',
      'Linda Li'    => 'linda.li@mydomain.com',
      'Larry Page'  => 'larry.p@google.com',
      'Sergey Brin' => 's.brin@google.com',
      'Steve Jobs'  => 's.j@apple.com'
    }
  end

  subject { described_class.new(name, domain, reference_contacts) }

  describe "#contacts" do
    it { expect(subject.contacts).to be_kind_of(Array) }

    it { expect(subject.contacts.first).to be_kind_of(Contact) }
  end

  describe "#predict!" do

    context "given a reference with first name dot last name" do
      it { expect(subject.predict!).to eql("filipe.costa@mydomain.com") }
    end

    context "given a reference with first initial and last name" do
      let(:reference_contacts) do
        {
          'John Doe'    => 'j.d@mydomain.com',
          'Larry Page'  => 'larry.p@google.com',
          'Sergey Brin' => 's.brin@google.com',
          'Steve Jobs'  => 's.j@apple.com'
        }
      end

      it { expect(subject.predict!).to eql("f.c@mydomain.com") }
    end

    context "given a there isn't a reference" do
      let(:reference_contacts) do
        {
          'Larry Page'  => 'larry.p@google.com',
          'Sergey Brin' => 's.brin@google.com',
          'Steve Jobs'  => 's.j@apple.com'
        }
      end

      it "raise an runtime error" do
        expect { subject.predict! }.to raise_error(
          RuntimeError, "No contact found")
      end
    end
  end

  describe "#first_name" do
    it { expect(subject.first_name).to eql("Filipe") }
  end

  describe "#last_name" do
    it { expect(subject.last_name).to eql("Costa") }
  end

end
