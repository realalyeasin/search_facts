import 'dart:convert';

List<FactModel> factModelFromJson(String str) => List<FactModel>.from(json.decode(str).map((x) => FactModel.fromJson(x)));

String factModelToJson(List<FactModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FactModel {
  FactModel({
    required this.fact,
  });

  String? fact;

  factory FactModel.fromJson(Map<String, dynamic> json) => FactModel(
    fact: json["fact"],
  );

  Map<String, dynamic> toJson() => {
    "fact": fact,
  };
}
