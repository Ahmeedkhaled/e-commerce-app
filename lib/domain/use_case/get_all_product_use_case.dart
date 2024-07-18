import 'package:dartz/dartz.dart';
import 'package:untitled13/domain/entity/CategoryOrBrandResponEntity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/repository/repository/home_repository_contract.dart';

class GetAllBrandsUseCase{
  HomeRepositoryContract repositoryContract;
  GetAllBrandsUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke(){
    return repositoryContract.getBrands();
  }
}