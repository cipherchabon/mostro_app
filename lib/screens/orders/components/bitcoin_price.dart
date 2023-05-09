import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../asset_paths/icon_paths.dart';

class BitcoinPriceWidget extends StatelessWidget {
  const BitcoinPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: null,
      icon: SvgPicture.asset(
        currencyBitcoinIcon,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      label: const Text('usd 31.427'),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
