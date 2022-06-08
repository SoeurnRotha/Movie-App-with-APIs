import 'package:flutter/material.dart';
import 'package:json_api/Logic/UserLogic.dart';
import 'package:provider/provider.dart';
class InternetError extends StatefulWidget {
  const InternetError({Key? key}) : super(key: key);

  @override
  State<InternetError> createState() => _InternetErrorState();
}

class _InternetErrorState extends State<InternetError> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off),
          Text("Internet no connect",style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          ElevatedButton(
            child: Text("Again",style: TextStyle(fontSize: 20),),
            style: ElevatedButton.styleFrom(
              primary: Colors.purpleAccent,
              fixedSize: Size(200, 50),
              onPrimary: Colors.white
            ),
            onPressed: (){
              context.read<MovieLogic>().setLoadding();
              context.read<MovieLogic>().read();
            },
          )
        ],
      ),
    );
  }
}
