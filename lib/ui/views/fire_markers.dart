import 'package:astro_fire_monitoring/ui/providers/map_controller.dart';
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
    final controller = ref.watch(mapControllerProvider);
    return MarkerLayer(
      markers: [
        Marker(
          point: LatLng(19.462909481822955, -99.04031221700238),
          width: 50,
          height: 50,
          builder: (context) => Image.network(
              'https://cdn-icons-png.flaticon.com/512/599/599502.png'),
        ),
        Marker(
          point: LatLng(20, -100),
          width: 50,
          height: 50,
          builder: (context) => MouseRegion(
            onHover: (event) => print('Hola con el zoom ${controller.zoom}'),
            child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/599/599502.png'),
          ),
        ),
        Marker(
          point: LatLng(20, -101),
          width: 50,
          height: 50,
          builder: (context) => Image.network(
              'https://cdn-icons-png.flaticon.com/512/599/599502.png'),
        ),
      ],
    );
  }
}
