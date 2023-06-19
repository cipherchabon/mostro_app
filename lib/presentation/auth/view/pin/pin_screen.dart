import '../../../widgets/widgets.dart';
import '../../auth.dart';
import '../../controllers/pin/pin_controllers.dart';
import 'pin_input_field.dart';

class PinScreen extends ConsumerWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(pinScreenControllerProvider, (prev, next) {
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
                PinFormView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PinFormView extends ConsumerStatefulWidget {
  const PinFormView({super.key});

  @override
  ConsumerState<PinFormView> createState() => _SetPinFormViewState();
}

class _SetPinFormViewState extends ConsumerState<PinFormView> {
  /// Text Editing Controllers
  TextEditingController get pinController =>
      ref.watch(pinFieldControllerProvider);
  TextEditingController get confirmPinController =>
      ref.watch(confirmPinFieldControllerProvider);

  TextEditingController get activeController {
    return switch (state) {
      ConfirmPin() => confirmPinController,
      _ => pinController,
    };
  }

  /// Pin Screen State
  PinScreenState get state => ref.watch(pinScreenControllerProvider);

  String get text1 {
    return switch (state) {
      EnterPin() => 'Enter your PIN',
      SetPin() => 'Create a PIN',
      ConfirmPin() => 'Re-enter you PIN',
      _ => '',
    };
  }

  String get text2 {
    return switch (state) {
      SetPin() =>
        'Please enter any 6 digit that you will use to unlock yours keys',
      ConfirmPin() =>
        'If you forget your PIN, you will need to reset your keys',
      _ => '',
    };
  }

  String? get errorMessage {
    if (state.isError) {
      final error = (state as PinError).error;
      return switch (error) {
        PinFieldError.doesNotMatch => 'PIN does not match',
        PinFieldError.invalid => 'Invalid PIN',
      };
    }
    return null;
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (text2.isNotEmpty) ...[
            gapH16,
            Text(
              text2,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
          gapH32,
          if (state.isSubmitting)
            Spinner()
          else
            PinInputField(
              controller: activeController,
              focusNode: ref.watch(pinFocusNodeProvider),
              errorMessage: errorMessage,
            ),
        ],
      );
}
