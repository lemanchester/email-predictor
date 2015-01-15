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

end
