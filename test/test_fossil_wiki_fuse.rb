require 'test/unit'
require 'fossil_wiki_fuse'
require "mocha/setup"
class TestFossilWikiFuse < Test::Unit::TestCase
    def setup
        @f = FossilWikiFuse.new
        def @f.`(*args)
            "a\nb\nc"
        end
    end
    def test_contents
        assert_equal ["a", "b", "c"], @f.contents("")
    end
    def test_file
        assert @f.file?("/a")
        assert @f.file?("/d") == false
    end
    def test_read_file
        assert_equal "a\nb\nc", @f.read_file("blah")
    end
    def test_size
        assert_equal 5, @f.size("blah")
    end
    def test_can_write
        assert @f.can_write? "blah"
    end
    def test_times
        assert_equal [0, nil, 0], @f.times("/lol")
    end
    def test_can_delete
        assert @f.can_delete? "blah"
    end
    def test_delete
        assert @f.delete "blah"
    end
    def test_write_to
        Open3.expects("popen3").once
        @f.write_to "lol", "content"
    end
    def test_touch
        Open3.expects("popen3").once
        @f.touch "lol", "content"
    end
end
