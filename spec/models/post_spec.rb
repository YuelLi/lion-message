require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user1 = User.create(username: 'yuankai', password: '123456',role: "student", department: "Computer Science")
    @p1 = Post.create(subject: "Course problem", department: "Electrical Engineering")
    @p2 = Post.create(department: "Computer Science")
    @p3 = Post.create(department: "Computer Science")
    @r1 = Reply.create(content: "I like CS")
    @r2 = Reply.create(content: "I don't like CS")
    @user1.posts<<@p1
    @user1.posts<<@p2
    @user1.posts<<@p3
    @p1.replies << @r1
    @p1.replies << @r2
    @user1.replies << @r1
    @user1.replies << @r2
  end

  describe "like_search" do
    it "search result" do
      expect(Post.like_search(Post.all(),"course")).to eq([@p1])
    end
  end

  describe "usernames_by_reply" do
    it "find all the replies relate to the given post" do
      expect(Post.usernames_by_reply(@p1)).to eq([@p1.replies.order(created_at: :desc),
                                                  {@user1.id => @user1.username}])
    end
  end

end
