import 'package:pets_manager/app/shared/repositories/places/pet_place_interface.dart';

class PetPlaceFirebase implements IPetPlace{

  @override
  Future<List<Map<String,dynamic>>> getListPetPlaces() async {
    List<Map<String,dynamic>> _list = [
      {
        "name": "Estimacão",
        "lat": -25.4762144,
        "lon": -49.3367242,
        "phone": "+554132886961",
        "address": "R. João Dembinski, 3368 - Fazendinha, Curitiba - PR, 81240-270",
        "vetRespName": "Dr. Fulano de tal",
        "vetRespCRMV": "12349PR",
        "durationAppointment": "30",
        "rating": 4.8,
        "email": "teste@teste.com",
        "site": "www.site.com",
        "type" : [1,2],
        "urlImageAvatar" : "",
        "operationList": [
          {
            "dayWeek": 1,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 2,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 3,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 4,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 5,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 6,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 7,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          }
        ],
        "specialities": [
          "Clinica Geral",
          "Cirurgia",
          "Neurologia",
          "Oncologia"
        ]
      },
      {
        "name": "HVB",
        "lat": -25.444845,
        "lon": -49.290025,
        "phone": "+554130396644",
        "address": "Rua Bruno Filgueira, 501 - Batel, Curitiba - PR, 80440-220",
        "vetRespName": "Dr. Fulano de tal",
        "vetRespCRMV": "113349PR",
        "durationAppointment": "30",
        "rating": 4.6,
        "email": "teste@teste.com",
        "site": "www.site.com",
        "type" : [1],
        "urlImageAvatar" : "https://hvbatel.com.br/themes/hvbateltheme/images/logo.png",
        "operationList": [
          {
            "dayWeek": 1,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 2,
            "hour": {
              "open": "00:00",
              "close": "23:59"
            }
          },
          {
            "dayWeek": 3,
            "hour": {
              "open": "00:00",
              "close": "23:59"
            }
          },
          {
            "dayWeek": 4,
            "hour": {
              "open": "00:00",
              "close": "23:59"
            }
          },
          {
            "dayWeek": 5,
            "hour": {
              "open": "00:00",
              "close": "23:59"
            }
          },
          {
            "dayWeek": 6,
            "hour": {
              "open": "00:00",
              "close": "23:59"
            }
          },
          {
            "dayWeek": 7,
            "hour": {
              "open": "00:00",
              "close": "23:59"
            }
          }
        ],
        "specialities": [
          "Clinica Geral",
          "Cirurgia",
          "Neurologia",
          "Oncologia"
        ]
      },
      {
        "name": "Pets",
        "lat": -25.4762144,
        "lon": -49.3367242,
        "phone": "+554135287389",
        "address": "Av. N. Sra. Aparecida, 582 - Seminário, Curitiba - PR, 80440-000",
        "vetRespName": "Dr. Fulano de tal",
        "vetRespCRMV": "12349PR",
        "durationappointment": "30",
        "rating": 4.8,
        "email": "teste@teste.com",
        "site": "www.site.com",
        "type" : [2],
        "urlImageAvatar" :"https://www.petz.com.br/novaLoja/images/logo.png",
        "operationList": [
          {
            "dayWeek": 1,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 2,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 3,
            "hour": {
              "open": "09:00",
              "close": "23:00"
            }
          },
          {
            "dayWeek": 4,
            "hour": {
              "open": "09:00",
              "close": "23:00"
            }
          },
          {
            "dayWeek": 5,
            "hour": {
              "open": "09:00",
              "close": "23:00"
            }
          },
          {
            "dayWeek": 6,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          },
          {
            "dayWeek": 7,
            "hour": {
              "open": "09:00",
              "close": "18:00"
            }
          }
        ],
        "specialities": [
          "Clinica Geral",
          "Cirurgia",
          "Neurologia",
          "Oncologia"
        ]
      }
    ];
    return _list;
  }
}