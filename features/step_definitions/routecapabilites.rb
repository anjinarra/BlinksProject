
When(/^I am on the Video Player Page$/) do
  navigate_to(VideoContainerPage, :using=>:video_selection_route).select_video_by_index
  on(VideoContainerPage).is_video_loaded
end