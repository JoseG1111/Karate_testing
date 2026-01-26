@TestingWeatherApi
Feature: Get geographical info of a city

  Background:
    * url baseUrl2
    * def weatherApiPath = '/data/2.5/weather'
    * def apiKey = karate.properties['apiKey']

  @WeatherApi
  Scenario: Get geographical info of a city
    Given path weatherApiPath
    When param lat = 20
    And param lon = -80
    And param appid = apiKey
    And method GET
    Then assert responseStatus == 200

  @testOne
  Scenario Outline: Get info of a city
    Given path weatherApiPath
    When param lat = <latitud>
    And param lon = <longitud>
    And param appid = apiKey
    And method GET
    Then assert responseStatus == <status>
    Examples:
      | latitud | longitud | status |
      | 30      | 'p'      | 400    |
      | 20      | -6       | 200    |
      | 58      | -2       | 200    |

  @testTwo
  Scenario Outline: introducing wrong values
    Given path weatherApiPath
    When param lat = <latitud>
    And param lon = <longitud>
    And param appid = apiKey
    And method GET
    Then assert responseStatus == <status>
    Examples:
      | latitud | longitud   | status |
      | 30      | 'p'        | 400    |
      | 20      | '-212121q' | 400    |
      | 58      | -2         | 200    |