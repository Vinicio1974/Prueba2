Feature: Pruebas al endpoint /signup

Background:
  * url 'https://api.demoblaze.com'
  * def user = 'testuser' + java.util.UUID.randomUUID().toString().substring(0, 5)
  * def password = 'TestPass123'

Scenario: Crear un nuevo usuario
  Given path '/signup'
  And request { username: '#(user)', password: '#(password)' }
  When method POST
  Then status 200
  And match response == { "message": "Sign up successful." }

Scenario: Crear un usuario ya existente
  * def existingUser = 'existinguser123'
  * def existingPassword = 'TestPass123'
  Given path '/signup'
  And request { username: '#(existingUser)', password: '#(existingPassword)' }
  When method POST
  Then status 200
  And match response == { "errorMessage": "This user already exist." }
