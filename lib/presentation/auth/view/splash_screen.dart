import '../../app/controller/controller.dart';
import '../../widgets/widgets.dart';
import '../auth.dart';

class SpashScreen extends ConsumerWidget {
  const SpashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appControllerProvider, (prev, next) {
      next.whenData((s) {
        if (s.pinSeted) {
          context.go(enterPinRoutePath);
        } else {
          context.go(setPinRoutePath);
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
