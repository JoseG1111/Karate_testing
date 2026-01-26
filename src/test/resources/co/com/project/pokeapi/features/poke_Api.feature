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

  @DiferentParameters
  Scenario Outline: testing apiPoke using different params
    Given path pokeApiPath
    When param limit = <limit>
    And  param offset = <offset>
    And method GET
    Then assert responseStatus == 200
    And match response.results[0].url == <urlResponse>
    And match response.results[0].name == <nameResponse>
    Examples:
      | limit | offset | urlResponse                           | nameResponse |
      | 20    | 20     | 'https://pokeapi.co/api/v2/ability/21/' | 'suction-cups' |
      | 40    | 20     | 'https://pokeapi.co/api/v2/ability/21/' | 'suction-cups' |

  @ValidateResponse
  Scenario: validate response structure
    Given path pokeApiPath
    When method GET
    Then assert responseStatus == 200
    And match response ==
  """
  {count: '#number',
  next: '#string',
  previous: '#?',
  results: '#array'
  }
  """



