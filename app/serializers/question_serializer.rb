class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question

  # has_one :user
  has_one :answer
end
