import 'package:flutter/material.dart';

class NotificationSetting {
  String title;
  bool value;

  NotificationSetting({
    @required this.title,
    this.value = false,
  });
}