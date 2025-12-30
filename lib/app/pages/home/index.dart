import 'package:flutter/material.dart';
import 'package:flutter_learn/app/components/home/HmHot.dart';
import 'package:flutter_learn/app/components/home/HmMoreList.dart';
import 'package:flutter_learn/app/components/home/HmSlider.dart';
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

    _getBannerList();
    _getCategoryList();
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
  void _getBannerList() async {
    _bannerList = await getBannerList();
    setState(() {});
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
      const SliverToBoxAdapter(child: HmSuggestion()),

      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      // ListView
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),

      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const HmMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
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
    setState(() {});
  }
}
