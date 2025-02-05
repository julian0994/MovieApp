


import 'package:movieapp/data/services/movies_api_service.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository{ //concrete repositoryy
  final MoviesApiService apiService;

  MovieRepositoryImpl({required this.apiService});

  @override
    Future<List<Movie>> getPopularMovies (int page) async{//4 obtain api data
      final moviesDTO= await apiService.getPopularMovies(page);
      return moviesDTO.map((dto) => Movie(
        id: dto.id,
        title: dto.title,
        overview: dto.overview,
        release_date: dto.release_date,
        vote_average: dto.vote_average,
        vote_count: dto.vote_count,
        poster_path: dto.poster_path,
      )).toList();
  }
}