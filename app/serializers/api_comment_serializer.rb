class ApiCommentSerializer < ActiveModel::Serializer
  attributes :content,:date_of_comment,:article_id
end
