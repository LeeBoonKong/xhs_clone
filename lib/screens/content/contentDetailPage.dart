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
                    child: Container(
                      color: Colors.red,
                      height: 50.sp,
                      width: 50.sp,
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
                                  "https://instagram.fmkz1-2.fna.fbcdn.net/v/t51.2885-19/306888311_891236955171701_3470616429184276317_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fmkz1-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=BCuKOy16bm4AX84bftP&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfDhjPR5eLvf_R3eyR9Y21KrvwTApdbxT3v366WGZVNEZw&oe=642B49FF&_nc_sid=1527a3");
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
