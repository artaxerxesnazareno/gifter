class ImageGif {
  String url;

  ImageGif({required this.url});

  factory ImageGif.fromMap(Map<String, dynamic> map) {
    return ImageGif(
      url: map['url'] as String,
    );
  }
}

