Given(/^I am on the HomePage of the Blinkx Video portal$/) do
  visit HomePage
end

When(/^I select the category "(.*?)"$/) do |categoryName|
  on(HomePage).selectCategory('category' => categoryName)
end

When(/^I select the "(.*?)" video available$/) do |index_of_video|
  on(VideoContainerPage).select_video_by_index('index' => index_of_video)
end

Then(/^The video should be loaded$/) do
  on(VideoContainerPage).is_video_loaded
end

When(/^I pause the video$/) do
  on(VideoContainerPage).pauseVideo
end

When(/^I play the video$/) do
  on(VideoContainerPage).playVideo
end


When(/^I select the "([^"]*)" video available in category "([^"]*)"$/) do |index_of_video, category|
  steps %{
    When I select the category "#{category}"
    And I select the "#{index_of_video}" video available
  }
end