Feature: Watch Video in Blinkx.com
  By this feature Cigniti would like to demonstrate the capabilities, that it can offer in the space of test automation,
  especially in the field of Domain specific keyword driven testing

  In this feature the we will be watching pausing and watching 1 video each from 2 sections of the Blinkx video portal

  Background: Back ground generally refers to the common set up scripts specific to a given feature when it comes to execution.
  It can be a base state establishment or some specific pre condition that every scenario has to follow. In this feature we assume
  every scenario starts from the home screen of the blinkx video portal

    Given I am on the HomePage of the Blinkx Video portal

  @demo
  Scenario Outline: Select Video from different section and watch the video

  This is a crude way of performing the required actions. We can add all scenario related information here
  or add other comments as required for the understanding of the scenario for a new user.

    When I select the category "<category_name>"
    And I select the "<index_of_video>" video available
    Then The video should be loaded
    And I pause the video
    And I play the video

  Examples:
    | category_name   | index_of_video |
    | News & Politics | 1              |
    | Style           | 1              |

  @demo_nesting
  Scenario Outline: Select Video from different section and watch the video

  This is a slightly refined/ refactored scenario
  This also performs the same what is done by the previous scenario

    When I select the "<index_of_video>" video available in category "<category>"
    Then The video should be loaded
    And I pause the video
    And I play the video
  Examples:
    | index_of_video | category        |
    | 1              | News & Politics |


