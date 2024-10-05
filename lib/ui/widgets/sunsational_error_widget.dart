import 'package:flutter/material.dart';
import 'package:sunsational/extensions/context_extensions.dart';

import '../../api/models/error_response.dart';
import 'margins.dart';

class SunsationalErrorWidget extends StatelessWidget {
  const SunsationalErrorWidget({
    super.key,
    this.error,
  });

  final ErrorResponse? error;

  @override
  Widget build(BuildContext context) {
    final errorCode = error?.statusCode ?? 'No error code';
    final friendlyMessage = _createFriendlyMessage(error);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Something went wrong!',
          style: context.text.titleSmall,
        ),
        kSmallMargin,
        Text(
          friendlyMessage,
          style: context.text.bodyMedium,
        ),
        kMediumMargin,
        Text(
          'Code : $errorCode',
          style: context.text.bodySmall,
        ),
      ],
    );
  }

  _createFriendlyMessage(ErrorResponse? error) {

    final statusMessage = error?.statusMessage ?? '';
    final message = error?.message ?? '';
    final parameters = error?.parameters.join(', ') ?? '';

    final buffer = StringBuffer();

    buffer.write('The request failed');

    if (statusMessage.isNotEmpty) {
      buffer.write(' with a status message of $statusMessage');
    }

    if (message.isNotEmpty) {
      if(statusMessage.isNotEmpty) {
        buffer.write(' and');
      }
      buffer.write(' with an additional message of $message');
    }

    if (parameters.isNotEmpty) {
      buffer.write(' due to parameters : $parameters');
    }

    if (statusMessage.isEmpty && message.isEmpty && parameters.isEmpty) {
      buffer.write('but no additional information was provided');
    }

    buffer.write('.');
    return buffer.toString();
  }
}
