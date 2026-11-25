import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favourites_controller.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.memberId,
    this.color = Colors.red,
  });

  final String memberId;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final favourites = context.watch<FavouritesController>();
    final isFavourite = favourites.isFavourite(memberId);

    return IconButton(
      tooltip: isFavourite ? 'Remove from favourites' : 'Add to favourites',
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: color,
      ),
      onPressed: () => context.read<FavouritesController>().toggle(memberId),
    );
  }
}
