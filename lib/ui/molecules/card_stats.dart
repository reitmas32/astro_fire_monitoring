import 'package:astro_fire_monitoring/ui/atoms/stats_title.dart';
import 'package:astro_fire_monitoring/ui/providers/marks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStats extends ConsumerWidget {
  const CardStats({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensors = ref.watch(marksSensorsProvider);
    return Positioned(
      top: 50,
      left: 50,
      height: 250,
      width: 250,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor.withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sesores Muertos',
                  style: GoogleFonts.outfit(
                    fontSize: 25,
                  ),
                ),
                Text(
                  '${sensors.length}',
                  style: GoogleFonts.outfit(
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
