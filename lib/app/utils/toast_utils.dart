import 'package:flutter/material.dart';

class ToastUtils {
  // 阀门控制
  static bool _isLoading = false; // 是否有人正在使用
  static void showToast(BuildContext context,String msg) {
    // 如果正在加载中，则不显示
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    Future.delayed(Duration(seconds: 3), () {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        content: Text(msg ?? "加载成功", textAlign: TextAlign.center),
      ),
    );
  }
}