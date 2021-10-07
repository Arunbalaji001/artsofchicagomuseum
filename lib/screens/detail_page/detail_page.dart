

import 'package:artsofchicagomuseum/model/artx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailPage extends StatefulWidget{
  final artx datax;
  const DetailPage(artx datax):datax=datax,super();
  @override
  _detailpagestate createState() => _detailpagestate();
}
class _detailpagestate extends State<DetailPage>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,centerTitle: true,title: Text(widget.datax.title.toString(),
      style: TextStyle(color: Colors.black),
      ),),
      body:

      Column(
        children:[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.6,
        color: Colors.black,
        child:Center(
          child:FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: widget.datax.imageurlhigh.toString(),
        ),
        ),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      child:
    Column(
    children:[
      Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Expanded(child:
        Text('Artist   :',style: TextStyle(color: Colors.blueGrey,fontSize: 18),textAlign: TextAlign.start,),),
        Expanded(child:
        Text(widget.datax.artist_title!=null?widget.datax!.artist_title!:'Unknown',style: TextStyle(color: Colors.blueGrey,fontSize: 18),textAlign: TextAlign.start,),
        ),
      ],),
      SizedBox(height: 4,),
      Container(color: Colors.blueGrey,height: 0.2,),
      SizedBox(height: 8,),


      Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Expanded(child:
          Text('Year   :',style: TextStyle(color: Colors.blueGrey,fontSize: 18),textAlign: TextAlign.start,),),
          Expanded(child:
          Text(widget.datax.fiscal_year!=null?widget.datax!.fiscal_year!:'Unknown',style: TextStyle(color: Colors.blueGrey,fontSize: 18),textAlign: TextAlign.start,),
          ),
        ],),
      SizedBox(height: 4,),
      Container(color: Colors.blueGrey,height: 0.2,),
      SizedBox(height: 8,),

      Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Expanded(child:
          Text('Country   :',style: TextStyle(color: Colors.blueGrey,fontSize: 18),textAlign: TextAlign.start,),),
          Expanded(child:
          Text(widget.datax.place_of_origin!=null?widget.datax!.place_of_origin!:'Unknown',style: TextStyle(color: Colors.blueGrey,fontSize: 18),textAlign: TextAlign.start,),
          ),
        ],),
      SizedBox(height: 4,),
      Container(color: Colors.blueGrey,height: 0.2,),
      SizedBox(height: 8,),



    ]),),]));
  }
}