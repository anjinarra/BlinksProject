Feature: Routing capabilties
  This feature ensures the re usability by abstraction instead of nesting
  @Routes
  Scenario: Display the code reduction with routes
  This is a sample scenario with routing capabilites
    Given I am on the HomePage of the Blinkx Video portal
    When I am on the Video Player Page
    Then The video should be loaded
    And I pause the video
    And I play the video