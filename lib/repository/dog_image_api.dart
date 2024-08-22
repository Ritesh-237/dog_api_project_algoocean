import 'dart:convert';

import 'package:dog_api_project/models/dog_image_model.dart';
import 'package:http/http.dart' as http;

class RepositoryImpl {
  Future<DogResponseModel> getDogImageResponse() async {
    final response =
        await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    try {
      if (response.statusCode == 200) {
        DogResponseModel dogResponseModel =
            DogResponseModel.fromJson(jsonDecode(response.body));
        return dogResponseModel;
      } else {
        throw Exception('network failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
