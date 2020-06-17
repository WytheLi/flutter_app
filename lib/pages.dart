import 'package:flutter/material.dart';
import 'custome_router.dart';

class FirstPage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('FirstPage', style: TextStyle(fontSize: 36.0),),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: (){
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (BuildContext context){
            //     return SecondPage();
            //   })
            // );
            // 使用自定义的路由构造器
            Navigator.of(context).push(CustomRoute(SecondPage()));
          },
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('SecondPage', style: TextStyle(fontSize: 36.0),),
        backgroundColor: Colors.pinkAccent,
        // leading: Container(),    // leading标题前的一个控件，首页通常显示应用logo；其它界面默认显示为返回按钮
        elevation: 0.0,   // AppBar 滚动时的融合程度，默认值4.0；设置0.0可以使得body与appBar完全融合
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}