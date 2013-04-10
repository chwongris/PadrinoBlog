require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class AuthorTest < Test::Unit::TestCase
  context "Author Model" do

      setup do
      @author = Author.new(:name => "Charles Dickson")
      @author.posts << Post.new(:title => "Dark and Stormy Night", :body => "Best of times, worst of times")
      @author.posts << Post.new(:title => "It was like awesome", :body => "Wooooooooooo")
      @author.posts << Post.new(:title => "Late night coding", :body => "Compile errors all night")
      @author.comments << Comment.new(:body => "Best entry ever")
      @author.comments << Comment.new(:body => "Worst entry ever")
      @author.comments << Comment.new(:body => "Wooooooo")
      @author.save
      @author.reload
      end

      should 'have many posts' do
      assert @author.respond_to?(:posts)
      assert_not_nil @author.posts
      assert @author.posts.is_a?(Array)
      assert_equal 3, @author.posts.length
      assert @author.posts.first.is_a?(Post)
      assert_equal "Dark and Stormy Night", @author.posts.first.title
      assert_equal "Best of times, worst of times", @author.posts.first.body
      post = @author.posts.first
      assert_not_nil post.author
      assert_equal @author, post.author 
      end

      should 'have many comments' do
      assert @author.respond_to?(:comments)
      assert_not_nil @author.comments
      assert @author.comments.is_a?(Array)
      assert_equal 3, @author.comments.length
      assert @author.comments.first.is_a?(Comment)
      assert_equal "Best entry ever", @author.comments.first.body
      comment = @author.comments.first
      assert_not_nil comment.author
      assert_equal @author, comment.author 
      end
    
  end
end
