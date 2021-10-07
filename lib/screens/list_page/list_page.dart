import 'package:artsofchicagomuseum/providers/appdataprovider.dart';
import 'package:artsofchicagomuseum/screens/detail_page/detail_page.dart';
import 'package:artsofchicagomuseum/screens/list_page/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ListPage extends StatefulWidget{
  @override
  _Listpagestate createState()=>_Listpagestate();


}
class _Listpagestate extends State<ListPage>
{
  final _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_isbottom);
    Provider.of<appdataprovider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title: Text('Arts of Chicago Museum',style: TextStyle(color: Colors.black),),),
      body: Container(
        color: Colors.blueGrey.shade100,
        child: Consumer<appdataprovider>(
    builder: (context,model,child){
    if(model.xzz==status.loading){
      return
        Stack(
            children:[

             GridView.builder(
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
                    SizedBox(height: 4,),
                    // Image.network(model!.xt![index].imageurl!,fit: BoxFit.fitWidth,),
                    Container(height: 40,
                      child:
                          Center(
                            child:
                      Text(model.xt![index].title!,maxLines:2,style: TextStyle(color: Colors.blueGrey),),),
                    ),

                  ],
                ),
              ),);
          }
      ),
          Positioned(child:
          Container(height: 56,width: MediaQuery.of(context).size.width,
          child: Center(child:CircularProgressIndicator(color: Colors.red,),),
          ),bottom: 0,),
            ]);
    }
    else if(model.xzz==status.initial)
      {
        return Container(
          child: Center(
            child: CircularProgressIndicator(color: Colors.green,),
          ),
        );

      }
    else if(model.xzz==status.dataadded)
      {
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child:
                      FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,fit: BoxFit.fitWidth, image: model.xt![index].imageurl.toString()),),
                      SizedBox(height: 4,),
                      // Image.network(model!.xt![index].imageurl!,fit: BoxFit.fitWidth,),
                      Container(height: 40,
                        child:
                            Center(
                              child:
                        Text(model.xt![index].title!,maxLines:2,style: TextStyle(color: Colors.blueGrey),),),
                      ),

                    ],
                  ),
                ),);
            }
        );
      }
    else{
      return Container(child:
        Center(
          child:
          Text('Error occured'),
        ),);
    }
}),
    ),
    );
  }
  void _isbottom(){
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (_scrollController.hasClients && currentScroll >= (maxScroll * 0.9))
      {
        if(Provider.of<appdataprovider>(context, listen: false).xzz==status.dataadded) {
          Provider.of<appdataprovider>(context, listen: false).adddata();
          print('reached end');
        }
      }
  }
}