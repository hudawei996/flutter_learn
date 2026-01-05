import 'package:flutter/material.dart';
import 'package:flutter_learn/app/view_models/home_models.dart';

class HmHot extends StatefulWidget {
  final SpecialRecommendResult recommendResult;
  final String type;

  const HmHot({super.key, required this.recommendResult, required this.type});

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  // 获取前两条数据
  List<GoodsItem> get _items {
    if (widget.recommendResult.subTypes.isEmpty) {
      return [];
    }
    return widget.recommendResult.subTypes.first.goodsItems.items
        .take(2)
        .toList();
  }

  // 构建子项
  List<Widget> _getChildrenList() {
    return _items.map((item) {
      return Expanded(
        child: Container(
          // width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.picture,
                  // width: 80,
                  fit: BoxFit.cover,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "lib/app/assets/home_cmd_inner.png",
                      // width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              Text(
                "¥${item.price}",
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 86, 24, 20),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == "step" ? "一站买全" : "爆款推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.type == "step" ? "精心优选" : "最受欢迎",
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.type == "step"
              ? const Color.fromARGB(255, 249, 247, 219)
              : const Color.fromARGB(255, 211, 228, 240),
        ),
        child: Column(
          children: [
            // 顶部内容
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _getChildrenList(),
            ),
          ],
        ),
      ),
    );
  }
}
