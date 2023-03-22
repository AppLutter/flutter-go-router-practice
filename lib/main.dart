import 'package:flutter/material.dart';
import 'package:flutter_go_router_practice/route.dart';
import 'package:flutter_go_router_practice/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: MyRouter.route,
    );

    /// router.go 하는 방식으로 마치 상태관리를 쓰듯 [Navigator] 사용 가능
    /// [context] extension이 너무 잘 되어 있어서 안쓴다..

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(primarySwatch: Colors.blue),
    //   home: InheritedGoRouter(
    //      goRouter: MyRouter.route,
    //     child: HomeScreen(),
    //   ),
    // );
  }
}
