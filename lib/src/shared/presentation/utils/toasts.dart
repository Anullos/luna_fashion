import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showError(BuildContext context, {required String message}) => Flushbar(
      message: message,
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(20),
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      duration: const Duration(
        seconds: 2,
      ),
    )..show(context);

void showSuccess(BuildContext context, {required String message}) => Flushbar(
      message: message,
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(20),
      icon: const Icon(
        Icons.done,
        size: 28.0,
        color: Colors.green,
      ),
      duration: const Duration(
        seconds: 2,
      ),
    )..show(context);

void showInfo(BuildContext context, {required String message}) => Flushbar(
      message: message,
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(20),
      icon: const Icon(
        Icons.info_outline,
        color: Colors.lightBlueAccent,
      ),
      duration: const Duration(
        seconds: 2,
      ),
    )..show(context);
