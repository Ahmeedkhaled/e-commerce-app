import 'package:dartz/dartz.dart';
import 'package:untitled13/domain/entity/CategoryOrBrandResponEntity.dart';
import 'package:untitled13/domain/entity/ProductResponseEntity.dart';
import 'package:untitled13/domain/failures.dart';

abstract class HomeDataSource{
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getCategories();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getBrands();
  Future<Either<Failures,ProductResponseEntity>> getProducts();


}