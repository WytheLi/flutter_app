import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  @override 
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin{
  int _counter = 0;
  
  @override 
  bool get wantKeepAlive => true;

  // 申明一个内部方法，点击按钮时候调用该方法计数
  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('通过点击按钮计数！'),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 64.0),
            )
          ],
        ),
      ),

      // 增加悬浮按钮，用于计数
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}