import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/domain/di.dart';
import 'package:untitled13/my_theme.dart';
import 'package:untitled13/ui/tabs/list/cubit/cubit/list_tab_state.dart';
import 'package:untitled13/ui/tabs/list/cubit/cubit/list_tab_view_modal.dart';
import 'package:untitled13/ui/tabs/list/widget/List_details.dart';
import 'package:untitled13/ui/tabs/list/widget/list_item.dart';

// ignore: must_be_immutable
class ListTab extends StatelessWidget {
  ListTabViewModal viewModal =
      ListTabViewModal(getAllProductUseCase: injectGetAllProductUseCase());

  ListTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<ListTabViewModal, ListTabState>(
          bloc: viewModal..getAllCategories(),
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Image.asset("assets/images/smalllogo.png"),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                              decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.06),
                              child: Icon(
                                Icons.search,
                                size: 35,
                                color: MyTheme.primaryColor,
                              ),
                            ),
                            hintText: "what do you search for?",
                            hintStyle: Theme.of(context).textTheme.titleSmall,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: MyTheme.primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: MyTheme.primaryColor),
                            ),
                          )),
                        ),
                        Expanded(
                            flex: 1,
                            child: ImageIcon(
                              const AssetImage("assets/images/icon_cart.png"),
                              color: MyTheme.primaryColor,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    state is ListTabProductInitialState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: MyTheme.primaryColor,
                            ),
                          )
                        : Expanded(
                            child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              mainAxisExtent:
                                  MediaQuery.of(context).size.height * 0.55,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        ListItemDetails.routeName,
                                        arguments:
                                            viewModal.productsList[index]);
                                  },
                                  child: ListItem(
                                    productEntity:
                                        viewModal.productsList[index],
                                  ));
                            },
                            itemCount: viewModal.productsList.length,
                          )),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
