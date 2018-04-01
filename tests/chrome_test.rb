require 'test/unit'
require_relative 'search_rank_test'

class ChromeTest < Test::Unit::TestCase
  include SearchRankTest

  def setup()
    @driver = Selenium::WebDriver.for(:chrome)
    @driver.manage.timeouts.implicit_wait = SearchRankTest::ImplicitWait
  end
end
