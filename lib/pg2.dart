import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/pg1.dart';

class pg2 extends StatefulWidget {
  const pg2({super.key});

  @override
  State<pg2> createState() => _pg2State();
}

class _pg2State extends State<pg2> {
  List someImages = [];
  List pic = [];
  List show = [];
  List match = [];
  int end = 5;
  int start = 0;
  int a = 5;
  int abc = 0;
  String temp = '';

  time() async {
    a = 5;
    for (int i = end - 1; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      a = i;
      setState(() {});
    }
    show = List.filled(pic.length, false);
    end = 30;
    for (int i = 1; i < end; i++) {
      await Future.delayed(Duration(seconds: 1));
      a = i;
      setState(() {});
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showDialog().then((value){
      time();
      _initImages().then((value) {
        show = List.filled(pic.length, true);
      });
    } );



  }
 Future _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text("wait for few seconds"),);
        });
  }

  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines
    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('image/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      someImages = imagePaths;
      someImages.shuffle();
      for (int i = 0; i < 6; i++) {
        pic.add(someImages[i]);
        pic.add(someImages[i]);
      }
      pic.shuffle();
      // print(someImages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Time: $a",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Container(
                alignment: Alignment.center,
                child: Text(
                  "NO TIME LIMIT",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                )),
            IconButton(onPressed: () {}, icon: Icon(Icons.volume_up)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        body: InkWell(onTap: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(title: Container(color: Colors.teal,child: Text("TIME: NO TIME LIMIT",style: TextStyle(color: Colors.white)),),);
          },);
        },
          child: GridView.builder(
            itemCount: pic.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  if (!show[index]) {
                    abc++;
                    if (abc == 1) {
                      show[index] = true;
                      temp = pic[index];
                    }
                    if (abc == 2) {
                      show[index] = true;
                      setState(() {});
                      if (temp == pic[index]) {
                        match.add(temp);
                      }
                      await Future.delayed(Duration(seconds: 1)).then(
                            (value) {
                          for (int i = 0; i < pic.length; i++) {
                            if (!match.contains(pic[i]))
                              show[i] = false;

                          }

                        },
                      );
                      temp = '';
                      abc = 0;
                    }
                    if(match.length*2==pic.length)
                    {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(actions: [
                          ElevatedButton(onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return First();
                            },));
                          }, child: Text("OK"))
                        ],);
                      },);
                    }
                  }
                  setState(() {});
                },
                child: Visibility(
                  visible: show[index],
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Image.asset(pic[index]),
                  ),
                  replacement: Container(
                    decoration: BoxDecoration(color: Colors.teal,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1, color: Colors.black)),
                  ),
                ),
              );
            },
          ),
        )), onWillPop: ()async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return First();
      },));
          return true;
        },);
  }
}
