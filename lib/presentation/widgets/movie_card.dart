
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/presentation/providers/navigation.dart';

import '../../domain/entities/movie.dart';

class MovieCard extends ConsumerWidget{
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final navigationservice= ref.read(navigationServiceProvider);
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 5,
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(top: 10,left: 20),
              child: Text(movie.title,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 10),
              child: LayoutBuilder(builder: (context,constraints){
                final width=constraints.maxWidth;
                final height=width*1.5;
                return Image.network("https://image.tmdb.org/t/p/w780/${movie.poster_path}",
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                );

              }
              ),
            ),



            Padding(padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                      ),
                      const SizedBox(width: 5,),
                      Text(" ${movie.vote_average.toString()}")
                    ],
                  ),
                  Text(" ${movie.release_date}"),


                ],
              ),

            )

          ],
        ),
        onTap: (){
          navigationservice.navigateToMovieDetails(context, movie);
        },
      )
    );
  }
}