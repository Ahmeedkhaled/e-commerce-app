
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/domain/entity/CategoryOrBrandResponEntity.dart';
import 'package:untitled13/domain/use_case/get_all_brands_use_case.dart';
import 'package:untitled13/domain/use_case/get_all_categories_use_case.dart';
import 'package:untitled13/ui/tabs/home/cubit/home_tab_state.dart';

class HomeTabViewModal extends Cubit<HomeTabState>{
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  HomeTabViewModal({required this.getAllCategoriesUseCase,required this.getAllBrandsUseCase}):super(HomeTabBrandInitialState());
  List<CategoryOrBrandEntity> categoriesList=[];
  List<CategoryOrBrandEntity> brandsList=[];

  void getAllCategories() async{
    emit(HomeTabCategoryLoadingState(loadingMessage: "Loading..."));
   var either=await getAllCategoriesUseCase.invoke();
   either.fold((l){
    emit(HomeTabCategoryErrorState(error: l));
   }, (response){
     categoriesList=response.data??[];
     emit(HomeTabCategorySuccessState(categoryResponEntity: response));
           }
   );
  }
  void getAllBrands() async{
    emit(HomeTabBrandLoadingState(loadingMessage: "Loading..."));
   var either=await getAllCategoriesUseCase.invoke();
   either.fold((l){
    emit(HomeTabBrandErrorState(error: l));
   }, (response){
     brandsList=response.data??[];
     emit(HomeTabBrandSuccessState(brandResponseEntity: response));
           }
   );
  }

}