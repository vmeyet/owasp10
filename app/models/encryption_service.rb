module EncryptionService
  def self.encrypt(cleartext)
    Digest::MD5.hexdigest(cleartext)
  end
end
