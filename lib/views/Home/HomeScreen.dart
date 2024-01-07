import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:green_grove/views/Home/widgets/CarbonFootprintIndicator.dart';
import 'package:green_grove/views/Home/widgets/Statistics.dart';
import 'package:page_transition/page_transition.dart';
import '../../Utils/constants.dart';
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
    List<Plant> _plantList = Plant.plantList;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // CarbonFootprintBarChart(),
              CarbonFootprintIndicator(),
              Container(
                padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
                child: const Text(
                  'Recent Activity',
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
                    itemCount: _plantList.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: (){
                            Navigator.push(context, PageTransition(child: DetailPage(plantId: _plantList[index].plantId), type: PageTransitionType.bottomToTop));
                          },
                          child: PlantWidget(index: index, plantList: _plantList));
                    }),
              ),
            ],
          ),
        ));
  }
}