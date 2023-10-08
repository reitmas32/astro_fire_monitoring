import 'package:flutter/material.dart';

class NotificationFires extends StatelessWidget {
  const NotificationFires({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, index) => NotificationWidget(
        notification: Notification(
          latitude: 25.0,
          message: "Hay un incendio en este lugar",
          longitude: 65.0,
        ),
      ),
    );
  }
}

class Notification {
  String message;
  double latitude;
  double longitude;

  Notification({
    required this.latitude,
    required this.message,
    required this.longitude,
  });
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.notification,
  });

  final Notification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
