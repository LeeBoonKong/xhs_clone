import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentDetailPage extends StatefulWidget {
  final itemIndex;
  const ContentDetailPage({super.key, required this.itemIndex});

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends State<ContentDetailPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(10.sp),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'heroUserImg_${widget.itemIndex}',
                    child: SizedBox(
                      height: 50.sp,
                      width: 50.sp,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://instagram.fmkz1-2.fna.fbcdn.net/v/t51.2885-19/306888311_891236955171701_3470616429184276317_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fmkz1-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=BCuKOy16bm4AX_NnZvw&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfBrzhit65YorTJahg7QtMEdyH5scpJCmEZWlLymYVDpCg&oe=642B49FF&_nc_sid=8fd12b",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Hero(
                    tag: 'heroUsername_${widget.itemIndex}',
                    child: Text(
                      "Username",
                      style: theme.textTheme.bodyMedium,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              Hero(
                  tag: 'heroImg_${widget.itemIndex}',
                  child: SizedBox(
                    width: 1.sw,
                    height: 300.sp,
                    child: PageView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (index % 2 == 0) {
                          return CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  "https://instagram.fmkz1-1.fna.fbcdn.net/v/t51.2885-15/334613634_1628868230899779_8311926397722148066_n.webp?stp=dst-jpg_e35&_nc_ht=instagram.fmkz1-1.fna.fbcdn.net&_nc_cat=103&_nc_ohc=tIb6FOyTfxQAX_I6_sp&edm=ACWDqb8BAAAA&ccb=7-5&ig_cache_key=MzA1NTk4NTM3NjAyNDgzNDUxNg%3D%3D.2-ccb7-5&oh=00_AfCm0G7bj0V3G7Gza2kRKiF4V63ho_JT5BNQx1c9NCwGYg&oe=642B7515&_nc_sid=1527a3");
                        } else {
                          return Container(
                            color: Colors.pink,
                          );
                        }
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
