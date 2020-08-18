class Message < ApplicationRecord
    belongs_to :user
    belongs_to :chef
    belongs_to :chatroom
end
