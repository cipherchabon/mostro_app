// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mostro_app/widgets/gaps.dart';

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
  @override
  Widget build(BuildContext context) {
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
            leading: CircleAvatar(
              child: Text(
                widget.fiatTicker,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isExpanded)
                  Row(
                    children: [
                      Text(
                        'Dany',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const Spacer(),
                      Container(
                        transform: Matrix4.translationValues(28, 0, 0),
                        child: Row(
                          children: [
                            RatingBar(
                              itemSize: 16,
                              initialRating: 3,
                              ignoreGestures: true,
                              allowHalfRating: true,
                              ratingWidget: RatingWidget(
                                full: Icon(Icons.star),
                                half: Icon(Icons.star_half),
                                empty: Icon(Icons.star_border),
                              ),
                              onRatingUpdate: (_) {},
                            ),
                            gapW4,
                            Text(
                              '5(17)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                Text(
                  'SATs por ${widget.fiatTicker} ${widget.fiatAmount.toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  'Precio Mercado +${widget.premium.round()}%',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
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
                    onPressed: () {},
                    child: Text('Vender'),
                  ),
                ],
              ),
              gapH8,
            ],
          ),
        ),
      ),
    );
  }
}
