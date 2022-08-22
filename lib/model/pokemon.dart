// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

List<Pokemon> pokemonFromJson(String str) => List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
    Pokemon({
        required this.pokemon,
    });

    List<PokemonElement> pokemon;

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        pokemon: List<PokemonElement>.from(json["pokemon"].map((x) => PokemonElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
    };
}

class PokemonElement {
    PokemonElement({
        required this.id,
        required this.name,
        required this.img,
    });

    int id;
    String name;
    String img;
   
    factory PokemonElement.fromJson(Map<String, dynamic> json) => PokemonElement(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
    };
}

