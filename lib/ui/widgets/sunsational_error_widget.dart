import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunsational/extensions/context_extensions.dart';
import 'package:sunsational/ui/widgets/sunsational_dialog.dart';

import '../../api/models/error_response.dart';
import 'margins.dart';

class SunsationalErrorWidget extends StatelessWidget {
  const SunsationalErrorWidget._({
    this.error,
    this.errorMessage,
    this.errorSupportText,
    this.retryLabel,
    this.onTryAgain,
    this.reportEventCallback,
    this.isHero = false,
    this.showImage = false,
    this.isCompact = false,
    this.isDetailed = false,
  });

  final ErrorResponse? error;
  final String? errorMessage;
  final String? errorSupportText;
  final String? retryLabel;
  final VoidCallback? onTryAgain;
  final VoidCallback? reportEventCallback;
  final bool isHero;
  final bool showImage;
  final bool isCompact;
  final bool isDetailed;

  factory SunsationalErrorWidget.hero({
    ErrorResponse? error,
    String? errorMessage,
    VoidCallback? reportEventCallback,
    VoidCallback? onTryAgain,
    String? errorSupportText,
    String? retryLabel,
  }) {
    return SunsationalErrorWidget._(
      error: error,
      errorMessage: errorMessage,
      errorSupportText: errorSupportText,
      retryLabel: retryLabel,
      onTryAgain: onTryAgain,
      reportEventCallback: reportEventCallback,
      isHero: true,
      showImage: true,
    );
  }

  factory SunsationalErrorWidget.detailed({
    ErrorResponse? error,
    String? errorMessage,
    VoidCallback? reportEventCallback,
    VoidCallback? onTryAgain,
    String? errorSupportText,
    String? retryLabel,
    bool useNavigator = false,
  }) {
    return SunsationalErrorWidget._(
      error: error,
      errorMessage: errorMessage,
      errorSupportText: errorSupportText,
      retryLabel: retryLabel,
      onTryAgain: onTryAgain,
      reportEventCallback: reportEventCallback,
      isDetailed: true,
    );
  }

  factory SunsationalErrorWidget.compact({
    ErrorResponse? error,
    String? errorMessage,
    VoidCallback? reportEventCallback,
    VoidCallback? onTryAgain,
    String? errorSupportText,
    String? retryLabel,
  }) {
    return SunsationalErrorWidget._(
      error: error,
      errorMessage: errorMessage,
      errorSupportText: errorSupportText,
      retryLabel: retryLabel,
      onTryAgain: onTryAgain,
      reportEventCallback: reportEventCallback,
      isCompact: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isHero || isDetailed) {
      return _buildSunsationalErrorWidget(context);
    } else if (isCompact) {
      return _buildErrorMessage(context);
    } else {
      return const SizedBox();
    }
  }

  Widget _buildSunsationalErrorWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildErrorMessage(context),
            if (errorSupportText?.isNotEmpty == true)
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    errorSupportText ?? '',
                    style: context.text.bodySmall?.copyWith(color: context.colors.onSurface),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            if (onTryAgain != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: OutlinedButton(
                  onPressed: onTryAgain,
                  child: Text(retryLabel ?? 'Try Again', style: context.text.bodyMedium),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showErrorDialog(
          context,
          error,
          errorMessage,
          reportEventCallback,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        children: [
          if (!isCompact) _buildInfoButton(context, error),
          if (!isCompact) kMediumMargin,
          Flexible(
            child: Text(
              errorMessage ?? 'Oops that\'s an error.',
              style: isCompact ? context.text.bodySmall?.copyWith(color: context.colors.error) : null,
            ),
          ),
          kLargeMargin,
        ],
      ),
    );
  }

  Widget _buildInfoButton(
    BuildContext context,
    ErrorResponse? error,
  ) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      icon: Icon(
        Icons.info_outline_rounded,
        color: isCompact ? context.colors.error : null,
      ),
      tooltip: 'Open error details',
      padding: EdgeInsets.zero,
      onPressed: () {
        _showErrorDialog(
          context,
          error,
          errorMessage,
          reportEventCallback,
        );
      },
    );
  }

  void _showErrorDialog(
    BuildContext context,
    ErrorResponse? error,
    String? errorMessage,
    VoidCallback? reportEventCallback,
  ) {
    context.push(
      kDialogRoute,
      extra: _buildSunsationalDialogPageArguments(
        context,
        errorMessage,
        reportEventCallback,
      ),
    );
  }

  SunsationalDialogPageArguments _buildSunsationalDialogPageArguments(
    BuildContext context,
    String? errorMessage,
    VoidCallback? reportEventCallback,
  ) {
    final message = errorMessage ?? error?.message ?? 'No error message';
    final errorCode = error?.statusCode ?? 'No error code';
    final errorDetails = error?.error ?? '';
    return SunsationalDialogPageArguments(
      title: 'Error',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 8,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: (context.screenHeight - 400),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Message : $message',
                    style: context.text.bodyMedium?.copyWith(
                      color: context.colors.onSurface,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (errorDetails.toString().isNotEmpty)
                    Text(
                      'Details : $errorDetails',
                      style: context.text.bodyMedium?.copyWith(
                        color: context.colors.onSurface,
                      ),
                    ),
                ],
              ),
            ),
          ),
          kMediumMargin,
          Text(
            'Code : $errorCode',
            style: context.text.bodyMedium?.copyWith(
              color: context.colors.onSurface,
            ),
          ),
        ],
      ),
      dialogActions: [
        if (reportEventCallback != null)
          DialogAction(
            actionText: 'Send Report',
            callback: (context){
              reportEventCallback();
            },
          ),
        DialogAction(
          actionText: 'Cancel',
          callback: (context){
            context.pop();
          },
        ),
      ],
      isDismissible: true,
    );
  }
}
