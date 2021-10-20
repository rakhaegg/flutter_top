//@dart=2.9
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildHeaderBackground(),
        Positioned(
          child: PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(child: Text("View Profile")),
              PopupMenuItem(child: Text("Add to Friends")),
            ],
          ),
          right: 0,
        ),
        Positioned(child: buildHeaderContent(context),
        bottom: 0,
        left: 24,
        ),
      ],
    );
  }

  Widget buildHeaderContent(BuildContext context) => Row(
    children: <Widget>[
        buildProfile(context),
        SizedBox(
          height: 24,
        ),
        Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            
            Text(
              "Taste Me",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
            SizedBox(
              height: 16,
            ),
            buildFollowButton(context),
          ],
        )
      ]);
  Widget buildFollowButton(BuildContext context) => Container(
        child: FlatButton(
            onPressed: () {},
            child: Text(
              "Follow",
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ), 
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
        decoration: decoration(context),
      );

  Widget buildHeaderBackground() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 152,
          child: Image.asset(
            'graphic/workout.png',
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        const SizedBox(height: 24,)
      ],
    );
  }

  Widget buildProfile(BuildContext context) {
    final Image = DecorationImage(
        image: AssetImage('graphic/profile.jpg'), fit: BoxFit.cover);

    return Container(
      width: 92,
      height: 92,
      decoration: decoration(context, image: Image),
    );
  }

  Decoration decoration(BuildContext context, {DecorationImage image}) =>
      BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).scaffoldBackgroundColor,
                spreadRadius: 4)
          ],
          image: image
      );
}
