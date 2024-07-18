import 'package:flutter/material.dart';

class LastHomeList extends StatelessWidget {
  const LastHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Home Appliance", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, crossAxisSpacing: 16, mainAxisSpacing: 16),
            itemBuilder: (context, index) {
              return Image.asset("assets/images/Frame9.png");
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
