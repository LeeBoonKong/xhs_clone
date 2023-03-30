import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(0, 100.sp, 0, 0),
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 60.sp,
              width: 60.sp,
            ),
            Text(
              "My Profile",
              style: theme.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
