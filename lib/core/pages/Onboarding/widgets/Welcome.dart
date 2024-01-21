import 'package:flutter/material.dart';
import 'package:green_grove/core/Utils/colors.dart';
import 'package:green_grove/features/Auth/presentation/pages/SignIn.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Constants.primaryColor],
            )
        ),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              // Image.asset("assets/images/greengrove.png"),
              Lottie.network(
                "https://lottie.host/f58f21b4-774a-4ea5-bbdb-df5c18f9e0e9/YlP65xM7my.json",
                height:350,
                width:350,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          'Welcome to GreenGrove!',
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
                          'Discover a revolutionary way to track and reduce your carbon footprint. '
                              'Join us on a journey towards sustainable living and make a positive impact on the planet.'
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
                          ),
                        ),
                        SizedBox(
                            height:20
                        ),
                        Center(child: Text('Swipe left to continue...',style:TextStyle(color:Colors.white))),
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
                                    color: Colors.white,
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
    );
  }
}
