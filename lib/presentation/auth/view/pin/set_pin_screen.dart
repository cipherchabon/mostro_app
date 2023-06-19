import '../../../widgets/widgets.dart';
import '../../auth.dart';
import '../../controllers/pin/pin_controllers.dart';
import 'pin_input_field.dart';

class SetPinScreen extends ConsumerWidget {
  const SetPinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(setPinScreenControllerProvider, (prev, next) {
      if (next.isSuccess) {
        Future.delayed(const Duration(milliseconds: 100), () {
          context.pushReplacement(setKeysRoutePath);
        });
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Column(
              children: [
                gapH128,
                Logo(),
                gapH32,
                SetPinFormView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SetPinFormView extends ConsumerWidget {
  const SetPinFormView({super.key});

  String? errorMessage(SetPinState state) {
    if (state.isError) {
      final error = (state as PinError).error;
      return switch (error) {
        PinFieldError.doesNotMatch => 'PIN does not match',
      };
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinController = ref.watch(pinFieldControllerProvider);
    final confirmPinController = ref.watch(confirmPinFieldControllerProvider);
    final state = ref.watch(setPinScreenControllerProvider);
    final isEnterPin = state.isEnterPin;
    final controller = isEnterPin ? pinController : confirmPinController;
    return Column(
      children: [
        Text(
          isEnterPin ? 'Create a PIN' : 'Re-enter you PIN',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        gapH16,
        Text(
          isEnterPin
              ? 'Please enter any 6 digit that you will use to unlock yours keys'
              : 'If you forget your PIN, you will need to reset your keys',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        gapH32,
        if (state.isSuccess)
          Spinner()
        else
          PinInputField(
            controller: controller,
            focusNode: ref.watch(pinFocusNodeProvider),
            errorMessage: errorMessage(state),
          ),
      ],
    );
  }
}
