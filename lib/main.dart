import 'package:flutter/material.dart';
import 'package:untitled2/pg1.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Select mode",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.volume_up)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("image/picturematchbackgroung.jpg"))),
          child: Column(
            children: [
              Expanded(flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 210,
                      decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 5, color: Colors.teal)),
                      child: Column(children: [
                        Expanded(
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:(context) {
                                  return First();
                                },));
                              },
                                child: Container(alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 10),
                                  width: 180,
                                  height: 50,
                                  color: Colors.teal,
                                  child: Text("NO TIME LIMIT",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10),
                                width: 180,
                                height: 50,
                                color: Colors.teal,
                                child: Text("NORMAL",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10,bottom: 10),
                                width: 180,
                                height: 50,
                                color: Colors.teal,
                                child: Text("HARD",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 5, color: Colors.teal)),
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10),
                              width: 140,
                              height: 30,
                              color: Colors.teal,
                              child: Text("REMOVE ADS",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.teal.shade50,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 5, color: Colors.teal)),
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10),
                              width: 120,
                              height: 50,
                              color: Colors.teal,
                              child: Text("SHARE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ),
                            Container(alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10),
                              width: 120,
                              height: 50,
                              color: Colors.teal,
                              child: Text("MORE GAMES",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
