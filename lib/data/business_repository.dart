import 'package:sample_bookmarks/data/business_model.dart';

abstract class BusinessRepository {
  Future<ApiResponse<List<BusinessModel>>> businessList();
}

class BusinessRepositoryImpl extends BusinessRepository {
  @override
  Future<ApiResponse<List<BusinessModel>>> businessList() async {
    //TODO: Check cache and return data
    //TODO: Or get data from remote source using Dio

    final response = sampleBusinessList.map(BusinessModel.fromJson).toList();
    return ApiResponse(data: response);
  }

  final sampleBusinessList = [
    {
      "biz_name": "Glow & Go Salon",
      "bss_location": "Atlanta",
      "contct_no": "+1 404 123 4567",
    },

    {
      "biz_name": "Fresh Cuts Barbershop",
      "bss_location": "Lagos",
      "contct_no": "+234 802 555 1212",
    },

    {
      "biz_name": "Chef Ama Private Kitchen",
      "bss_location": "Accra",
      "contct_no": "+233 24 888 9999",
    },
  ];
}

class ApiResponse<T> {
  final T? data;
  final Object? error;

  ApiResponse({this.data, this.error});
}
