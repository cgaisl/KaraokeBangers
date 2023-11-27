import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:karaoke_bangers/di/di.dart';
import 'package:karaoke_bangers/screens/song_detail/song_detail_screen.dart';
import 'package:karaoke_bangers/screens/song_list/song_list_screen.dart';
import 'package:karaoke_bangers/screens/song_new/song_new_screen.dart';
import 'package:karaoke_bangers/screens/song_update/song_update_screen.dart';
import 'package:karaoke_bangers/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  songRepository =
      SharedPreferencesSongRepository(await SharedPreferences.getInstance());
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      // This will make the status bar text color white.
      statusBarIconBrightness: Brightness
          .light, // This is for Android. This will make the status bar icons white.
    ),
  );
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SongListScreen(),
    ),
    GoRoute(
      path: '/song/new',
      builder: (context, state) => SongNewScreen(),
    ),
    GoRoute(
      path: '/song/:id',
      builder: (context, state) =>
          SongDetailScreen(songId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/song/update/:id',
      builder: (context, state) =>
          SongUpdateScreen(songId: state.pathParameters['id']!),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeData,
      routerConfig: _router,
    );
  }
}
