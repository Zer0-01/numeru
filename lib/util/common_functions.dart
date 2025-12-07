import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

void showErrorToast(BuildContext context, String title, String? description) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    title: Text(title),
    description: description == null ? null : Text(description),
    alignment: Alignment.bottomCenter,
    autoCloseDuration: const Duration(seconds: 2),
    borderRadius: BorderRadius.circular(100.0),
    closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
    closeOnClick: false,
    dragToClose: true,
    pauseOnHover: false,
  );
}
