import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gifter/domain/entities/image_gif.dart';
import 'package:gifter/domain/use_case/use_case_get_image_gif.dart';
import 'package:gifter/domain/use_case/use_case_search_image_gif.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: CachedNetworkImage(
          imageUrl:
              "https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif",
          placeholder: (context, url) => const CircularProgressIndicator(
            color: Colors.white,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onSubmitted: (text) {
                setState(() {
                  search = text;
                });
              },
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: 'Pesquisar',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                hintText: 'Pesquisar',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder(
                future: search == null
                    ? UsecaseGetImageGiftrending.getImageGiftrending()
                    : UseCaseSearchImageGif.searchImageGiftrending(search),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error.toString()}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  if (snapshot.data.isEmpty) {
                    return const Center(
                      child: Text(
                        'Sem Gifs',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  }

                  return _GifGrid(context, snapshot);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _GifGrid(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          ImageGif imageGif = snapshot.data[index];
          return GestureDetector(
              child: CachedNetworkImage(
            imageUrl: imageGif.url,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.white,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            height: 300.0,
          ));
        });
  }
}
