class ResultModel { // đưa con (ResultModel) vào trc rồi mslamf MovieModel
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? firstAirDate;
  double? voteAverage;
  int? voteCount;
  List<String>? originCountry;
  String? title;
  String? originalTitle;
  String? releaseDate;
  bool? video;

  ResultModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.video,
  });

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'name': name,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'genre_ids': genreIds,
      'popularity': popularity,
      'first_air_date': firstAirDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'origin_country': originCountry,
      'title': title,
      'original_title': originalTitle,
      'release_date': releaseDate,
      'video': video,
    };
  }

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      mediaType: json['media_type'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      popularity: json['popularity'] as double?,
      firstAirDate: json['first_air_date'] as String?,
      voteAverage: json['vote_average'] as double?,
      voteCount: json['vote_count'] as int?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      releaseDate: json['release_date'] as String?,
      video: json['video'] as bool?,
    );
  }

  @override
  String toString() =>
      "Results(adult: $adult,backdropPath: $backdropPath,id: $id,name: $name,originalLanguage: $originalLanguage,originalName: $originalName,overview: $overview,posterPath: $posterPath,mediaType: $mediaType,genreIds: $genreIds,popularity: $popularity,firstAirDate: $firstAirDate,voteAverage: $voteAverage,voteCount: $voteCount,originCountry: $originCountry,title: $title,originalTitle: $originalTitle,releaseDate: $releaseDate,video: $video)";

  @override
  int get hashCode => Object.hash(
      adult,
      backdropPath,
      id,
      name,
      originalLanguage,
      originalName,
      overview,
      posterPath,
      mediaType,
      genreIds,
      popularity,
      firstAirDate,
      voteAverage,
      voteCount,
      originCountry,
      title,
      originalTitle,
      releaseDate,
      video);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultModel &&
          runtimeType == other.runtimeType &&
          adult == other.adult &&
          backdropPath == other.backdropPath &&
          id == other.id &&
          name == other.name &&
          originalLanguage == other.originalLanguage &&
          originalName == other.originalName &&
          overview == other.overview &&
          posterPath == other.posterPath &&
          mediaType == other.mediaType &&
          genreIds == other.genreIds &&
          popularity == other.popularity &&
          firstAirDate == other.firstAirDate &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          originCountry == other.originCountry &&
          title == other.title &&
          originalTitle == other.originalTitle &&
          releaseDate == other.releaseDate &&
          video == other.video;
}
