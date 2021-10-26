import 'package:facebook_android_ui/config/palette.dart';
import 'package:facebook_android_ui/models/models.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final List<Story> stories;
  final User currentUser;

  const Stories({Key? key, required this.currentUser, required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
        itemCount: stories.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: double.infinity,
                width: 120.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    index == 0
                        ? currentUser.imageUrl
                        : stories[index - 1].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                right: 5.0,
                child: Text(
                  index == 0 ? "Add to Story" : stories[index - 1].user.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
              Positioned(
                top: 15.0,
                left: 10.0,
                child: index == 0
                    ? Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Palette.facebookBlue,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      )
                    : CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Palette.facebookBlue,
                      child: CircleAvatar(
                          radius: (stories[index-1].isViewed ?? false) ? 20.0 : 17.0,
                          backgroundColor: Colors.grey[200],
                          backgroundImage:
                              NetworkImage(stories[index - 1].user.imageUrl),
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
