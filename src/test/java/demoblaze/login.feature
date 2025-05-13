Feature: Pruebas al endpoint /login

Background:
  * url 'https://api.demoblaze.com'
  * def validUser = 'existinguser123'
  * def validPassword = 'TestPass123'

Scenario: Login exitoso con credenciales válidas
  Given path '/login'
  And request { username: '#(validUser)', password: '#(validPassword)' }
  When method POST
  Then status 200
  And match response contains { "status": "success" }

Scenario: Login con credenciales incorrectas
  Given path '/login'
  And request { username: 'invaliduser', password: 'wrongpass' }
  When method POST
  Then status 200
  And match response == { "errorMessage": "User does not exist." }
