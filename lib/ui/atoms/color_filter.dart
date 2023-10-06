import 'package:flutter/material.dart';

class ColorFilterTheme extends StatelessWidget {
  const ColorFilterTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(80, 0, 0, 0),
      ),
    );
  }
}
