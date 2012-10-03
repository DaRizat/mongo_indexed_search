class Hardware
  include Mongoid::Document
  paginates_per 1
  field :make, type: String
  field :model, type: String
  field :serial_number, type: String
  field :hardware_status, type: Boolean
  field :created_at, type: Date
  field :updated_at, type: Date
  field :purchased_on, type: Date
  field :sold_on, type: Date
  field :installed_on, type: Date
  field :processing_time, type: Integer
end
