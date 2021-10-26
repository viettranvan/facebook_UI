import 'package:facebook_android_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_android_ui/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreatePostContainer(currentUser: currentUser),
        const SizedBox(height: 10.0),
        Rooms(onlineUsers: onlineUsers),
        const SizedBox(height: 10.0),
        Stories(currentUser: currentUser,stories: stories),
        const SizedBox(height: 10.0),
        Posts(posts: posts),
      ],
    );
  }
}


