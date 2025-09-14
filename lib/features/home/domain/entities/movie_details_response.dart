/// data : {"movie":{"id":15,"url":"https://yts.mx/movies/16-blocks-2006","imdb_code":"tt0450232","title":"16 Blocks","title_english":"16 Blocks","title_long":"16 Blocks (2006)","slug":"16-blocks-2006","year":2006,"rating":6.6,"runtime":102,"genres":["Action","Crime","Drama","Thriller"],"like_count":52,"description_intro":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","yt_trailer_code":"55nKvGV0APA","language":"en","large_cover_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg","cast":[{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"David Morse","character_name":"Det. Frank Nugent","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0001556.jpg","imdb_code":"0001556"},{"name":"Peter McRobbie","character_name":"Mike Sheehan","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0574513.jpg","imdb_code":"0574513"},{"name":"David Zayas","character_name":"Det. Robert Torres","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0953882.jpg","imdb_code":"0953882"}]}}

class MovieDetailsResponse {
  MovieDetailsResponse({Data? data}) {
    _data = data;
  }

  MovieDetailsResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? _data;

  MovieDetailsResponse copyWith({Data? data}) =>
      MovieDetailsResponse(data: data ?? _data);

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// movie : {"id":15,"url":"https://yts.mx/movies/16-blocks-2006","imdb_code":"tt0450232","title":"16 Blocks","title_english":"16 Blocks","title_long":"16 Blocks (2006)","slug":"16-blocks-2006","year":2006,"rating":6.6,"runtime":102,"genres":["Action","Crime","Drama","Thriller"],"like_count":52,"description_intro":"\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294","yt_trailer_code":"55nKvGV0APA","language":"en","large_cover_image":"https://yts.mx/assets/images/movies/16_Blocks_2006/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg","cast":[{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"David Morse","character_name":"Det. Frank Nugent","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0001556.jpg","imdb_code":"0001556"},{"name":"Peter McRobbie","character_name":"Mike Sheehan","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0574513.jpg","imdb_code":"0574513"},{"name":"David Zayas","character_name":"Det. Robert Torres","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0953882.jpg","imdb_code":"0953882"}]}

class Data {
  Data({Movie? movie}) {
    _movie = movie;
  }

  Data.fromJson(dynamic json) {
    _movie = json['movie'] != null ? Movie.fromJson(json['movie']) : null;
  }

  Movie? _movie;

  Data copyWith({Movie? movie}) => Data(movie: movie ?? _movie);

  Movie? get movie => _movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_movie != null) {
      map['movie'] = _movie?.toJson();
    }
    return map;
  }
}

/// id : 15
/// url : "https://yts.mx/movies/16-blocks-2006"
/// imdb_code : "tt0450232"
/// title : "16 Blocks"
/// title_english : "16 Blocks"
/// title_long : "16 Blocks (2006)"
/// slug : "16-blocks-2006"
/// year : 2006
/// rating : 6.6
/// runtime : 102
/// genres : ["Action","Crime","Drama","Thriller"]
/// like_count : 52
/// description_intro : "\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294"
/// yt_trailer_code : "55nKvGV0APA"
/// language : "en"
/// large_cover_image : "https://yts.mx/assets/images/movies/16_Blocks_2006/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.mx/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg"
/// cast : [{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"David Morse","character_name":"Det. Frank Nugent","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0001556.jpg","imdb_code":"0001556"},{"name":"Peter McRobbie","character_name":"Mike Sheehan","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0574513.jpg","imdb_code":"0574513"},{"name":"David Zayas","character_name":"Det. Robert Torres","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0953882.jpg","imdb_code":"0953882"}]

class Movie {
  Movie({
    num? id,
    String? url,
    String? imdbCode,
    String? title,
    String? titleEnglish,
    String? titleLong,
    String? slug,
    num? year,
    num? rating,
    num? runtime,
    List<String>? genres,
    num? likeCount,
    String? descriptionIntro,
    String? ytTrailerCode,
    String? language,
    String? largeCoverImage,
    String? mediumScreenshotImage1,
    String? mediumScreenshotImage2,
    String? mediumScreenshotImage3,
    List<Cast>? cast,
  }) {
    _id = id;
    _url = url;
    _imdbCode = imdbCode;
    _title = title;
    _titleEnglish = titleEnglish;
    _titleLong = titleLong;
    _slug = slug;
    _year = year;
    _rating = rating;
    _runtime = runtime;
    _genres = genres;
    _likeCount = likeCount;
    _descriptionIntro = descriptionIntro;
    _ytTrailerCode = ytTrailerCode;
    _language = language;
    _largeCoverImage = largeCoverImage;
    _mediumScreenshotImage1 = mediumScreenshotImage1;
    _mediumScreenshotImage2 = mediumScreenshotImage2;
    _mediumScreenshotImage3 = mediumScreenshotImage3;
    _cast = cast;
  }

