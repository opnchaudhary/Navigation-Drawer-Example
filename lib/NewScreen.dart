import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  final String slug;

  _NewScreenState createState() => _NewScreenState();

  NewScreen({ this.slug});
}

class _NewScreenState extends State<NewScreen> {
  String _pageContent = "New screen content";
  String _pageTitle = "NewScreen";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
                child:Text(
                    _pageContent
                )
            ),
          ],
        ),
      ),
    );
  }
}
