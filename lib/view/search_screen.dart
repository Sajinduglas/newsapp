import 'package:flutter/material.dart';
import 'package:newsapp/view/widget/news_card.dart';
import 'package:provider/provider.dart';
import '../contoller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width * 2 / 3,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xff6A3DE8), width: 3)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      provider.searchData(
                          searchText: textController.text.toLowerCase());
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff6A3DE8))),
                  ),
                )
              ],
            ),
            Expanded(child: Consumer<SearchScreenController>(
              builder: (context, SearchScreenController, child) {
                return provider.isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemBuilder: (context, index) => NewsCard(
                            title: provider.newsModel?.articles?[index].title ??
                                "",
                            description: provider
                                    .newsModel?.articles?[index].description ??
                                "",
                            date: provider
                                .newsModel?.articles?[index].publishedAt,
                            imageUrl: provider
                                    .newsModel?.articles?[index].urlToImage ??
                                "",
                            contant:
                                provider.newsModel?.articles?[index].content ??
                                    "",
                            sourceName:
                                provider.newsModel?.articles?[index].source?.name ?? "",
                            url: provider.newsModel?.articles?[index].url ?? ""),
                        separatorBuilder: (context, index) => const Divider(height: 20),
                        itemCount: provider.newsModel?.articles?.length ?? 0);
              },
            ))
          ],
        ),
      )),
    );
  }
}
