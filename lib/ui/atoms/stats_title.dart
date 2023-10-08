import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsTitle extends StatelessWidget {
  const StatsTitle({
    super.key,
    required this.lable,
    required this.percentage,
    required this.color,
    this.leadding,
  });

  final String lable;
  final double percentage;
  final Color color;
  final Icon? leadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            lable,
            style: GoogleFonts.outfit(
              fontSize: 20,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            '$percentage',
            style: GoogleFonts.outfit(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
