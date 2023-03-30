import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreenWithNavBar extends StatefulWidget {
  final Widget child;
  const HomeScreenWithNavBar({super.key, required this.child});

  @override
  State<HomeScreenWithNavBar> createState() => _HomeScreenWithNavBarState();
}

class _HomeScreenWithNavBarState extends State<HomeScreenWithNavBar> {
  bool _visible = true;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                if (_visible != false) {
                  //Checking to prevent setting the same state multiple times
                  setState(() {
                    _visible = false;
                  });
                }
              } else if (direction == ScrollDirection.forward) {
                if (_visible != true) {
                  setState(() {
                    _visible = true;
                  });
                }
              }
              return true;
            },
            child: widget.child),
        Align(
          alignment: Alignment.bottomCenter,
          child: IgnorePointer(
            ignoring: !_visible,
            child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _visible ? 1.0 : 0.0,
                child: Container(
                  key: UniqueKey(),
                  margin: EdgeInsets.fromLTRB(10.sp, 0, 10.sp, 20.sp),
                  height: 75.sp,
                  width: 0.9.sw,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                  child: Row(children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _index = 0;
                          context.go('/home');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              size: 25.sp,
                              color: _index == 0 ? Colors.red : Colors.white,
                            ),
                            Text(
                              "Home",
                              style: theme.textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _index = 1;
                          context.go('/profile');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.verified_user,
                              size: 25.sp,
                              color: _index == 1 ? Colors.red : Colors.white,
                            ),
                            Text(
                              "Profile",
                              style: theme.textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                )),
          ),
        )
      ],
    );
  }
}
