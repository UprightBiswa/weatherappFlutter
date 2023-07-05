import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map info = ModalRoute.of(context)!.settings.arguments as Map;

    String temp = ((info['temp_value']).toString());
    String air = ((info['air_speed_value']).toString());
    if (temp == "NA") {
      print("NA");
    } else {
      temp = ((info['temp_value']).toString()).substring(0, 5);
      air = ((info['air_speed_value']).toString()).substring(0, 5);
    }
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];
    String des = info['des_value'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration:const  BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color.fromARGB(255, 179, 216, 255), Color.fromARGB(255, 59, 207, 199)])),
            child: Column(
              children: [
                Container(
                  //Search Wala Container
      
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 236, 236),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(" ", "") == "") {
                            print("blank search");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading", arguments: {
                              "searchText": searchController.text,
                            });
                          }
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 214, 2, 2),
                          ),
                          margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search $city"),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color.fromARGB(255, 120, 189, 136).withOpacity(0.5)),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          padding: const EdgeInsets.all(26),
                          child: Row(children: [
                            Image.network(
                                "http://openweathermap.org/img/wn/$icon@2x.png"),
                               const  SizedBox(
                                  width: 20,
                                ),
                            Column(
                              children: [
                                Text(
                                  " $des ",
                                  style: const TextStyle(
                                      fontSize: 26, fontWeight: FontWeight.bold,color: Colors.deepOrange),
                                ),
                                Text(
                                  "In $getcity",
                                  style: const TextStyle(
                                      fontSize: 23, fontWeight: FontWeight.bold, color: Colors.limeAccent),
                                )
                              ],
                            )
                          ])),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromARGB(255, 244, 255, 158).withOpacity(0.5)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  " $temp ",
                                  style:  const TextStyle(fontSize: 90, color: Color.fromARGB(255, 255, 145, 19)),
                                 
                                ),
                                const Text(
                                  "C°",
                                  style: TextStyle(fontSize: 50),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromARGB(255, 190, 241, 136).withOpacity(0.5)),
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.wind)],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              " $air ",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("km/hr")
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromARGB(255, 207, 236, 154).withOpacity(0.5)),
                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: const EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.humidity)],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              " $hum ",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text("Percent")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
               const  SizedBox(height: 50,),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made By Biswajit"),
                      Text("Data Provided By Openweathermap.org")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
