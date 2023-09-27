// El origren de los datos

// Es una clase abstracta porque no se van a hacer instancias de esta clase
import '../entities/video_post.dart';

abstract class VideoPostDataSource {
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
