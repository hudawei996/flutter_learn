import 'package:flutter/material.dart';

class MainPageRouteSenior extends StatelessWidget {
  const MainPageRouteSenior({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/goodsList",
      routes: {
        "/goodsList": (context) => GoodsListPage(),
        "/carList": (context) => CarListPage(),
      },
      // 登录页和购物车页 不在路由表里
      onGenerateRoute: (settings) {
        print(settings.name);
        if (settings.name == "/carList") {
          bool isLogin = true;
          if (isLogin) {
            MaterialPageRoute(
              builder: (context) {
                return CarListPage();
              },
            );
            //MaterialPageRoute(builder:(context) => CarListPage());
          } else {
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            );
          }
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return NotFoundPage();
          },
        );
      },
    );
  }
}

class GoodsListPage extends StatefulWidget {
  const GoodsListPage({super.key});

  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品列表")),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/carList");
          },
          child: Text("加入购物车"),
        ),
      ),
    );
  }
}

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("购物车页面")),
      body: Center(
        child: TextButton(onPressed: () {
          Navigator.of(context).pushNamed("/pay");
        }, child: Text("去支付")),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录页面")),
      body: Center(
        child: TextButton(onPressed: () {
          Navigator.of(context).pushNamed("/carList");
        }, child: Text("去登录")),
      ),
    );
  }
}

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("找不到页面")),
      body: Center(child: Icon(Icons.error_outline)),
    );
  }
}
