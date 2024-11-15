import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifter/domain/entities/image_gif.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';

class GifPage extends StatelessWidget {
  ImageGif imageGif;

  GifPage(this.imageGif);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  final response = await http.get(Uri.parse(imageGif.url));
                  final bytes = response.bodyBytes;
                  final temp = await getTemporaryDirectory();
                  final path = '${temp.path}/gif.gif';
                  File(path).writeAsBytesSync(bytes);
                  await Share.shareXFiles([XFile(path)], text: imageGif.title);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Erro ao compartilhar GIF')),
                  );
                }
              },
              icon: const Icon(Icons.share)),
        ],
        title: Text(
          imageGif.title,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: FadeInImage.memoryNetwork(
          image: imageGif.url,
          placeholder: kTransparentImage,
          fit: BoxFit.cover,
          height: 300.0,
        ),
      ),
    );
  }
}
