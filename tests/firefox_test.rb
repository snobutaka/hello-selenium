require 'test/unit'
require_relative 'search_rank_test'

class FirefoxTest < Test::Unit::TestCase
  include SearchRankTest

  def setup()
    @driver = Selenium::WebDriver.for(:firefox)
    @driver.manage.timeouts.implicit_wait = SearchRankTest::ImplicitWait
  end
end
