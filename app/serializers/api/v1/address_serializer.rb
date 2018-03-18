class Api::V1::AddressSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :full_address, :name
  belongs_to :user
  has_many :order_addresses
  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
   end

   def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
   end
end
