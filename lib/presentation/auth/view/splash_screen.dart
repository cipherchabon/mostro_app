import '../../widgets/widgets.dart';
import '../auth.dart';
import '../controllers/pin/pin_controllers.dart';

class SpashScreen extends ConsumerWidget {
  const SpashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(pinControllerProvider, (prev, next) {
      next.whenData((_) {
        context.pushReplacement(pinRoutePath);
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
