import 'package:astro_fire_monitoring/ui/providers/marks.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
                    builder: (context) => e.isDead ? Icon(EvaIcons.radio, color: Colors.red,) : Icon(EvaIcons.radio, color: Colors.green,),
                  );
                },
              ).toList(),
          error: (_, __) => [],
          loading: () => []),
    );
  }
}
