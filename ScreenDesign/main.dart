//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/header_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lorem Ipsum",
      theme: ThemeData(
          primaryColor: Colors.red,
          dividerColor: Colors.black.withOpacity(0.8),
          iconTheme: IconThemeData(
            color : Colors.black
          )
      ),
          
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lorem Ipsum"),
      ),
      body: Column(
        children: <Widget>[
          HeaderWidget(),
          const SizedBox(height: 32,),
          buildMainButton(),
          const SizedBox(height: 32,),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis. ",
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }

  Widget buildMainButton() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[
        buildButton(5, 'Followers'),
        VerticalDivider(),
        buildButton(30, 'Posts'),
      ],
    ));
  }

  Widget buildButton(int i, String s) {
    return FlatButton(
      onPressed: () {},
      child: Column(
        children: <Widget>[
          Text(
            '$i',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            s,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }
}
