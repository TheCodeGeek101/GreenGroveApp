import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Utils/constants.dart';
import '../../SignIn/SignIn.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Constants.primaryColor,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              // Image.asset("assets/images/plant-four.png",height:300),
              Lottie.network(
                "https://lottie.host/37f784d6-2607-4235-9317-64f8f04bf47f/B2N2DilK5l.json",
                height:350,
                width:350,
              ),
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
                              'Ready to make a difference? Let\'s embark on this green adventure with GreenGrove!'
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
    );
  }
}
