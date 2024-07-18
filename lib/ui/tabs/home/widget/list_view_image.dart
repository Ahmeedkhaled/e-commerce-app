import 'package:flutter/material.dart';
import 'package:untitled13/domain/entity/CategoryOrBrandResponEntity.dart';
import 'package:untitled13/ui/tabs/home/widget/category_item.dart';

// ignore: must_be_immutable
class CustomListViewImage extends StatelessWidget {
  List<CategoryOrBrandEntity> list;
  CustomListViewImage({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: GridView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryEntity: list[index],
          );
        },
      ),
    );
  }
}
