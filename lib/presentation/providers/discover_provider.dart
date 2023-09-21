import 'package:flutter/material.dart';

import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  // Funcion para pasar al siguiente video
  Future<void> loadNextPage() async {
    // todo: cargar videos

    notifyListeners();
  }
}
