require 'uri'
require 'selenium-webdriver' # http://www.rubydoc.info/gems/selenium-webdriver/

#
# 各種検索エンジンで「Ruby」を検索すると，
# トップヒットが [Ruby の公式サイト](www.ruby-lang.org) となることをテストする．
#
module SearchRankTest
  Keyword = 'Ruby'
  ExpectingSite = 'www.ruby-lang.org'
  ImplicitWait = 10 # seconds
  SaveScreenshots = false
  
  def teardown()
    @driver.quit()
  end

  #
  # Google の I'm Feeling Lucky をテストする．
  #
  def test_feeling_lucky_ruby()
    @driver.get('http://google.com')
    @driver.find_element(:id => 'lst-ib').send_keys(Keyword)
    @driver.find_element(:xpath => '//*[@id="tsf"]/div[2]/div[3]/center/input[2]').click()

    @driver.save_screenshot('./feeling-lucky-ruby.png') if SaveScreenshots

    assert_equal(ExpectingSite, URI.parse(@driver.current_url).host)
  end

  #
  # DuckDuckGo をテストする．
  #
  def test_duckduckgo_ruby()
    @driver.get('https://duckduckgo.com')
    @driver.find_element(:id => 'search_form_input_homepage').send_keys(Keyword)
    @driver.find_element(:id => 'search_button_homepage').click()
    @driver.find_element(:id => 'r1-0').click()

    @driver.save_screenshot('./duckduckgo-ruby.png') if SaveScreenshots

    assert_equal(ExpectingSite, URI.parse(@driver.current_url).host)
  end

  #
  # Yahoo! Japan をテストする．
  #
  def test_yahoojapan_ruby()
    @driver.get('https://www.yahoo.co.jp')
    @driver.find_element(:id => 'srchtxt').send_keys(Keyword)
    @driver.find_element(:id => 'srchbtn').click()
    @driver.find_element(:xpath => '//*[@id="WS2m"]/div[1]/div[1]/h3/a').click()

    @driver.save_screenshot('./yahoo-ruby.png') if SaveScreenshots

    assert_equal(ExpectingSite, URI.parse(@driver.current_url).host)
  end
end
