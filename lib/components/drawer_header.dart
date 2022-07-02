import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  _MyHeaderDrawerState();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: AssetImage("assets/pakflag.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 75,right: 165),
          //   child: Container(
              
          //     child: Column(
          //       children: [Text("Shara Websolution"), Text("www.Sharasol.com")],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top:  70),
            child: ListTile(
              textColor: Colors.white,
              selectedColor: Colors.white10,
              leading: Column(children: [Text("Shara Websolution"), Text("www.Sharasol.com")],),),
          )
        ],
      ),
    );
  }
}
