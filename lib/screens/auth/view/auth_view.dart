import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../asset_paths/icon_paths.dart';
import '../../../asset_paths/image_paths.dart';
import '../../../routing/routes.dart';
import '../../../widgets/scaffold.dart';
import '../controller/auth_controller.dart';
import '../model/auth_state.dart';
import '../model/form/auth_form.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (prev, next) {
      if (next.isSuccess) {
        context.goNamed(AppRoute.home.name);
      }
    });
    return CustomScaffold(
      body: Column(
        children: [
          const Expanded(
            child: Logo(),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                KeyInputField(),
                AuthButton(),
                GenerateNewKeyButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(logo);
  }
}

class KeyInputField extends ConsumerStatefulWidget {
  const KeyInputField({
    super.key,
  });

  @override
  ConsumerState<KeyInputField> createState() => _KeyInputFieldState();
}

class _KeyInputFieldState extends ConsumerState<KeyInputField> {
  late TextEditingController _controller;

  String get _input => _controller.text.trim();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      ref.read(authControllerProvider.notifier).onKeyInputChanged(_input);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? errorText(KeyTextFieldError? e) {
    switch (e) {
      case KeyTextFieldError.invalid:
        return 'Invalid key';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    return TextField(
      controller: _controller,
      enabled: !state.isSubmitting,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'nsec / npub / hex private key',
        hintText: 'Enter your key',
        helperText: '',
        errorText: errorText(state.form.value.error),
        suffixIcon: IconButton(
          onPressed: () {
            _controller.clear();
          },
          icon: SvgPicture.asset(cancelIcon),
        ),
      ),
    );
  }
}

class AuthButton extends ConsumerWidget {
  const AuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    return FilledButton(
      onPressed: state.form.isValid
          ? ref.read(authControllerProvider.notifier).onAuthButtonPressed
          : null,
      child: state.isSubmitting
          ? const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Text('Enter'),
    );
  }
}

class GenerateNewKeyButton extends ConsumerWidget {
  const GenerateNewKeyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    return TextButton(
      onPressed: state.isSubmitting ? null : () {},
      child: const Text('Generate a new key'),
    );
  }
}
