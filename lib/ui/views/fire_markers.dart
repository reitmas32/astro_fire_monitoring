import 'package:astro_fire_monitoring/ui/providers/marks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class FireMarkers extends ConsumerWidget {
  const FireMarkers({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marks = ref.watch(getsensorsMarks);
    return MarkerLayer(
      markers: marks.when(
          data: (data) => data.map(
                (e) {
                  print(LatLng(e.latitude, e.longitude).toString());
                  return Marker(
                    point: LatLng(e.latitude, e.longitude),
                    width: 50,
                    height: 50,
                    builder: (context) => Image.network(
                      'https://raw.githubusercontent.com/reitmas32/astro_fire_monitoring/master/assets/png-transparent-motion-sensors-computer-icons-others-text-logo-monochrome.png',
                    ),
                  );
                },
              ).toList(),
          error: (_, __) => [],
          loading: () => []),
    );
  }
}
