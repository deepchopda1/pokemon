import 'dart:core';

class ApiEndpointUrl {
  static const String baseUrl = "https://pokeapi.co/api/v2/";

  static const String pokemonList = "${baseUrl}pokemon?offset=0&limit=20";
}
