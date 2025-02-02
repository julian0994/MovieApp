import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/presentation/screens/details.dart';
import 'package:movieapp/presentation/screens/home.dart';

import '../../domain/entities/movie.dart';

final navigationServiceProvider = Provider<NavigationService>((ref){
  return NavigationService();
});





class NavigationService {
  void navigateToMovieDetails(BuildContext context, Movie movie){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>MovieDetails(movie: movie)),);
  }

  void navigateToHomeScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>HomeScreen()),);
  }
}