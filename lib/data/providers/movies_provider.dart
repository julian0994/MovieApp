import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/data/services/movies_api_service.dart';

import '../../core/config/api_config.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../domain/use_cases/get_popular_movies.dart';
import '../models/movies_dto.dart';


//Set the BAseUrl for dio
final dioProvider = Provider<Dio>((ref){

  return Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    headers: {'Authorization': 'Bearer ${ApiConfig.apitoken}'},
  ));
});

final moviesApiServiceProvider = Provider<MoviesApiService>((ref){
  final dio = ref.read(dioProvider);
  return MoviesApiService(dio: dio);
});

final movieRepositoryProvider = Provider<MovieRepository>((ref){
  final apiService =ref.read(moviesApiServiceProvider);
  return MovieRepositoryImpl(apiService: apiService);
}

);

final getPopularMoviesProvider = Provider<GetPopularMovies>((ref) {
  final repository =ref.read(movieRepositoryProvider);
  return GetPopularMovies(repository);
}

);

class MoviesState{
  final List<Movie> movies;
  final int page;
  final bool isLoading;
  final bool hasMore;

  MoviesState({
    required this.movies,
    required this.page,
    required this.isLoading,
    required this.hasMore
});
  MoviesState copyWith({
    List<Movie>? movies,
    int? page,
    bool? isLoading,
    bool? hasMore,
}){
    return MoviesState(movies: movies?? this.movies, page: page ?? this.page, isLoading: isLoading ?? this.isLoading, hasMore: hasMore ?? this.hasMore);
  }
}

class MoviesNotifier extends StateNotifier<MoviesState>{
  final GetPopularMovies getPopularMovies;

  MoviesNotifier(this.getPopularMovies):
      super(MoviesState(movies: [], page: 1, isLoading: false, hasMore: true)

      );

  Future<void> loadMovies() async{
    if (state.isLoading || !state.hasMore) return;
    state=state.copyWith(isLoading: true);

    try{
      final newMovies= await getPopularMovies(state.page);

      state=state.copyWith(
        movies: [...state.movies,...newMovies],
        page: state.page+1,
        isLoading: false,
        hasMore: newMovies.isNotEmpty
      );

    }catch(e){
      state=state.copyWith(isLoading: false);
    }
  }
}

final moviesProvider=StateNotifierProvider<MoviesNotifier,MoviesState>((ref)
{
  final getPopularMovies = ref.read(getPopularMoviesProvider);
  return MoviesNotifier(getPopularMovies);
});



