import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassDemo extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          ConstrainedBox(   // 约束盒子，添加额外的约束条件
            constraints: const BoxConstraints.expand(),
            child: Image.network('http://47.101.37.196/static/images/viewpager/bc47c3cb740d7ad1e883e922a689c8ba.jpg'),
          ),
          Center(
            child: ClipRect(    // 可裁剪的矩形
              child: BackdropFilter(    // 背景滤镜组件
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // 图片模糊值
                child: Opacity(
                  opacity: 0.5,   // 透明效果
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(color: Colors.grey.shade200),   // 盒子修饰器, 设置颜色灰色深浅(数值越小越明亮，反之越暗)200
                    child: Center(
                      child: Text(
                        '梦深路遥',
                        // style: Theme.of(context).textTheme.display3,  // 设置字体
                        style: TextStyle(fontSize: 64.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}