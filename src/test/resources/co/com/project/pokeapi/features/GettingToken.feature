@GettingToken
Feature: Get token

  Background:
    * url baseUrl4
    * def tokenpath = '/auth/login'
   # * def username = user
   # * def password = pass

    * def leerUser = read('../features/DummyApi.feature')
    * def llamarUser = callonce leerUser
    * def valorUser = llamarUser.user
    * def valorPass = llamarUser.pass
    * def requestBodyObtenerToken = read('../json/ObtenerToken.json')


  @GetToken
  Scenario Outline: get token
    * set requestBodyObtenerToken.username = valorUser
    * set requestBodyObtenerToken.password = valorPass
    Given path tokenpath
    When request  requestBodyObtenerToken
    And method POST
    Then assert responseStatus == 200
    And def token = response.accessToken
    Examples:
      | expiresInMinsQA |
      | 100             |




