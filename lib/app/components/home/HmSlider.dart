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
  int _currentIndex = 0;

  // 轮播图切换时更新当前索引
  void _updateCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    // Stack -> 轮播图 + 搜索框 指示灯导航
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
    // return Container(
    //   height: 200,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //   child: Text("轮播图", style: TextStyle(color: Colors.white, fontSize: 20)),
    // );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  // 返回指示灯导航部件
  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.bannerList.length, (index) {
          return GestureDetector(
            onTap: () {
              _controller.animateToPage(index);
              _updateCurrentIndex(index);
            },
            child:
            // Container(
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: index == _currentIndex ? 40 : 20,
              height: 6,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: index == _currentIndex
                    ? Colors.white
                    : Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _getSlider() {
    // 在flutter中获取屏幕宽度的方法
    final screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      carouselController: _controller,
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
        onPageChanged: (index, reason) {
          _updateCurrentIndex(index);
        },
      ),
    );
  }
}
