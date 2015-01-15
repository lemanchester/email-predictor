require "spec_helper"

describe CheckEmailPattern do
  let(:first_name) { "Mick" }
  let(:last_name)  { "Fanning"  }
  let(:domain)     { "asp.com" }

  subject { described_class.new(first_name, last_name, domain, reference_email) }

  describe "#get_email_pattern!!" do
    context "given an email using first name dot last name" do
      let(:reference_email) { "mick.fanning@asp.com" }

      it { expect(subject.get_email_pattern!).to eql(FirstNameDotLastName) }
    end

    context "given an email using first name dot last initial" do
      let(:reference_email) { "mick.f@asp.com" }

      it { expect(subject.get_email_pattern!).to eql(FirstNameDotLastInitial) }
    end

    context "given an email using first initial dot last name" do
      let(:reference_email) { "m.fanning@asp.com" }

      it { expect(subject.get_email_pattern!).to eql(FirstInitialDotLastName) }
    end

    context "given an email using first initial dot last initial" do
      let(:reference_email) { "m.f@asp.com" }

      it { expect(subject.get_email_pattern!).to eql(FirstInitialDotLastInitial) }
    end

    context "given an email using an unknow pattern" do
      let(:reference_email) { "mickfanning@asp.com" }
  
      it "raise an runtime error" do
        expect { subject.get_email_pattern! }.to raise_error(RuntimeError, "Unknow Email Pattern")
      end

    end

  end

end
