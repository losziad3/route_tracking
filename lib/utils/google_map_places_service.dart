import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/place_auto_complete_model/place_autocomplete_model.dart';

class GoogleMapPlacesService{

  final String baseUrl = 'https://maps.googleapis.com/maps/api/place';
  final String apiKey = 'AIzaSyAcsQ9eVLdwWTqmaGs4EYj6Gp8X5cqIZH0';

  Future<List<PlaceModel>> getPredictions({required String input })async{
   var response = await http.get(Uri.parse('$baseUrl/autocomplete/json?key=$apiKey&input=$input'));

   if(response.statusCode == 200){
     var data = jsonDecode(response.body)['predictions'];
     List<PlaceModel> places = [];
     for (var item in data){
       places.add(PlaceModel.fromJson(item));

     }
     return places;
   }else{
     throw Exception();
   }
  }
}