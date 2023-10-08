import 'package:astro_fire_monitoring/models/fire_detection.dart';
import 'package:astro_fire_monitoring/services/astrofire_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MarksFires extends StateNotifier<List<FireDetection>> {
  // We initialize the list of todos to an empty list
  MarksFires() : super([]);

  Future<List<FireDetection>> load() async {
    if (state.isEmpty) {
      final response = await SystemAPI.getFakeData();
      if (response.isNotEmpty) {
        state = response;
      }
    } else {
      throw const FormatException('Error al cargar los FireDetection');
    }

    return Future(() => state);
  }
}

final marksFiresProvider =
    StateNotifierProvider<MarksFires, List<FireDetection>>((ref) {
  return MarksFires();
});
final getMarksFires = FutureProvider<List<FireDetection>>((ref) async {
  final marksFires = await ref.watch(marksFiresProvider.notifier).load();
  final List<FireDetection> marks = marksFires;
  return marks;
});

class DeathSensorsList extends StateNotifier<List<DeathSensor>> {
  // We initialize the list of todos to an empty list
  DeathSensorsList() : super([]);

  Future<List<DeathSensor>> load() async {
    if (state.isEmpty) {
      final response = await SystemAPI.getSensors();
      if (response.isNotEmpty) {
        state = response;
      }
    } else {
      throw const FormatException('Error al cargar los FireDetection');
    }

    return Future(() => state);
  }
}

final marksSensorsProvider =
    StateNotifierProvider<DeathSensorsList, List<DeathSensor>>((ref) {
  return DeathSensorsList();
});
final getsensorsMarks = FutureProvider<List<DeathSensor>>((ref) async {
  final sensorsMarks = await ref.watch(marksSensorsProvider.notifier).load();
  final List<DeathSensor> marks = sensorsMarks;
  return marks;
});
