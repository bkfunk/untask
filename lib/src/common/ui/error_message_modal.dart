// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";

class ErrorMessageModal extends StatelessWidget {
  static String _defaultErrorMessageBuilder(Object error) => error.toString();

  ErrorMessageModal(this.error, this.stackTrace,
      {super.key,
      this.messageBuilder = ErrorMessageModal._defaultErrorMessageBuilder,
      String? errorMessage,}) {
    _errorMessage = errorMessage;
  }
  final Object error;
  final StackTrace stackTrace;
  final String Function(Object) messageBuilder;
  late final String? _errorMessage;

  get errorMessage {
    return _errorMessage ?? messageBuilder(error);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text(errorMessage));
    // TODO need to handle ok and cancel
  }
}
