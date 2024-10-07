Feature: Fetch user API

  Background:
    * def token = '8cafb8d9be4135f05a13cd04434acc947b566ae89a3bdc3124f96ba9d01936bd'
    Given url 'https://gorest.co.in/public/v1/'
    Given header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + token

  Scenario: Fetch data of all users
    Given path 'users'
    When method get
    Then status 200

  Scenario: Fetch data of a specific user using a valid ID
    Given path 'users/7452008'
    When method get
    Then status 200
    And match response.data.id == 7452008


  Scenario:  Fetch data of a user using an Invalid ID
    Given path 'users/123'
    When method get
    Then status 404