  Movie.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
    _imdbCode = json['imdb_code'];
    _title = json['title'];
    _titleEnglish = json['title_english'];
    _titleLong = json['title_long'];
    _slug = json['slug'];
    _year = json['year'];
    _rating = json['rating'];
    _runtime = json['runtime'];
    _genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    _likeCount = json['like_count'];
    _descriptionIntro = json['description_intro'];
    _ytTrailerCode = json['yt_trailer_code'];
    _language = json['language'];
    _largeCoverImage = json['large_cover_image'];
    _mediumScreenshotImage1 = json['medium_screenshot_image1'] ?? "";
    _mediumScreenshotImage2 = json['medium_screenshot_image2'] ?? "";
    _mediumScreenshotImage3 = json['medium_screenshot_image3'] ?? "";
    if (json['cast'] != null) {
      _cast = [];
      json['cast'].forEach((v) {
        _cast?.add(Cast.fromJson(v));
      });
    }
  }

  num? _id;
  String? _url;
  String? _imdbCode;
  String? _title;
  String? _titleEnglish;
  String? _titleLong;
  String? _slug;
  num? _year;
  num? _rating;
  num? _runtime;
  List<String>? _genres;
  num? _likeCount;
  String? _descriptionIntro;
  String? _ytTrailerCode;
  String? _language;
  String? _largeCoverImage;
  String? _mediumScreenshotImage1;
  String? _mediumScreenshotImage2;
  String? _mediumScreenshotImage3;
  List<Cast>? _cast;

  Movie copyWith({
    num? id,
    String? url,
    String? imdbCode,
    String? title,
    String? titleEnglish,
    String? titleLong,
    String? slug,
    num? year,
    num? rating,
    num? runtime,
    List<String>? genres,
    num? likeCount,
    String? descriptionIntro,
    String? ytTrailerCode,
    String? language,
    String? largeCoverImage,
    String? mediumScreenshotImage1,
    String? mediumScreenshotImage2,
    String? mediumScreenshotImage3,
    List<Cast>? cast,
  }) => Movie(
    id: id ?? _id,
    url: url ?? _url,
    imdbCode: imdbCode ?? _imdbCode,
    title: title ?? _title,
    titleEnglish: titleEnglish ?? _titleEnglish,
    titleLong: titleLong ?? _titleLong,
    slug: slug ?? _slug,
    year: year ?? _year,
    rating: rating ?? _rating,
    runtime: runtime ?? _runtime,
    genres: genres ?? _genres,
    likeCount: likeCount ?? _likeCount,
    descriptionIntro: descriptionIntro ?? _descriptionIntro,
    ytTrailerCode: ytTrailerCode ?? _ytTrailerCode,
    language: language ?? _language,
    largeCoverImage: largeCoverImage ?? _largeCoverImage,
    mediumScreenshotImage1: mediumScreenshotImage1 ?? _mediumScreenshotImage1,
    mediumScreenshotImage2: mediumScreenshotImage2 ?? _mediumScreenshotImage2,
    mediumScreenshotImage3: mediumScreenshotImage3 ?? _mediumScreenshotImage3,
    cast: cast ?? _cast,
  );

  num? get id => _id;

  String? get url => _url;

  String? get imdbCode => _imdbCode;

  String? get title => _title;

  String? get titleEnglish => _titleEnglish;

  String? get titleLong => _titleLong;

  String? get slug => _slug;

  num? get year => _year;

  num? get rating => _rating;

  num? get runtime => _runtime;

  List<String>? get genres => _genres;

  num? get likeCount => _likeCount;

  String? get descriptionIntro => _descriptionIntro;

  String? get ytTrailerCode => _ytTrailerCode;

  String? get language => _language;

  String? get largeCoverImage => _largeCoverImage;

  String? get mediumScreenshotImage1 => _mediumScreenshotImage1;

  String? get mediumScreenshotImage2 => _mediumScreenshotImage2;

  String? get mediumScreenshotImage3 => _mediumScreenshotImage3;

  List<Cast>? get cast => _cast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    map['imdb_code'] = _imdbCode;
    map['title'] = _title;
    map['title_english'] = _titleEnglish;
    map['title_long'] = _titleLong;
    map['slug'] = _slug;
    map['year'] = _year;
    map['rating'] = _rating;
    map['runtime'] = _runtime;
    map['genres'] = _genres;
    map['like_count'] = _likeCount;
    map['description_intro'] = _descriptionIntro;
    map['yt_trailer_code'] = _ytTrailerCode;
    map['language'] = _language;
    map['large_cover_image'] = _largeCoverImage;
    map['medium_screenshot_image1'] = _mediumScreenshotImage1;
    map['medium_screenshot_image2'] = _mediumScreenshotImage2;
    map['medium_screenshot_image3'] = _mediumScreenshotImage3;
    if (_cast != null) {
      map['cast'] = _cast?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "Bruce Willis"
/// character_name : "Det. Jack Mosley"
/// url_small_image : "https://yts.mx/assets/images/actors/thumb/nm0000246.jpg"
/// imdb_code : "0000246"

class Cast {
  Cast({
    String? name,
    String? characterName,
    String? urlSmallImage,
    String? imdbCode,
  }) {
    _name = name;
    _characterName = characterName;
    _urlSmallImage = urlSmallImage;
    _imdbCode = imdbCode;
  }

  Cast.fromJson(dynamic json) {
    _name = json['name'] ?? "";
    _characterName = json['character_name'] ?? "";
    _urlSmallImage = json['url_small_image'] ?? "";
    _imdbCode = json['imdb_code'] ?? "";
  }

  String? _name;
  String? _characterName;
  String? _urlSmallImage;
  String? _imdbCode;

  Cast copyWith({
    String? name,
    String? characterName,
    String? urlSmallImage,
    String? imdbCode,
  }) => Cast(
    name: name ?? _name,
    characterName: characterName ?? _characterName,
    urlSmallImage: urlSmallImage ?? _urlSmallImage,
    imdbCode: imdbCode ?? _imdbCode,
  );

  String? get name => _name;

  String? get characterName => _characterName;

  String? get urlSmallImage => _urlSmallImage;

  String? get imdbCode => _imdbCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['character_name'] = _characterName;
    map['url_small_image'] = _urlSmallImage;
    map['imdb_code'] = _imdbCode;
    return map;
  }
}
