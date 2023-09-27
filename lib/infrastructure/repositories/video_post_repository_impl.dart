import 'package:tiktok_alike/domain/datasources/video_posts_datasource.dart';
import 'package:tiktok_alike/domain/entities/video_post.dart';

import '../../domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  // Se llama al video post data source del dominio, asi mas adelante permitimos datasopurces de cualquier lado
  final VideoPostDataSource videosDatasource;

  VideoPostsRepositoryImpl({required this.videosDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
