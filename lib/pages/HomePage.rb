class HomePage
  include PageObject
  include DataMagic

  page_url "http://www.blinkx.com"

  expected_element(:news_and_politics)

  unordered_list(:categories, :id => 'home-categories')
  list_item(:news_and_politics, :text => 'News & Politics')
  list_item(:style, :text => 'Style')
  list_item(:ign_news, :text => 'IGN News')

  #def PageSync(timeout=60)
  #  self.wait_until(timeout, 'Page Level Synchronization Failed') do
  #    sleep(5)
  #    self.text.include? 'News & Politics'
  #  end
  #end


  #selects the given category from the home page
  def selectCategory(data = {})
    self.has_expected_element?
    data = data_for('homepage',data)
    case data['category'].downcase.gsub(/\s+/, '')
      when 'news&politics'
        news_and_politics_element.click
      when 'style'
        style_element.click
    end
  end

end
