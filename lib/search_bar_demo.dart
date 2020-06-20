import 'package:flutter/material.dart';
import 'asset.dart';

class SearchBarDemo extends StatefulWidget{
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              // print('开始搜索');
              showSearch(context: context, delegate: searchBarDelegate());
            },
          )
        ],  
      ),
    );
  }
}

class searchBarDelegate extends SearchDelegate<String>{
  // 搜索继承SearchDelegate 并且重写四个方法
  @override 
  List<Widget> buildActions(BuildContext context){
    // 右侧图标 一般为叉号
    return [
      IconButton(
        // icon: Icon(Icons.clear),
        icon: Text('清除'),
        onPressed: () => query = '',  // 点击将输入框置为空
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    // 左边图标 一般为回退箭头
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,  // 设置过渡动画
      ),
      onPressed: () => close(context, null),
    );
  }

  @override 
  Widget buildResults(BuildContext context){
    // 搜索结果
    return Container(
      // width: 100.0,
      // height: 100.0,
      child: Card(
        color: Colors.grey,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context){
    // 搜索提示
    final suggestionList = query.isEmpty
      ? recentSuggest
      : searchList.where((element) => element.startsWith(query)).toList();

    return ListView.builder(  // 动态列表
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(  // 富文本 
          text: TextSpan(
            // 截取搜索字符串的长度，ser加粗显示
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                // 截取搜索字符串以外的字符，灰色显示
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )
            ]
          ),
        ),  
      )
    );
  }
}