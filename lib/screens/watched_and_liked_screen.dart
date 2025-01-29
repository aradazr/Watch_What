import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:watch_what/constans/app_colors.dart';
import 'package:watch_what/screens/liked_screen.dart';

class WatchedAndLikedScreen extends StatelessWidget {
  const WatchedAndLikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: DarkColors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        backgroundColor: DarkColors.black,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'assets/images/back.png',
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Series',
              style: TextStyle(color: DarkColors.white, fontFamily: 'mont'),
            ),
          ],
        ),
        centerTitle: false,
        leadingWidth: 20,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: DarkColors.black,
        width: size.width / 1,
        height: size.height / 1,
        child: ContainedTabBarView(
          tabBarProperties: const TabBarProperties(
            indicatorColor: DarkColors.redButton,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            labelColor: DarkColors.white,
            unselectedLabelColor: DarkColors.white,
            labelPadding: EdgeInsets.zero,
            labelStyle: TextStyle(
                fontSize: 16, fontFamily: 'mont', fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(
                fontSize: 16, fontFamily: 'mont', fontWeight: FontWeight.bold),
          ),
          tabs: const [
            Text('First'),
            Text('Second'),
          ],
          views: [
            const WatchedScreen(),
            Container(color: Colors.green),
          ],
        ),
      ),
    );
  }
}
