import 'package:astro_fire_monitoring/ui/providers/sidebar_controller.dart';
import 'package:astro_fire_monitoring/ui/providers/theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sidebarx/sidebarx.dart';

class AstroFireSideBar extends ConsumerWidget {
  const AstroFireSideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(sideBarControllerProvider);
    return SidebarX(
      controller: _controller,
      theme: getThemeSideBar(context),
      extendedTheme: getExtendedTheme(context),
      footerDivider:
          Divider(color: Color.fromARGB(255, 15, 88, 224), height: 1),
      animationDuration: Duration(milliseconds: 200),
      headerBuilder: (context, extended) {
        return Column(
          children: [
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/708/708290.png',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
          ],
        );
      },
      items: [
        const SidebarXItem(
          icon: Icons.map_outlined,
          label: 'MAP',
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'SETTINGS',
        ),
      ],
    );
  }
}
