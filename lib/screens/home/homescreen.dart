import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Random rand = Random();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10.sp),
      child: GridView.custom(
        gridDelegate: SliverStairedGridDelegate(
          crossAxisSpacing: 15.sp,
          mainAxisSpacing: 12.sp,
          startCrossAxisDirectionReversed: true,
          pattern: [
            StairedGridTile(0.5, 1),
            StairedGridTile(0.5, 4 / 4),
            StairedGridTile(1.0, 7 / 4),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) => GestureDetector(
            onTap: () {
              context.pushNamed('detail',
                  queryParams: {'itemIndex': index.toString()});
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: 'heroImg_$index',
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://instagram.fmkz1-2.fna.fbcdn.net/v/t51.2885-19/306888311_891236955171701_3470616429184276317_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fmkz1-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=BCuKOy16bm4AX84bftP&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfDhjPR5eLvf_R3eyR9Y21KrvwTApdbxT3v366WGZVNEZw&oe=642B49FF&_nc_sid=1527a3"),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Row(
                      children: [
                        Hero(
                          tag: 'heroUserImg_$index',
                          child: Container(
                            color: Colors.red,
                            height: 25.sp,
                            width: 25.sp,
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Hero(
                          tag: 'heroUsername_$index',
                          child: Text(
                            "Username",
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
