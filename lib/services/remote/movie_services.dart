import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:movie_app/constants/app_constant.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
//làm vs vs api 
abstract class ImplMovieServices {  // 1 model dùng chung 5 api
  Future<MovieModel> getTrending();
  Future<MovieModel> getNowPlaying();
  Future<MovieModel> getUpComing();
  Future<MovieModel> getTopRated();
  Future<MovieModel> getPopular();
}
//cách thầy trả về y trên api
class MovieServices extends ImplMovieServices {
    static final httpLog = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);
  //thêm httplog vào đây 
  @override
  Future<MovieModel> getTrending() async {
    const url =
        '${AppConstant.theMovieDb}${AppConstant.trending}?api_key=${AppConstant.keyMovie}';

    final response = await httpLog.get(Uri.parse(url));
    Map<String, dynamic> json = jsonDecode(response.body);  // response.body là mao
    final movie = MovieModel.fromJson(json); // biến thành đối tượng (ojchek)
    return movie;
  }

  @override
  Future<MovieModel> getNowPlaying() async {
    const url =
        '${AppConstant.theMovieDb}${AppConstant.nowPlaying}?api_key=${AppConstant.keyMovie}';

    final response = await httpLog.get(Uri.parse(url));
    Map<String, dynamic> json = jsonDecode(response.body);
    final movie = MovieModel.fromJson(json);
    return movie;
  }

  @override
  Future<MovieModel> getUpComing() async {
    const url =
        '${AppConstant.theMovieDb}${AppConstant.upComing}?api_key=${AppConstant.keyMovie}';

    final response = await httpLog.get(Uri.parse(url));
    Map<String, dynamic> json = jsonDecode(response.body);
    final movie = MovieModel.fromJson(json);
    return movie;
  }

  @override
  Future<MovieModel> getPopular() async {
    const url =
        '${AppConstant.theMovieDb}${AppConstant.popular}?api_key=${AppConstant.keyMovie}';

    final response = await httpLog.get(Uri.parse(url));
    Map<String, dynamic> json = jsonDecode(response.body);
    final movie = MovieModel.fromJson(json);
    return movie;
  }

  @override
  Future<MovieModel> getTopRated() async {
    const url =
        '${AppConstant.theMovieDb}${AppConstant.topRated}?api_key=${AppConstant.keyMovie}';

    final response = await httpLog.get(Uri.parse(url));
    Map<String, dynamic> json = jsonDecode(response.body);
    final movie = MovieModel.fromJson(json);
    return movie;
  }
}
