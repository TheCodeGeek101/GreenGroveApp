import 'package:flutter/material.dart';
import 'package:green_grove/core/Utils/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CarbonFootprintIndicator extends StatefulWidget {
  CarbonFootprintIndicator({super.key});

  @override
  _CarbonFootprintIndicatorState createState() {
    return _CarbonFootprintIndicatorState();
  }
}

class _CarbonFootprintIndicatorState extends State<CarbonFootprintIndicator> {

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
    int percent = 60;
    var carbonFootprint = 300;

    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                  radius: 100,
                  animation:true,
                  animationDuration: 1500,
                  lineWidth: 20,
                  percent:0.6,
                  progressColor: Constants.primaryColor,
                  backgroundColor: Colors.green.shade200,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      const Text(
                        "CO2",
                        style: TextStyle(fontSize: 15, color: Color(0xff296e48)),
                      ),
                      Text(
                        "${carbonFootprint}Kg",
                        style: TextStyle(fontSize: 35, color: Color(0xff296e48)),
                      ),
                      const Text(
                        "so far this week ",
                        style: TextStyle(fontSize: 15, color: Color(0xff296e48)),
                      ),
                    ],
                  )
              ),
              SizedBox(height:20),
              Text(
                  'Monitor your carbon footprint and stay aware of your Impact!',
                  style: TextStyle(color:Constants.primaryColor
                  )
              ),
              SizedBox(height: 9),
              Text("${percent}% of Carbon Footprint reduction", style: TextStyle(color: Constants.primaryColor)),
              LinearPercentIndicator(
                  animation:true,
                  animationDuration:3000,
                  lineHeight:25,
                  progressColor: Constants.primaryColor,
                  backgroundColor: Colors.green.shade200,
                  percent: 0.6,

              )
            ],
          )
        )
      ),
    );
  }
}