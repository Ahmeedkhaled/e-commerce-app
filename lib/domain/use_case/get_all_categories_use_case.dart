import 'package:dartz/dartz.dart';
import 'package:untitled13/domain/entity/CategoryResponEntity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/repository/repository/home_repository_contract.dart';

class GetAllCategoriesUseCase{
  HomeRepositoryContract repositoryContract;
  GetAllCategoriesUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryResponEntity>> invoke(){
    return repositoryContract.getCategories();
  }
}