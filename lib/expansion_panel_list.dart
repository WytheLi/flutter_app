import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  var currentPanelIndex = -1;
  List<int> mList;
  List<ExpandStateBean> expandStateList;    // 展开的状态列表， ExpandStateBean是自定义的类

  _ExpansionPanelListDemoState(){
    mList = List();
    expandStateList = List();
    for(int i=0; i<10; i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  _setCurrentIndex(int index, isExpand){
    setState(() {
      expandStateList.forEach((element) {
        if(element.index == index){
          // 取反 控制展开闭合
          element.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion panel list'),
      ),
      // 使用可滑动组件，因为ExpansionPanelList Widget必须放在可滑动组件中使用，否则报错
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol){
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index){
            return ExpansionPanel(
              headerBuilder: (context, isExpanded){
                return ListTile(
                  title: Text('This is No.$index'),
                );
              },
              body: ListTile(
                title: Text('expansion no.$index'),
              ),
              isExpanded: expandStateList[index].isOpen   // 是否展开
            );
          }).toList(),
        ),
      ),
    );
    
  }
}

// 自定义扩展状态类
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}