import 'package:cookoff/screens/cookPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 249, 134, 126),
          title: Text("CookOFF!"),
        ),
        drawer: Drawer(
            backgroundColor: Color.fromARGB(255, 120, 75, 243),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "This is a CookOFF!",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  "Choose your reciepe based on the CHEF",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "May the best Chef WIN!",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 249, 134, 126),
            Color.fromARGB(255, 120, 75, 243),
          ])),
          child: ListView(
            children: [
              Container(
                  child: Column(
                children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            child: Image(
                                image: NetworkImage(
                                    "https://i.dailymail.co.uk/1s/2022/08/12/21/61338741-0-image-a-25_1660337237034.jpg")),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            child: Image(
                                image: NetworkImage(
                                    "https://static.onecms.io/wp-content/uploads/sites/34/2021/12/17/martha-stewart-stainless-steel-cookware-merch-1221.jpg")),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            child: Image(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Martha_Stewart_%2848926315347%29_%28cropped%29.jpg/1300px-Martha_Stewart_%2848926315347%29_%28cropped%29.jpg")),
                          ),
                        ],
                      )),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            child: Image(
                                image: NetworkImage(
                                    "https://hips.hearstapps.com/delish/assets/17/18/1493652604-photo2-1493437634073-13-hr.jpg")),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            child: Image(
                                image: NetworkImage(
                                    "https://media.timeout.com/images/105854659/image.jpg")),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            child: Image(
                                image: NetworkImage(
                                    "https://www.grandcentralpublishing.com/wp-content/uploads/2017/06/GR.jpg?resize=500%2C700")),
                          ),
                        ],
                      )),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Cook_off();
                        }));
                      },
                      icon: Icon(
                        Icons.start,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Lets Get Going!",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                ],
              )),
            ],
          ),
        ));
  }
}
