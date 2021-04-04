import 'package:flutter/material.dart';
import 'package:ipvp/bloc/navigation_bloc/Navigations.dart';

class Homepage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Page",
      style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),
      ),
    );
  }
}
