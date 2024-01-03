import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../Utils/constants.dart';
import '../models/plant.dart';
import 'Cart/CartPage.dart';
import 'Favourites/Favourites.dart';
import 'Home/HomeScreen.dart';
import 'Profile/ProfilePage.dart';
import 'ScanPage.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

final advancedDrawerController = AdvancedDrawerController();

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [
      HomeScreen(),
      FavoritePage(favoritedPlants: favorites),
      CartPage(addedToCartPlants: myCart),
      const ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
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

  void _updateLists() {
    final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
    final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

    favorites = favoritedPlants;
    myCart = addedToCartPlants.toSet().toList();
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
        child: Column(
          children: [
            // CircleAvatar(
            //   radius: 72,
            //   backgroundImage: ,
            // ),
            SizedBox(height: 12,),
            Image.asset("assets/images/greengrove.png",height:80),
            SizedBox(height: 52,),
            // New Drawer Items
            _buildDrawerItem(
              icon: Icons.insert_chart,
              title: 'Carbon History',
              onTap: () {
                // Handle navigation to Carbon Footprint History screen
              },
            ),
            _buildDrawerItem(
              icon: Icons.compare,
              title: 'Product Comparisons',
              onTap: () {
                // Handle navigation to Product Comparisons screen
              },
            ),
            _buildDrawerItem(
              icon: Icons.eco,
              title: 'Sustainable Practices',
              onTap: () {
                // Handle navigation to Sustainable Practices screen
              },
            ),

            // ... add more Drawer Items for additional features
            _buildDrawerItem(
              icon: Icons.forum,
              title: 'Community Forum',
              onTap: () {
                // Handle navigation to Community Forum screen
              },
            ),

            _buildDrawerItem(
              icon: Icons.trending_up,
              title: 'Impact Insights',
              onTap: () {
                // Handle navigation to Impact Insights screen
              },
            ),

            _buildDrawerItem(
              icon: Icons.emoji_events,
              title: 'Challenges & Rewards',
              onTap: () {
                // Handle navigation to Challenges and Rewards screen
              },
            ),
            _buildDrawerItem(
              icon: Icons.new_releases,
              title: 'News & Updates',
              onTap: () {
                // Handle navigation to News and Updates screen
              },
            ),


          ],
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
                  color: Constants.blackColor,
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
              _updateLists();
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
