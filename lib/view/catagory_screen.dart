import 'package:flutter/material.dart';
import 'package:newsapp/view/utils/colors/mycolors.dart';
import 'package:newsapp/view/widget/news_card.dart';
import 'package:provider/provider.dart';

import '../controller/catogory_controller.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController provider = Provider.of<CategoryController>(context);
    return DefaultTabController(
      length: provider.categoryList.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.bgColor,
          centerTitle: true,
          title: Text(
            "Categories",
            style: TextStyle(
              color: MyColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          bottom: TabBar(
            indicatorColor: MyColors.blackColor ,
            labelColor: MyColors.whiteColor,
            unselectedLabelColor: MyColors.blackColor,
            physics: BouncingScrollPhysics(),
            isScrollable: true,
            tabs: List.generate(
              provider.categoryList.length,
              (index) => Tab(
                text: provider.categoryList[index],
              ),
            ),
            onTap: (value) {
              provider.onTap(index: value);
            },
          ),
        ),
        body: Consumer<CategoryController>(
          builder: (context, categoryController, child) =>
              categoryController.isloading == true
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView.separated(
                          itemBuilder: (context, index) => NewsCard(
                                title: categoryController
                                        .newsModel.articles?[index].title
                                        .toString() ??
                                    "",
                                description: categoryController
                                        .newsModel.articles?[index].description
                                        .toString() ??
                                    "",
                                date: provider
                                    .newsModel.articles?[index].publishedAt,
                                imageUrl: categoryController
                                        .newsModel.articles?[index].urlToImage
                                        .toString() ??
                                    "",
                                contant: categoryController
                                        .newsModel.articles?[index].content
                                        .toString() ??
                                    "",
                                sourceName: categoryController
                                        .newsModel.articles?[index].source
                                        .toString() ??
                                    "",
                                url: categoryController
                                        .newsModel.articles?[index].content
                                        .toString() ??
                                    "",
                              ),
                          separatorBuilder: (context, index) =>
                              Divider(height: 10, color: MyColors.blackColor),
                          itemCount:
                              categoryController.newsModel.articles?.length ??
                                  0),
                    ),
        ),
      ),
    );
  }
}
