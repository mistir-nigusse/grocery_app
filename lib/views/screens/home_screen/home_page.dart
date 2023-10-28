import 'package:flutter/material.dart';

import '../../custom_widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                      child: Row(
                        children: [
                          Text(
                            'User Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                          ),
                          Icon(Icons.notifications_on_rounded)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 240, 238, 238),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                Text("Categories",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w800)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 35,
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomCard(
                                    image: Image.asset("assets/Group 3.png")),
                                CustomCard(
                                    image: Image.asset("assets/Group 2.png")),
                                CustomCard(
                                    image: Image.asset("assets/Group 3.png")),
                                CustomCard(
                                    image: Image.asset("assets/Group 2.png")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 240, 238, 238),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.08,
            )
          ],
        ),
      ),
    );
  }
}
