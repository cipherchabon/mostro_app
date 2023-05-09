// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/routes.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              'Orders',
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Sell',
                ),
                Tab(
                  text: 'Buy',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SellOrderList(),
              BuyOrderList(),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              context.pushNamed(AppRoute.orderDetail.name);
            },
            label: const Text('Select'),
            icon: const Icon(Icons.check),
          )),
    );
  }
}

class SellOrderList extends StatelessWidget {
  const SellOrderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Checkbox(
            value: false,
            shape: const CircleBorder(),
            onChanged: (_) {},
          ),
          title: Text('Comprando Sats por xxx ARS'),
          subtitle: Text('Tasa: yadio.io + 2%'),
        ),
        ListTile(
          leading: Checkbox(
            value: false,
            shape: const CircleBorder(),
            onChanged: (_) {},
          ),
          title: Text('Comprando Sats por xxx ARS'),
          subtitle: Text('Tasa: yadio.io + 2%'),
        ),
        ListTile(
          leading: Checkbox(
            value: true,
            shape: const CircleBorder(),
            onChanged: (_) {},
          ),
          title: Text('Comprando Sats por xxx ARS'),
          subtitle: Text('Tasa: yadio.io + 2%'),
        ),
      ],
    );
  }
}

class BuyOrderList extends StatelessWidget {
  const BuyOrderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
