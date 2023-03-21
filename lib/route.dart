import 'package:flutter/material.dart';
import 'package:flutter_go_router_practice/screens/home_screen.dart';
import 'package:flutter_go_router_practice/screens/second_screen.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
const rootScreen = '/';
const secondScreen = '/second';

class MyRouter {
  /// GoRoute : 네비게이터를 사용하여 일치하는 상위 경로 위에 시각적으로 표시되는 경로
  /// builder가 반환한 위젯은 [Page]에 래핍되어 루트 [Navigator]나 가장 가까운 [ShellRoute] 조상의 [Navigator] 또는
  /// 일치하는 [parentNavigatorKey]가 있는 [Navigator]에 제공
  static final route = GoRouter(
    /// RouteBase : GoRoute 및 ShellRoute의 기본 클래스
    routes: <RouteBase>[
      GoRoute(
        /// name : 선택 옵션으로 경로의 이름
        /// 사용하는 경우 문자열 제공해야하며 빈 문자열 불가
        /// GoRouter.namedLocation에서 사용된다. 정확한 URI를 몰라도 이 경로를 탐색하는데 사용가능
        /// name을 'family'로 지정했으면 context.namedLocation('family') 로 이동가능
        name: 'test',
        path: rootScreen,

        /// redirect : 조건에 따라 다른 route를 [Navigator]하도록 함
        /// 보통 상태관리의 Status로 분기함
        // redirect: (context,state){},
        builder: (context, state) => const HomeScreen(),

        /// parentNavigatorKey : 화면을 표시할 [Navigator]를 지정하는 키(옵션)
        /// 루트 [Navigator]를 지정하면 가장 가까운 [ShellRoute] 조상 대신 해당 [Navigator]가 쌓임
        // parentNavigatorKey: navigatorKey,

        /// pageBuilder : 이 경로의 페이지 빌더
        /// CupertinoPage 또는 CustomTransitionPage 사용 가능
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: secondScreen,
        builder: (context, state) => const SecondScreen(),
      ),
    ],
  );
}
