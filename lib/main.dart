import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:xhs_clone/configs/theme.dart';
import 'package:xhs_clone/screens/content/contentDetailPage.dart';
import 'package:xhs_clone/screens/home/homescreen.dart';
import 'package:xhs_clone/screens/home/homescreenNavbar.dart';
import 'package:xhs_clone/screens/loginScreen.dart';
import 'package:xhs_clone/screens/profile/profilePage.dart';
import 'package:xhs_clone/screens/splashScreen.dart';

//This is the entry point to your application, which is also the root of the application
//As a best practice, do not declare any sort of UI here,
//only application-level operations should be defined here.

void main() {
  runApp(const MyApp());
}

// GoRouter Configuration
// All your pages to be declared here
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeRouteNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          getPageWithTransition(state.pageKey, const SplashScreen(), true),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          getPageWithTransition(state.pageKey, const LoginScreen(), true),
    ),
    ShellRoute(
        navigatorKey: _homeRouteNavigatorKey,
        builder: (context, state, child) {
          return HomeScreenWithNavBar(
            child: child,
          );
        },
        routes: [
          GoRoute(
              path: '/home',
              pageBuilder: (context, state) =>
                  getPageWithTransition(state.pageKey, HomePage(), true),
              routes: [
                GoRoute(
                    name: 'detail',
                    path: 'detail',
                    pageBuilder: (context, state) {
                      return getPageWithTransition(
                          state.pageKey,
                          ContentDetailPage(
                            itemIndex: state.queryParams['itemIndex'],
                          ),
                          false);
                    }),
              ]),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                getPageWithTransition(state.pageKey, const ProfilePage(), true),
          )
        ]),
  ],
);

CustomTransitionPage getPageWithTransition(
    LocalKey pageKey, Widget page, bool opaque) {
  return CustomTransitionPage(
      key: pageKey,
      opaque: opaque,
      reverseTransitionDuration: const Duration(milliseconds: 400),
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
              opacity: CurveTween(curve: Curves.easeOutQuad).animate(animation),
              child: child),
      child: page);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeConfig.getTheme(),
          darkTheme: ThemeConfig.getDarkTheme(),
          routerConfig: _router,
        );
      },
    );
  }
}
