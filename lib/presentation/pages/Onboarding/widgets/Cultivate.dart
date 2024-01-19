import 'package:flutter/material.dart';
import 'package:green_grove/core/Utils/constants.dart';
import 'package:lottie/lottie.dart';
import '../../SignIn/SignIn.dart';

class CultivateScreen extends StatelessWidget {
  CultivateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // color: Colors.grey.shade300,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:[Colors.white,Constants.primaryColor],
            )
        ),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              // Image.asset("assets/images/plant-three.png",height:300),
              Lottie.network(
                "https://lottie.host/d61e7a83-6ef8-4ab2-a522-c5401b2db856/C0x7vMc1HW.json",
                height:350,
                width:350,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          'Cultivate a Greener Tomorrow',
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
                          'GreenGrove empowers you to adopt sustainable practices. Learn about eco-friendly farming,'
                              ' contribute to challenges, and earn rewards. Together, let\'s cultivate a greener, healthier future'
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
                                primary: Constants.primaryColor, // background
                                onPrimary: Colors.white, // foreground
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
