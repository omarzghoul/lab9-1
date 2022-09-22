import 'dart:io';

import 'package:cookoff/models/modelUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class Cook_off extends StatefulWidget {
  const Cook_off({super.key});

  @override
  State<Cook_off> createState() => _Cook_offState();
}

class _Cook_offState extends State<Cook_off> {
  int gordenVotes = 20;

  int matheaVotes = 20;

  File? image;

  String chif = "";
  String name = "";
  Future _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 120, 75, 243),
            title: Text("CookOFF!"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.info,
                  color: Color.fromARGB(255, 249, 134, 126),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.people,
                  color: Color.fromARGB(255, 249, 134, 126),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.photo_sharp,
                  color: Color.fromARGB(255, 249, 134, 126),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.share,
                  color: Color.fromARGB(255, 249, 134, 126),
                ),
              ),
            ]),
          ),
          body: TabBarView(children: [tab1(), tab2(), tab3(), tab4()]),
        ));
  }

  Widget tab4() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 249, 134, 126),
        Color.fromARGB(255, 120, 75, 243),
      ])),
      child: SingleChildScrollView(
        child: Column(
          children: [
            image != null
                ? Image.file(
                    image!,
                    width: 200,
                    height: 200,
                  )
                : Image.asset(
                    "images/image.jpg",
                    width: 200,
                    height: 200,
                  ),
            ElevatedButton(
                onPressed: () {
                  _pickImage();
                },
                child: Text("Take Photo")),
            Text(
              "Description",
            ),
            const SizedBox(
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey))),
                expands: true,
                maxLines: null,
              ),
            ),
            Text("Choice Chef"),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            RadioListTile(
              value: "gorden",
              title: Text("gorden"),
              groupValue: chif,
              onChanged: (value) {
                setState(() {
                  chif = value.toString();
                  name = "Gorden";
                });
              },
            ),
            RadioListTile(
              value: "mathea",
              title: Text("mathea"),
              groupValue: chif,
              onChanged: (value) {
                setState(() {
                  chif = value.toString();
                  name = "Mathea";
                });
              },
            ),
            Text("Choice Chef"),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("$name"),
                  RatingBar.builder(
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tab3() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 249, 134, 126),
        Color.fromARGB(255, 120, 75, 243),
      ])),
      child: Column(
        children: [
          // Padding(
          // padding: const EdgeInsets.all(16.0),
          Image.asset(
            "images/2.jpg",
            width: 300,
            height: 400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gordenVotes++;
                        });
                      },
                      child: Text("vote")),
                  Text("$gordenVotes")
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          matheaVotes++;
                        });
                      },
                      child: Text("vote")),
                  Text("$matheaVotes")
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget tab1() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 249, 134, 126),
        Color.fromARGB(255, 120, 75, 243),
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Image(
                image: NetworkImage(
                    "https://yt3.ggpht.com/bFpwiiOB_NLCVsIcVQ9UcwBjb1RzipnMmtNfLSWpeIaHboyGkBCq4KBitmovRbStk9WvIWIZOyo=s900-c-k-c0x00ffffff-no-rj")),
            title: Text("Gorden Ramsay"),
            subtitle: Text("55 year old British chef"),
            trailing: Icon(Icons.male),
            onTap: () {
              AlertDialog alert = AlertDialog(
                backgroundColor: Colors.blueAccent,
                title: Text("Gorden Ramsay"),
                content: Text(
                  "a British chef, restaurateur, television personality and writer. His restaurant group, Gordon Ramsay Restaurants, was founded in 1997 and has been awarded 16 Michelin stars overall; it currently holds a total of seven. Michelin Starred is His signature restaurant, Restaurant Gordon Ramsay in Chelsea, London, has held three Michelin stars since 2001. After rising to fame on the British television miniseries Boiling Point in 1999, Ramsay became one of the best-known and most influential chefs in the United Kingdom.",
                ),
                actions: [],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          ),
          ListTile(
            leading: Image(
                image: NetworkImage(
                    "https://media.self.com/photos/60df3d8c11cf3ada53f4949c/4:3/w_3647,h_2735,c_limit/1209597225")),
            title: Text("Martha Stewart"),
            subtitle: Text("81 Amirican chef"),
            trailing: Icon(Icons.female),
            onTap: () {
              AlertDialog alert = AlertDialog(
                backgroundColor: Colors.red,
                title: Text("Martha Stewart"),
                content: Text(
                  "an American retail businesswoman, writer, and television personality. As founder of Martha Stewart Living Omnimedia, she gained success through a variety of business ventures, encompassing publishing, broadcasting, merchandising and e-commerce. She has written numerous bestselling books, is the publisher of Martha Stewart Living magazine and hosted two syndicated television programs: Martha Stewart Living, which ran from 1993 to 2004, and Martha, which ran from 2005 to 2012.",
                ),
                actions: [],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          )
        ],
      ),
    );
  }

  Widget tab2() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 249, 134, 126),
        Color.fromARGB(255, 120, 75, 243),
      ])),
      child: ListView(
        children: [
          Column(
            children: [
              Image(
                  width: 300,
                  height: 300,
                  image: NetworkImage(
                      "https://media12.s-nbcnews.com/i/MSNBC/Components/Video/202101/1609854253638_tdy_food_8a_martha_stewart_new_book_tips_enjoy_210105_1920x1080.jpg")),
              URlClass(
                  myfunction: Facebook_Function,
                  myplatformIcon: Icons.facebook,
                  myplatformSubTitle: "sss",
                  myplatformTitle: "sss"),
              URlClass(
                  myfunction: instagram_function,
                  myplatformIcon: Ionicons.logo_instagram,
                  myplatformSubTitle: "sss",
                  myplatformTitle: "sss"),
            ],
          ),
          Column(
            children: [
              Image(
                  width: 300,
                  height: 300,
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/80/1d/90/801d90bddba8bc272a7f27d67d2552f8.jpg")),
            ],
          )
        ],
      ),
    );
  }
}
