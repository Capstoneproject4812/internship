import 'package:flutter/material.dart';
import 'package:ipvp/bloc/navigation_bloc/Navigations.dart';

class YourActivity extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Your Activity",
        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),
      ),
    );
  }
}