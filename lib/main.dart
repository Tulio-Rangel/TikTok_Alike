import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_alike/config/theme/app_theme.dart';
import 'package:tiktok_alike/infrastructure/datasources/local_video_posts_datasource_impl.dart';
import 'package:tiktok_alike/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:tiktok_alike/presentation/providers/discover_provider.dart';
import 'package:tiktok_alike/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoPostsDatasource());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp(
        title: 'TikTok Copy',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
