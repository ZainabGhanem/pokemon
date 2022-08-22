import 'package:pokemon/model/pokemon.dart';
import 'package:http/http.dart' as http;

class RemoteService{
  Future <List<Pokemon>?> getPokemon() async
  {
    var client = http.Client();
    var url=Uri.parse('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    var response = await client.get(url);
    if(response.statusCode==200)
    {
      var json =response.body;
      return pokemonFromJson(json);
    }
  }
}