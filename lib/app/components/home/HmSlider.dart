import 'package:flutter/material.dart';
import 'package:flutter_learn/app/view_models/home_models.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;

  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    // Stack -> 轮播图 + 搜索框 指示灯导航
    return Stack(children: [_getSlider()]);
    // return Container(
    //   height: 200,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //   child: Text("轮播图", style: TextStyle(color: Colors.white, fontSize: 20)),
    // );
  }

  Widget _getSlider() {
    // 在flutter中获取屏幕宽度的方法
    final screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imgUrl!,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        height: 200,
        autoPlayAnimationDuration: Duration(seconds: 3),
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
    );
  }
}
