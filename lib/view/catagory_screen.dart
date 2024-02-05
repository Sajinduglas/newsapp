import 'package:flutter/material.dart';
import 'package:newsapp/view/widget/news_card.dart';
import 'package:provider/provider.dart';

import '../contoller/catogory_controller.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryprovider =
        Provider.of<CategoryController>(context);
    return DefaultTabController(
        length: categoryprovider.catagoryList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Categories"),
            bottom: TabBar(
              isScrollable: true,
              tabs: List.generate(
                categoryprovider.catagoryList.length,
                (index) => Tab(
                  text: categoryprovider.catagoryList[index],
                ),
              ),
              onTap: (value) {
                categoryprovider.onTap(index: value);
              },
            ),
          ),
          body: Consumer<CategoryController>(
              builder: (context, CategoryController, child) =>
                  categoryprovider.isloading == true
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: EdgeInsets.all(10),
                          child: ListView.separated(
                              itemBuilder: (context, index) => NewsCard(
                                    title: CategoryController
                                            .newsModel.articles?[index].title
                                            .toString() ??
                                        "",
                                    description: categoryprovider.newsModel
                                            .articles?[index].description
                                            .toString() ??
                                        "",
                                    date: categoryprovider
                                        .newsModel.articles?[index].publishedAt,
                                    imageUrl: categoryprovider.newsModel
                                            .articles?[index].urlToImage
                                            .toString() ??
                                        "",
                                    contant: categoryprovider
                                            .newsModel.articles?[index].content
                                            .toString() ??
                                        "",
                                    sourceName: categoryprovider
                                            .newsModel.articles?[index].source
                                            .toString() ??
                                        "",
                                    url: categoryprovider
                                            .newsModel.articles?[index].content
                                            .toString() ??
                                        "",
                                  ),
                              separatorBuilder: (context, index) =>
                                  Divider(height: 20),
                              itemCount:
                                  categoryprovider.newsModel.articles?.length ??
                                      0),
                        )),
        ));
  }
}
