import 'package:facebook_android_ui/config/palette.dart';
import 'package:facebook_android_ui/models/models.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  List<User> onlineUsers;

  Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: onlineUsers.length + 1,
        itemBuilder: (context, index) {
          return index == 0
              ? Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  width: 120.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.blue),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.video_call,
                        color: Colors.purple,
                        size: 30.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Create\nRoom",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Palette.facebookBlue),
                      ),
                    ],
                  ),
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            NetworkImage(onlineUsers[index - 1].imageUrl),
                      ),
                    ),
                    Positioned(
                      bottom: 15.0,
                      right: 12.0,
                      child: Container(
                        height: 15.0,
                        width: 15.0,
                        decoration: BoxDecoration(
                          color: Palette.online,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white,width: 2.0)
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
