import 'package:flutter/material.dart';
import 'package:green_grove/features/Home/Data/models/Activities.dart';
import 'package:green_grove/features/Home/presentation/widgets/ActivityWidget.dart';
import 'package:green_grove/features/Home/presentation/widgets/CarbonFootprintIndicator.dart';

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