import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_drawer_example/NewScreen.dart';
import 'fragments/AssesmentFragment.dart';
import 'fragments/SchoolFragment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Navigation Drawer Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _selectedFragment = AssesmentFragment();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.blueAccent
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
//            DrawerHeader(
//              child: Text("Header", style: TextStyle(color: Colors.white),),
//              decoration: BoxDecoration(
//                color: Colors.blue
//              ),
//            ),
          UserAccountsDrawerHeader(
            accountEmail: Text("john.doe@example.com"),
            accountName: Text("John Doe"),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(110),
              child: Image.asset("images/user1.jpg", fit: BoxFit.cover,),
            ),
            otherAccountsPictures: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(110),
                child: Image.asset("images/user2.jpg", fit: BoxFit.cover,),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(110),
                child: Image.asset("images/user3.jpg", fit: BoxFit.cover,),
              )
            ],
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text("Assessment"),
              onTap: (){
                setState(() {
                  _selectedFragment = AssesmentFragment();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("School"),
              onTap: (){
                setState(() {
                  _selectedFragment = SchoolFragment();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text("Announcement"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NewScreen()));
              },
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: _selectedFragment,
      )
    );
  }
}
