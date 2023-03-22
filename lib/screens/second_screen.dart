import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_go_router_practice/route.dart' as router;

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                context.go(router.rootScreen);
              },
              child: Text('뒤로'),
            ),
            const SizedBox(width: 10.0),
            TextButton(
              onPressed: () {
                context.goNamed(router.thirdScreen);
              },
              child: Text('세번째'),
            ),
            const SizedBox(width: 10.0),
            TextButton(
              onPressed: () {
                context.goNamed(router.shellOneScreen);
              },
              child: Text('네번째'),
            ),
          ],
        ),
      ),
    );
  }
}
