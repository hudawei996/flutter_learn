import 'package:flutter/material.dart';

class AnimationHero extends StatefulWidget {
  const AnimationHero({super.key});

  @override
  State<AnimationHero> createState() => _AnimationHeroState();
}

class _AnimationHeroState extends State<AnimationHero> {
  List listDta = [
    {
      "title": 'Candy Shop',
      "author": 'Mohamed Chahin',
      "imageUrl": 'https://www.itying.com/images/flutter/1.png',
    },
    {
      "title": 'Childhood',
      "author": 'Google',
      "imageUrl": 'https://www.itying.com/images/flutter/2.png',
    },
    {
      "title": 'Alibaba Shop',
      "author": 'Alibaba',
      "imageUrl": 'https://www.itying.com/images/flutter/3.png',
    },
    {
      "title": 'Candy Shop',
      "author": 'Mohamed Chahin',
      "imageUrl": 'https://www.itying.com/images/flutter/4.png',
    },
    {
      "title": 'Tornado',
      "author": 'Mohamed Chahin',
      "imageUrl": 'https://www.itying.com/images/flutter/5.png',
    },
    {
      "title": 'white-dragon',
      "author": 'Mohamed Chahin',
      "imageUrl": 'https://www.itying.com/images/flutter/7.png',
    }
  ];

  List<Widget> _getListData() {
    var tempList = listDta.map((value) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            "/hero",
            arguments: {'imageUrl': value['imageUrl']},
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(233, 233, 233, 0.9),
              width: 1,
            ),
          ),
          child: Column(
            children: <Widget>[
              Hero(
                tag: value['imageUrl'],
                child: Image.network(value['imageUrl']),
              ),
              SizedBox(height: 10),
              Text(
                value['title'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    });
    return tempList.toList();
  }

  // 自定义 两个图标切换动画
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10.0,
      //水平子 widget之间距离
      mainAxisSpacing: 10.0,
      // 垂直子 widget 之间距离,
      padding: EdgeInsets.all(10.0),
      crossAxisCount: 2,
      // 一行的widget数量
      childAspectRatio: 0.7,
      //宽高比
      children: _getListData(),
    );
  }
}
