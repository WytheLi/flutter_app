import 'package:flutter/material.dart';

import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplay_screen.dart';

class BottomNavigationWidget extends StatefulWidget{
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
      ..add(HomeScreen())
      ..add(EmailSreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(title: Text('底部导航栏'),),
      body: list[_currentIndex],
      // BottomNavigationBar底部导航栏；BottomAppBar底部工具栏
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text('Home', style: TextStyle(color: _BottomNavigationColor),)
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _BottomNavigationColor,
            ),
            title: Text('Email', style: TextStyle(color: _BottomNavigationColor),)
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _BottomNavigationColor,
            ),
            title: Text('AirPlay', style: TextStyle(color: _BottomNavigationColor),)
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _BottomNavigationColor,
            ),
            title: Text('Pages', style: TextStyle(color: _BottomNavigationColor),)
          )
        ],
        currentIndex: _currentIndex,  // 选中突出显示
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}