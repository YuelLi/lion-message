class Post < ApplicationRecord
  belongs_to :user
  has_many :replies
  def self.like_search(post_list,search)
    post_list.where("topic LIKE '%#{search}%' OR department LIKE '%#{search}%' OR subject LIKE '%#{search}%'
                    OR body LIKE '%#{search}%'")
  end

  # Returns replies and a hash[user_id => username]
  # of the current post.
  def self.usernames_by_reply(post)
    replies = Reply.where(:post_id => post.id).order(created_at: :desc)
    user_id_to_username = {}
    replies.each do |reply|
      user = User.find reply.user_id
      username = user.username
      user_id_to_username[reply.user_id] = username
    end
    return replies, user_id_to_username
  end

  def self.filter_by_topic(post_list, filter_topic)
    post_list.where(topic: filter_topic)
  end

end
