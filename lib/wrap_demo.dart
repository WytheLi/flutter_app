import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  List<Widget> list;

  @override 
  void initState(){   // 初始化状态，给列表初始的第一个可单击的Container容器
    super.initState();
    list = List<Widget>()
      ..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    // 获取设备屏幕的宽高，用来设置子容器的宽高
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,
            child: Wrap(    // 流式布局
              children: list,
              spacing: 50.0,    // 设置间距
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton(){
    // 返回一个手势识别Widget，用于显示事件
    return GestureDetector(
      onTap: (){
        if(list.length<9){
          setState(() {
            list.insert(list.length-1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}