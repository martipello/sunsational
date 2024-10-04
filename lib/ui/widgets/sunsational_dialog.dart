import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunsational/extensions/context_extensions.dart';
import 'package:sunsational/ui/widgets/view_constraint.dart';

const kDialogRoute = '/dialog';

class SunsationalDialogPageArguments {
  const SunsationalDialogPageArguments({
    required this.title,
    required this.child,
    required this.dialogActions,
    required this.isDismissible,
  });

  final String title;
  final Widget child;
  final List<DialogAction>? dialogActions;
  final bool isDismissible;
}

class SunsationalDialogPage<T> extends Page<T> {
  const SunsationalDialogPage(this.sunsationalDialogPageArguments);

  final SunsationalDialogPageArguments sunsationalDialogPageArguments;

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        barrierDismissible: sunsationalDialogPageArguments.isDismissible,
        builder: (context) => SunsationalDialog._(
          title: sunsationalDialogPageArguments.title,
          dialogActions: sunsationalDialogPageArguments.dialogActions,
          isDismissible: sunsationalDialogPageArguments.isDismissible,
          child: sunsationalDialogPageArguments.child,
        ),
      );
}

class SunsationalDialog extends StatelessWidget {
  const SunsationalDialog._({
    required this.title,
    required this.child,
    this.dialogActions,
    this.isDismissible = true,
  });

  final String title;
  final Widget child;
  final List<DialogAction>? dialogActions;
  final bool isDismissible;

  static Future<T?> show<T>(
    BuildContext context,
    SunsationalDialogPageArguments sunsationalDialogPageArguments,
  ) {
    return context.push<T?>(
      '/dialog',
      extra: sunsationalDialogPageArguments,
    );
  }

  static Future<T?> showUsingNavigator<T>(
    BuildContext context,
    SunsationalDialogPageArguments sunsationalDialogPageArguments,
  ) {
    return showDialog<T>(
      context: context,
      builder: (context) => SunsationalDialog._(
        title: sunsationalDialogPageArguments.title,
        dialogActions: sunsationalDialogPageArguments.dialogActions,
        isDismissible: sunsationalDialogPageArguments.isDismissible,
        child: sunsationalDialogPageArguments.child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewConstraint(
      child: AlertDialog(
        title: Text(title, style: context.text.headlineSmall),
        content: child,
        actions: _getActions(context),
      ),
    );
  }

  List<Widget> _getActions(BuildContext context) {
    return dialogActions
            ?.map(
              (action) => _buildDialogAction(
                context,
                action,
              ),
            )
            .toList() ??
        [];
  }

  Widget _buildDialogAction(
    BuildContext context,
    DialogAction action,
  ) {
    return TextButton(
      onPressed: () {
        action.callback(context);
      },
      child: Text(
        action.actionText,
        style: context.text.bodyMedium,
      ),
    );
  }
}

typedef ContextCallback = void Function(BuildContext context);

class DialogAction {
  const DialogAction({
    required this.actionText,
    required this.callback,
  });

  DialogAction.close()
      : this(
            actionText: 'Close',
            callback: (BuildContext context) {
              context.pop();
            });

  final String actionText;
  final ContextCallback callback;
}
