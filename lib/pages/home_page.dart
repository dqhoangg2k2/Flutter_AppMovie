import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/mv_simmer.dart';
import 'package:movie_app/constants/app_constant.dart';
import 'package:movie_app/models/result_model.dart';
import 'package:movie_app/resources/app_color.dart';
import 'package:movie_app/services/remote/movie_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {  // có này ms làm vc vs tabBar, tabBarview (1)
  final _movieServices = MovieServices();
  late TabController _tabController;  //bắt buộc late   //tabbar chung controller vs tabbarview 
  List<ResultModel> _trendings = []; //5 api thì 5 list
  List<ResultModel> _nowPlayings = [];
  List<ResultModel> _upComings = [];
  List<ResultModel> _topRateds = [];
  List<ResultModel> _populars = [];

  bool isLoading = false;

  _getTrending() async {  //viết dài hơn vì làm hiệu ứng xoay khi miết ngón tay 
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 3200));
    _movieServices.getTrending().then((value) {
      setState(() {
        isLoading = false;
        _trendings = value.results ?? [];
      });
    }).catchError((onError) {
      isLoading = false;
      setState(() {});
    });
  }

  _getNowPlaying() {
    _movieServices.getNowPlaying().then((value) {
      _nowPlayings = value.results ?? [];
      setState(() {});
    });
  }

  _getUpComing() {
    _movieServices.getUpComing().then((value) {
      _upComings = value.results ?? [];
      setState(() {});
    });
  }

  _getTopRated() {
    _movieServices.getTopRated().then((value) {
      _topRateds = value.results ?? [];
      setState(() {});
    });
  }

  _getPopular() {
    _movieServices.getPopular().then((value) {
      _populars = value.results ?? [];
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);  //dùng late :  khởi tạo controller truyền này vào 
  // controller dùng chung cho taskbar , tabbar view 
    // vsync: có này ms làm vc vs tabBar, tabBarview  ()
  //length: 4, có 4 tababr
    _getTrending();  // cuộc ngang đầu tiên  //5 api
    _getNowPlaying();
    _getUpComing();
    _getTopRated();
    _getPopular();
  }
//có list view cuộn theo  chiều ngang thì phải xét chiều cao 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 6.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "What do you want to watch?",
                style: TextStyle(fontSize: 16.8, color: AppColor.orange),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _searchBox(),
          ),
          const SizedBox(height: 18.0),
          SizedBox( //ListView đặt kích thước cho ListView
            height: 220.0,
            child: isLoading
                ? ListView(  // số 6.7,...và linh ảnh : lấy từ api ra
                    scrollDirection: Axis.horizontal,
                    children: [//di vào  children  là 1 list rồi , ko cần [...]  (bỏ đoạn này ) , thêm nhiều list 
                      ...List.generate(
                        6,  //mỗi lần loang, 6 containner đầu nó quay
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 20.0),
                          width: 146.0,
                          height: 220.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.brown.withOpacity(0.86)),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  )
                : _trendings.isEmpty
                    ? _notFindTheMovie()  // api bị rỗng in dòng thông báo  (_notFindTheMovie) // có kính lúc
                    : ListView.separated(  // loag xong chạy vô đây 
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        itemCount: _trendings.length,
                        itemBuilder: (context, index) {
                          final trending = _trendings[index]; // item đưa ra màn hình 
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: CachedNetworkImage(  //đưa ảnh vào
                                  imageUrl: AppConstant.imageTheMovie +
                                      (trending.posterPath ?? ''), //(trending.posterPath ?? '') back end trả về
                                  width: 146.0,
                                  height: 220.0,
                                  fit: BoxFit.cover,
                                  placeholder: (context, _) => const MvSimmer(
                                      width: 146.0, height: 220.0),
                                  errorWidget: (context, url, error) =>
                                      const MvSimmer(
                                          width: 146.0, height: 220.0),
                                ),
                              ),
                              Positioned(
                                top: 10.0,
                                right: 10.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.orangeAccent,
                                  child: Text(
                                    trending.voteAverage?.toStringAsFixed(1) ??  // trending.voteAverag dùng gen nên . ra ảnh 
                                        '',
                                    style:
                                        const TextStyle(color: AppColor.white),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 20.0),
                      ),
          ),
          const SizedBox(height: 14.0),
          SizedBox(
            height: 36.0,
            child: TabBar( //thanh ,đoạn chữ kéo ngang qua
              indicatorColor: AppColor.h3A3F47,
              dividerColor: Colors.transparent,
              labelColor: AppColor.white,
              unselectedLabelColor: AppColor.white,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              controller: _tabController,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(horizontal: 6.8),
              tabs: const [
                Tab(text: 'Now playing'),
                Tab(text: 'Upcoming'),
                Tab(text: 'Top rated'),
                Tab(text: 'Popular'),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          Expanded(
            child: TabBarView( // kéo dọc được là do dùng 1 cái contailler chung vs tabBar 
              controller: _tabController,
              children: [
                RefreshIndicator(  // kéo xuống nó loah (hiện vòng tròn xoay) , kéo xuống loag (chạy) 2 method dưới
                  onRefresh: () async {  //onRefresh sự kiện miết ngón tay
                    _getTrending();  // kéo xuống nó loag lại cái lướt ngang trên đầu 
                    _getNowPlaying(); // và cái từng trang riêng (_buildGridVIew) của nó loag lại
                  },
                  child: Center(
                    child: _buildGridVIew(_nowPlayings),  // 1 cái tabbatr ấn vào hiện _buildGridVIew (là 1 cái list ( tạo 1 list dùng chung))
                  ),
                ),
                RefreshIndicator( 
                  onRefresh: () async {
                    _getTrending();  //gọi api 
                    _getUpComing();
                  },
                  child: Center(
                    child: _buildGridVIew(_upComings),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    _getTrending();
                    _getTopRated();
                  },
                  child: Center(
                    child: _buildGridVIew(_topRateds),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    _getTrending();
                    _getPopular();
                  },
                  child: Center(
                    child: _buildGridVIew(_populars),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Center _notFindTheMovie() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/image_search_one.png',
            width: 56.0,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 6.0),
          const Text(
            'We Are Sorry, We Can',
            style: TextStyle(color: AppColor.white, fontSize: 16.0),
          ),
          const Text(
            'Not Find The Movie 😍',
            style: TextStyle(color: AppColor.white, fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: AppColor.h3A3F47,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: TextField(
        onTap: () {},
        readOnly: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: AppColor.h67686D),
          suffixIcon: Icon(Icons.search, size: 26.0, color: AppColor.h67686D),
          suffixIconConstraints: BoxConstraints(minWidth: 46.0),
        ),
      ),
    );
  }

  Widget _buildGridVIew(List<ResultModel> items) {
    return GridView.builder( // di vào có SliverGridDelegateWithFixedCrossAxisCount (bắt buộc)
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 2 / 3,
      ),
      padding: const EdgeInsets.all(20.0).copyWith(top: 16.0),
      physics: const AlwaysScrollableScrollPhysics(), // 2 item vẫn cuộn // luôn cuộn
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: CachedNetworkImage(
            imageUrl: AppConstant.imageTheMovie + (item.posterPath ?? ''),
            fit: BoxFit.cover,
            placeholder: (context, _) => const MvSimmer(),
            errorWidget: (context, url, error) => const MvSimmer(),
          ),
        );
      },
    );
  }
}
