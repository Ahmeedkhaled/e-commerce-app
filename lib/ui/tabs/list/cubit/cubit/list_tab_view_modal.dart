import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/domain/entity/ProductResponseEntity.dart';

import 'package:untitled13/domain/use_case/get_all_product_use_case.dart';
import 'package:untitled13/ui/tabs/list/cubit/cubit/list_tab_state.dart';

class ListTabViewModal extends Cubit<ListTabState> {
  GetAllProductUseCase getAllProductUseCase;
  ListTabViewModal({required this.getAllProductUseCase})
      : super(ListTabProductInitialState());
  List<ProductEntity> productsList = [];

  void getAllCategories() async {
    emit(ListTabProductLoadingState(loadingMessage: "Loading..."));
    var either = await getAllProductUseCase.invoke();
    either.fold((l) {
      emit(ListTabProductErrorState(error: l));
    }, (response) {
      productsList = response.data ?? [];
      emit(ListTabProductSuccessState(productResponseEntity: response));
    });
  }
}
