import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_service.dart';
import 'custom_text_field.dart';
import 'login_controller.dart';

const String groupName = 'Group 8';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(AuthService()),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  Future<void> _onSignInPressed(BuildContext context) async {
    final controller = context.read<LoginController>();
    final messenger = ScaffoldMessenger.of(context);
    final errorColor = Theme.of(context).colorScheme.error;

    FocusScope.of(context).unfocus();
    await controller.signIn();

    final message = controller.errorMessage;
    if (message != null) {
      messenger.showSnackBar(
        SnackBar(content: Text(message), backgroundColor: errorColor),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A237E), Color(0xFF3949AB), Color(0xFF7986CB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Icon(Icons.groups_rounded, size: 80, color: Colors.white),
                  const SizedBox(height: 12),
                  const Text(
                    'Team Profiles',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '$groupName · Mobile Communication CA 02',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 32),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Sign in',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            labelText: 'Email',
                            hintText: 'name@example.com',
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined),
                            onChanged: controller.updateEmail,
                            errorText: controller.emailError,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            obscureText: controller.obscurePassword,
                            prefixIcon: const Icon(Icons.lock_outline),
                            onChanged: controller.updatePassword,
                            errorText: controller.passwordError,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                          if (controller.errorMessage != null) ...[
                            const SizedBox(height: 12),
                            Text(
                              controller.errorMessage!,
                              style: TextStyle(color: colors.error),
                            ),
                          ],
                          const SizedBox(height: 24),
                          FilledButton(
                            onPressed: controller.isLoading
                                ? null
                                : () => _onSignInPressed(context),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: controller.isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text('Sign In'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
