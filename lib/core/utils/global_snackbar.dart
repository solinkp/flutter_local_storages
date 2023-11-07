import 'package:flutter/material.dart';

import 'package:flutter_local_storages/core/constants/global.dart';

void showMsnSnackbar(String message) {
  clearSnackbars();
  snackbarKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message),
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 5),
    ),
  );
}

void clearSnackbars() {
  snackbarKey.currentState?.clearSnackBars();
}
