@GetAuthUser
Feature: Get current auth user

  Background:
    * url baseUrl4
    * def dummypathuser = '/auth/me'
    * def leerToken = read('./GettingToken.feature')
    * def llamarToken = callonce leerToken
    * def valorToken = llamarToken.token
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + valorToken
    * print valorToken

  @GetUserAuth
  Scenario Outline: Get current auth user
    Given path dummypathuser
    When method GET
    Then assert responseStatus == 200
    And match response.firstName == '<firstName>'
    And match response.lastName == '<lastName>'
    And match response.maidenName == '<maidenName>'
    And match response.age == <age>
    And match response.address.address == '<address>'
    And match response.crypto.coin == '<coin>'
    Examples:
      | firstName | lastName | maidenName | age | address         | coin    |
      | Isabella  | Anderson | Davis      | 32  | 1964 Oak Street | Bitcoin |

