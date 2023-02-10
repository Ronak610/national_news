
import 'package:flutter/material.dart';
import 'package:news_app/Screen/Animal/Provider/AnimalProvider.dart';
import 'package:news_app/Utils/Apihttp.dart';
import 'package:provider/provider.dart';

import '../../News/Modal/News_modal.dart';

class Animal_Page extends StatefulWidget {
  const Animal_Page({Key? key}) : super(key: key);

  @override
  State<Animal_Page> createState() => _Animal_PageState();
}

class _Animal_PageState extends State<Animal_Page> {
  AnimalProvider? AnimalProvidertrue;
  @override
  Widget build(BuildContext context) {
    AnimalProvidertrue = Provider.of(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 65,
              width: double.infinity,
              color: Colors.white,
              child: ListView.builder(
                itemCount:AnimalProvidertrue!.Animal.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.brown)),
                          onPressed: () {
                            AnimalProvidertrue!.ChangeIndex3(index);
                          },
                          child: Text(
                            "${AnimalProvidertrue!.Animal[index]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Apihttp().getNews(
                    "${AnimalProvidertrue!.Animal[AnimalProvidertrue!.index4]}(Animal)"),
                builder: (context, shapshot) {
                  if (shapshot.hasError) {
                    return Text("${shapshot.hasError}");
                  } else if (shapshot.hasData) {
                    NewsModal? l1 = shapshot.data;
                    return ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      itemCount: l1!.articles!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        child: Text(
                                          "${l1.articles![index].title}",
                                          style: TextStyle(
                                              color: Colors.brown,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        child: Text(
                                          "${l1.articles![index].description}",
                                          style: TextStyle(
                                              color: Colors.black
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: double.infinity,
                                  width: 50,
                                  child: Image.network(
                                      "${l1.articles![index].urlToImage}"),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
