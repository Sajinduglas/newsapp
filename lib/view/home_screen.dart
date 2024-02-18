import 'package:flutter/material.dart';
import 'package:newsapp/controller/home_screen_controller.dart';
import 'package:newsapp/view/search_screen.dart';
import 'package:newsapp/view/utils/colors/mycolors.dart';
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
        backgroundColor: MyColors.bgColor,
        title: Text("Headlines",
            style: TextStyle(
              color: MyColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(Icons.search, size: 25, color: MyColors.whiteColor))
        ],
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, provider, child) =>
        provider.isLoading == true
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
            itemBuilder: (context, index) =>
                NewsCard(
                    title: provider.newsModel.articles?[index].title
                        .toString() ??
                        "",
                    description: provider.newsModel.articles?[index].description
                        .toString() ??
                        "",
                    date: provider.newsModel.articles?[index].publishedAt,
                    imageUrl: provider.newsModel.articles?[index].urlToImage
                        .toString() ??
                        "",
                    contant:
                    provider.newsModel.articles?[index].content.toString() ??
                        "",
                    sourceName:
                    provider.newsModel.articles?[index].source.toString() ??
                        "",
                    url: provider.newsModel.articles?[index].url.toString() ??
                        ""),
            separatorBuilder: (context, index) =>
                Divider(
                  color: MyColors.bgColor,
                  height: 10,
                ),
            itemCount: provider.newsModel.articles?.length ?? 0),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:newsapp/controller/home_screen_controller.dart';
// import 'package:newsapp/view/search_screen.dart';
// import 'package:newsapp/view/utils/colors/mycolors.dart';
// import 'package:newsapp/view/widget/news_card.dart';
// import 'package:provider/provider.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key});
//
//   void fetchData(BuildContext context) {
//     Provider.of<HomeScreenController>(context, listen: false).fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.bgColor,
//         title: Text("Headlines",
//             style: TextStyle(
//               color: MyColors.whiteColor,
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//             )),
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SearchScreen()),
//                 );
//               },
//               icon: Icon(Icons.search, size: 25, color: MyColors.whiteColor))
//         ],
//       ),
//       body: Consumer<HomeScreenController>(
//         builder: (context, provider, child) {
//           fetchData(context); // Fetch data when the widget is built
//           return provider.isLoading == true
//               ? Center(child: CircularProgressIndicator())
//               : ListView.separated(
//             itemBuilder: (context, index) => NewsCard(
//                 title: provider.newsModel.articles?[index].title.toString() ??
//                     "",
//                 description: provider.newsModel.articles?[index].description
//                     .toString() ??
//                     "",
//                 date: provider.newsModel.articles?[index].publishedAt,
//                 imageUrl: provider.newsModel.articles?[index].urlToImage
//                     .toString() ??
//                     "",
//                 contant:
//                 provider.newsModel.articles?[index].content.toString() ??
//                     "",
//                 sourceName:
//                 provider.newsModel.articles?[index].source.toString() ??
//                     "",
//                 url: provider.newsModel.articles?[index].url.toString() ?? ""),
//             separatorBuilder: (context, index) => Divider(
//               color: MyColors.bgColor,
//               height: 10,
//             ),
//             itemCount: provider.newsModel.articles?.length ?? 0,
//           );
//         },
//       ),
//     );
//   }
// }

