require 'test/unit'
require_relative 'search_rank_test'

class ChromeHeadlessTest < Test::Unit::TestCase
  include SearchRankTest

  def setup()
    options = Selenium::WebDriver::Chrome::Options.new()
    options.add_argument('--headless')
    @driver = Selenium::WebDriver.for(:chrome, options: options)
    @driver.manage.timeouts.implicit_wait = SearchRankTest::ImplicitWait
  end
end
