Feature: Delete user API

  Background:
    * def token = '8cafb8d9be4135f05a13cd04434acc947b566ae89a3bdc3124f96ba9d01936bd'
    Given url 'https://gorest.co.in/public/v1/'
    Given header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + token

  Scenario: Delete a user using a valid ID
    Given path 'users/7452274'
    When method delete
    Then status 204

    Given path 'users/7452274'
    When method get
    Then status 404


  Scenario: Delete a user using an invalid ID
    Given path 'users/7459'
    When method delete
    Then status 404

  Scenario: Delete a user using an invalid Alphanumeric ID
    Given path 'users/745187afd9'
    When method delete
    Then status 404

  Scenario: Delete a user using an id which has already been deleted
    Given path 'users/7452274'
    When method delete
    Then status 404
