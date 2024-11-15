class ImageGif {
  String url;
  String title;

  ImageGif({required this.url, required this.title});

  factory ImageGif.fromMap(Map<String, dynamic> map) {
    return ImageGif(
      url: map['url'] as String,
      title: map['title'] as String,
    );
  }
}
