
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:new_flutter/pages/main_page.dart';

Future<String> getData() async{
  await Future.delayed(Duration(seconds: 2));
  return 'Hello User';

}




void main()async{
  // getData().then((value) => print(value));

  // try{
  //   final data =  await getData();
  //   print(data);
  //
  // }catch(err){
  //   print('err $err');
  //
  // }

  runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
