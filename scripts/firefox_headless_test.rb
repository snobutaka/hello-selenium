require 'test/unit'
require_relative 'search_rank_test'

class FirefoxHeadlessTest < Test::Unit::TestCase
  include SearchRankTest

  def setup()
    options = Selenium::WebDriver::Firefox::Options.new()
    options.add_argument('-headless')
    @driver = Selenium::WebDriver.for(:firefox, options: options)
    @driver.manage.timeouts.implicit_wait = SearchRankTest::ImplicitWait
  end
end
