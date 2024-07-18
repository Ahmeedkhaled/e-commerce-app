import 'package:dartz/dartz.dart';
import 'package:untitled13/domain/entity/ProductResponseEntity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/repository/repository/home_repository_contract.dart';

class GetAllProductUseCase {
  HomeRepositoryContract repositoryContract;
  GetAllProductUseCase({required this.repositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return repositoryContract.getProducts();
  }
}
