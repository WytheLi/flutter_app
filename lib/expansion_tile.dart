import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion 收缩列表'),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('Expansion Tile'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          children: [
            ListTile(
              title: Text('tile-01'),
              subtitle: Text('subtitle')
            ),
            ListTile(
              title: Text('tile-02'),
              subtitle: Text('subtitle')
            ),
          ],
          initiallyExpanded: true,   // 初始状态是否展开,为true时,是展开,默认为false,是不展开
        )
      ),
    );
  }
}