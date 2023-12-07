import 'package:dartz/dartz.dart';
import 'package:untitled13/domain/entity/CategoryResponEntity.dart';
import 'package:untitled13/domain/failures.dart';

abstract class HomeDataSource{
  Future<Either<Failures,CategoryResponEntity>> getCategories();

}