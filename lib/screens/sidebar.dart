import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipvp/bloc/navigation_bloc/Navigations.dart';
import '../screens/menu-item.dart';
import 'package:rxdart/rxdart.dart';


class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }
  @override
  void dispose(){
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }
  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync)
    {
      return AnimatedPositioned(
        duration: _animationDuration,
        top: 0,
        bottom: 0,
        left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
        right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: const Color(0xFF4CAF50),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100,),
                    ListTile(
                        title: Text(
                          "Akshat",
                          style:
                          TextStyle(color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      subtitle: Text(
                        "akshat.ovalekar@vpt.edu.in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        ),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.lightGreenAccent,
                        ),
                        radius: 40,
                      ),
                      ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.black.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                      icon: Icons.person,
                      title: "My Account",
                      onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                      },
                    ),
                    MenuItem(
                      icon: Icons.home,
                      title: "Home",
                      onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                      },
                    ),
                    MenuItem(
                      icon: Icons.work_sharp,
                      title: "Company",
                      onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.CompanyClickedEvent);
                      },
                    ),
                    MenuItem(
                      icon: Icons.pending_actions,
                      title: "Your activity",
                      onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.YourActivityClickedEvent);
                      },
                    ),
                    MenuItem(
                      icon: Icons.receipt_long_rounded,
                      title: "Review your Report",
                      onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ReviewReportClickedEvent);
                      },
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.black.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                      icon: Icons.help,
                      title: "Help & Feedback",
                      onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.FeedbackClickedEvent);
                      },
                    ),
                MenuItem(
                  icon: Icons.exit_to_app,
                  title: "Logout",
                  onTap: () {
                    onIconPressed();
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                  },
                ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.9),
              child: GestureDetector(
                onTap: () {
                  onIconPressed();
                },
                child: ClipPath(
                  clipper: CustomMenuClipper(),
                  child: Container(
                    width: 35,
                    height: 110,
                    color: Color(0xFF4CAF50),
                    alignment: Alignment.centerLeft,
                    child: AnimatedIcon(
                      progress: _animationController.view,
                      icon: AnimatedIcons.menu_close,
                      color: Color(0xFFFFFFFF),
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    );
  }
}


class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path>oldClipper){
    return true;
  }
}