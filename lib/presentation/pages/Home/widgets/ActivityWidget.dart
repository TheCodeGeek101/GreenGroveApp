import 'package:flutter/material.dart';
import 'package:green_grove/Data/models/Activities.dart';
import 'package:green_grove/core/Utils/constants.dart';
import 'package:page_transition/page_transition.dart';
import '../../Details/DetailsScreen.dart';

class ActivityWidget extends StatelessWidget {
  final int index;
  final List<Activities> activityList;

  ActivityWidget({
    Key? key, required this.index, required this.activityList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(
                  plantId: activityList[index].activityId,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child:
                    Image.asset(activityList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(activityList[index].activity),
                      Text(
                        activityList[index].effect,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Container(
            //   padding: const EdgeInsets.only(right: 10),
            //   child: Text(
            //     r'$' + activityList[index].price.toString(),
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18.0,
            //       color: Constants.primaryColor,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}