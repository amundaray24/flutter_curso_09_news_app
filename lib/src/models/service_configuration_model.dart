class ServiceConfigurationsModel {

  String baseUrl;
  String token;

  ServiceConfigurationsModel({
    required this.baseUrl,
    required this.token
  });

  factory ServiceConfigurationsModel.fromJson(dynamic json) => ServiceConfigurationsModel(
    baseUrl: json["baseUrl"],
    token: json["token"],
  );
}