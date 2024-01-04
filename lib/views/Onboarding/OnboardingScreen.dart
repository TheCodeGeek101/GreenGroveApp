import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../Utils/constants.dart';
import '../SignIn/SignIn.dart';
class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
    // TODO: implement build
      final pages = [
        Container(
        color: Colors.grey.shade400,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Image.asset("assets/images/greengrove.png"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      'Welcome to GreenGrove!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 10
                    ),
                    Text(
                      'Discover a revolutionary way to track and reduce your carbon footprint. '
                          'Join us on a journey towards sustainable living and make a positive impact on the planet.'
                    ,
                      style: TextStyle(color: Constants.primaryColor),
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
                      ),
                    ),
                    SizedBox(
                      height:20
                    ),
                    Center(child: Text('Swipe left to continue...',style:TextStyle(color:Constants.primaryColor))),
                    SizedBox(
                        height:20
                    ),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('GreenGrove', style:TextStyle(color:Color(0xff296e48)))),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height:20),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Center(
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: 'Powered by ',
                              style: TextStyle(
                                color: Constants.blackColor,
                              ),
                            ),
                            TextSpan(
                              text: 'techbythembinkosi.com',
                              style: TextStyle(
                                color: Constants.primaryColor,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ]
                )
              ),
            ]
          )
        ),

        Container(
            color: Constants.primaryColor,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Image.asset("assets/images/plant-two.png",height:300),
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
        ),
        Container(
            color: Colors.grey.shade400,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Image.asset("assets/images/plant-three.png",height:300),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal:20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(
                              'Cultivate a Greener Tomorrow',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.primaryColor,
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
                              style: TextStyle(color: Constants.primaryColor),
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
        ),
        Container(
            color: Constants.primaryColor,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Image.asset("assets/images/plant-four.png",height:300),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal:20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(
                              'Join the Green Movement',
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
                              'Be part of a community committed to environmental stewardship. Share your sustainable journey,'
                                  ' connect with like-minded individuals in our forum, and together, let\'s turn every small action into a big change.'
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
                                child: const Text('Get Started'),
                              )
                            )
                          ]
                      )
                  ),
                ]
            )
        ),

      ];

    return Scaffold(
      body: LiquidSwipe(
        pages:pages,
        positionSlideIcon: 0,
        slideIconWidget: Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Colors.white,
        )
      )
    );
  }
}