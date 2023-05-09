// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mostro_app/widgets/gaps.dart';

import 'components/rating.dart';

class SellOrderTile extends StatefulWidget {
  final String fiatTicker;
  final double fiatAmount;
  final double premium;

  const SellOrderTile({
    super.key,
    required this.fiatTicker,
    required this.fiatAmount,
    required this.premium,
  });

  @override
  State<SellOrderTile> createState() => _SellOrderTileState();
}

class _SellOrderTileState extends State<SellOrderTile> {
  bool isExpanded = false;

  TextStyle? get bodyMediumStyle => Theme.of(context)
      .textTheme
      .bodyMedium
      ?.copyWith(color: Theme.of(context).colorScheme.primary);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      tappable: false,
      // useRootNavigator: tsrue,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      middleColor: Colors.transparent,
      closedBuilder: (context, openContainer) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: ExpansionTile(
                onExpansionChanged: (value) {
                  setState(() {
                    isExpanded = value;
                  });
                },
                leading: FiatTickerAvatar(widget.fiatTicker),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isExpanded)
                      Row(
                        children: [
                          Text(
                            'Dany',
                            style: bodyMediumStyle,
                          ),
                          const Spacer(),
                          Container(
                            transform: Matrix4.translationValues(28, 0, 0),
                            child: Rating(),
                          ),
                        ],
                      ),
                    Text(
                      'SATs por ${widget.fiatTicker} ${widget.fiatAmount.toStringAsFixed(2)}',
                      style: bodyMediumStyle,
                    ),
                    Text(
                      'Precio Mercado +${widget.premium.round()}%',
                      style: bodyMediumStyle,
                    ),
                  ],
                ),
                trailing: SizedBox.shrink(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                childrenPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                children: [
                  Row(
                    children: [
                      Text('N26 - Revolut'),
                      const Spacer(),
                      Text('Hace 3hs'),
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text('Buenos Aires'),
                    ],
                  ),
                  gapH8,
                  Row(
                    children: [
                      const Spacer(),
                      FilledButton(
                        onPressed: () {
                          openContainer();
                        },
                        child: Text('Sell'),
                      ),
                    ],
                  ),
                  gapH8,
                ],
              ),
            ),
          ),
        );
      },
      openBuilder: (context, closeContainer) {
        return Card(
          child: TextButton(
            onPressed: () {
              closeContainer();
            },
            child: Text('Back'),
          ),
        );
      },
    );
  }
}

class FiatTickerAvatar extends StatelessWidget {
  final String fiatTicker;

  const FiatTickerAvatar(
    this.fiatTicker, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        fiatTicker,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
