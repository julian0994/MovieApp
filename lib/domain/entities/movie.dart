class Movie {
  final int id;
  final String title;
  final String overview;
  final String release_date;
  final double vote_average;
  final int vote_count;
  final String poster_path;


  Movie(
      {
        required this.id,
        required this.title,
        required this.overview,
        required this.release_date,
        required this.vote_count,
        required this.vote_average,
        required this.poster_path,
      });
}