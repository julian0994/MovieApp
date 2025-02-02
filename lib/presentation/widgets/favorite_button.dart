import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/data/providers/favorites_provider.dart';

class FavoriteButton extends ConsumerWidget{

  final int movieId;

  const FavoriteButton({Key? key,required this.movieId}):super(key:key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite= ref.watch(favoritesProvider).contains(movieId);

    return IconButton(onPressed:() async {
      ref.read(favoritesProvider.notifier).toggleFavorite(movieId);
    },

        icon:Icon(
          isFavorite?Icons.favorite
              :Icons.favorite_border,
          color: isFavorite?Colors.red
              :Colors.grey,));
  }

}