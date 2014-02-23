require File.expand_path(File.join('..', 'test_helper'), __dir__)

class EchoTest < Minitest::Test
  include AcceptanceTest

  def test_echo_input
    visit '/'
    click_on 'Echo server'
    fill_in 'data', with: 'foo bar'
    click_on 'Send'

    assert page.has_content?('foo bar'), "Expected to find 'foo bar' in '#{page.text}'"

    fill_in 'data', with: 'baz froz'
    click_on 'Send'

    assert page.has_content?('foo bar'), "Expected to find 'foo bar' in '#{page.text}'"
    assert page.has_content?('baz froz'), "Expected to find 'baz froz' in '#{page.text}'"
  end

  def test_haml_automatic_escaping
    visit '/'
    click_on 'Echo server'
    fill_in 'data', with: '<foo>bar'
    click_on 'Send'

    assert page.body.include?('&lt;foo&gt;'), "Expected to find '<foo>' escaped as '&lt;foo&gt;'"
  end
end
