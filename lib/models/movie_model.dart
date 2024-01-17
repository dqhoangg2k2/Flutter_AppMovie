import 'package:movie_app/models/result_model.dart';
//5 link api 1 nội dung viết 1 model dùng chung 
class MovieModel {
  int? page;
  List<ResultModel>? results; // 1 list  ResultModel
  int? totalPages;
  int? totalResults;

  MovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results,
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );
  }

  @override
  String toString() =>
      "MovieModel2(page: $page,results: $results,totalPages: $totalPages,totalResults: $totalResults)";

  @override
  int get hashCode => Object.hash(page, results, totalPages, totalResults);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModel &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          results == other.results &&
          totalPages == other.totalPages &&
          totalResults == other.totalResults;
}
