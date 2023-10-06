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
    final marks = ref.watch(getMarksFires);
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
                      'https://cdn-icons-png.flaticon.com/512/599/599502.png',
                    ),
                  );
                },
              ).toList(),
          error: (_, __) => [],
          loading: () => []),
    );
  }
}
