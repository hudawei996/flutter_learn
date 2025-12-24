import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageTest extends StatefulWidget {
  const MainPageTest({super.key});

  @override
  State<MainPageTest> createState() => _MainPageTestState();
}

/// 学习 column 和 Row
// class _MainPageTestState extends State<MainPageTest> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Flutter Demo Home Page'),
//           ),
//           body: Container(
//             width:double.infinity,
//             height:double.infinity,
//             decoration: const BoxDecoration(
//               // image: DecorationImage(
//               //   image: AssetImage('assets/images/bg.png'),
//               //   fit: BoxFit.cover,
//               // ),
//               color: Colors.amber,
//             ),
//             alignment: Alignment.center,
//             child:
//             // Column(
//               Row(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                 children: [
//                   Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.blue,
//                   ),Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.blue,
//                   ),Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.blue,
//                   )
//                 ]
//             ),
//           )
//       ),
//     );
//   }
// }

/// 学习 Flex Expanded Flexible
// class _MainPageTestState extends State<MainPageTest> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Flutter Demo Home Page')),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(color: Colors.amber),
//           alignment: Alignment.center,
//           child: Flex(
//             direction: Axis.horizontal,
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Container(width: 100, height: 100, color: Colors.red),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(width: 100, height: 100, color: Colors.green),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

///  Flex Expanded Flexible 例子
// class _MainPageTestState extends State<MainPageTest> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Flutter Demo Home Page')),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(color: Colors.amber),
//           alignment: Alignment.center,
//           child: Container(
//             color: Colors.amber,
//             child: Flex(
//               direction: Axis.vertical,
//               children: [
//                 Container(
//                   height: 100,
//                   color: Colors.blue,
//                 ),
//                 Expanded(
//                   child: Container(
//                     color: Colors.blueGrey,
//                   ),
//                 ),
//                 Container(
//                   height: 100,
//                   color: Colors.red,
//                 ),
//               ]
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

/// wrap - 流式布局 .生成的内容长度不均等，所以需要这种流式布局
// class _MainPageTestState extends State<MainPageTest> {
//   List<Widget> getList() {
//     // return [];
//     return List.generate(10, (index) {
//       return Container(width: 100, height: 100, color: Colors.blue);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Flutter Demo Home Page')),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(color: Colors.amber),
//           alignment: Alignment.center,
//           child: Wrap(
//             spacing: 10,
//             runSpacing: 10,
//             //alignment: WrapAlignment.center,
//             direction: Axis.horizontal,
//             children: getList(),
//           ),
//         ),
//       ),
//     );
//   }
// }

/// TextField - 输入框
// class _MainPageTestState extends State<MainPageTest> {
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _pwdController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('登录')),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(color: Colors.amber),
//           alignment: Alignment.center,
//           child: Container(
//             color: Colors.white,
//             padding: EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _phoneController,
//                   onChanged: (value){
//                     print("onChanged $value");
//                   },
//                   onSubmitted: (value){
//                     print("onSubmitted $value");
//                   },
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.all(20),
//                     hintText: "请输入用户名",
//                     filled: true,
//                     //允许显示填充色
//                     fillColor: Colors.amber[100],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 TextField(
//                   controller: _pwdController,
//                   obscureText: true,//不显示实际内容 用来做密码框的显示
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.all(20),
//                     hintText: "请输密码",
//                     filled: true,
//                     //允许显示填充色
//                     fillColor: Colors.amber[100],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 50,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(25),
//
//                   ),
//                   child: TextButton(
//                       onPressed: (){
//                         print("登录-${_phoneController.text}_${_pwdController.text}");
//                       },
//                       child: Text("登录",style:
//                       TextStyle(color: Colors.white),)),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

