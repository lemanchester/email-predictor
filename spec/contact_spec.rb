require "spec_helper"

describe Contact do
  let(:name)  { 'Steve Jobs' }
  let(:email) { 's.j@apple.com' }

  subject{ described_class.new(name, email) }

  describe "#first_name" do
    it { expect(subject.first_name).to eql("Steve") }
  end

  describe "#last_name" do
    it { expect(subject.last_name).to eql("Jobs") }
  end

  describe "#domain" do
    it { expect(subject.domain).to eql("apple.com") }
  end

  describe "#email" do
    it { expect(subject.email).to eql("s.j@apple.com") }
  end

  describe ".parse" do
    let(:contacts) do
      {
        'John Doe'    => 'john.doe@mydomain.com',
        'Joseph Wu'   => 'joseph.wu@mydomain.com',
        'Linda Li'    => 'linda.li@mydomain.com',
        'Larry Page'  => 'larry.p@google.com',
        'Sergey Brin' => 's.brin@google.com',
        'Steve Jobs'  => 's.j@apple.com'
      }
    end

    subject { described_class.parse(contacts) }

    it { expect(subject).to be_kind_of(Array) }

    it { expect(subject.first).to be_kind_of(Contact) }
  end

end
