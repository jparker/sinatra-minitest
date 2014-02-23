require File.expand_path(File.join('..', 'test_helper'), __dir__)

class CircleBufferTest < Minitest::Test
  def test_unshift_into_empty
    buffer = CircleBuffer.new(5)
    buffer.unshift(42)
    assert_equal [42], buffer.to_a
  end

  def test_unshift_into_partially_full
    buffer = CircleBuffer.new(5, [1, 2])
    buffer.unshift(42)
    assert_equal [42, 1, 2], buffer.to_a
  end

  def test_unshift_into_full
    buffer = CircleBuffer.new(5, [1, 2, 3, 4, 5])
    buffer.unshift(42)
    assert_equal [42, 1, 2, 3, 4], buffer.to_a
  end

  def test_each
    buffer = CircleBuffer.new(5, [1, 2, 3, 4, 5])
    yielded = []
    buffer.each { |e| yielded << e }
    assert_equal [1, 2, 3, 4, 5], yielded
  end
end
