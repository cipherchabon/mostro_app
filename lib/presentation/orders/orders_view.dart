import '../widgets/widgets.dart';
import 'buy_order_form.dart';
import 'components/bitcoin_price.dart';
import 'components/filter_button.dart';
import 'sell_order_tile.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
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
          const Row(
            children: [
              gapW8,
              FilterButton(),
              Spacer(),
              BitcoinPriceWidget(),
              gapW8,
            ],
          ),
          gapH8,
          Expanded(
            child: ListView(
              children: const [
                SellOrderTile(
                  fiatTicker: 'USD',
                  fiatAmount: 100,
                  premium: 1,
                ),
                SellOrderTile(
                  fiatTicker: 'ARS',
                  fiatAmount: 10000,
                  premium: 3,
                ),
                SellOrderTile(
                  fiatTicker: 'MXN',
                  fiatAmount: 7000,
                  premium: 2,
                ),
              ],
            ),
          )
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
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BitcoinPriceWidget(),
              ],
            ),
            BuyOrderForm(),
          ],
        ),
      ),
    );
  }
}
