import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/login-page.dart';
import 'package:wiredash/wiredash.dart';
void main(){
  runApp(Ipvp());
}
class Ipvp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'ipvp-4x35g2n',
      secret: 'tm5tzuuhgu110lm803d268d3g8ylkb75w6bbigjo0za72xse',
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'LoginPage',
        theme: ThemeData(
          textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}




