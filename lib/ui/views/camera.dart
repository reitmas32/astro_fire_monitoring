import 'dart:async';
import 'dart:convert';

import 'package:astro_fire_monitoring/ui/molecules/hour_slider.dart';
import 'package:astro_fire_monitoring/ui/providers/hour_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CameraUI extends ConsumerStatefulWidget {
  CameraUI({super.key});

  @override
  ConsumerState<CameraUI> createState() => _CameraUIState();
}

class _CameraUIState extends ConsumerState<CameraUI> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(hourSliderControllerProvider);
    //final picture = ref.watch(cameraPictureProvider);
    print(image.length);
    return Container(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              height: 400,
              width: 450,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 380,
                  width: 430,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 32, // Número de columnas
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // Colores de la lista
                        //height: 100.0,
                        //width: 100.0,
                        child: Center(),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.1),
                          color: getCOlorFromTemperature(
                            image[index],
                          ),
                        ),
                      );
                    },
                    itemCount: image.length, // Número de celdas
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Text(
              currentHour,
              style: GoogleFonts.outfit(fontSize: 15),
            ),
            top: 20,
            right: 20,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      fetchRandomNumber();
    });
  }

  @override
  void dispose() {
    super.dispose();

    // Cancela el temporizador en dispose
    _timer.cancel();
  }

  String intToStringPair(int num) {
    if (num >= 0 && num < 10) {
      return '0$num';
    } else if (num < 0) {
      return '00';
    }
    return '$num';
  }

  List<dynamic> image = List.generate(768, (index) => 0.0);
  String currentHour = '';

  late Timer _timer;

  Future<void> fetchRandomNumber() async {
    // Obtener la hora actual
    try {
      // Obtener la hora actual
      final now = DateTime.now();

      // Restar 1 minuto a la hora actual
      final oneMinuteAgo = now.subtract(Duration(seconds: 5));

      // Obtener la hora y los minutos de la hora actual menos un minuto
      final hour = intToStringPair(oneMinuteAgo.hour + 6);
      final minute = intToStringPair(oneMinuteAgo.minute);

      final mount = intToStringPair(oneMinuteAgo.month);
      final day = intToStringPair(oneMinuteAgo.day - 1);
      final year = intToStringPair(oneMinuteAgo.year);

      var datetime_event = '$year-$mount-$day%20$hour%3A$minute%3A00';

      //datetime_event = '2023-10-08%2017%3A19%3A40';

      print(datetime_event);

      final response = await http.get(Uri.parse(
          'https://system-api-hackthon.onrender.com/api/v1/dron-temperature/?datetime_event=$datetime_event'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          currentHour = '$year-$mount-$day $hour:$minute:00';
          var data_array = data['Data'];
          if (data_array != null) {
            List<dynamic> rawTemperatures = data['Data']['temperatures'];
            image = rawTemperatures.map((value) => value.toDouble()).toList();
          }

          //print(image);
        });
      } else {
        throw Exception('No se pudo cargar el número aleatorio');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  getCOlorFromTemperature(double temperature) {
    if (temperature <= 15) {
      return const Color.fromARGB(255, 47, 33, 243);
    } else if (temperature < 25) {
      return Color.fromARGB(255, 62, 174, 194);
    } else if (temperature <= 30) {
      return Color.fromARGB(255, 2, 253, 86);
    } else if (temperature < 35) {
      return Color.fromARGB(255, 194, 66, 62);
    } else if (temperature <= 40) {
      return Color.fromARGB(255, 253, 61, 2);
    } else if (temperature < 45) {
      return Color.fromARGB(255, 194, 121, 62);
    } else if (temperature <= 50) {
      return Color.fromARGB(255, 253, 173, 2);
    } else if (temperature < 55) {
      return Color.fromARGB(255, 194, 159, 62);
    } else if (temperature <= 100) {
      return Color.fromARGB(255, 249, 253, 2);
    } else {}
  }
}
