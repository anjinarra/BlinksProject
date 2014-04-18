Before do |scenario|
  case FigNewton.browser.downcase
    when 'chrome'
      @browser = Watir::Browser.new :chrome
    when 'ie'
      @browser = Watir::Browser.new :ie
    when 'firefox'
      @browser = Watir::Browser.new :firefox
    when 'iphone'
      @browser = Watir::Browser.new :iphone
    else
      @browser = Watir::Browser.new :firefox
  end
end

After do |scenario|
  if(scenario.failed?)
    @browser.screenshot.save("html-report/image/png/#{scenario.__id__}.png")
    embed("image/png/#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end
  @browser.quit
end
