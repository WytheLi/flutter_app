import 'package:flutter/material.dart';

// 自定义路由构造器
class CustomRoute extends PageRouteBuilder{
  final Widget widget;
  CustomRoute(this.widget)
    :super(
      transitionDuration:const Duration(seconds: 1),    // 过渡时间
      pageBuilder: (    // 页面构造器
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2
      ){
        return widget;
      },
      transitionsBuilder: (   // 过渡效果构造器
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        Widget child
      ){
         // FadeTransition渐隐渐显切换动画效果
        // return FadeTransition(
        //   // opacity过渡透明效果
        //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //     parent: animation1,
        //     curve: Curves.fastOutSlowIn // curve动画曲线，fastOutSlowIn快出慢进
        //   )),
        //   child: child,
        // );

        // 缩放切换动画效果
        // return ScaleTransition(
        //   scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //     parent: animation1,
        //     curve: Curves.fastOutSlowIn
        //   )),
        //   child: child,
        // );

        // 旋转缩放切换动画
        // return RotationTransition(
        //   turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //     parent: animation1,
        //     curve: Curves.fastOutSlowIn
        //   )),
        //   child: ScaleTransition(
        //     scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //       parent: animation1,
        //       curve: Curves.fastOutSlowIn
        //     )),
        //     child: child,
        //   ),
        // );

        // 滑动切换动画
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),
          child: child,
        );
      }
    );
}