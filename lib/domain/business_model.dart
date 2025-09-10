class BusinessModel {
  final String name;
  final String location;
  final String contact;

  BusinessModel({
    required this.name,
    required this.location,
    required this.contact,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      name: json["biz_name"] ?? '',
      location: json["bss_location"] ?? '',
      contact: json["contct_no"] ?? '',
    );
  }
}
