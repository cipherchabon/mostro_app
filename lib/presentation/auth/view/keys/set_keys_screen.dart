import 'package:flutter_svg/svg.dart';

import '../../../home/home.dart';
import '../../../widgets/widgets.dart';
import '../../controllers/keys/set_keys_controller.dart';
import '../../model/keys/form/set_keys_form.dart';
import '../../model/keys/state/set_keys_state.dart';

class SetKeysScreen extends ConsumerWidget {
  const SetKeysScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(setKeysControllerProvider, (prev, next) {
      if (next.isSuccess) {
        context.go(homeRoutePath);
      }
    });
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Logo(),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyInputField(),
                SetKeysButton(),
                GenerateNewKeyButton(),
              ],
            ),
          ),
        ],
      ),
    );
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
      ref.read(setKeysControllerProvider.notifier).onKeyInputChanged(_input);
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
    final state = ref.watch(setKeysControllerProvider);
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

class SetKeysButton extends ConsumerWidget {
  const SetKeysButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(setKeysControllerProvider);
    return FilledButton(
      onPressed: state.form.isValid
          ? ref.read(setKeysControllerProvider.notifier).onAuthButtonPressed
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
    final state = ref.watch(setKeysControllerProvider);
    return TextButton(
      onPressed: state.isSubmitting ? null : () {},
      child: const Text('Generate a new key'),
    );
  }
}
