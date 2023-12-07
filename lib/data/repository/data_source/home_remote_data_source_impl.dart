import 'package:dartz/dartz.dart';
import 'package:untitled13/data/modal/api/api_manager.dart';
import 'package:untitled13/domain/entity/CategoryResponEntity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/repository/data_source/home_data_source.dart';

class HomeDataSourceImpl extends HomeDataSource{
  ApiManager apiManager;
  HomeDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CategoryResponEntity>> getCategories()async {
   var either=await apiManager.getAllCategories();
   return either.fold(
           (l){
     return Left(Failures(errorMessage: l.errorMessage));
   },
           (r){
            return Right(r);
           }
   );
  }

}