class MovieEntity {
  final int id;
  final String title;
  final String overiew;
  final double popularity;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overiew,
    required this.popularity,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });
}
