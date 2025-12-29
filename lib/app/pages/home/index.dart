import 'package:flutter/material.dart';
import 'package:flutter_learn/app/components/home/HmSlider.dart';

import '../../components/home/HmCategory.dart';
import '../../components/home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChildre(){
    return [
      // 轮播图
      const SliverToBoxAdapter(child: HmSlider()),

      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类组件
      const SliverToBoxAdapter(child: HmCategory()),

      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐商品组件
      const SliverToBoxAdapter(child: HmSuggestion()),

    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildre(),
    );
  }
}
