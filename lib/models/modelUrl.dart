import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri Facebook_url = Uri.parse('https://www.facebook.com');
final Uri instagram_url = Uri.parse('https://www.instagram.com/abcit000/');

Future<void> Facebook_Function() async {
  if (!await launchUrl(Facebook_url)) {
    throw 'Could not launch $Facebook_url';
  }
}

Future<void> instagram_function() async {
  if (!await launchUrl(instagram_url)) {
    throw 'Could not launch $instagram_url';
  }
}

class URlClass extends StatelessWidget {
  URlClass(
      {required this.myfunction,
      required this.myplatformIcon,
      required this.myplatformSubTitle,
      required this.myplatformTitle});

  String? myplatformTitle;
  String? myplatformSubTitle;

  IconData? myplatformIcon;
  Function()? myfunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myfunction,
      child: ListTile(
        title: Text("$myplatformTitle"),
        subtitle: Text("$myplatformSubTitle"),
        leading: Icon(myplatformIcon),
      ),
    );
  }
}
