#autor JGBC
  @GestionDocument
  Feature: testing pokeapi


    Background:
      * url baseUrl
      * def pokeApiPath = '/api/v2/ability/'
      
      
      @ApiTest
      Scenario: testing api 
        Given path pokeApiPath
        When param limit = 20
        And  param offset = 20
        And method GET
        Then assert responseStatus == 200


        @ApiPoke
        Scenario Outline:
          Given

