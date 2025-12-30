import 'package:flutter/material.dart';
import 'package:flutter_learn/app/view_models/home_models.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialRecommendResult specialRecommendResult;

  const HmSuggestion({super.key, required this.specialRecommendResult});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  //取前3条数据
  List<GoodsItem> _getDisplayItems() {
    // 网络图片有构建失败的可能，所以这里需要判断一下，返回空就行
    if (widget.specialRecommendResult.subTypes.isEmpty) return [];
    return widget.specialRecommendResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDisplayItems();
    // 注意这个还是需要return 漏了会报错
    // List.generate(list.length, (int index) {
    return List.generate(list.length, (int index) {
      return Column(
        children: [
          // ClipRRect 可以包裹子元素 裁剪图片设置圆角
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              // 如果网络图片加载错误的时候，返回一个默认图片
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "lib/app/assets/home_cmd_inner.png",
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                );
              },
              list[index].picture,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 240, 96, 12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "¥${list[index].price}",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage("lib/app/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                _buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: const TextStyle(
            color: Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省钱攻略",
          style: const TextStyle(
            color: Color.fromARGB(255, 124, 63, 58),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage("lib/app/assets/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
