//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/showcase_data.dart';
import 'package:flutter_application_1/data/tabs.dart';
import 'package:flutter_application_1/widget/header_widget.dart';
import 'package:flutter_application_1/widget/showcase_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          primaryColor: Colors.white,
          dividerColor: Colors.black.withOpacity(0.8),
          primaryTextTheme:
              Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.white),
          accentColor: Colors.blue,
          unselectedWidgetColor: Colors.grey,
          iconTheme: IconThemeData(color: Colors.white)),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: tabs.length - 1,
    );
    tabController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lorem Ipsum"),
      ),
      drawer: Drawer(
        child: Container(),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              HeaderWidget(),
              const SizedBox(
                height: 32,
              ),
              buildMainButton(),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis. ",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              Divider(),
              SizedBox(
                height: 32,
              )
            ],
          ),
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(12),
            crossAxisCount: 4,
            mainAxisSpacing : 24.0,
            crossAxisSpacing: 12,

            itemCount: showcases.length,
            itemBuilder: (BuildContext context , int index) => ShowCaseWidget(
            showcase: showcases[index],
          ),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          ),
          
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
        )),
        padding: const EdgeInsets.all(16.0),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          labelColor: Theme.of(context).accentColor,
          unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
          tabs: tabs
              .map((icon) => icon == null
                  ? FlutterLogo(textColor: getLogoColor())
                  : Icon(icon))
              .toList(),
        ),
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

  Color getLogoColor() {
    final isFlutterLogoSelected = tabController.index + 1 == tabs.length;
    return isFlutterLogoSelected
        ? Theme.of(context).accentColor
        : Theme.of(context).unselectedWidgetColor;
  }
}
