

import 'package:movieapp/domain/repositories/movie_repository.dart';

import '../entities/movie.dart';

class GetPopularMovies{
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<Movie>> call(int page) async{
    return await repository.getPopularMovies(page);
  }
}