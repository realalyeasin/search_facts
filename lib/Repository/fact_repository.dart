import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:joke_api/Model/fact_model.dart';

class Repo extends GetxController {
  var factModels = [].obs;

  Future<RxList?> getFact(String num) async {
    var headers = {'X-Api-Key': 'hHGqUycV7p9jasnzzrhPXw==bQbdCtRqidezcxEN'};

    String baseUrl = 'https://api.api-ninjas.com/v1/facts?limit=$num';
    final response =
        await http.Client().get(Uri.parse(baseUrl), headers: headers);
    if (response.statusCode == 200) {
      Iterable results = jsonDecode(response.body);
      for (var result in results) {
        var factModel = FactModel.fromJson(result);
        factModels.add(factModel);
      }
      return factModels;
    } else {
      return null;
    }
  }
  RxList get FactRepo => factModels;
}
