import 'package:flutter/material.dart';
import 'package:untitled13/domain/entity/CategoryResponEntity.dart';

class CategoryItem extends StatelessWidget {
  CategoryEntity categoryEntity;
   CategoryItem({super.key,required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.height*0.04,
            backgroundImage: NetworkImage(categoryEntity.image??""),
          ),
        ),
        Expanded(
          flex: 2,
            child: Text(categoryEntity.name??"",
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center
            ,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 12,
                  fontWeight: FontWeight.w400
                )
            )
        ),
      ],
    );
  }
}
