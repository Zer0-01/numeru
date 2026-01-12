import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showErrorToast(BuildContext context, String title, String? description) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    title: Text(title),
    description: description == null ? null : Text(description),
    alignment: Alignment.bottomCenter,
    autoCloseDuration: const Duration(seconds: 2),
    borderRadius: BorderRadius.circular(12.0),
    closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
    closeOnClick: false,
    dragToClose: true,
    pauseOnHover: false,
  );
}

String getInitials(String name) {
  final parts = name.trim().split(RegExp(r'\s+'));

  if (parts.length == 1) {
    return parts.first.substring(0, 1).toUpperCase();
  }

  return (parts.first[0] + parts.last[0]).toUpperCase();
}

Color getAvatarColor(int id) {
  final colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.red,
    Colors.indigo,
    Colors.pink,
  ];

  return colors[id % colors.length];
}
