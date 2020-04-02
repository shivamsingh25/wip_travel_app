import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V3 - Wip Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TravelAppHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TravelAppHome extends StatefulWidget {
  @override
  _TravelAppHomeState createState() => _TravelAppHomeState();
}

class _TravelAppHomeState extends State<TravelAppHome> {
  
  int _currentIndex = 0;
  // Asset Data
  List<String> images = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpg"
  ];

  List<String> titles = ["Cordoba", "Sevilla", "Dortmund", "Katowice"];
  List<String> subtitles = ["SPAIN", "SPAIN", "GERMANY", "POLAND"];
  List<int> colorTheme = [0xff96877f, 0xffffffff, 0xffc0b886, 0xff97cbf1];

  List<Widget> places() {
    List<Widget> placeList = new List();

    for(int i = 0; i < 4; i++){
      var placeItem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
        child: Container(
          height: 80.0,
          width: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.transparent
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Image.asset(
                  images[i],
                  fit: BoxFit.cover
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)
                ),
                child: new DecoratedBox(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topCenter,
                      colors: [
                        Color(colorTheme[i]),
                        Colors.transparent
                      ]
                    ),
                  )
                ),
              ),
              Positioned(
                top: 230.0, left: 20.0,
                child: Text(
                  titles[i],
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: i % 2 == 0 ? Colors.white : Color(0xff304570) ,
                  ),
                ),
              ),
              Positioned(
                top: 255.0, left: 20.0,
                child: Text(
                  subtitles[i],
                  style: TextStyle(
                    fontSize: 18.0,
                    color: i % 2 == 0 ? Colors.white : Color(0xff304570) ,
                  ),
                ),
              ),
            ],
            overflow: Overflow.clip,
          ),
        ),
      );
      placeList.add(placeItem);
    }
    return placeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f3ee),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 100.0, left: 25.0),
                  child: Text(
                    "Hello World",
                    style: TextStyle(
                      color: Color(0xff3e3d69),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100.0, left: 230.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://i.pravatar.cc/400"),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 50.0, left: 25.0),
                child: Text(
                  "Title",
                  style: new TextStyle(
                    color: Color(0xff3e3d69),
                    fontSize: 45,
                    fontFamily: 'Ultra'
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, left: 25.0),
                child: Text(
                  "Welcome to the finest and\nexclusive community of crowd\nsourced insider tips for trips.",
                  style: TextStyle(
                    color: Color(0xff3e3d69),
                    fontSize: 18,
                    fontFamily: 'Raleway'
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0, left: 25.0),
              child: Container(
                height: 350.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: places()
                ),
              ),
            ),
          ]
        ),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          textTheme: Theme.of(context)
                      .textTheme
                      .copyWith(caption: new TextStyle(color: Colors.black)) 
        ),
        child: BottomNavigationBar(
          selectedItemColor: Color(0xff3e3d69),
          unselectedItemColor: Color(0xffaed5d6),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            // Resource Limit -> Using material Icons instead of Custom Icons
            BottomNavigationBarItem(icon: Icon(Icons.person_pin_circle), title: Container(height: 0.0)),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Container(height: 0.0)),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Container(height: 0.0)),
            BottomNavigationBarItem(icon: Icon(Icons.flag), title: Container(height: 0.0)),
          ]
        ),
      ),
    );
  }
}

// Thanks for Watching
// Source code in Description,
// Like, & Subscribe -> Shivam SR