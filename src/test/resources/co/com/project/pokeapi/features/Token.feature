@Token
Feature: Consume api token


  Background:
    * url baseUrl3
    * header 'content-Type' = 'aplication/x-www-form-urlencode'
    * form field grand_type = 'password'
    * form field client_id = 'ID'
    * form field client_secret = 'secret'
    * form field username = 'user'
    * form field password = 'password'


  @obtenerToken
  Scenario: getting a token to consume it
    When method POST
    Then status 200
    And match responseType == '#string'



