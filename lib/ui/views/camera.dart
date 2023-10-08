import 'package:astro_fire_monitoring/ui/molecules/hour_slider.dart';
import 'package:astro_fire_monitoring/ui/providers/camera.dart';
import 'package:astro_fire_monitoring/ui/providers/hour_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CameraUI extends ConsumerStatefulWidget {
  CameraUI({super.key});

  @override
  ConsumerState<CameraUI> createState() => _CameraUIState();
}

class _CameraUIState extends ConsumerState<CameraUI> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(hourSliderControllerProvider);
    final picture = ref.watch(cameraPictureProvider);
    final currentHour = ref.watch(hourProvider);
    print(picture.length);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 600,
              width: 800,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Container(
              height: 500,
              width: 700,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 32, // Número de columnas
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: getCOlorFromTemperature(
                      picture[index].value,
                    ), // Colores de la lista
                    //height: 100.0,
                    //width: 100.0,
                    child: Center(),
                  );
                },
                itemCount: picture.length, // Número de celdas
              ),
            ),
            Positioned(
              child: Text(
                currentHour,
                style: GoogleFonts.outfit(fontSize: 25),
              ),
              top: 50,
              right: 50,
            ),
          ],
        ),
        HourSlider(controller: controller),
      ],
    );
  }

  getCOlorFromTemperature(double temperature) {
    if (temperature <= 15) {
      return const Color.fromARGB(255, 47, 33, 243);
    } else if (temperature < 30) {
      return Color.fromARGB(255, 62, 174, 194);
    } else if (temperature <= 45) {
      return Color.fromARGB(255, 2, 253, 86);
    } else if (temperature < 60) {
      return Color.fromARGB(255, 194, 66, 62);
    } else if (temperature <= 100) {
      return Color.fromARGB(255, 253, 61, 2);
    } else if (temperature < 150) {
      return Color.fromARGB(255, 194, 121, 62);
    } else if (temperature <= 200) {
      return Color.fromARGB(255, 253, 173, 2);
    } else if (temperature < 300) {
      return Color.fromARGB(255, 194, 159, 62);
    } else if (temperature <= 400) {
      return Color.fromARGB(255, 249, 253, 2);
    } else {}
  }
}
