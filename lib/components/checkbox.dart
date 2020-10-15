import 'package:flutter/material.dart';
import 'package:flutterComponents/models/notification_setting.dart';

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool value = false;
  final allowNotifications = NotificationSetting(title: 'Allow Notifications');
  final notifications = [
    NotificationSetting(title: 'Show messages'),
    NotificationSetting(title: 'Show group'),
    NotificationSetting(title: 'Show calling'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Components', style: TextStyle(color: Colors.blueAccent),),
      ),
      body: ListView(
        children: [
          buildToggleCheckbox(allowNotifications),
          Divider(),
          ...notifications.map(buildSingleCheckbox).toList()
        ],
      ),
    );
  }

  Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(notification: notification, onClicked: () {
    final newValue = !notification.value;
    setState(() {
      allowNotifications.value = newValue;
      notifications.forEach((notification) { 
        notification.value = newValue;
      });
    });
  });

  Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(notification: notification, onClicked: () {
    setState(() {
      final newValue = !notification.value;
      notification.value = newValue;
      if (!newValue) {
        allowNotifications.value = false;
      } else {
        final allow = notifications.every((notification) => notification.value);
        allowNotifications.value = allow;
      }
    });
  });

  Widget buildCheckbox({@required NotificationSetting notification, @required VoidCallback onClicked}) {
    return ListTile(
      onTap: onClicked,
      leading: Checkbox(value: notification.value, onChanged: (value) => onClicked()),
      title: Text(notification.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
