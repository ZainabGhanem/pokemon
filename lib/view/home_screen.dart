import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/service/remote_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
List <Pokemon>? pokemonList;
var isLoaded = false;
void initState(){
 getData();
}
getData() async {
pokemonList = await RemoteService().getPokemon();
if(pokemonList != null)
{
  setState(() {
    isLoaded=true;
  });
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Poke App',)
      ),
      body:Visibility(
        visible: isLoaded,
        child:
        ListView.builder(
        itemCount: pokemonList?.length,
        itemBuilder: ((context, index) {
        return Container(
            child: Column(
              children: [
                Image.network(pokemonList![index].pokemon[index].img, height: 150,width: 150,),
                Text(pokemonList![index].pokemon[index].name, style: TextStyle(color: Colors.black, fontSize: 25),),
              ],
            ),
        );
      })),
        replacement:const Center(child: CircularProgressIndicator(),) ,
      ) ,
    
    );
  }
}