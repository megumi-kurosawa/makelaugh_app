class Message < ApplicationRecord
  validates :send_id, {presence: true}
  validates :receive_id, {presence: true}
  validates :content, {presence: true}

  def sended_user
    return User.find_by(id: self.send_id)
  end

  def received_user
    return User.find_by(id: self.receive_id)
  end
end
