import 'package:flutter/material.dart';

import '../../../models/ForumPost.dart';

class ForumPostCard extends StatelessWidget {
  final ForumPost post;

  ForumPostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 3.0,
      child: ListTile(
        title: Text(post.title),
        subtitle: Text('by ${post.author} • ${post.date}'),
        onTap: () {
          // Implement navigation to view the full post details
          // Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailsPage(post: post)));
        },
      ),
    );
  }
}
