import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../asset_paths/icon_paths.dart';
import '../../widgets/gaps.dart';
import 'sell_order_tile.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: const [
            TabBar(
              tabs: [
                Tab(
                  text: 'Sell',
                ),
                Tab(
                  text: 'Buy',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SellingView(),
                  BuyingView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SellingView extends StatelessWidget {
  const SellingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              gapW8,
              FilledButton.icon(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.filter_alt_outlined),
                label: const Text(
                  'Filter',
                ),
              ),
              const Spacer(),
              OutlinedButton.icon(
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
              ),
              gapW8,
            ],
          ),
          gapH8,
          const SellOrderTile(
            fiatTicker: 'USD',
            fiatAmount: 100,
            premium: 1,
          ),
          const SellOrderTile(
            fiatTicker: 'ARS',
            fiatAmount: 10000,
            premium: 3,
          ),
          const SellOrderTile(
            fiatTicker: 'MXN',
            fiatAmount: 7000,
            premium: 2,
          ),
        ],
      ),
    );
  }
}

class BuyingView extends StatelessWidget {
  const BuyingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
