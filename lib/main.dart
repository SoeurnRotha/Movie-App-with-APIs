import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_api/Logic/UserLogic.dart';
import 'package:json_api/Page/HomePage.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(api());
}
class api extends StatelessWidget {
  const api({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> MovieLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
