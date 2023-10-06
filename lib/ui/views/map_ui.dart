import 'package:astro_fire_monitoring/ui/atoms/color_filter.dart';
import 'package:astro_fire_monitoring/ui/molecules/astrofire_searchbar.dart';
import 'package:astro_fire_monitoring/ui/molecules/card_stats.dart';
import 'package:astro_fire_monitoring/ui/providers/map_controller.dart';
import 'package:astro_fire_monitoring/ui/views/fire_markers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class MapUI extends ConsumerStatefulWidget {
  const MapUI({super.key});

  @override
  ConsumerState<MapUI> createState() => _MapUIState();
}

class _MapUIState extends ConsumerState<MapUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mapControllerProvider);
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(0, 30),
            zoom: 3,
          ),
          mapController: controller,
          nonRotatedChildren: [
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => print('object'),
                ),
              ],
            ),
          ],
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            FireMarkers(),
          ],
        ),
        ColorFilterTheme(),
        CardStats(),
        AstroFireSearchBar(),
      ],
    );
  }
}