/// SingleChildScrollView - 单个滚动
// class _MainPageTestState extends State<MainPageTest> {
//   final ScrollController _controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('登录')),
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               controller: _controller,
//               child: Column(
//                 children: List.generate(100, (index) {
//                   return Container(
//                     alignment: Alignment.center,
//                     margin: EdgeInsets.only(top: 10),
//                     height: 100,
//                     color: Colors.blue,
//                     child: Text(
//                       "我是第$index个",
//                       style: TextStyle(color: Colors.white, fontSize: 30),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             Positioned(
//               top: 10,
//               right: 10,
//               child: GestureDetector(
//                 onTap: () {
//                   print("去顶部");
//                   // _controller.jumpTo(0);
//                   _controller.animateTo(
//                     0,
//                     duration: Duration(microseconds: 1000),
//                     curve: Curves.easeIn,
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(40),
//                   ),
//                   width: 80,
//                   height: 80,
//                   alignment: Alignment.center,
//                   child: Text("去顶部", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 10,
//               right: 10,
//               child: GestureDetector(
//                 onTap: () {
//                   print("去底部");
//                   //滚动到底部
//                  //_controller.jumpTo(_controller.position.maxScrollExtent);
//                   _controller.animateTo(
//                     _controller.position.maxScrollExtent,
//                     duration: Duration(microseconds: 1000),
//                     curve: Curves.easeIn,
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(40),
//                   ),
//                   width: 80,
//                   height: 80,
//                   alignment: Alignment.center,
//                   child: Text("去底部", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// ListView - 列表
// class _MainPageTestState extends State<MainPageTest> {
//   final ScrollController _controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('登录')),
//         body: Container(
//           child: ListView(
//             padding: EdgeInsets.all(10),
//             controller: _controller,
//             children: List.generate(100, (index) {
//               return Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.only(top: 10),
//                 height: 100,
//                 color: Colors.blue,
//                 child: Text(
//                   "我是第$index个",
//                   style: TextStyle(color: Colors.white, fontSize: 30),
//                 ),
//               );
//             })
//           )
//         ),
//       ),
//     );
//   }
// }

/// listview-builder 学习 有销毁的列表，这样不会占用太多内存，
/// 只会按需构建
// class _MainPageTestState extends State<MainPageTest> {
//   final ScrollController _controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('登录')),
//         body: Container(
//             child: ListView.builder(
//               itemCount: 100,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                         alignment: Alignment.center,
//                         margin: EdgeInsets.only(top: 10),
//                         height: 100,
//                         color: Colors.blue,
//                         child: Text(
//                           "我是第$index个",
//                           style: TextStyle(color: Colors.white, fontSize: 30),
//                         ),
//                       );
//                 },
//                 padding: EdgeInsets.all(10),
//                 controller: _controller,
//             )
//         ),
//       ),
//     );
//   }
// }

/// listview-separated 模式
/// 作用：在ListView.builder的基础上，额外提供了构建分割线的能力
/// 方式：需要同时提供 itemCount、itemBuilder、separatorBuilder 三个属性
// class _MainPageTestState extends State<MainPageTest> {
//   final ScrollController _controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('登录')),
//         body: ListView.separated(
//           itemCount: 100,
//           // 分割线
//           separatorBuilder: (BuildContext context, int index) {
//             return Container(height: 10, color: Colors.red);
//           },
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               alignment: Alignment.center,
//               // margin: EdgeInsets.only(top: 10),
//               height: 100,
//               color: Colors.blue,
//               child: Text(
//                 "我是第$index个",
//                 style: TextStyle(color: Colors.white, fontSize: 30),
//               ),
//             );
//           },
//           padding: EdgeInsets.all(10),
//           controller: _controller,
//         ),
//       ),
//     );
//   }
// }

/// 常用滚动组件 GridView
/// 作用：用于创建二维可滚动网格布局的核心组件
/// 方式：提供多种构建方式 GridView.count,GridView.extent,GridView.builder等

