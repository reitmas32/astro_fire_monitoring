import 'dart:async';
import 'dart:convert';

import 'package:astro_fire_monitoring/ui/providers/camera.dart';
import 'package:http/http.dart' as http;

import 'package:astro_fire_monitoring/models/fire_detection.dart';

class SystemAPI {
  // Simulamos la obtención de datos de la API.
  static Future<List<FireDetection>> getFakeData() async {
    // Simulamos un retraso de 1 segundo para emular una solicitud HTTP.
    await Future.delayed(Duration(seconds: 1));

    // Aquí puedes proporcionar tu array de datos de ejemplo.
    final List<Map<String, dynamic>> fakeData = [
      {
        "latitude": 0.05836,
        "longitude": 29.59085,
        "bright_ti4": 295.64,
        "scan": 0.38,
        "track": 0.59,
        "acq_date": "2023-07-12",
        "acq_time": 3,
        "satellite": "N",
        "instrument": "VIIRS",
        "confidence": "n",
        "version": "2.0NRT",
        "bright_ti5": 275.15,
        "frp": 0.83,
        "daynight": "N"
      },
      {
        "latitude": 0.48765,
        "longitude": 31.5076,
        "bright_ti4": 296.73,
        "scan": 0.51,
        "track": 0.66,
        "acq_date": "2023-07-12",
        "acq_time": 3,
        "satellite": "N",
        "instrument": "VIIRS",
        "confidence": "n",
        "version": "2.0NRT",
        "bright_ti5": 275.15,
        "frp": 0.56,
        "daynight": "N"
      },
      {
        "latitude": 2.15227,
        "longitude": 13.94524,
        "bright_ti4": 305.26,
        "scan": 0.51,
        "track": 0.49,
        "acq_date": "2023-07-12",
        "acq_time": 3,
        "satellite": "N",
        "instrument": "VIIRS",
        "confidence": "n",
        "version": "2.0NRT",
        "bright_ti5": 287.94,
        "frp": 1.08,
        "daynight": "N"
      },
      {
        "latitude": 2.15681,
        "longitude": 13.94618,
        "bright_ti4": 319.05,
        "scan": 0.51,
        "track": 0.49,
        "acq_date": "2023-07-12",
        "acq_time": 3,
        "satellite": "N",
        "instrument": "VIIRS",
        "confidence": "n",
        "version": "2.0NRT",
        "bright_ti5": 288.77,
        "frp": 1.81,
        "daynight": "N"
      },
      {
        "latitude": 2.15754,
        "longitude": 13.94131,
        "bright_ti4": 301.13,
        "scan": 0.51,
        "track": 0.5,
        "acq_date": "2023-07-12",
        "acq_time": 3,
        "satellite": "N",
        "instrument": "VIIRS",
        "confidence": "n",
        "version": "2.0NRT",
        "bright_ti5": 288.17,
        "frp": 1.81,
        "daynight": "N"
      },
      {
        "latitude": 2.62829,
        "longitude": 16.06323,
        "bright_ti4": 312.64,
        "scan": 0.57,
        "track": 0.43,
        "acq_date": "2023-07-12",
        "acq_time": 3,
        "satellite": "N",
        "instrument": "VIIRS",
        "confidence": "n",
        "version": "2.0NRT",
        "bright_ti5": 283.14,
        "frp": 1.97,
        "daynight": "N"
      },
      {
        "latitude": 2.80413,
        "longitude": 18.02321,
        "bright_ti4": 305.63,
        "scan": 0.45,
        "track": 0.39,
        "acq_date": "2023-07-12",
        "acq_time": 3,
        "satellite": "N",
        "instrument": "VIIRS",
        "confidence": "n",
        "version": "2.0NRT",
        "bright_ti5": 289.43,
        "frp": 0.5,
        "daynight": "N"
      },
      {
        "latitude": 2.8077,
        "longitude": 18.02378,
        "bright_ti4": 307.2,
        "scan": 0.45,
        "track": 0.39,
        "acq_date": "2023-07-12",
        "acq_time": 3,
        "satellite": "N",
        "instrument": "VIIRS",
        "confidence": "n",
        "version": "2.0NRT",
        "bright_ti5": 289.59,
        "frp": 0.5,
        "daynight": "N"
      }
    ];

    // Mapeamos los datos simulados al modelo FireDetection.
    final List<FireDetection> fireDetections =
        fakeData.map((json) => FireDetection.fromJson(json)).toList();

    return fireDetections;
  }

  static Future<List<Temperature>> getTeperatures(String time) async {
    try {
      final hour = time[0] + time[1];
      final minute = time[3] + time[4];

      final String url =
          'https://sytem-fire-api-prod.onrender.com/api/v1/dron-temperature/?datetime_event=2023-10-07%20$hour%3A$minute%3A00';
      print(url);

      final uri = Uri.parse(url);

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var bodyDecode = jsonDecode(response.body);

        final temperatures = bodyDecode['Data']['temperatures'];

        final List<Temperature> temperaturesDouble = [];

        for (var t in temperatures) {
          temperaturesDouble.add(Temperature(t));
        }

        return temperaturesDouble;
      } else {
        throw Exception('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error en la solicitud HTTP: $e');
    }
  }

  static Future<List<DeathSensor>> getSensors() async {
    try {
      final String url =
          'https://sytem-fire-api-prod.onrender.com/api/v1/death-sensors/';
      print(url);

      final uri = Uri.parse(url);

      var response = 200; //await http.get(uri);

      if (response == 200) {
        //var bodyDecode = jsonDecode(response.body);

        //final temperatures = bodyDecode['Data'];
        final List<DeathSensor> sensors = [
          DeathSensor(
            latitude: 20,
            longitude: -99,
            datetimeEvent: "2023-10-08T10:41:43.339Z",
            temperature: 25.5,
            batteryPercentage: 80,
          ),
          DeathSensor(
            latitude: 20.1,
            longitude: -99.1,
            datetimeEvent: "2023-10-08T14:30:15.123Z",
            temperature: 28.0,
            batteryPercentage: 75,
          ),
          DeathSensor(
            latitude: 20.2,
            longitude: -99.2,
            datetimeEvent: "2023-10-08T19:15:30.987Z",
            temperature: 22.8,
            batteryPercentage: 90,
          ),
          DeathSensor(
            latitude: 20.3,
            longitude: -99.3,
            datetimeEvent: "2023-10-08T23:59:59.999Z",
            temperature: 30.2,
            batteryPercentage: 60,
          ),
        ];
        return sensors;
      } else {
        throw Exception('Error en la solicitud HTTP: ');
      }
    } catch (e) {
      throw Exception('Error en la solicitud HTTP: $e');
    }
  }
}

class DeathSensor {
  final double latitude;
  final double longitude;
  final String datetimeEvent;
  final double temperature;
  final int batteryPercentage;

  DeathSensor({
    required this.latitude,
    required this.longitude,
    required this.datetimeEvent,
    required this.temperature,
    required this.batteryPercentage,
  });

  factory DeathSensor.fromJson(Map<String, dynamic> json) {
    return DeathSensor(
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      datetimeEvent: json['datetime_event'] ?? "",
      temperature: json['temperature'] ?? 0.0,
      batteryPercentage: json['battery_percentage'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'datetime_event': datetimeEvent,
      'temperature': temperature,
      'battery_percentage': batteryPercentage,
    };
  }
}
