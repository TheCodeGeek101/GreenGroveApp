import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:green_grove/pages/SignIn/SignIn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../Utils/constants.dart';
import 'Carbon Footprint Tracker/CarbonFootprintTracker.dart';
import 'Educational Hub/EducationalHub.dart';
import 'Home/HomeScreen.dart';
import 'Profile/ProfilePage.dart';
import 'ScanPage.dart';
import 'Statistics/Stats.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

final advancedDrawerController = AdvancedDrawerController();

class _RootPageState extends State<RootPage> {

  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [
      HomeScreen(),
      Stats(),
      CarbonFootprintTracker(),
      const ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.analytics_sharp,
    Icons.track_changes,
    Icons.person,
  ];

  List<String> titleList = [
    'Home',
    'Statistics',
    'Carbon Tracker',
    'Profile',
  ];

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon,color:Constants.primaryColor),
      title: Text(title,style: TextStyle(color:Constants.primaryColor)),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      openRatio: 0.55,
      openScale: 0.80,
      backdropColor: Colors.grey.shade200,
      rtlOpening: false,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 500),
      controller: advancedDrawerController,
      drawer: SafeArea(
        child:SingleChildScrollView(
    child:
        Column(
          children: [
            SizedBox(height: 5,),
            Image.asset("assets/images/greengrove.png",height:80),
            SizedBox(height: 32,),
            // New Drawer Items
            _buildDrawerItem(
              icon: FontAwesomeIcons.book,
              title: 'Education Hub',
              onTap: () {
                // Handle navigation to Product Comparisons screen
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => EducationalHub()));
              },
            ),
            // _buildDrawerItem(
            //   icon: Icons.eco,
            //   title: 'Carbon offset programs',
            //   onTap: () {
            //     // Handle navigation to Sustainable Practices screen
            //     // Navigator.pushReplacement(context,
            //     //     MaterialPageRoute(builder: (_) => const SignIn()));
            //   },
            // ),

            // ... add more Drawer Items for additional features
            _buildDrawerItem(
              icon: Icons.people,
              title: 'Community Forum',
              onTap: () {
                // Handle navigation to Community Forum screen
              },
            ),
            _buildDrawerItem(
              icon: Icons.person_add,
              title: 'Invite friends',
              onTap: () {
                // Handle navigation to Community Forum screen
              },
            ),
            _buildDrawerItem(
              icon: Icons.feedback,
              title: 'Feedback & Support',
              onTap: () {
                // Handle navigation to Impact Insights screen
              },
            ),

            _buildDrawerItem(
              icon: FontAwesomeIcons.bullseye,
              title: 'Goals & Challenges',
              onTap: () {
                // Handle navigation to Challenges and Rewards screen
              },
            ),
            // _buildDrawerItem(
            //   icon: Icons.new_releases,
            //   title: 'News & Updates',
            //   onTap: () {
            //     // Handle navigation to News and Updates screen
            //   },
            // ),
            _buildDrawerItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                // Handle navigation to News and Updates screen
              },
            ),
            _buildDrawerItem(
              icon: Icons.help,
              title: 'Help center',
              onTap: () {
                // Handle navigation to Impact Insights screen
              },
            ),
            _buildDrawerItem(
              icon: Icons.exit_to_app,
              title: 'Log out',
              onTap: () {
                // Handle navigation to News and Updates screen
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => SignIn()));
              },
            ),

          ],
        ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleList[_bottomNavIndex],
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Icon(Icons.notifications, color: Constants.blackColor, size: 30.0)
            ],
          ),
          leading: IconButton(
            onPressed: () {
              drawerControl();
            },
            icon: const Icon(Icons.menu, color: Color(0xff296e48) ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
        ),
        body: IndexedStack(
          index: _bottomNavIndex,
          children: _widgetOptions(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                child: const ScanPage(),
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
          child: Image.asset('assets/images/code-scan-two.png', height: 30.0),
          backgroundColor: Constants.primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              // _updateLists();
            });
          },
        ),
      ),
    );
  }

  void drawerControl() {
    advancedDrawerController.showDrawer();
  }
}
