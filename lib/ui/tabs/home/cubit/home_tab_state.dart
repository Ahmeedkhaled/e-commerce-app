import 'package:untitled13/domain/entity/CategoryOrBrandResponEntity.dart';
import 'package:untitled13/domain/failures.dart';

abstract class HomeTabState{}
class HomeTabCategoryInitialState extends HomeTabState{}
class HomeTabCategoryLoadingState extends HomeTabState{
  String? loadingMessage;
  HomeTabCategoryLoadingState({required this.loadingMessage});
}
class HomeTabCategoryErrorState extends HomeTabState{
  Failures error;
  HomeTabCategoryErrorState({required this.error});
}
class HomeTabCategorySuccessState extends HomeTabState{
  CategoryOrBrandResponseEntity categoryResponEntity;
  HomeTabCategorySuccessState({required this.categoryResponEntity});
}
class HomeTabBrandInitialState extends HomeTabState{}
class HomeTabBrandLoadingState extends HomeTabState{
  String? loadingMessage;
  HomeTabBrandLoadingState({required this.loadingMessage});
}
class HomeTabBrandErrorState extends HomeTabState{
  Failures error;
  HomeTabBrandErrorState({required this.error});
}
class HomeTabBrandSuccessState extends HomeTabState{
  CategoryOrBrandResponseEntity brandResponseEntity;
  HomeTabBrandSuccessState({required this.brandResponseEntity});
}
