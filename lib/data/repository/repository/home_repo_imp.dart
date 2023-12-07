import 'package:dartz/dartz.dart';
import 'package:untitled13/domain/entity/CategoryResponEntity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/repository/data_source/home_data_source.dart';
import 'package:untitled13/domain/repository/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract{
  HomeDataSource dataSource;
  HomeRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failures, CategoryResponEntity>> getCategories() {
     return dataSource.getCategories();
  }

}