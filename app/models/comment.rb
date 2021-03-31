# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#
class Comment < ApplicationRecord

  belongs_to :article, dependent: :destroy
  # dependent: :destroy => 記事が削除されたらコメントも同時に削除されるというメソッド

  validates :content, presence: true
end
