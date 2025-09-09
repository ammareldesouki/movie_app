
import '../../domain/entities/MovieResponse.dart';

class MovieModel {
  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String englishTitle;
  final String longTitle;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String mediumCoverImage;
  final String largeCoverImage;

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        url = json['url'] as String,
        imdbCode = json['imdb_code'] as String,
        title = json['title'] as String,
        englishTitle = json['title_english'] as String,
        longTitle = json['title_long'] as String,
        slug = json['slug'] as String,
        year = json['year'] as int,
        rating = (json['rating'] as num).toDouble(),
        runtime = json['runtime'] as int,
        genres = List<String>.from(json['genres'] ?? []),
        mediumCoverImage = json['medium_cover_image'] as String,
        largeCoverImage = json['large_cover_image'] as String;

  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      url: url,
      imdbCode: imdbCode,
      title: title,
      englishTitle: englishTitle,
      longTitle: longTitle,
      slug: slug,
      year: year,
      rating: rating,
      runtime: runtime,
      genres: genres,
      mediumCoverImage: mediumCoverImage,
      largeCoverImage: largeCoverImage,
    );
  }
}
