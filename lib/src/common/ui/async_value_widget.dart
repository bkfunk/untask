// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_message_modal.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  static Widget _defaultErrorThrownBuilder(Object e, StackTrace st) {
    return ErrorMessageModal(e, st);
  }

  static Widget _defaultLoadingBuilder() {
    return const CircularProgressIndicator();
  }

  // TODO: Figure out if these static methods as defaults is the best way to do this
  const AsyncValueWidget({
    super.key,
    required this.asyncValue,
    required this.dataLoadedBuilder,
    this.errorThrownBuilder = AsyncValueWidget._defaultErrorThrownBuilder,
    this.loadingBuilder = AsyncValueWidget._defaultLoadingBuilder,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(T) dataLoadedBuilder;
  final Widget Function(Object, StackTrace) errorThrownBuilder;
  final Widget Function() loadingBuilder;

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
        data: dataLoadedBuilder,
        error: errorThrownBuilder,
        loading: loadingBuilder);
  }
}
