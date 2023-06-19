import '../../widgets/widgets.dart';
import '../auth.dart';
import '../controllers/pin/pin_controllers.dart';

class SpashScreen extends ConsumerWidget {
  const SpashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(pinControllerProvider, (prev, next) {
      next.whenData((pin) {
        if (pin != null) {
          context.pushReplacement(enterPinRoutePath);
        } else {
          context.pushReplacement(setPinRoutePath);
        }
      });
    });
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            gapH16,
            Spinner(),
          ],
        ),
      ),
    );
  }
}
