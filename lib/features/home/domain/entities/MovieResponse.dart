

class MovieEntity {
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

  const MovieEntity({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.englishTitle,
    required this.longTitle,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.mediumCoverImage,
    required this.largeCoverImage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MovieEntity && runtimeType == other.runtimeType &&
              id == other.id && url == other.url &&
              imdbCode == other.imdbCode && title == other.title &&
              englishTitle == other.englishTitle &&
              longTitle == other.longTitle && slug == other.slug &&
              year == other.year && rating == other.rating &&
              runtime == other.runtime && genres == other.genres &&
              mediumCoverImage == other.mediumCoverImage &&
              largeCoverImage == other.largeCoverImage;

  @override
  int get hashCode =>
      Object.hash(
          id,
          url,
          imdbCode,
          title,
          englishTitle,
          longTitle,
          slug,
          year,
          rating,
          runtime,
          genres,
          mediumCoverImage,
          largeCoverImage);


}
