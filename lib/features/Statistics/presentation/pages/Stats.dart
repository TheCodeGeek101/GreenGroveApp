import 'package:flutter/material.dart';
import 'package:green_grove/features/Statistics/Data/models/Recommendations.dart';
import 'package:green_grove/features/Statistics/Data/models/Rewards.dart';
import 'package:green_grove/features/Statistics/presentation/Widgets/RecommendationsWidget.dart';
import 'package:green_grove/features/Statistics/presentation/Widgets/RewardsWidget.dart';
import 'package:green_grove/features/Statistics/presentation/Widgets/Statistics.dart';

class Stats extends StatefulWidget {
  Stats({super.key});

  @override
  _StatsState createState() {
    return _StatsState();
  }
}

class _StatsState extends State<Stats> {
  List<Recommendations> _recommendationsList = Recommendations.recommendationsList;
  List<Rewards> _rewardsList = Rewards.rewardsList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarbonFootprintBarChart(),
            _buildSectionTitle('Recommendations'),
            _buildRecommendationsList(size),
            _buildSectionTitle('Rewards'),
            _buildRewardsList(size),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildRecommendationsList(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: size.height * .5,
      child: ListView.builder(
        itemCount: _recommendationsList.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(context, PageTransition(child: DetailPage(plantId: _plantList[index].plantId), type: PageTransitionType.bottomToTop));
            },
            child: RecommendationsWidget(
              index: index,
              recommendationsList: _recommendationsList,
            ),
          );
        },
      ),
    );
  }

  Widget _buildRewardsList(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: size.height * .5,
      child: ListView.builder(
        itemCount: _rewardsList.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(context, PageTransition(child: DetailPage(plantId: _plantList[index].plantId), type: PageTransitionType.bottomToTop));
            },
            child: RewardsWidget(
              index: index,
              rewardsList: _rewardsList,
            ),
          );
        },
      ),
    );
  }
}