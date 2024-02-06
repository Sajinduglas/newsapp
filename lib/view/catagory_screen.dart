import 'package:flutter/material.dart';
import 'package:newsapp/view/widget/news_card.dart';
import 'package:provider/provider.dart';

import '../contoller/catogory_controller.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController provider =
        Provider.of<CategoryController>(context);
    return DefaultTabController(
        length: provider.catagoryList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Categories"),
            bottom: TabBar(
              isScrollable: true,
              tabs: List.generate(
                provider.catagoryList.length,
                (index) => Tab(
                  text: provider.catagoryList[index],
                ),
              ),
              onTap: (value) {
                provider.onTap(index: value);
              },
            ),
          ),
          body: Consumer<CategoryController>(
              builder: (context, CategoryController, child) =>
                  provider.isloading == true
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: EdgeInsets.all(10),
                          child: ListView.separated(
                              itemBuilder: (context, index) => NewsCard(
                                    title: CategoryController
                                            .newsModel.articles?[index].title
                                            .toString() ??
                                        "",
                                    description: CategoryController.newsModel
                                            .articles?[index].description
                                            .toString() ??
                                        "",
                                    date: CategoryController
                                        .newsModel.articles?[index].publishedAt,
                                    imageUrl: CategoryController.newsModel
                                            .articles?[index].urlToImage
                                            .toString() ??
                                        "",
                                    contant: CategoryController
                                            .newsModel.articles?[index].content
                                            .toString() ??
                                        "",
                                    sourceName: CategoryController
                                            .newsModel.articles?[index].source
                                            .toString() ??
                                        "",
                                    url: CategoryController
                                            .newsModel.articles?[index].content
                                            .toString() ??
                                        "",
                                  ),
                              separatorBuilder: (context, index) =>
                                  Divider(height: 20),
                              itemCount:
                              CategoryController.newsModel.articles?.length ??
                                      0),
                        )),
        ));
  }
}
