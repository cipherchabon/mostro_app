import 'package:pinput/pinput.dart';

import '../../../widgets/widgets.dart';

class PinInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorMessage;
  final FocusNode focusNode;
  final bool enabled;

  const PinInputField({
    required this.controller,
    required this.focusNode,
    this.errorMessage,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onPrimary),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );

    final errorTextStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: Theme.of(context).colorScheme.error);

    return Pinput(
      enabled: enabled,
      controller: controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      errorTextStyle: errorTextStyle,
      length: 6,
      forceErrorState: errorMessage != null,
      errorText: errorMessage,
      errorBuilder: (errorText, pin) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            errorText ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ),
      pinAnimationType: PinAnimationType.scale,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      obscureText: true,
      closeKeyboardWhenCompleted: true,
      keyboardType: TextInputType.number,
      useNativeKeyboard: true,
      focusNode: focusNode,
    );
  }
}
