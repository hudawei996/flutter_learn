import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  const HmSuggestion({super.key});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 300,
      color: Colors.blue,
      child: Text(
        "推荐商品",
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
