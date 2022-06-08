import 'package:flutter/material.dart';
import 'package:json_api/ErrorInternet/ErrorInternet.dart';
import 'package:json_api/Loadding/Loadding.dart';
import 'package:json_api/Logic/UserLogic.dart';
import 'package:json_api/Model/UserModel.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MovieLogic>().setLoadding();
    context.read<MovieLogic>().read();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar,
      body: _buildBody,
    );
  }
  get buildAppbar{
    return AppBar(
      backgroundColor: Colors.purpleAccent[300],
      title: Text("Movie with APIs"),
    );
  }
  Widget get _buildBody{
    Loadding loadding = context.watch<MovieLogic>().loadding;
    switch(loadding){
      case Loadding.none:
      case Loadding.loadding:
        return _buildLoadding();
      case Loadding.error:
        return InternetError();
      case Loadding.done:
        return _buildListView;
    }
  }
  Widget get _buildListView{
    MovieModel movieModel = context.watch<MovieLogic>().movieModel;
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: movieModel.search.length,
        itemBuilder: (context,index){
          return _buildListTitle(movieModel.search[index]);
        },
      ),
      onRefresh: () async{
        context.read<MovieLogic>().setLoadding();
        context.read<MovieLogic>().read();
      },
    );
  }
  _buildListTitle(Search items){
    return Container(
      child: Card(
        child: Row(
          children: [
            Container(
              width: 160,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(items.poster),
                  fit: BoxFit.cover
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(alignment: Alignment.center,width: 200,child: Text(items.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)),
                  SizedBox(height: 10,),
                  Text("Type : ${items.type}",style: TextStyle(fontSize: 20),),
                  Text("Date time : ${items.year}",style: TextStyle(fontSize: 20),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  _buildLoadding(){
    return Center(child: CircularProgressIndicator());
  }
}
