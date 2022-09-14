import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/bloc/reddit_bloc.dart';
import 'package:reddit_clone/constant/color_constant.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RedditBloc>(
      create: (_) =>
          RedditBloc(client: HttpClient())..add(const RedditFetched()),
      child: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool expand = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            "Reddit-Clone",
            style: TextStyle(color: ColorConstant.colorwhite),
          )),
      body: BlocBuilder<RedditBloc, RedditState>(
        builder: (context, redditState) {
          switch (redditState.status) {
            case RedditStatus.failure:
              return Center(
                child: Text(
                  "Hata Oluştu!",
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            case RedditStatus.success:
              if (redditState.data.isEmpty) {
                return const Center(
                  child: Text("Görüntülenecek bir şey bulunamadı..."),
                );
              }
              return ListView.builder(
                  itemCount: redditState.data.first.data!.children!.length,
                  itemBuilder: (context, index) {
                    var item = redditState.data.first.data!.children![index];
                    return Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      margin: EdgeInsets.all(15),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  "Posted by " + item.data!.name!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                )),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color:
                                          ColorConstant.primaryColor.shade200,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Join",
                                      )),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.data!.secureMedia != null
                                        ? item.data!.secureMedia!.oembed!
                                                    .description !=
                                                null
                                            ? item.data!.secureMedia!.oembed!
                                                .description!
                                            : ""
                                        : "",
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.data!.title!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: ColorConstant.coloryellow),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(item.data!.subreddit!),
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  item.expand = !item.expand;
                                });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(item.expand
                                          ? item.data!.selftext!.length > 250
                                              ? item.data!.selftext!
                                                      .substring(0, 250) +
                                                  "..."
                                              : item.data!.selftext!
                                          : item.data!.selftext!))
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                item.data!.thumbnail == "self"
                                    ? Container()
                                    : Image.network(
                                        item.data!.thumbnail!,
                                      )
                              ],
                            ),
                            Row(
                              children: [
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.comment),
                                    label: Text("Comment")),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.share),
                                    label: Text("Share")),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.save),
                                    label: Text("Save"))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            default:
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              );
          }
        },
      ),
    );
  }
}
