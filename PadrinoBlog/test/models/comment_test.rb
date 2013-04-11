require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class CommentTest < Test::Unit::TestCase
  context "Comment Model" do

    setup do
      @comment = Comment.new(:body => "Best post ever")
      @comment.author = Author.new(:name => "Bob")
      @comment.post = Post.new(:title => "Late night coding", :body => "Compile errors all night")
      @comment.save
      @comment.reload
    end

    should 'belong to author' do
      assert @comment.respond_to?(:author)
      assert_not_nil @comment.author
      assert @comment.author.is_a? Author
    end

    should 'belong to post' do
      assert @comment.respond_to?(:post)
      assert_not_nil @comment.post
      assert @comment.post.is_a? Post
    end

    
  end
end
