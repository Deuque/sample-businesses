import 'package:flutter/cupertino.dart';
import 'package:sample_bookmarks/domain/business_model.dart';
import 'package:sample_bookmarks/domain/business_repository.dart';

class BusinessNotifier extends ChangeNotifier {
  final BusinessRepository repository;

  BusinessNotifier(this.repository);

  ViewState<List<BusinessModel>> _itemState = ViewSuccess([]);

  ViewState<List<BusinessModel>> get items => _itemState;

  Future<void> fetchBusinessList() async {
    _itemState = ViewLoading();
    notifyListeners();

    final response = await repository.getBusinessList();

    switch (response) {
      case ApiSuccess():
        _itemState = ViewSuccess(response.data);
      case ApiError():
        _itemState = ViewError(response.error);
    }
    notifyListeners();
  }
}

sealed class ViewState<T> {}

class ViewLoading<T> extends ViewState<T> {}

class ViewError<T> extends ViewState<T> {
  final Object error;

  ViewError(this.error);
}

class ViewSuccess<T> extends ViewState<T> {
  final T data;

  ViewSuccess(this.data);
}
