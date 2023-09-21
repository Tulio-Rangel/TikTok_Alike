import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_alike/config/theme/app_theme.dart';
import 'package:tiktok_alike/presentation/providers/discover_provider.dart';
import 'package:tiktok_alike/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DiscoverProvider())],
      child: MaterialApp(
        title: 'TikTok Copy',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
