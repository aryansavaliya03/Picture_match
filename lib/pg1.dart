import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/pg2.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  List name = [
    "match 1",
    "match 2",
    "mirror 3",
    "match 4",
    "match 5",
    "mirror 6"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Select level",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(alignment: Alignment.center,child: Text("NO TIME LIMIT",style: TextStyle(color: Colors.white70,fontSize: 15),)),
          IconButton(onPressed: () {}, icon: Icon(Icons.volume_up)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("image/picturematchbackgroung.jpg"))),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 100, right: 100),
                itemCount: name.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, myind) {
                  return Container(
                    width: 200,
                    height: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 10,top: 25,bottom: 70),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.teal.shade50,
                        border: Border.all(color: Colors.teal, width: 5)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.center,
                          width: 170,height: 60,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1,color: Colors.teal))),
                          child:  Text(
                            " ${name[myind]} ",
                            style: TextStyle(fontSize: 25,color: Colors.teal,fontWeight: FontWeight.bold),
                          ),
                        ),

                        Expanded(
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: InkWell(onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                      return pg2();
                                    },));
                                  },
                                    child: Container(
                                      height: 60,
                                      // margin: EdgeInsets.all(10),
                                      color: Colors.teal,
                                      alignment: Alignment.center,
                                      child: Text("level ${myind * 10 + index + 1}",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 25)),
                                    ),
                                  ),
                                );
                              },
                            ))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ), onWillPop: () async{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return Home();
          },));
          return true;
    },);
  }
}
