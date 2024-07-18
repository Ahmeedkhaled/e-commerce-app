import 'package:untitled13/domain/entity/ProductResponseEntity.dart';
import 'package:untitled13/domain/failures.dart';

abstract class ListTabState{}
class ListTabProductInitialState extends ListTabState{}
class ListTabProductLoadingState extends ListTabState{
  String? loadingMessage;
  ListTabProductLoadingState({required this.loadingMessage});
}
class ListTabProductErrorState extends ListTabState{
  Failures error;
  ListTabProductErrorState({required this.error});
}
class ListTabProductSuccessState extends ListTabState{
  ProductResponseEntity productResponseEntity;
  ListTabProductSuccessState({required this.productResponseEntity});
}

