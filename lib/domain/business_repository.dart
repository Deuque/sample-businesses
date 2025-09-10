import 'package:sample_bookmarks/domain/business_model.dart';

abstract class BusinessRepository {
  Future<ApiResponse<List<BusinessModel>>> getBusinessList();
}

sealed class ApiResponse<T> {}

class ApiSuccess<T> extends ApiResponse<T> {
  final T data;
  ApiSuccess(this.data);
}

class ApiError<T> extends ApiResponse<T> {
  final Object error;
  ApiError(this.error);
}