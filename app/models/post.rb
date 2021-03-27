class Post < ApplicationRecord
  belongs_to :user
  has_many :replies
  def self.like_search(post_list,search)
    # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
    #  movies with those ratings
    # if ratings_list is nil, retrieve ALL movies
    post_list.where("topic LIKE '%#{search}%' OR department LIKE '%#{search}%' OR subject LIKE '%#{search}%'
                    OR body LIKE '%#{search}%'")
  end
end
