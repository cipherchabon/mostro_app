import '../../../widgets/widgets.dart';
import '../../auth.dart';
import '../../controllers/pin/set_pin_controller.dart';
import '../../model/pin/form/pin_form.dart';
import '../../model/pin/state/set_pin_state.dart';
import 'pin_input_field.dart';

class SetPinScreen extends ConsumerWidget {
  const SetPinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Column(
            children: [
              Expanded(child: Logo()),
              Expanded(child: SetPinFormView()),
            ],
          ),
        ),
      ),
    );
  }
}

class SetPinFormView extends ConsumerStatefulWidget {
  const SetPinFormView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PinFormViewState();
}

class _PinFormViewState extends ConsumerState<SetPinFormView> {
  late FocusNode focusNode;
  late TextEditingController pinController;
  late TextEditingController confirmPinController;

  SetPinState get state => ref.watch(setPinControllerProvider);
  SetPinController get controller =>
      ref.read(setPinControllerProvider.notifier);

  bool get pinIsValid => state.form.pinIsValid;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    confirmPinController = TextEditingController();
    focusNode = FocusNode()..requestFocus();
    pinController.addListener(() {
      controller.pinChanged(pinController.text);
    });
    confirmPinController.addListener(() {
      controller.confirmPinChanged(confirmPinController.text);
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    confirmPinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(setPinControllerProvider, (prev, next) {
      if (prev != null) {
        if (!prev.form.pinIsValid && next.form.pinIsValid) {
          Future.delayed(Duration(milliseconds: 100), () {
            focusNode.requestFocus();
          });
        }

        if (next.form.errorMessage != null) {
          Future.delayed(Duration(milliseconds: 600), () {
            confirmPinController.clear();
            focusNode.requestFocus();
          });
        }

        if (next.isSuccess) {
          context.go(setKeysRoutePath);
        }
      }
    });
    final state = ref.watch(setPinControllerProvider);
    return Column(
      children: [
        Text(
          pinIsValid ? 'Re-enter you PIN' : 'Create a PIN',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        gapH16,
        Text(
          pinIsValid
              ? 'If you forget your PIN, you will need to reset your keys'
              : 'Please enter any $pinLength digit that you will use to unlock yours keys',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        gapH32,
        if (state.isSubmiting)
          Spinner()
        else
          PinInputField(
            focusNode: focusNode,
            controller: pinIsValid ? confirmPinController : pinController,
            errorMessage: state.form.errorMessage,
            enabled: !state.form.confirmPinIsValid,
          ),
      ],
    );
  }
}
