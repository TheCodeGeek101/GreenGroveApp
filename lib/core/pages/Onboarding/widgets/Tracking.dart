import 'package:flutter/material.dart';
import 'package:green_grove/core/Utils/colors.dart';
import 'package:green_grove/features/Auth/presentation/pages/SignIn.dart';
import 'package:lottie/lottie.dart';

class Tracking extends StatelessWidget {
  Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Constants.primaryColor,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              // Image.asset("assets/images/plant-two.png",height:300),
              Lottie.network(
                "https://lottie.host/81bee3e4-5679-42a2-bf90-8703ceab5ca3/g174EA1yJg.json",
                height:350,
                width:350,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          'Track Your Impact',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                            height: 10
                        ),
                        Text(
                          'Use GreenGrove to monitor the carbon footprint of your daily choices. From the food you eat to the products you buy,'
                              ' see the environmental impact of your decisions and make informed, eco-friendly choices.'
                          ,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ButtonTheme(
                            height: 50,
                            minWidth:150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // background
                                onPrimary: Constants.primaryColor, // foreground
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (_) => const SignIn()));
                              },
                              child: const Text('Skip'),
                            )
                        )
                      ]
                  )
              ),
            ]
        )
    );
  }
}
