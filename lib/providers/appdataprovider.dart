

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:artsofchicagomuseum/model/artx.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
enum status{initial,dataadded,loading,error}
class appdataprovider extends ChangeNotifier{
  List<artx>? xt=[];
  status xzz=status.initial;
  appdataprovider()
  {
    xzz=status.initial;
    print('Provider intialized');
    getartlist();
  }
  Future<bool> getartlist() async {
    artx? result;
    try {
      xzz=status.loading;
      final response = await http.get(
        Uri.parse("https://api.artic.edu/api/v1/artworks?page=1&limit=100"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);

        for(var x in item['data'])
          {
            artx zt=artx.fromJson(x);
            xt?.add(zt);
          }
      print('Got Data :: List Size Is ::::'+(xt!=null?xt!.length.toString():'zero'));
        xzz=status.dataadded;
      notifyListeners();
      } else {
        xzz=status.error;
        notifyListeners();
        // Toast.show("Data not found", context,
        //     duration: 2, backgroundColor: Colors.redAccent);
      }
    } catch (e) {
     print('Exception ==> '+e.toString());
     xzz=status.error;
     notifyListeners();
    }
    return true;
  }
  Future<void> adddata() async {
    try {
      int x=xt!.length%10;
      xzz=status.loading;
      notifyListeners();
      final response = await http.get(
        Uri.parse("https://api.artic.edu/api/v1/artworks?page="+x.toString()+"&limit=100"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);

        for(var x in item['data'])
        {
          artx zt=artx.fromJson(x);
          xt?.add(zt);
        }
        print('Got Data :: List Size Is ::::'+(xt!=null?xt!.length.toString():'zero'));
        xzz=status.dataadded;
        notifyListeners();
      } else {
        xzz=status.error;
        notifyListeners();
        // Toast.show("Data not found", context,
        //     duration: 2, backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      print('Exception ==> '+e.toString());
      xzz=status.error;
      notifyListeners();
    }

  }

}