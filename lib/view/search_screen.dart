import 'package:flutter/material.dart';
import 'package:newsapp/view/utils/colors/mycolors.dart';
import 'package:newsapp/view/widget/news_card.dart';
import 'package:provider/provider.dart';
import '../controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.bgColor,
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(
            color: MyColors.whiteColor,
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SizedBox(
              //   //    height: 45,
              //       height: MediaQuery.of(context).size.height/4,
              //      // width: MediaQuery.sizeOf(context).width * 2 / 3,
              //       width: MediaQuery.of(context).size.width*.52,
              //       child: TextField(
              //         controller: textController,
              //         decoration: InputDecoration(
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(10),
              //               borderSide: const BorderSide(
              //                   color: Color(0xff6A3DE8), width: 3)),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 5,
              //     ),
              //     Expanded(
              //       child: ElevatedButton(
              //         onPressed: () {
              //           provider.searchData(
              //               searchText: textController.text.toLowerCase());
              //           FocusManager.instance.primaryFocus?.unfocus();
              //         },
              //         child: Text(
              //           "Search",
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStatePropertyAll(Color(0xff6A3DE8))),
              //       ),
              //     )
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFd6e5ea),
                    //  hintText: "Search",
                    labelText: "Search",
                    // prefixIcon: Icon(Icons.person_outline_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                      // borderSide: BorderSide(color: Colors.black87)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    provider.searchData(
                        searchText: textController.text.toLowerCase());
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF568896),
                    ),
                  ),
                  child: Text("Search",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Expanded(child: Consumer<SearchScreenController>(
                builder: (context, SearchScreenController, child) {
                  return provider.isLoading == true
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          itemBuilder: (context, index) => NewsCard(
                              title: provider.newsModel?.articles?[index].title ??
                                  "",
                              description: provider.newsModel?.articles?[index]
                                      .description ??
                                  "",
                              date: provider
                                  .newsModel?.articles?[index].publishedAt,
                              imageUrl:
                                  provider.newsModel?.articles?[index].urlToImage ??
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
        ),
      ),
    );
  }
}
