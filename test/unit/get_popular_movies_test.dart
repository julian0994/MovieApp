import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/use_cases/get_popular_movies.dart';

import 'get_popular_movies_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main(){
    late MockMovieRepository mockMovieRepository;
    late GetPopularMovies getPopularMovies;

    setUp(() {
      mockMovieRepository = MockMovieRepository();
      getPopularMovies = GetPopularMovies(mockMovieRepository);
    });

    test('Tiene que devolver una lista de películas cuando se llama a getPopularMovies', () async {
      // Arrange
      final movies = [
        Movie(id: 1, title: 'Movie 1', overview: 'test overview',release_date:'2025-01-01',vote_average:7.5,vote_count:8,poster_path: 'path1.jpg'),
        Movie(id: 2, title: 'Movie 2', overview: 'test overview 2',release_date:'2025-01-31',vote_average:9.5,vote_count:899,poster_path: 'path2.jpg'),
      ];
      when(mockMovieRepository.getPopularMovies(1)).thenAnswer((_) async => movies);


      final result = await getPopularMovies(1);


      expect(result, movies);
      verify(mockMovieRepository.getPopularMovies(1)).called(1);
    });

}
