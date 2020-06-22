import 'dart:io';

import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  void initState() {
    super.initState();
    // 设置一个动画控制器，这个动画控制器控制动画执行时间是3000毫秒
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    /* 动画监听器
    监听动画的执行状态。
    这里监听动画是否结束，如果结束则执行页面跳转动作 */
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) => MyHomePage()
        ), (route) => false);
      }
    });

    // 播放动画
    _controller.forward();

    @override 
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(  // 透明度动画组件
      opacity: _animation,    // 执行动画
      child: Image.asset(
        'images/77a1f236afc37931cc4ba09ce6c4b74543a91130.jpg',
        scale: 2.0,   // 缩放
        fit: BoxFit.cover,    // 充满父容器
      ),
    );
  }
}