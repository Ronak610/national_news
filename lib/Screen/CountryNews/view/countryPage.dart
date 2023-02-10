import 'package:flutter/material.dart';
import 'package:news_app/Screen/CountryNews/provider/CountryProvider.dart';
import 'package:news_app/Screen/News/Modal/News_modal.dart';
import 'package:news_app/Utils/Apihttp.dart';
import 'package:provider/provider.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  CountryProvider? CountryProvidertrue;

  @override
  Widget build(BuildContext context) {
    CountryProvidertrue = Provider.of(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 65,
              width: double.infinity,
              color: Colors.white,
              child: ListView.builder(
                itemCount: CountryProvidertrue!.country.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.brown)),
                          onPressed: () {
                            CountryProvidertrue!.ChangeIndex2(index);
                          },
                          child: Text(
                            "${CountryProvidertrue!.country[index]}",
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
                    "${CountryProvidertrue!.country[CountryProvidertrue!.index2]}(country)"),
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
