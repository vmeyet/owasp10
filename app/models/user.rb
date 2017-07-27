class User < ApplicationRecord
  def password=(pass)
    self.encrypted_password = EncryptionService.encrypt(pass)
  end

  def check_password(pass)
    encrypted_password == EncryptionService.encrypt(pass)
  end
end
