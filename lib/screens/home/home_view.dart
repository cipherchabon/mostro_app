import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../asset_paths/image_paths.dart';
import '../../widgets/scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 56,
            ),
            SvgPicture.asset(logo),
            const SizedBox(
              height: 56,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('New Order'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Search Order'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Active Order'),
            ),
          ],
        ),
      ),
    );
  }
}
