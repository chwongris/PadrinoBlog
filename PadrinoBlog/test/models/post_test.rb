require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class PostTest < Test::Unit::TestCase
  context "Post Model" do
    setup do
      @post = Post.new(:title => "Late night coding", :body => "Compile errors all night")
      @post.author = Author.new(:name => "Charles Dickson")
      @tag = Tag.new(:name => "Tech")
      @post.post_tags << PostTag.new(:post => @post, :tag => @tag)
      @post.comments << Comment.new(:body => "Best entry ever")
      @post.comments << Comment.new(:body => "Worst entry ever")
      @post.comments << Comment.new(:body => "Wooooooo")
      @post.save
    end


    should 'belong to author' do
      assert @post.respond_to?(:author)
      assert_not_nil @post.author
      assert @post.author.is_a? Author
    end

    should 'have many comments' do
      assert @post.respond_to?(:comments)
      assert_not_nil @post.comments
      assert @post.comments.is_a?(Array)
      assert_equal 3, @post.comments.length
      assert @post.comments.first.is_a?(Comment)
      assert_equal "Best entry ever", @post.comments.first.body
      comment = @post.comments.first
      assert_not_nil comment.post
      assert_equal @post, comment.post 
    end

    should 'have many post_tags' do
      assert @post.respond_to?(:post_tags)
      assert_equal 1, @post.post_tags.length
      assert @post.post_tags.is_a?(Array)
      assert @post.post_tags.first.is_a?(PostTag)
      assert @post.post_tags.first.tag.is_a?(Tag)
      assert_equal @tag, @post.post_tags.first.tag
    end



    should 'construct new instance' do
      @post = Post.new
      assert_not_nil @post
    end
  end
end
