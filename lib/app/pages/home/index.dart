import 'package:flutter/material.dart';
import 'package:flutter_learn/app/components/home/HmHot.dart';
import 'package:flutter_learn/app/components/home/HmMoreList.dart';
import 'package:flutter_learn/app/components/home/HmSlider.dart';

import '../../components/home/HmCategory.dart';
import '../../components/home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChildre() {
    return [
      // 轮播图
      const SliverToBoxAdapter(child: HmSlider()),

      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类组件
      const SliverToBoxAdapter(child: HmCategory()),

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
    return CustomScrollView(slivers: _getScrollChildre());
  }
}
