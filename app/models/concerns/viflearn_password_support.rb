module ViflearnPasswordSupport
  extend ActiveSupport::Concern

  def valid_password?(password)
    case encrypted_password
    when /\A\$2a\$/ # Managed by ruby bcrypt
      super
    when /\A\$2y\$/ # Joomla PHP bcrypt
      php_valid_password?(password) and update_encrypted_password(password)
    when /\A[a-zA-Z0-9]{32}:[a-zA-Z0-9]{32}\z/ # Joomla MD5
      md5_valid_password?(password) and update_encrypted_password(password)
    when /\A\$P\$D/ # Joomla PHPass
      phpass_valid_password?(password) and update_encrypted_password(password)
    else
      false
    end
  end

  private

  def php_valid_password?(password)
    Devise::Encryptor.compare(
      self.class,
      encrypted_password.sub("$2y$", "$2a$"),
      password)
  end

  def md5_valid_password?(password)
    stored_md5, salt = encrypted_password.split(":")
    computed_md5 = Digest::MD5.hexdigest(password + salt)
    Devise.secure_compare(computed_md5, stored_md5)
  end

  def phpass_valid_password?(password)
    # see http://www.openwall.com/phpass/

    salt = encrypted_password[4, 8]
    stored_hash = encrypted_password[12..-1]

    computed_hash = Digest::MD5.digest(salt + password)
    32768.times do
      computed_hash = Digest::MD5.digest(computed_hash + password)
    end
    computed_hash = phpass_encode64(computed_hash, 16)

    Devise.secure_compare(computed_hash, stored_hash)
  end

  def update_encrypted_password(password)
    update(encrypted_password: password_digest(password))
    true
  end

  def phpass_encode64(input, count)
    # see http://www.openwall.com/phpass/

    itoa64 = './0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    output = ''
    i = 0

    loop do
      value = input[i].ord
      i += 1
      output += itoa64[value & 0x3f]

      if (i < count)
        value = value | input[i].ord << 8
      end

      output += itoa64[(value >> 6) & 0x3f]

      break if (i >= count)
      i += 1

      if (i < count)
        value = value | input[i].ord << 16
      end

      output += itoa64[(value >> 12) & 0x3f]

      break if (i >= count)
      i += 1

      output += itoa64[(value >> 18) & 0x3f]

      break if i >= count
    end

    return output
  end

end
