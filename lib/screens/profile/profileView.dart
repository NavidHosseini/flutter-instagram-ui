import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screens/profile/Profile.dart';
import 'package:instagram/screens/profile/tabs/tabPost/TabMyPost.dart';

class ProfileView extends StatelessWidget {
  // const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileContoroller = Get.put(ProfileContoroller());
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, isScolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  collapsedHeight:
                      profileContoroller.isShowSuggestion.value ? 700 : 540,
                  expandedHeight:
                      profileContoroller.isShowSuggestion.value ? 700 : 540,
                  flexibleSpace: Profile(),
                ),
                SliverPersistentHeader(
                  delegate: MyDelegate(TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on)),
                      // Tab(icon: Icon(Icons.favorite_border_outlined)),
                      Tab(icon: Icon(Icons.bookmark_border)),
                    ],
                    indicatorColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                  )),
                  floating: true,
                  pinned: true,
                )
              ];
            },
            body: profileContoroller.isShowSuggestion.value
                ? TabBarView(children: [
                    TabMyPost(),
                    TabMyPost(),
                  ])
                : TabBarView(children: [
                    TabMyPost(),
                    TabMyPost(),
                  ]),
          ),
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
