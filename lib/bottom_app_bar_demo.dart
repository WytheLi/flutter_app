import 'package:flutter/material.dart';
import 'each_view.dart';

// 动态Widget
class BottomAppBarDemo extends StatefulWidget{
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo>{
  List<Widget> _eachView;
  int _index = 0;

  @override 
  void initState(){
    super.initState();
    _eachView = List();
    _eachView
      ..add(EachView('Home'))
      ..add(EachView('Me'));
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: _eachView[_index],
      // 可交互的浮动按钮
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // 创建新的路由页面
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return EachView('New Page');
          }));
        },
        tooltip: 'Increment',    // 长按显示的提示文本
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  // 悬浮按钮与底部融合

      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),    // 圆形缺口
        child: Row(
          mainAxisSize: MainAxisSize.max,   // 指定Row在主軸方向占用的空间 max尽可能多的占用
          mainAxisAlignment: MainAxisAlignment.spaceAround,   // 表示子组件在Row所占的水平空间的对齐方式
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}