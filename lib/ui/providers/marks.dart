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
