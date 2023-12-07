import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/domain/entity/CategoryResponEntity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/use_case/get_all_categories_use_case.dart';
import 'package:untitled13/ui/tabs/home/cubit/home_tab_state.dart';

class HomeTabViewModal extends Cubit<HomeTabState>{
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  HomeTabViewModal({required this.getAllCategoriesUseCase}):super(HomeTabInitialState());
  List<CategoryEntity> categoriesList=[];

  void getAllCategories() async{
    emit(HomeTabLoadingState(loadingMessage: "Loading..."));
   var either=await getAllCategoriesUseCase.invoke();
   either.fold((l){
    emit(HomeTabErrorState(error: l));
   }, (response){
     categoriesList=response.data??[];
     emit(HomeTabSuccessState(categoryResponEntity: response));
           }
   );
  }


}