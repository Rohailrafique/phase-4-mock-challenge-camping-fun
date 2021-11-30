class SignupSerializer < ActiveModel::Serializer
  attributes :id, :camper_id, :activity_id, :time, :activity
  # belongs_to :activity

end
