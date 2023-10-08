import 'package:astro_fire_monitoring/services/astrofire_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Temperature {
  late double value;

  Temperature(dynamic _value) {
    value = _value.toDouble();
  }
}

class PictureTermal extends StateNotifier<List<Temperature>> {
  PictureTermal() : super([]);

  Future<List<Temperature>> load(String time) async {
    if (state.isEmpty) {
      final response = await SystemAPI.getTeperatures(time);
      if (response.isNotEmpty) {
        state = response;
      } else {
        throw const FormatException('Error al cargar los Productos');
      }
    }
    return Future(() => state);
  }
}

final cameraPictureProvider =
    StateProvider((ref) => List.generate(768, (index) => Temperature(0.0)));

final pictureTermalProvider =
    StateNotifierProvider<PictureTermal, List<Temperature>>((ref) {
  return PictureTermal();
});
