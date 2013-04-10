require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class TagTest < Test::Unit::TestCase
  context "Tag Model" do
    setup do
      @tag = Tag.new(:name => "Tech")
      @post = Post.new(:title => "Late night coding", :body => "Compile errors all night")
      @tag.post_tags << PostTag.new(:post => @post, :tag => @tag)
      @tag.save
    end

      should 'have many post_tags' do
      assert @tag.respond_to?(:post_tags)
      assert_equal 1, @tag.post_tags.length
      assert @tag.post_tags.is_a?(Array)
      assert @tag.post_tags.first.is_a?(PostTag)
      assert @tag.post_tags.first.post.is_a?(Post)
      assert_equal @tag, @post.post_tags.first.tag
    end

  end
end
