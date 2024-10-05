import 'package:flutter/material.dart';
import 'package:sunsational/extensions/context_extensions.dart';
import 'package:sunsational/ui/detail_page.dart';
import 'package:sunsational/ui/widgets/margins.dart';
import 'package:sunsational/ui/widgets/theme_button.dart';
import 'package:sunsational/ui/widgets/view_constraint.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.app_name),
        actions: const [
          ThemeButton(),
        ],
      ),
      body: SafeArea(
        child: ViewConstraint(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Expanded(
                        child: _buildLocationTextFormField(context),
                      ),
                      kSmallMargin,
                      _buildSubmitButton(context)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationTextFormField(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: locationTextController,
      decoration: InputDecoration(
        labelText: 'Enter your location',
        floatingLabelStyle: context.text.bodyMedium?.copyWith(color: context.colors.onSurface),
      ),
      textInputAction: TextInputAction.send,
      onFieldSubmitted: (value) {
        if (formKey.currentState!.validate()) {
          DetailPage.navigate(context, locationTextController.text);
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
          DetailPage.navigate(context, locationTextController.text);
        }
      },
      icon: Icon(Icons.send, color: context.colors.onPrimary),
    );
  }
}
