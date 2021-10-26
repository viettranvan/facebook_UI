import 'package:facebook_android_ui/config/palette.dart';
import 'package:facebook_android_ui/models/models.dart';
import 'package:facebook_android_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Posts extends StatelessWidget {
  final List<Post> posts;

  Posts({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(posts[index].user.imageUrl),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posts[index].user.name, style: kUserName),
                        Row(
                          children: [
                            Text("${posts[index].timeAgo} • ", style: kTimeAgo),
                            Icon(
                              Icons.public,
                              color: Colors.grey,
                              size: 18.0,
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                child: Text(
                  posts[index].caption,
                  style: kCaption,
                ),
              ),
              posts[index].imageUrl != null
                  ? Image.network(posts[index].imageUrl!)
                  : SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 25.0,
                      width: 25.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Palette.facebookBlue),
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Text(posts[index].likes.toString(), style: kReaction),
                    Spacer(),
                    Text(
                      "${posts[index].comments.toString()} Comments • ${posts[index].comments.toString()} Shares",
                      style: kReaction,
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1.0,indent: 8.0,endIndent: 8.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _PostButton(
                      icon: MdiIcons.thumbUpOutline,
                      title: "Like",
                      onTap: (){print("Like");},
                    ),
                  ),
                  Expanded(
                    child: _PostButton(
                      icon: MdiIcons.commentOutline,
                      title: "Comment",
                      onTap: (){print("Comment");},
                    ),
                  ),
                  Expanded(
                    child: _PostButton(
                      icon: MdiIcons.shareOutline,
                      title: "Share",
                      onTap: (){print("Share");},
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PostButton extends StatelessWidget {

  final IconData icon;
  final String title;
  Function()? onTap;


  _PostButton({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 5.0),
            Text(title)
          ],
        ),
      ),
    );
  }
}
