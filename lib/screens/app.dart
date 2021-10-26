import 'package:facebook_android_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:facebook_android_ui/widgets/widgets.dart';
import 'package:facebook_android_ui/screens/screens.dart';

class AndroidFacebookUI extends StatefulWidget {
  const AndroidFacebookUI({Key? key}) : super(key: key);

  @override
  _AndroidFacebookUIState createState() => _AndroidFacebookUIState();
}

class _AndroidFacebookUIState extends State<AndroidFacebookUI>
    with SingleTickerProviderStateMixin {
  final controller = ScrollController();


  late TabController _tabController;

  static const List<Tab> myTabs = <Tab>[
    Tab(
      icon: Icon(Icons.home, color: Colors.blue),
    ),
    Tab(
      icon: Icon(MdiIcons.accountGroupOutline, color: Colors.blue),
    ),
    Tab(
      icon: Icon(Icons.ondemand_video, color: Colors.blue),
    ),
    Tab(
      icon: Icon(MdiIcons.accountCircleOutline, color: Colors.blue),
    ),
    Tab(
      icon: Icon(MdiIcons.bellOutline, color: Colors.blue),
    ),
    Tab(
      icon: Icon(Icons.menu, color: Colors.blue),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ScrollAppBar(
          elevation: 0.0,
          controller: controller,
          backgroundColor: Colors.white,
          // Note the controller here
          title: Text("facebook", style: kAppTitle),
          centerTitle: false,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPress: () {
                print("search");
              },
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPress: () {
                print("Messenger");
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TabBar(
                controller: _tabController,
                tabs: myTabs,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    controller: controller,
                      child: HomeScreen()
                  ),
                  GroupScreen(),
                  WatchScreen(),
                  AccountScreen(),
                  NotificationScreen(),
                  MoreScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
