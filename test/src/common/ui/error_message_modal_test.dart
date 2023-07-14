import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:untask/src/common/ui/error_message_modal.dart';

void main() {
  test('Error message modal sets error message correctly', () {
    expect(
        ErrorMessageModal(
                TimeoutException('Timeout'), StackTrace.fromString(''))
            .errorMessage,
        'TimeoutException: Timeout');
    expect(
        ErrorMessageModal(
          TimeoutException('Timeout'),
          StackTrace.fromString(''),
          messageBuilder: (e) => 'Foo: ${e.toString()}',
        ).errorMessage,
        'Foo: TimeoutException: Timeout');
    expect(
        ErrorMessageModal(
          TimeoutException('Timeout'),
          StackTrace.fromString(''),
          messageBuilder: (e) => 'Foo: ${e.toString()}',
          errorMessage: 'Tada',
        ).errorMessage,
        'Tada');
  });
}