// class _MainPageTestState extends State<MainPageTest> {
//   final ScrollController _controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('登录')),
//         body:
//             /// GridView.builder 懒加载，只渲染可见区域
//             /// 接收gridDelegate布局委托，itemBuilder构建函数，itemCount构建数量
//             GridView.builder(
//               itemCount: 100,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   alignment: Alignment.center,
//                   //margin: EdgeInsets.only(top: 10),
//                   height: 100,
//                   color: Colors.blue,
//                   child: Text(
//                     "第$index个",
//                     style: TextStyle(color: Colors.white, fontSize: 30),
//                   ),
//                 );
//               },
//               padding: EdgeInsets.all(10),
//               gridDelegate: // 布局委托
//               /// 按照高度去固定
//               SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 childAspectRatio: 0.5,
//               ),
//               /// 按照列数去固定
//               // SliverGridDelegateWithFixedCrossAxisCount(
//               //   crossAxisCount: 4,
//               //   mainAxisSpacing: 10,
//               //   crossAxisSpacing: 10,
//               // ),
//             ),
//
//         /// GridView.extent 指定子项的最大列数（行数）宽度 或 高度 可以根据现实宽比自动适配
//         /// GridView.extent通过maxCrossAxisExtent设置子项最大宽度、高度 来计算横行或者纵向有多少页。
//         // GridView.extent(
//         //   maxCrossAxisExtent: 100,
//         //   padding: EdgeInsets.all(10),
//         //   mainAxisSpacing: 10,
//         //   crossAxisSpacing: 10,
//         //   children: List.generate(100, (int index) {
//         //     return Container(
//         //       alignment: Alignment.center,
//         //       //margin: EdgeInsets.only(top: 10),
//         //       height: 100,
//         //       color: Colors.blue,
//         //       child: Text(
//         //         "第$index个",
//         //         style: TextStyle(color: Colors.white, fontSize: 30),
//         //       ),
//         //     );
//         //   }),
//         // ),
//         /// GridView.count 创建一个二维可滚动网格布局 固定列数（行数）
//         // GridView.count(
//         //   scrollDirection: Axis.vertical,
//         //   crossAxisCount: 3,
//         //   mainAxisSpacing: 10,
//         //   crossAxisSpacing: 10,
//         //   padding: EdgeInsets.all(10),
//         //   children: List.generate(100, (int index) {
//         //     return Container(
//         //       alignment: Alignment.center,
//         //       margin: EdgeInsets.only(top: 10),
//         //       height: 100,
//         //       color: Colors.blue,
//         //       child: Text(
//         //         "我是第$index个",
//         //         style: TextStyle(color: Colors.white, fontSize: 30),
//         //       ),
//         //     );
//         //   }),
//         // ),
//       ),
//     );
//   }
// }

/// 黑马程序员Flutter入门到实战全套视频教程
/// https://www.bilibili.com/video/BV1wR4Xz6EqG?spm_id_from=333.788.player.switch&vd_source=e10f137a63ff65947d019d16bb78ea8d&p=66
/// CustomScrollView
/// 作用：用于组合多个可滚动组件（如列表，网格），实现统一协调的滚动效果
/// Sliver：Flutter中描述可滚动视图内部一部分内容的组件，他是滚动视图的“切片”
/// 用法：通过sliver属性接收一个Sliver组件列表
/// Sliver组件对应关系：
///   SliverAppBar：AppBar
///   SliverList：ListView
///   SliverGrid：GridView
///   SliverAppBar：AppBar
///   SliverPadding：Padding
///   SliverToBoxAdapter：ToBoxAdapter(用于包裹普通widget)
///   SliverPersistentHeader(粘性吸顶）
///
/// PageView-整页滚动
///  作用：用于实现分页滚动视图的核心组件
///  方式：提供多种构建方式，默认构建方式、PageView.builder等
///  优势：支持懒加载（按需渲染）
///
class _MainPageTestState extends State<MainPageTest> {
  final ScrollController _controller = ScrollController();
  int _currentPageIndex = 0; //当前激活索引
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('登录')),
        body: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            /// 包裹普通组件SizedBox，Container等
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    color: Colors.blue,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          height: 200,
                          color: Colors.blue,
                          child: Text(
                            "轮播图${index + 1}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(10, (index) {
                          return GestureDetector(
                            onTap: () {
                              // 切换到具体的page
                              _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              setState(() {
                                _currentPageIndex = index;
                              });
                            },
                            child: Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPageIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 包裹普通组件SizedBox，Container等
            SliverToBoxAdapter(child: SizedBox(height: 10)),

            /// 粘性吸顶组件
            SliverPersistentHeader(
              delegate: _StickyCategoryHeaderDelegate(),
              pinned: true, // 固定吸顶
            ),

            /// 包裹普通组件SizedBox，Container等
            SliverToBoxAdapter(child: SizedBox(height: 10)),

            /// 列表视图
            // SliverList.separated(
            //   itemCount: 100,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       height: 100,
            //       color: Colors.blue,
            //       alignment: Alignment.center,
            //       child: Text(
            //         "第${index+1}个",
            //         style: TextStyle(color: Colors.white, fontSize: 20),
            //       ),
            //     );
            //   },
            //   separatorBuilder: (BuildContext context, int index) {
            //     return SizedBox(
            //       height: 10,
            //     );
            //   },
            // )

            /// 网格视图
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(100, (index) {
                return Container(
                  height: 100,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    "网格视图${index + 1}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _StickyCategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: 30,
        // 水平排列滚动
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "分类${index + 1}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
      ),
    );
  }

  @override
  // 最大展开高度
  double get maxExtent => 80;

  @override
  // 最小折叠高度
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // 是否需要重建，不需要
  }
}
