import 'package:untitled13/domain/entity/CategoryResponEntity.dart';
import 'package:untitled13/domain/failures.dart';

abstract class HomeTabState{}
class HomeTabInitialState extends HomeTabState{}
class HomeTabLoadingState extends HomeTabState{
  String? loadingMessage;
  HomeTabLoadingState({required this.loadingMessage});
}
class HomeTabErrorState extends HomeTabState{
  Failures error;
  HomeTabErrorState({required this.error});
}
class HomeTabSuccessState extends HomeTabState{
  CategoryResponEntity categoryResponEntity;
  HomeTabSuccessState({required this.categoryResponEntity});
}
