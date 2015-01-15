require "spec_helper"

describe EmailAddressPrediction do
  let(:name)   { "Filipe Costa" }
  let(:domain) { "stackbuilders.com" }
  let(:reference_contacts) do
    {
      'John Doe'    => 'john.doe@stackbuilders.com',
      'Joseph Wu'   => 'joseph.wu@stackbuilders.com',
      'Linda Li'    => 'linda.li@stackbuilders.com',
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

  describe "#email" do

    context "given a reference with first name dot last name" do
      it { expect(subject.email).to eql("filipe.costa@stackbuilders.com") }
    end

    context "given a reference with first initial and last name" do
      let(:reference_contacts) do
        {
          'John Doe'    => 'j.d@stackbuilders.com',
          'Larry Page'  => 'larry.p@google.com',
          'Sergey Brin' => 's.brin@google.com',
          'Steve Jobs'  => 's.j@apple.com'
        }
      end

      it { expect(subject.email).to eql("f.c@stackbuilders.com") }
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
        expect { subject.email }.to raise_error(RuntimeError, "No reference is found")
      end
    end
  end


end