import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/widgets.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar(
          itemSize: 16,
          initialRating: 3,
          ignoreGestures: true,
          allowHalfRating: true,
          ratingWidget: RatingWidget(
            full: const Icon(Icons.star),
            half: const Icon(Icons.star_half),
            empty: const Icon(Icons.star_border),
          ),
          onRatingUpdate: (_) {},
        ),
        gapW4,
        Text(
          '5(17)',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
