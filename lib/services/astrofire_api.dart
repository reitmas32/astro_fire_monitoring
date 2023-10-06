import 'dart:async';

import 'package:astro_fire_monitoring/models/fire_detection.dart';

class FakeApiService {
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
}
