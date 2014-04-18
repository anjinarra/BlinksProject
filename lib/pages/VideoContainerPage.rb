class VideoContainerPage

  include PageObject
  include DataMagic

  @@frameid = ''

  expected_element(:default_container, 60)

  h2(:video_page_header, :id => 'stream-title')
  form(:video_player, :id => /playerform/)
  div(:default_container, :class => "vid-play-overlay", :index => 0)

  def select_video_by_index(data = {})
    data = data_for('videoContainerPage', data)
    self.class.div(:video_container, :class => "vid-play-overlay", :index => (data['index'].to_i-1))
    #dynamic wait for the page to load
    self.has_expected_element?
    #static wait as suggested by selenium forums to avoid Element NOT attached to DOM #ISSUE 67 in webdriver
    sleep(5)
    self.video_container_element.click
  end

  def is_video_loaded()
    #static wait for the video to load after clicking on the image video link
    sleep(10)
    #check if video is not present
    if not video_player?
      raise ("The Video is not Loaded")
    else
      @@frameid = video_player_element.target
    end
  end

  def pauseVideo()
    sleep(5) #to ensure the default play back visually
    @browser.execute_script(@@frameid+".blinkx_request_pause('blinkx_request_pause')")
    sleep(5) #to ensure the pause visually
  end

  def playVideo()
    @browser.execute_script(@@frameid+".blinkx_request_play('blinkx_request_play')")
    sleep(5) #to ensure the resume play back visually
  end
end