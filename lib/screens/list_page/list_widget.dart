import 'package:artsofchicagomuseum/providers/appdataprovider.dart';
import 'package:artsofchicagomuseum/screens/detail_page/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ListWidget extends StatefulWidget
{
  @override
  _ListWidgetState createState() => _ListWidgetState();
}
class _ListWidgetState extends State<ListWidget>
{
  ScrollController? _scrollController;

  @override
  void init(){
    _scrollController= ScrollController()..addListener(isbottom);
    super.initState();
    // _scrollController=ScrollController();
    // _scrollController..addListener(isbottom);


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        body:Consumer<appdataprovider>(
        builder: (context,model,child){

          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: model.xt!.length,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(model.xt![index])),
                    );

                  },
                  child:Container(
                    color: Colors.white,
                    height: 200,
                    margin: EdgeInsets.symmetric(vertical: 3,horizontal: 2),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Expanded(child:
                        FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,fit: BoxFit.fitWidth, image: model.xt![index].imageurl.toString()),),
                        // SizedBox(height: 4,),
                        // Image.network(model!.xt![index].imageurl!,fit: BoxFit.fitWidth,),
                       Container(height: 40,
                        child:
                        Text(model.xt![index].artist_display!,maxLines:2,style: TextStyle(color: Colors.blueGrey),),),

                      ],
                    ),
                  ),);
              }
          );

          // return StaggeredGridView.countBuilder(
          //   crossAxisCount: 4,
          //   itemCount: model.xt?.length,
          //   controller: _scrollController,
          //   itemBuilder: (BuildContext context, int index) =>
          //   new InkWell(
          //     onTap: (){
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => DetailPage(model.xt![index])),
          //       );
          //
          //     },
          //     child:Container(
          //       color: Colors.white,
          //       margin: EdgeInsets.symmetric(vertical: 3,horizontal: 2),
          //       padding: EdgeInsets.all(6),
          //       child: Column(
          //         children: [
          //
          //
          //
          //       SizedBox(height: 4,),
          //     // Image.network(model!.xt![index].imageurl!,fit: BoxFit.fitWidth,),
          //           Text(model.xt![index].artist_display!,style: TextStyle(color: Colors.blueGrey),),
          //         ],
          //       ),
          //   ),),
          //   staggeredTileBuilder: (int index) =>
          //   new StaggeredTile.fit(2),
          // );



        },
        )
    );
  }
  void isbottom(){
    print('scrolling');
    if (_scrollController!.offset >= _scrollController!.position.maxScrollExtent  ) {
      print('reached bottom');
    }
  }
}