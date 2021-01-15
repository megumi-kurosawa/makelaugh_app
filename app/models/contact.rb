class Contact < ApplicationRecord
  validates :send_id, {presence: true}
  validates :receive_id, {presence: true}
end
