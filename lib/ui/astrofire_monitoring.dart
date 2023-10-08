import 'package:astro_fire_monitoring/ui/views/astrofire_sidebar.dart';
import 'package:astro_fire_monitoring/ui/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AstroFireMonitoring extends ConsumerWidget {
  AstroFireMonitoring({super.key});

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: _key,
      body: Row(
        children: [
          //AstroFireSideBar(),
          Expanded(
            child: Center(
              child: HomeView(),
            ),
          ),
        ],
      ),
    );
  }
}
