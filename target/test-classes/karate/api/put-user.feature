Feature: Update user API

  Background:
    * def token = '8cafb8d9be4135f05a13cd04434acc947b566ae89a3bdc3124f96ba9d01936bd'
    Given url 'https://gorest.co.in/public/v1/'
    Given header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + token

  Scenario: Update user's name to a valid name
  Given path 'users/7452273'
  And request
  """
  {
  "name":"Ashi"
  }
  """
  When method put
  Then status 200
  And match response.data.name == "Ashi"

  Scenario: Update user's email to a valid email
    Given path 'users/7452273'
    And request
    """
    {
    "email":"nautiyalll@gmail.com"
    }
    """
    When method put
    Then status 200
    And match response.data.email == "nautiyalll@gmail.com"

  Scenario: Updated user's gender to a valid gender
    Given path 'users/7452273'
    And request
    """
    {
    "gender":"male"
    }
    """
    When method put
    Then status 200
    And match response.data.gender == "male"

  Scenario: Update user's status to a valid status
    Given path 'users/7452273'
    And request
    """
    {
    "status":"active"
    }
    """
    When method put
    Then status 200
    And match response.data.status == "active"

  Scenario: Update user's name to an invalid name
  Given path 'users/7452273'
  And request
  """
  {
  "name":"1^&56"
  }
  """
  When method put
  Then status 422

  Scenario: Update user's email to an invalid email
  Given path 'users/7452273'
  And request
  """
  {
  "email":"hehe.com"
  }
  """
  When method put
  Then status 422

  Scenario: Update user's gender to an invalid gender
  Given path 'users/7452273'
  And request
  """
  {
  "gender":"xyz"
  }
  """
  When method put
  Then status 422

  Scenario: Update user's status to an invalid status
  Given path 'users/7452273'
  And request
  """
  {
  "status":"hehe"
  }
  """
  When method put
  Then status 422

  Scenario: Update user's details using an invalid ID
  Given path 'users/74'
  And request
  """
  {
  "name":"Tanmay"
  }
  """
  When method put
  Then status 404

  Scenario: Not providing an ID when using Put method
  Given path 'users'
  And request
  """
  {
  "name":"Anushka"
  }
  """
  When method put
  Then status 404