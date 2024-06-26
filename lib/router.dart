import 'package:ecommerce_flutter/common/widgets/bottom_bar.dart';
import 'package:ecommerce_flutter/features/auth/screens/auth_screen.dart';
import 'package:ecommerce_flutter/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>const AuthScreen(),);
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>const HomeScreen(),);
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>const BottomAppBar(),);
    default :
      return MaterialPageRoute(builder: (_)=>const Scaffold(
        body: Center(child: Text('screen does not exist'),),
      ),
      );
  }

}