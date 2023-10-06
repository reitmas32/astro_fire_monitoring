import 'package:astro_fire_monitoring/ui/atoms/stats_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStats extends StatelessWidget {
  const CardStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  'Incendios Actules',
                  style: GoogleFonts.outfit(
                    fontSize: 25,
                  ),
                ),
                Text(
                  '750',
                  style: GoogleFonts.outfit(
                    fontSize: 50,
                  ),
                ),
                StatsTitle(
                  lable: '- ACTIVO',
                  percentage: 11.56,
                  color: Colors.red,
                ),
                StatsTitle(
                  lable: '- ESTABILIZADO',
                  percentage: 50.44,
                  color: Colors.orange,
                ),
                StatsTitle(
                  lable: '- CONTROLADO',
                  percentage: 38,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
