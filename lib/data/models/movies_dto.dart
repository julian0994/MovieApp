class MoviesDTO {
  final int id;
  final String title;
  final String overview;
  final String release_date;
  final double vote_average;
  final int vote_count;
  final String poster_path;


  MoviesDTO(
  {
    required this.id,
    required this.title,
    required this.overview,
    required this.release_date,
    required this.vote_count,
    required this.vote_average,
    required this.poster_path,
  });

  factory MoviesDTO.fromJson(Map<String, dynamic> json){
    return MoviesDTO(id: json['id'], title: json['title'] , overview: json['overview'], release_date: json['release_date'], vote_count: json['vote_count'], vote_average: json['vote_average'], poster_path: json['poster_path']);
  }
}