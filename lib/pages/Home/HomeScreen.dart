import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:green_grove/pages/Home/widgets/ActivityWidget.dart';
import 'package:green_grove/pages/Home/widgets/CarbonFootprintIndicator.dart';
import 'package:green_grove/pages/Statistics/Widgets/Statistics.dart';
import 'package:page_transition/page_transition.dart';
import '../../Utils/constants.dart';
import '../../models/Activities.dart';
import '../../models/plant.dart';
import '../Details/DetailsScreen.dart';
import '../widgets/plant_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Activities> _recentActivityList = Activities.recentActivities;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarbonFootprintIndicator(),
              Container(
                padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
                child: const Text(
                  'Recent Activities',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: size.height * .5,
                child: ListView.builder(
                    itemCount: _recentActivityList.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: (){
                            // Navigator.push(context, PageTransition(child: DetailPage(plantId: _recentActivityList[index].activityId), type: PageTransitionType.bottomToTop));
                          },
                      child: ActivityWidget(index: index, activityList: _recentActivityList,)
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}