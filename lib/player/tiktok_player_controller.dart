import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_driven_app/data_source_m3u8.dart';
import 'package:video_player/video_player.dart';

class DouyinPlayerController extends ChangeNotifier {
  DouyinPlayerController({
    required this.url,
    this.isPlaying = false,
    this.loop = true,
  }) : videoPlayerController = VideoPlayerController.network(url);

  String url;
  bool isPlaying;
  bool loop;

  late VideoPlayerController videoPlayerController;
  Future? videoPlayerFuture;

  void prepare() {
    videoPlayerFuture =
        videoPlayerController.initialize().then<dynamic>((value) {
      if (isPlaying) {
        play();
      }
    });
    videoPlayerController.setLooping(loop);
    videoPlayerController.addListener(_listener);
  }

  void play() async {
    isPlaying = true;
    videoPlayerController.play();
    notifyListeners();
  }

  void pause() {
    isPlaying = false;
    videoPlayerController.pause();
    notifyListeners();
  }

  void _listener() {
    final isPlaying = videoPlayerController.value.isPlaying;
    if (isPlaying != isPlaying) {
      this.isPlaying = isPlaying;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    debugPrint('player-dispose');
    videoPlayerController.dispose();
    super.dispose();
  }
}

final isPlayVideoProvider = StateProvider.family<bool, int>((ref, index) {
  if (index == 0) return true;
  return false;
});

final playingVideoProvider = StateProvider<String?>((ref) {
  return ref.read(dataSourceProvider)[0].toString();
});

final dataSourceProvider = Provider<List<String>>(
  (ref) {
    return dataM3u8Json['videos'] as List<String>;
  },
);

class DouyinPlayerControllerProviderParams {
  final String url;
  final bool isPlaying;
  const DouyinPlayerControllerProviderParams({
    required this.url,
    required this.isPlaying,
  });
}

final douyinPlayerControllerProvider = ChangeNotifierProvider.family<
    DouyinPlayerController, DouyinPlayerControllerProviderParams>(
  (ref, params) => DouyinPlayerController(
    url: params.url,
    isPlaying: params.isPlaying,
  ),
);
