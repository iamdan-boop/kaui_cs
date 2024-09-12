import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kaui_cs/common/app_colors.dart';
import 'package:sizer/sizer.dart';

extension DioExceptionExtension on DioException {
  String messageString() {
    return ((response?.data as Map?) ?? const {})['message'] as String? ??
        'Unknown Error';
  }
}

// extension XFileExtension on XFile {
//   File toFile() => File(path);
// }

// extension UserInfoExtension on BuildContext {
//   User? get user {
//     return watch<AuthenticationBloc>().state.maybeWhen(
//           (status, user, hasRecentlyVerified) => null,
//           authenticated: (user, hasRecentlyVerified) => user,
//           userUpdate: (user) => user,
//           orElse: () => null,
//         );
//   }
// }

extension GoRouterExtension on BuildContext {
  void popSafely<T extends Object?>([T? result]) {
    if (canPop()) {
      return pop(result);
    }
  }

  void clearStackAndNavigate(BuildContext context, String path) {
    while (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    }

    GoRouter.of(context).pushReplacement(path);
  }
}

extension DialogExtension on BuildContext {
  void showLoadingProgress({Key? key}) {
    showDialog<void>(
      context: this,
      builder: (context) => Dialog(
        key: key,
        child: Container(
          color: Colors.white,
          height: 10.h,
          child: const CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  void showConfirmationDialog({
    required VoidCallback onConfirm,
  }) {
    showDialog<void>(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(
          'Continue',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        content: const Text('Are you sure you want to continue?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            child: Text(
              'Confirm',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.red,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

extension SnackbarExtension on BuildContext {
  void showSnack(String content, {Color? backgroundColor = Colors.black}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(content),
          backgroundColor: backgroundColor,
        ),
      );
  }
}
