import 'package:flutter/material.dart';
import 'package:flutter_learn/app/components/home/HmHot.dart';
import 'package:flutter_learn/app/components/home/HmMoreList.dart';
import 'package:flutter_learn/app/components/home/HmSlider.dart';
import 'package:flutter_learn/app/utils/toast_utils.dart';
import 'package:flutter_learn/app/view_models/home_models.dart';

import '../../api/home_api.dart';
import '../../components/home/HmCategory.dart';
import '../../components/home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    // _getBannerList();
    // _getCategoryList();
    // _getPreferenceList();
    // _getInVogueList();
    // _getOneStopList();
    // _getRecommendList();
    registerEvent();

    // initState > build => 下拉刷新组件 => 才可以操作它
    // 所以要放到微任务里
    Future.microtask(() {
      _paddingTop = 100;
      setState(() {}); // 有了这个，才会执行的时候立马下拉的感觉
      // todo  这个方法可以触发RefreshIndicator 的 onRefresh()
      _refreshIndicatorKey.currentState?.show();
    });
  }

  // 监听滚动到底部的事件
  void registerEvent() {
    _scrollController.addListener(() {
      // 距离底部还有50的距离就可以开始了
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        print("滑动到底部了");
        // 加载下一页的数据
        _getRecommendList();
        setState(() {});
      }
    });
  }

  // final List<BannerItem> _bannerList = [
  //   BannerItem(
  //     id: "1",
  //     imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
  //   ),
  //   BannerItem(
  //     id: "2",
  //     imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
  //   ),
  //   BannerItem(
  //     id: "3",
  //     imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
  //   ),
  // ];

  List<BannerItem> _bannerList = [];

  Future<void> _getBannerList() async {
    _bannerList = await getBannerList();
    // setState(() {});
  }

  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg

  List<Widget> _getScrollChildren() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),

      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类组件
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),

      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐商品组件
      SliverToBoxAdapter(
        child: HmSuggestion(specialRecommendResult: _specialRecommendResult),
      ),

      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      // ListView
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HmHot(
                  recommendResult: _inVogueRecommendResult,
                  type: "hot",
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHot(
                  recommendResult: _oneStopRecommendResult,
                  type: "step",
                ),
              ),
            ],
          ),
        ),
      ),

      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(recommendList: _recommendList), // 无限滚动列表,
    ];
  }

  final ScrollController _scrollController = ScrollController();

  // GlobalKey 是一个方法可以床见一个key绑定到Widget部件上 可以操作widget部件
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey();
  double _paddingTop = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(microseconds: 300),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: _getScrollChildren(),
        ),
      ),
      onRefresh: () async {
        _onRefresh();
      },
    );
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _hasMore = true;
    _isLoading = false;
    _recommendList = [];

    await _getBannerList();
    await _getCategoryList();
    await _getPreferenceList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();

    // 数据获取成功了
    ToastUtils.showToast(context, "刷新成功");
    _paddingTop = 0;
    setState(() {}); //有这一个数据刷新，就行了，所有网络请求里边的刷新都可以省略
  }

  List<CategoryItem> _categoryList = [];

  // Future<void> _getCategoryList() { // 下边的代码没有用await 这里就不用写async
  //   // 也可以这样写，但是我觉得，上面的写法更清晰
  //   getCategoryList().then((value) {
  //     setState(() {
  //       _categoryList = value;
  //     });
  //   });
  // }
  Future<void> _getCategoryList() async {
    // 也可以像上边那样写，但是我觉得，这种写法更清晰
    _categoryList = await getCategoryList();
    // setState(() {});
  }

  // 特惠推荐商品列表
  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  Future<void> _getPreferenceList() async {
    _specialRecommendResult = await getPreferenceList();
    // setState(() {});
  }

  // 爆款推荐商品列表
  SpecialRecommendResult _inVogueRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  Future<void> _getInVogueList() async {
    _inVogueRecommendResult = await getInVogueList();
    // setState(() {});
  }

  // 一站买全商品列表
  SpecialRecommendResult _oneStopRecommendResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  Future<void> _getOneStopList() async {
    _oneStopRecommendResult = await getOneStopList();
    // setState(() {});
  }

  // 页码
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

  // 获取推荐列表
  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMore) {
      return;
    }
    _isLoading = true; // 先 占住位置
    int requestLimit = _page * 8;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    _isLoading = false; // 松开位置
    // setState(() {});

    // 我要10条 你给10条 说明我要的你都给了，结社认为还是有下一页
    // 我要10条 你给到的少于10 说明没有下一页
    if (_recommendList.length < requestLimit) {
      _hasMore = false;
      return;
    }
    _page++; // 自增
  }
}
