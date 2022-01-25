import 'package:flutter/material.dart';

class Camera extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,),
      body: Center(child: Text('Camera Page', style: TextStyle(fontSize: 22),),),
    );
  }
}