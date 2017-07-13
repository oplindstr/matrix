require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "recover_username" do
    let(:mail) { UserMailer.recover_username }

    it "renders the headers" do
      expect(mail.subject).to eq("Recover username")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "recover_password" do
    let(:mail) { UserMailer.recover_password }

    it "renders the headers" do
      expect(mail.subject).to eq("Recover password")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
