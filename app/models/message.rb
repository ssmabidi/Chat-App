class Message < ApplicationRecord
	belongs_to :sender, class_name: "User", primary_key: "id"
  belongs_to :receiver, class_name: "User", primary_key: "id"



	scope :between, -> (sender_id,receiver_id) do
 		where('(messages.sender_id = ? AND messages.receiver_id =?) OR (messages.sender_id = ? AND messages.receiver_id =?)', sender_id,receiver_id, receiver_id, sender_id)
 	end
end
