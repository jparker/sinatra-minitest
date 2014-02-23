require File.expand_path(File.join('..', 'test_helper'), __dir__)

class ApplicationTest < Minitest::Test
  include AcceptanceTest

  def test_index
    visit '/'

    assert page.has_link?('Echo server'), "Expected link with text 'Echo server' in '#{page.text}'"
  end
end
