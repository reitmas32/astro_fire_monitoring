import 'package:astro_fire_monitoring/services/astrofire_api.dart';
import 'package:astro_fire_monitoring/ui/providers/camera.dart';
import 'package:astro_fire_monitoring/ui/providers/hour_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HourSlider extends ConsumerStatefulWidget {
  final HourSliderController controller;

  const HourSlider({super.key, required this.controller});
  @override
  _HourSliderState createState() => _HourSliderState();
}

class _HourSliderState extends ConsumerState<HourSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 96,
      divisions: 96,
      value: widget.controller.currentSelected.toDouble(),
      onChanged: (value) {
        ref.read(hourProvider.notifier).update((state) =>
            convertirNumeroAHora(widget.controller.currentSelected / 4));
        setState(() {
          widget.controller.updateMask(value.toInt());
        });
      },
      onChangeEnd: (value) => loadImage(),
      label: convertirNumeroAHora(widget.controller.currentSelected / 4),
      activeColor: Colors.blue,
      inactiveColor: Color.fromARGB(165, 33, 149, 243),
    );
  }

  loadImage() async {
    final newPicture = await SystemAPI.getTeperatures(
        convertirNumeroAHora(widget.controller.currentSelected / 4));
    ref.read(cameraPictureProvider.notifier).update((state) => newPicture);
  }
}

class HourSliderController extends ChangeNotifier {
  late int currentSelected;
  HourSliderController() {
    currentSelected = 1;
  }

  updateMask(int index) {
    if (index >= 0) {
      currentSelected = index;
      notifyListeners();
    }
  }
}

String convertirNumeroAHora(double numero) {
  if (numero < 0 || numero > 24) {
    return "Fuera de rango";
  }

  int horas = numero.toInt();
  int minutos = ((numero - horas) * 60).toInt();

  // Asegurarse de que los minutos estén en el rango de 0 a 59
  if (minutos < 0) {
    minutos = 0;
  } else if (minutos > 59) {
    minutos = 59;
  }

  // Formatear la hora en un formato legible (HH:mm)
  String horaFormateada = horas.toString().padLeft(2, '0') +
      ':' +
      minutos.toString().padLeft(2, '0');

  return horaFormateada;
}
