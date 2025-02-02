import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/providers/favorites_provider.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/presentation/widgets/favorite_button.dart';

class MovieDetails extends ConsumerWidget{

  final Movie movie;

  const MovieDetails({Key? key, required this.movie}):super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesNotifier= ref.read(favoritesProvider.notifier);
    final isfavorite=ref.watch(favoritesProvider).contains(movie.id);

    return Scaffold(
      appBar: AppBar(title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Padding(padding: const EdgeInsets.only( bottom: 10),
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

              Padding(padding: const EdgeInsets.only(bottom: 10),
                child:

                  Row(children: [
                    Text(movie.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FavoriteButton(movieId: movie.id)
                  ],)
              ),



              Padding(padding: const EdgeInsets.only(bottom: 10),
                child:  Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 20,
                    ),
                    const SizedBox(width: 5,),
                    Text(" ${movie.vote_average.toString()}")
                  ],
                )

              ),


              Padding(padding: const EdgeInsets.only(bottom: 20),
                child: Text(movie.overview,
                    style: const TextStyle(
                    fontSize: 17
                    ),
                  textAlign: TextAlign.justify,
                    ),

              ),

              Padding(padding: const EdgeInsets.only(bottom: 10),
                child:
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: "Release Date: ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                        TextSpan(text: movie.release_date, style: const TextStyle(fontSize: 17))
                      ]
                    )
                  )
              ),
            ],
          ),

      ))
    );


  }
}