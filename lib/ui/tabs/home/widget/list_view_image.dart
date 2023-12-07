import 'package:flutter/material.dart';
import 'package:untitled13/domain/entity/CategoryResponEntity.dart';
import 'package:untitled13/ui/tabs/home/widget/category_item.dart';

class CustomListViewImage extends StatelessWidget {
  List<CategoryEntity> categoriesList;
   CustomListViewImage({super.key,required this.categoriesList});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      child: GridView.builder(
        itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16
          ),
          itemBuilder: (context, index) {
            return CategoryItem(categoryEntity:categoriesList[index] ,);
          },),
    );
  }
}
