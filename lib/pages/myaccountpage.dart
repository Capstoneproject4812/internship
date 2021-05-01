import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipvp/pages/homepage.dart';
import 'package:ipvp/screens/Teacher-page.dart';
import 'package:ipvp/screens/sidebar.dart';
import 'package:ipvp/widgets/AppBar.dart';
import '../bloc/navigation_bloc/Navigations.dart';

class MyAccount extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ClipPath(
          clipper: Appbar(),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 100, top: 100, bottom: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: IconButton(icon:
                    Icon(
                        Icons.arrow_back_ios,
                      color: Colors.black87,
                    ),
                        iconSize: 30,
                        onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarLayout()));
                        }
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text('My Account',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.amber[700],
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 220,
            width: 150,
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/pic-2.jpg"),
                ),
                Positioned(
                  right: -8,
                  bottom: 28,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Colors.grey[300],
                      onPressed: (){},
                      child: SvgPicture.asset("assets/pic-1.jpg"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:50 ,vertical:100 ),
            child: FlatButton(
              padding: EdgeInsets.only(bottom: 9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              color: Colors.amber[700],
                onPressed: (){},
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27, top: 10, bottom: 10),
                      child: Icon(
                        Icons.person,
                        color: Colors.black87,
                        size: 38,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text('View Resume',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}