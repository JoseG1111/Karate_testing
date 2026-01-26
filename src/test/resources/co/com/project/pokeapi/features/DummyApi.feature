@testingDummyApi
  Feature: Get user info

    Background:
      * url baseUrl4
      * def dummypath = '/users/10'

      @GetUser
      Scenario: Get an user info
        Given path dummypath
        When method GET
        Then assert responseStatus == 200
        And def user = response.username
        And def pass = response.password
        * print user
        * print pass