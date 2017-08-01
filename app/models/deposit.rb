class Deposit < ApplicationRecord
  belongs_to :user
  belongs_to :to_user, class_name: :User, foreign_key: :to_user_id

  def self.of_user(user)
    Deposit.where(to_user: user).or(Deposit.where(user: user))
  end

  def self.balance_in_cents_of(user)
    Deposit.where(to_user: user).sum(:amount) - Deposit.where(user: user).sum(:amount)
  end

  def self.balance_in_dollars_of(user)
    balance_in_cents_of(user) / 100.0
  end

  def self.positif?(user)
    balance_in_cents_of(user) > 0
  end

  def positif?(for_user)
    if to_user == for_user
      amount > 0
    elsif user == for_user
      amount < 0
    else
      raise 'Unknown Party'
    end
  end

  def amount_in_cents
    amount / 100.0
  end
end
