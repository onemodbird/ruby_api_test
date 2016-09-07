require "rails_helper"

describe ViflearnPasswordSupport do
  let(:user) { create :user, password: password }
  let(:password) { "password" }
  let(:invalid) { "invalid" }
  let(:viflearn_bcrypt_password) {
    "$2y$10$7YSYpr0Hhwiylu/Ay1uCPOjdDcKTSFDdtqpgQDsEYTybur1t3YV5a" }
  let(:viflearn_md5_password) {
    "0444029b3b2279bd048998482f46058c:74f386efaf7fc93f815a14321d870a17" }
  let(:viflearn_phpass_password) { "$P$DJRjoMMwaoj6gGiZ2Pvcycmrs.eE1n." }


<<<<<<< HEAD
  describe "greenprint ruby bcrypt passwords" do
=======
  describe "participate ruby bcrypt passwords" do
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    it "validates the password" do
      expect(user.valid_password?(password)).to eq(true)
    end

    it "rejects the password" do
      expect(user.valid_password?(invalid)).to eq(false)
    end

    it "leaves encrypted_password unchanged" do
      expect { user.valid_password?(password) }
        .to_not change(user, :encrypted_password)
    end
  end


  describe "viflearn php bcrypt passwords" do
    before :each do
      user.update(encrypted_password: viflearn_bcrypt_password)
    end

    it "validates the password" do
      expect(user.valid_password?(password)).to eq(true)
    end

    it "rejects the password" do
      expect(user.valid_password?(invalid)).to eq(false)
    end

    it "updates encrypted_password to use ruby bcrypt" do
      expect { user.valid_password?(password) }
        .to change(user, :encrypted_password)
      expect(user.reload.encrypted_password).to match(/\A\$2a\$/)
      expect(user.valid_password?(password)).to eq(true)
    end

    it "leaves encrypted_password unchanged when password is invalid" do
      expect { user.valid_password?(invalid) }
        .to_not change(user, :encrypted_password)
    end
  end


  describe "viflearn salted md5 passwords" do
    before :each do
      user.update(encrypted_password: viflearn_md5_password)
    end

    it "validates the password" do
      expect(user.valid_password?(password)).to eq(true)
    end

    it "rejects the password" do
      expect(user.valid_password?(invalid)).to eq(false)
    end

    it "updates encrypted_password to use ruby bcrypt" do
      expect { user.valid_password?(password) }
        .to change(user, :encrypted_password)
      expect(user.reload.encrypted_password).to match(/\A\$2a\$/)
      expect(user.valid_password?(password)).to eq(true)
    end

    it "leaves encrypted_password unchanged when password is invalid" do
      expect { user.valid_password?(invalid) }
        .to_not change(user, :encrypted_password)
    end
  end


  describe "viflearn PHPass hashed passwords" do
    before :each do
      user.update(encrypted_password: viflearn_phpass_password)
    end

    it "validates the password" do
      expect(user.valid_password?(password)).to eq(true)
    end

    it "rejects the password" do
      expect(user.valid_password?(invalid)).to eq(false)
    end

    it "updates encrypted_password to use ruby bcrypt" do
      expect { user.valid_password?(password) }
        .to change(user, :encrypted_password)
      expect(user.reload.encrypted_password).to match(/\A\$2a\$/)
      expect(user.valid_password?(password)).to eq(true)
    end

    it "leaves encrypted_password unchanged when password is invalid" do
      expect { user.valid_password?(invalid) }
        .to_not change(user, :encrypted_password)
    end
  end
end
