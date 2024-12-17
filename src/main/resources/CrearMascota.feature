Feature: API Mascotas de PetStore Swagger

  Background:
    Given url "https://petstore.swagger.io/v2"

  Scenario Outline: Crear Mascota
    And path "/pet"
    And request
    """
    {
      "id": <idPet>,
      "category": {
        "id": <idCategoria>,
        "name": <nombreCategoria>
      },
      "name": <nombreMascota>,
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": <idTag>,
          "name": <tag>
        }
      ],
      "status": <status>
    }
    """
    When method post
    Then status <statusCodeResponse>
    And match $.name == "<nombreMascota>"
    And match $.id == <idPet>
    Examples:
      | idPet | idCategoria | nombreCategoria    | nombreMascota | idTag | tag    | status    | statusCodeResponse |
      | 10    | 2           | Mascotas Sociables | Zeus          | 1     | blanco | available | 200                |
      | 11    | 2           | Mascotas Sociables | Doggi         | 2     | Marron | available | 200                |
      | 12    | 2           | Mascotas Sociables | Hobi          | 3     | Negro  | available | 200                |
      | 13    | 2           | Mascotas Sociables | Argus         | 2     | Marron | available | 200                |
      | 14    | 2           | Mascotas Sociables | Firulais      | 1     | blanco | available | 200                |
      | 15    | 2           | Mascotas Sociables | Daysi         | 1     | blanco | available | 200                |