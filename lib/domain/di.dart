import 'package:untitled13/data/modal/api/api_manager.dart';
import 'package:untitled13/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:untitled13/data/repository/data_source/home_remote_data_source_impl.dart';
import 'package:untitled13/data/repository/repository/auth_repository_impl.dart';
import 'package:untitled13/data/repository/repository/home_repo_imp.dart';
import 'package:untitled13/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:untitled13/domain/repository/data_source/home_data_source.dart';
import 'package:untitled13/domain/repository/repository/home_repository_contract.dart';
import 'package:untitled13/domain/use_case/get_all_brands_use_case.dart';
import 'package:untitled13/domain/use_case/get_all_categories_use_case.dart';
import 'package:untitled13/domain/use_case/get_all_product_use_case.dart';
import 'package:untitled13/domain/use_case/register_use_case.dart';

import 'repository/repository/auth_repository_contract.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authRepositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract(){
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
GetAllCategoriesUseCase injectGetAllCategoriesUseCase(){
  return GetAllCategoriesUseCase(repositoryContract: injectHomeRepositoryContract());
}
HomeRepositoryContract injectHomeRepositoryContract(){
  return HomeRepositoryImpl(dataSource:injectHomeDataSource() );
}
HomeDataSource injectHomeDataSource(){
  return HomeDataSourceImpl(apiManager: ApiManager.getInstance());
}
GetAllBrandsUseCase injectGetAllBrandsUseCase(){
  return GetAllBrandsUseCase(repositoryContract: injectHomeRepositoryContract());
}
GetAllProductUseCase injectGetAllProductUseCase(){
  return GetAllProductUseCase(repositoryContract: injectHomeRepositoryContract());
}

