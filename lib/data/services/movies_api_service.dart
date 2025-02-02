import 'package:dio/dio.dart';
import 'package:movieapp/data/models/movies_dto.dart';
import '';

class MoviesApiService {
  final Dio dio;

  MoviesApiService({required this.dio});

  Future<List<MoviesDTO>> getPopularMovies(int page) async{
    final response = await dio.get('/movie/popular', queryParameters: {'page':page});

    final List<dynamic> data= response.data['results'];
    return data.map((movie) => MoviesDTO.fromJson(movie)).toList();

  }
}