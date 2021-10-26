import 'package:flutter/material.dart';
import 'package:facebook_android_ui/models/models.dart';

class CreatePostContainer extends StatelessWidget {

  final User currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(currentUser.imageUrl),
                  radius: 25.0,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0.0),
                        hintText: "What\'s on your mind?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.videocam, color: Colors.red,),
                label: Text("Live"),
              ),
              const SizedBox(height: 25.0,child: VerticalDivider(color: Colors.grey)),
              TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.photo_library, color: Colors.green,),
                label: Text("Photos"),
              ),
              const SizedBox(height: 25.0,child: VerticalDivider(color: Colors.grey)),
              TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.video_call, color: Colors.purple,),
                label: Text("Rooms"),
              ),
            ],
          )
        ],
      ),
    );
  }
}