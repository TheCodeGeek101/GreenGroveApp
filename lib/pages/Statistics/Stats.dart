import 'package:flutter/material.dart';
import 'package:green_grove/models/Rewards.dart';
import 'package:green_grove/pages/Statistics/Widgets/RecommendationsWidget.dart';
import '../../models/Recommendations.dart';
import 'Widgets/RewardsWidget.dart';
import 'Widgets/Statistics.dart';

class Stats extends StatefulWidget {
  Stats({super.key});

  @override
  _StatsState createState() {
    return _StatsState();
  }
}

class _StatsState extends State<Stats> {
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
    List<Recommendations> _recommendationsList = Recommendations.recommendationsList;
    List<Rewards> _rewardsList = Rewards.rewardsList;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarbonFootprintBarChart(),
              Container(
                padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
                child: const Text(
                  'Recommendations',
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
                    itemCount: _recommendationsList.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: (){
                            // Navigator.push(context, PageTransition(child: DetailPage(plantId: _plantList[index].plantId), type: PageTransitionType.bottomToTop));
                          },
                          child:
                          RecommendationsWidget(
                              index: index,
                              recommendationsList: _recommendationsList
                          )
                      );
                    }),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, bottom: 20, top: 10),
                child: const Text(
                  'Rewards',
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
                    itemCount: _rewardsList.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: (){
                            // Navigator.push(context, PageTransition(child: DetailPage(plantId: _plantList[index].plantId), type: PageTransitionType.bottomToTop));
                          },
                          child: RewardsWidget(index: index,rewardsList: _rewardsList,)
                      );
                    }),
              ),
            ],
          ),
        )
    );
  }
}