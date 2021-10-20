//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/showcase.dart';

class ShowCaseWidget extends StatelessWidget {
  final ShowCase showcase;

  const ShowCaseWidget({Key key, this.showcase}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  showcase.image,
                  fit: BoxFit.cover,
                ),
              ),
              Material(
                color : Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Icon(Icons.image , color: Colors.black.withOpacity(0.8)))
            ],
          ),

          buildInfot(context),
        ],
      );

  Widget buildInfot(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 4,
            ),
            Text(
              showcase.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              showcase.title,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
}
