import 'package:flutter/services.dart';
import 'package:mostro_sdk/key/keys.dart';

import '../../../../utils/utils.dart';
import '../../../home/home.dart';
import '../../../widgets/widgets.dart';
import '../../controllers/keys/keys_controller.dart';

final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class KeysScreen extends ConsumerWidget {
  const KeysScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(keysScreenControllerProvider, (prev, next) {
      if (next.isSuccess) {
        context.go(homeRoutePath);
      }

      if (next.isError) {
        final msg = (next as Error).message;
        _scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(msg),
          ),
        );
      }
    });
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              gapH128,
              Logo(),
              gapH64,
              KeyInputField(),
              gapH8,
              KeysDisplay(),
              gapH64,
              SetKeysButton(),
              GenerateNewKeyButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class KeysDisplay extends ConsumerStatefulWidget {
  const KeysDisplay({
    super.key,
  });

  @override
  ConsumerState<KeysDisplay> createState() => _KeysDisplayState();
}

class _KeysDisplayState extends ConsumerState<KeysDisplay> {
  KeyPair? get keyPair {
    return ref.watch(keysScreenControllerProvider.select((s) => s.keyPair));
  }

  bool get noKeys => keyPair == null;
  bool get noSk => keyPair?.secretKey == null;

  String? get npub => keyPair?.publicKey.bench32;
  String? get nsec => keyPair?.secretKey?.bench32;

  String? get pkHex => keyPair?.publicKey.hex;
  String? get skHex => keyPair?.secretKey?.hex;

  String get pkHeader => 'Public key';
  String get skHeader => 'Secret key';

  String get npubValue => noKeys ? '' : 'nPub ${truncateString(npub!)}';
  String get nsecValue => noSk ? '' : 'sSec ${truncateString(nsec!)}';

  String get pkHexValue => noKeys ? '' : 'Hex ${truncateString(pkHex!)}';
  String get skHexValue => noSk ? '' : 'Hex ${truncateString(skHex!)}';

  TextStyle? get valueStyle => Theme.of(context).textTheme.bodySmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      padding: const EdgeInsets.all(8.0),
      child: Visibility(
        visible: !noKeys,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(pkHeader),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(npubValue, style: valueStyle),
                    Text(pkHexValue, style: valueStyle),
                  ],
                ),
                Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(skHeader),
                if (noSk)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('No secret key available', style: valueStyle),
                      Text('Only watch mode', style: valueStyle),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nsecValue, style: valueStyle),
                      Text(skHexValue, style: valueStyle),
                    ],
                  ),
                if (noSk)
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                  )
                else
                  Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              ],
            ),
            Divider(),
          ],
        ),
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
  KeysScreenState get state => ref.watch(keysScreenControllerProvider);

  String? get errorMessage {
    if (state is KeyFieldError) {
      final e = (state as KeyFieldError).error;
      return switch (e) {
        KeyFieldErrorType.invalid => 'Invalid key. Please enter a valid key.',
      };
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ref.watch(keyFieldControllerProvider),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'nsec / npub / hex secret key',
        hintText: 'Enter your key',
        errorText: errorMessage,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Clipboard.getData(Clipboard.kTextPlain).then((value) {
                  if (value != null) {
                    ref.read(keyFieldControllerProvider).text = value.text!;
                  }
                });
              },
              visualDensity: VisualDensity.compact,
              icon: Icon(Icons.paste),
            ),
            IconButton(
              onPressed: () {
                ref.read(keyFieldControllerProvider).clear();
              },
              visualDensity: VisualDensity.compact,
              icon: Icon(Icons.clear),
            ),
            gapW8,
          ],
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
    final state = ref.watch(keysScreenControllerProvider);
    if (state.isSubmitting) {
      return const CircularProgressIndicator();
    }

    return FilledButton(
      onPressed: state.keyPair == null
          ? null
          : () {
              ref.read(keysScreenControllerProvider.notifier).setKeys();
            },
      child: const Text('Enter'),
    );
  }
}

class GenerateNewKeyButton extends ConsumerWidget {
  const GenerateNewKeyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {},
      child: const Text('Generate a new key'),
    );
  }
}
