class User < ApplicationRecord
  def password=(pass)
    self.encrypted_password = EncryptionService.encrypt(pass)
  end

  def check_password(pass)
    encrypted_password == EncryptionService.encrypt(pass)
  end

  def chat_messages
    me_to = ChatMessage.where(user: self).group_by(&:to_user)
    to_me = ChatMessage.where(to_user: self).group_by(&:user)

    all = {}
    (me_to.keys + to_me.keys).each do |other|
      all[other.username] = ((all[other] || []) + me_to[other] + to_me[other]).sort_by(&:created_at)
    end

    all
  end
end
