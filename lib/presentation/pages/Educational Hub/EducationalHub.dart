import 'package:flutter/material.dart';
import 'package:green_grove/Data/models/Education.dart';
import 'package:green_grove/core/Utils/constants.dart';
import '../Home/HomeScreen.dart';
import '../RootPage.dart';
import 'Widgets/DetailsWidget.dart';


class EducationalHub extends StatefulWidget {
  EducationalHub({Key? key}) : super(key: key);

  @override
  _EducationalHubState createState() {
    return _EducationalHubState();
  }
}

class _EducationalHubState extends State<EducationalHub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education Hub',style:TextStyle(color:Constants.primaryColor)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => RootPage()));
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey.shade100,
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors:[Constants.primaryColor, Colors.white]
      //         )
      // ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to the Education Hub',
                    style: TextStyle(fontSize: 24, color: Constants.primaryColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Explore a variety of educational content on environmental awareness, sustainable living, and more.',
                    style: TextStyle(fontSize: 16,color:Colors.grey)
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: EducationData.getEducationItems().length,
              itemBuilder: (context, index) {
                return _buildEducationItem(EducationData.getEducationItems()[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(EducationModel educationItem) {
    return Card(
      elevation: 3.0,
      color: Constants.primaryColor,
      margin: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(educationItem.icon,color:Colors.white),
        title: Text(educationItem.title,style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)),
        subtitle: Text(educationItem.description,style:TextStyle(color:Colors.grey.shade400)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsWidget(title: educationItem.title, content: educationItem.description),
            ),
          );
        },
      ),
    );
  }
}
