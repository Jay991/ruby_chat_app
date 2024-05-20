class Chat < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :chat_users, dependent: :destroy
    has_many :users, through: :chat_users
  
    enum chat_type: { one_on_one: 0, group: 1 }, _prefix: :type
  end
  