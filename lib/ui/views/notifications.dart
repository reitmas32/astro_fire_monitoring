import 'package:flutter/material.dart';

class NotificationFires extends StatelessWidget {
  const NotificationFires({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, index) => Container(
        height: 100,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).canvasColor,
          boxShadow: const [BoxShadow()],
        ),
        child: Text('Hay un incendio en (5.12, -78,6)'),
      ),
    );
  }
}
