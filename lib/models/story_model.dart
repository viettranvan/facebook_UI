import 'package:facebook_android_ui/models/user_model.dart';

class Story{
  final User user;
  final String imageUrl;
  bool? isViewed;

  Story({
    required this.user,
    required this.imageUrl,
    this.isViewed
  });
}
