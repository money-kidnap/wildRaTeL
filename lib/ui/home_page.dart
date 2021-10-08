import 'package:first_ratel/services/notification_services.dart';
import 'package:first_ratel/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification;
    notifyHelper.requestIOSPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: const [
          Text("Theme Data",
            style: TextStyle(
                fontSize: 30
            ),
          )
        ],
      ),
    );
  }


  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light Theme"
                  : "Activated Dark Theme"
          );
          notifyHelper.scheduledNotification();
        },
        child: const Icon(Icons.nightlight_round,
          size: 20,),
      ),
      actions: const [
        Icon(Icons.person,
          size: 20,),
        SizedBox(width: 20,),
      ],
    );
  }
}