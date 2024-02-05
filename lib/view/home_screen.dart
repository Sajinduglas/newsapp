import 'package:flutter/material.dart';
import 'package:newsapp/contoller/home_screen_conntoller.dart';
import 'package:newsapp/view/widget/news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenController provider = Provider.of<HomeScreenController>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Daily report"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Provider
            .of<HomeScreenController>(context)
            .isloading == true
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
            itemBuilder: (context, index) =>
                NewsCard(
                    title:
                    provider.newsModel.articles?[index].title.toString() ?? "",
                    description: provider.newsModel.articles?[index].description
                        .toString() ?? "",
                    date: provider.newsModel.articles?[index].publishedAt,
                    imageUrl: provider.newsModel.articles?[index].urlToImage
                        .toString() ?? "",
                    contant: provider.newsModel.articles?[index].content
                        .toString() ?? "",
                    sourceName: provider.newsModel.articles?[index].source
                        .toString() ?? "",
                    url: provider.newsModel.articles?[index].url.toString() ??
                        ""),
            separatorBuilder: (context,index)=>Divider(
              height: 20,
            ),
            itemCount: provider.newsModel.articles?.length ??0));
  }
}
