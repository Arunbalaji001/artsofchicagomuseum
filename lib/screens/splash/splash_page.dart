
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget{
  @override
  _splashpagestate createState() => _splashpagestate();

}
class _splashpagestate extends State<SplashPage>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_){
     Future.delayed(Duration(seconds: 3),()=>Navigator.popAndPushNamed(context, 'home'));

    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.black,child: Center(
      child: Text('Arts\nOf\nChicago\nMuseum',textAlign:TextAlign.justify,style: TextStyle(color: Colors.red,decoration: TextDecoration.none),),
    ),);
  }
}