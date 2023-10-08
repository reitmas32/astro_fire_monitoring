import 'package:astro_fire_monitoring/ui/providers/sidebar_controller.dart';
import 'package:astro_fire_monitoring/ui/views/camera.dart';
import 'package:astro_fire_monitoring/ui/views/map_ui.dart';
import 'package:astro_fire_monitoring/ui/views/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = ref.watch(sideBarControllerProvider);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return NotificationFires();
          case 1:
            return MapUI();
          case 2:
            return CameraUI();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 2:
      return 'Aqui va la vista de la camara del dron';
    case 3:
      return 'Settings';

    default:
      return 'Not found page';
  }
}
