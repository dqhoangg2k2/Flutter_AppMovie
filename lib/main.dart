// https://jsonformatter.curiousconcept.com/#
// json to dart quicktype
// https://quicktype.io/dart   //xem thôi 

// https://api.themoviedb.org/3/trending/all/day?api_key=6badeb713e797a46bca7fc6193042311  // 4 cái link api 
// https://api.themoviedb.org/3/movie/594767?api_key=6badeb713e797a46bca7fc6193042311
// https://api.themoviedb.org/3/movie/594767/reviews?api_key=6badeb713e797a46bca7fc6193042311
// https://api.themoviedb.org/3/search/movie?api_key=6badeb713e797a46bca7fc6193042311&query=avatar

// https://api.themoviedb.org/3/movie/594767/videos?api_key=6badeb713e797a46bca7fc6193042311

// https://dartj.web.app/#/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/home_page.dart';
import 'resources/app_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.bgColor,
          toolbarHeight: 40.0,
          titleTextStyle: TextStyle(color: AppColor.orange, fontSize: 18.6),
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}

//svg laf text : zom to đc ko bể , với ko tăng mp

//MovieModel  (đặt tên model )   bỏ cái thứ 3 (tít chọn)
//result là 1 bộ phim , viết trc   bỏ vào ms_model  // voteave ( sửa int thành double )


////5 api dùng chung 1 model  result_model

// static const String trending = 'trending/all/day';
//   static const String nowPlaying = 'movie/now_playing';
//   static const String upComing = 'movie/upcoming';
//   static const String topRated = 'movie/top_rated';
//   static const String popular = 'movie/popular';