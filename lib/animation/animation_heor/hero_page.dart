import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class HeroPage extends StatefulWidget {
  Map arguments;

  HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  late List<dynamic> imageUrlList = [];
  late String incomeImageUrl = '';
  late int incomeIndex = 0;

  late int currentIndex = 0;

  @override
  void initState() {
    imageUrlList = widget.arguments['imageUrlList'];
    incomeImageUrl = widget.arguments['imageUrl'];

    incomeIndex = imageUrlList.indexOf(incomeImageUrl);
    currentIndex = incomeIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text('第 ${currentIndex+1} / ${imageUrlList.length} 张')),
        body: Hero(
          tag: widget.arguments['imageUrl'],
          child: Center(
            child:
                // 这个组件会限制最后图片能放大的上限，所以有第三方预览的组件时，这个可以不用
            // AspectRatio(
            //   aspectRatio: 16 / 9,
            //   child:
            //       // Image.network(widget.arguments['imageUrl']),
            //       // 使用PhotoView来预览单张图片，可以双指放大缩小
            //       PhotoView(imageProvider: NetworkImage(widget.arguments['imageUrl'])),
            // ),
            // 多张图片预览
            PhotoViewGallery.builder(
              itemCount: imageUrlList.length,
              pageController: PageController(initialPage: incomeIndex),
              onPageChanged: (index) {
                print("图片滑动到第$index 张");
                setState(() {
                  currentIndex = index;
                });
              },
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(
                    imageUrlList[index],
                  ),
                  // initialScale: PhotoViewComputedScale.contained * 1.0,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
