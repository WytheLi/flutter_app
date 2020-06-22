import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
            ),
          )
        ],
      ),
    );
  }
}


// 贝塞尔曲线-单波浪
// class BottomClipper extends CustomClipper<Path>{
//   @override 
//   Path getClip(Size size){
//     var path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(0, size.height - 50);
//     var firstControlPoint = Offset(size.width / 2, size.height);
//     var firstEndPoint = Offset(size.width, size.height - 50);
    
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    
//     path.lineTo(size.width, size.height - 50);
//     path.lineTo(size.width, 0);
//     return path;

//     // 绘制梯形
//     // var path = Path();
//     // // 线到（`lineTo`）方法，添加从当前点到给定点的直线段。
//     // // 起点变量。
//     // path.lineTo(0.0, 200.0);
//     // // 终点变量。
//     // path.lineTo(size.width, 100.0);
//     // path.lineTo(size.width, 0.0);
//     // path.close();
//     // return path;
//   }

//   @override 
//   bool shouldReclip(CustomClipper<Path> oldClipper){
//     return false;
//   }
// }

class BottomClipper extends CustomClipper<Path>{
  @override 
  Path getClip(Size size){
    var path = Path();
    print('${size.width}, ${size.height}');
    path.lineTo(0, size.height-20);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);
    
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    
    var secondControlPoint = Offset(size.width / 4 * 3, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);

    return path;
  }

  @override 
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}