import 'package:flutter/material.dart';
import 'package:green_grove/pages/Community/widgets/ForumList.dart';

class CommunityForumPage extends StatefulWidget {
  @override
  _CommunityForumPageState createState() => _CommunityForumPageState();
}

class _CommunityForumPageState extends State<CommunityForumPage> {
  bool isUserJoined = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Forum'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to the Community Forum!',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          if (!isUserJoined)
            ElevatedButton(
              onPressed: () {
                // Simulate joining the forum
                setState(() {
                  isUserJoined = true;
                });
              },
              child: Text('Join the Forum'),
            ),
          // if (isUserJoined)
            // Expanded(
            //   child: ForumList(),
            // ),
        ],
      ),
    );
  }
}



