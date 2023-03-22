import 'package:flutter/material.dart';
import 'package:flutter_go_router_practice/screens/fourth_screen.dart';
import 'package:flutter_go_router_practice/screens/home_screen.dart';
import 'package:flutter_go_router_practice/screens/second_screen.dart';
import 'package:flutter_go_router_practice/screens/third_screen.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
const rootScreen = '/';
const secondScreen = 'second';
const thirdScreen = 'third';
// const fourthScreen = 'fourth';
const shellOneScreen = 'shellOne';
const shellTwoScreen = 'shellTwo';

const List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.ac_unit),
    label: shellOneScreen,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.access_alarm_rounded),
    label: shellTwoScreen,
  ),
];

class MyRouter {
  /// GoRouter : 앱의 경로 구성
  /// 여기의

  static final route = GoRouter(
    ///
    /// RouteBase : GoRoute 및 ShellRoute의 기본 클래스
    /// routes : 앱의 최상위 경로 지정.. '/'를 포함 해야함
    ///

    /// errorBuilder : 에러일 시 보여줄 위젯
    // errorBuilder: (context,state){},

    /// errorPageBuilder : 에러일 시 보여줄 페이지
    // errorPageBuilder: (context,state){},

    /// redirect : 상태에 따라 다른 route(String 타입)을 바라보게 가능
    /// 상태관리 위젯이 프레임워크에게 상태변경을 알리면 redirect 조건식이 다시 트리거됨
    // redirect: (context,state){},

    /// refreshListenable : 새로고침될 때 실행되는 Listener
    // refreshListenable: ,

    /// redirect 횟수 제한.. 기본 값 5
    // redirectLimit: ,

    /// routerNeglect : 웹에 해당하는 것 같음.. 새 창으로 열 것인지(true) 아니면 현재 창에서 이동하는지(false)
    /// 브라우저에서 새 기록 항목을 만들지 않고 라우터를 강제로 실행합니다.
    // routerNeglect: false,

    /// initialLocation: 초기 경로 설정
    /// 아무 설정 없으면 초기 경로 '/'
    // initialLocation :rootScreen,

    /// observers : [NavigatorObserver]들의 목록 didPush, didPop 등의 [Navigator]의 상태 변화
    /// 또는 didRemove 등 [Route] 상태 변화에 따라 조치를 취하거나 단순 관찰할 때 쓰임
    // observers: <NavigatorObserver>[],

    /// navigatorKey: context 없이 참조할 때 쓰는 key..
    /// context가 없는 곳에서 사용한다기 보다는 이 key를 가지고 있는 Navigator가 context나 state가 있다면(not Null)
    /// 각종 정보를 얻거나 메서드 실행 가능
    navigatorKey: _rootNavigatorKey,

    /// debugLogDiagnostics : true 설정시 아래 경우를 로그로 출력함
    /// [Route] 전환시 발생한 에러, 현재 [Route]와 이전 [Route] 정보, [Route] 파라미터 정보

    /// restorationScopeId 등록 [Restoration] 참고
    // restorationScopeId:

    routes: <RouteBase>[
      ///
      /// GoRoute : 네비게이터를 사용하여 일치하는 상위 경로 위에 시각적으로 표시되는 경로
      /// builder가 반환한 위젯은 [Page]에 래핍되어 루트 [Navigator]나 가장 가까운 [ShellRoute] 조상의 [Navigator] 또는
      /// 일치하는 [parentNavigatorKey]가 있는 [Navigator]에 제공
      ///
      GoRoute(
          // parentNavigatorKey: _rootNavigatorKey,

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
          routes: [
            GoRoute(
              // parentNavigatorKey: _rootNavigatorKey,
              path: secondScreen,
              builder: (context, state) => const SecondScreen(),
            ),
            GoRoute(
              // parentNavigatorKey: _rootNavigatorKey,
              path: thirdScreen,
              name: thirdScreen,
              builder: (context, state) => const ThirdScreen(),
            ),
            ShellRoute(
              navigatorKey: _shellNavigatorKey,
              builder: (context, state, child) => Scaffold(
                appBar: AppBar(),
                bottomNavigationBar: BottomNavigationBar(
                  items: bottomItems,
                  onTap: (index) {
                    context.goNamed(bottomItems[index].label!);
                  },
                ),
                body: child,
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorKey,
                  path: shellOneScreen,
                  name: shellOneScreen,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: Center(
                      child: Text('shell_1'),
                    ),
                  ),
                ),
                GoRoute(
                  parentNavigatorKey: _shellNavigatorKey,
                  path: shellTwoScreen,
                  name: shellTwoScreen,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: Center(
                      child: Text('shell_2'),
                    ),
                  ),
                ),
              ],
            ),
          ]

          /// parentNavigatorKey : 화면을 표시할 [Navigator]를 지정하는 키(옵션)
          /// 루트 [Navigator]를 지정하면 가장 가까운 [ShellRoute] 조상 대신 해당 [Navigator]가 쌓임
          // parentNavigatorKey: navigatorKey,
          ),

      /// ShellRoute : 주변에 UI Shell로 둘러싸인 [Route]
      // ShellRoute(
      //   navigatorKey: _shellNavigatorKey,
      //   builder: (context, state, child) => const FourthScreen(),
      // ),

      /// pageBuilder : 이 경로의 페이지 빌더
      /// CupertinoPage 또는 CustomTransitionPage 사용 가능
      ///
      /// NoTransitionPage : CustomTransitionPage 중 하나로 마치 Route만 쌓는 것 처럼 아무 애니메이션 없음
      // GoRoute(
      //   parentNavigatorKey: _shellNavigatorKey,
      //   path: secondScreen,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const SecondScreen(),
      //   ),
      // ),
    ],
  );
}
