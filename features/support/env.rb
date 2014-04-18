$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))
require 'rubygems'
require 'bundler/setup'
require 'rspec-expectations'
require 'page-object'
require 'require_all'
require 'fig_newton'
require 'data_magic'
require 'watir-webdriver'

require_all 'lib'
require_all 'lib/pages'

@maxWait = 60
PageObject.default_page_wait = @maxWait
PageObject.default_element_wait = @maxWait


World(PageObject::PageFactory)
PageObject::PageFactory.routes = {
    :default => [
        [HomePage, :selectCategory]
    ],
    :video_selection_route => [
        [HomePage, :selectCategory],
        [VideoContainerPage, :select_video_by_index]
    ]}