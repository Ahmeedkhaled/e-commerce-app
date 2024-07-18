import 'package:dartz/dartz.dart';
import 'package:untitled13/data/modal/api/api_manager.dart';
import 'package:untitled13/domain/entity/CategoryOrBrandResponEntity.dart';
import 'package:untitled13/domain/entity/ProductResponseEntity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/repository/data_source/home_data_source.dart';

class HomeDataSourceImpl extends HomeDataSource{
  ApiManager apiManager;
  HomeDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories()async {
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

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands()async {
    var either=await apiManager.getAllBrands();
    return either.fold(
            (l){
          return Left(Failures(errorMessage: l.errorMessage));
        },
            (r){
          return Right(r);
        }
    );
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async{
    var either=await apiManager.getAllProducts();
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