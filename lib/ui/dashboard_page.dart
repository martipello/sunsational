import 'package:flutter/material.dart';
import 'package:sunsational/extensions/context_extensions.dart';
import 'package:sunsational/ui/detail_page.dart';
import 'package:sunsational/ui/widgets/margins.dart';
import 'package:sunsational/ui/widgets/theme_button.dart';

const kDashboardName = 'Dashboard';
const kDashboardRoute = '/dashboard';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final formKey = GlobalKey<FormState>();
  final locationTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.strings.app_name),
          actions: const [
            ThemeButton(),
          ],
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                Expanded(
                  child: _buildLocationTextFormField(),
                ),
                kSmallMargin,
                _buildSubmitButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationTextFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: locationTextController,
      decoration: const InputDecoration(
        labelText: 'Enter your location',
      ),
      textInputAction: TextInputAction.send,
      onFieldSubmitted: (value) {
        if (formKey.currentState!.validate()) {
          DetailPage.navigate(context);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your location';
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return IconButton(
      tooltip: 'Submit',
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(context.colors.primary),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          DetailPage.navigate(context);
        }
      },
      icon: Icon(Icons.send, color: context.colors.onPrimary),
    );
  }
}
