import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'player/tiktok_player_controller.dart';

final currentPageSProvider = StateProvider<int>(
  (ref) => 0,
);
final activePageSProvider = StateProvider<List<int>>(
  (ref) {
    return [];
  },
);

final dataSourceByPageProvider = Provider.family<BetterPlayerDataSource, int>(
  (ref, index) {
    final videos = ref.watch(dataSourceProvider);
    String source = videos[index];

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      source,
      liveStream: true,
      videoFormat: BetterPlayerVideoFormat.hls,
      cacheConfiguration: const BetterPlayerCacheConfiguration(
        useCache: false,
      ),
    );

    ref.onDispose(() {
      //  clear garbage
    });
    return dataSource;
  },
);

final playerControllerByPageProvider =
    Provider.family<BetterPlayerController, int>(
  (ref, id) {
    final source = ref.watch(dataSourceByPageProvider(id));

    final controller = BetterPlayerController(
      const BetterPlayerConfiguration(
        aspectRatio: 9 / 16,
        fit: BoxFit.fitWidth,
        looping: true,
        showPlaceholderUntilPlay: false,
        showSubtitlesDrawer: false,
        // placeholder: Image.network(
        //   images[id],
        //   fit: BoxFit.cover,
        // ),
        placeholder: SizedBox(), // for optimate Heap Memory
        autoPlay: false,
        autoDispose: false,
        handleLifecycle: false,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: false,
          backgroundColor: Colors.transparent,
          loadingWidget: SizedBox(),
        ),
      ),
      betterPlayerDataSource: source,
    );

    ref.onDispose(() {
      //  clear garbage
      controller.clearCache();
      controller.dispose();
    });

    return controller;
  },
);

class PlayPauseProviderParamsClass {
  final int index;
  final bool isPlay;

  const PlayPauseProviderParamsClass({
    required this.index,
    required this.isPlay,
  });
}

final playPauseProvider = Provider.family<bool, PlayPauseProviderParamsClass>(
  (ref, params) {
    final player = ref.watch(
      playerControllerByPageProvider(params.index),
    );

    if (params.isPlay) {
      if (player.isPlaying() ?? false) return false;

      player.play().then(
        (value) {
          ref.read(activePageSProvider.notifier).update(
                (state) => [params.index, ...state],
              );
        },
      );

      return true;
    } else {
      if (!(player.isPlaying() ?? false)) return false;

      player.pause().then(
        (value) async {
          ref.read(activePageSProvider.notifier).update(
            (state) {
              state.remove(params.index);
              return [...state];
            },
          );
          if (!(player.isVideoInitialized() ?? false)) return false;
          if (player.videoPlayerController?.value.duration == null) {
            return false;
          }
          if ((player.videoPlayerController?.value.duration
                      ?.compareTo(Duration.zero) ??
                  0) >
              0) return false;
          await player.seekTo(Duration.zero);
        },
      );
    }
    return false;
  },
);

class MyAppV3 extends ConsumerWidget {
  const MyAppV3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      showPerformanceOverlay: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePageV3(),
    );
  }
}

class MyHomePageV3 extends ConsumerStatefulWidget {
  const MyHomePageV3({super.key});

  @override
  ConsumerState<MyHomePageV3> createState() => _MyHomePageV3State();
}

class _MyHomePageV3State extends ConsumerState<MyHomePageV3> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((final _) => _init());
  }

  _init() async {
    ref.read(playPauseProvider(
      const PlayPauseProviderParamsClass(index: 0, isPlay: true),
    ));

    // ref.read(playerControllerByPageProvider(1)).preCache(
    //       ref.read(dataSourceByPageProvider(1)),
    //     );
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification.depth != 0) return false;
    if (notification is! ScrollUpdateNotification) return false;

    final metrics = notification.metrics as PageMetrics;
    final page = metrics.page!.round();
    // debugPrint('ScrollEndNotification: ${metrics.page} $page');

    if (page == ref.read(currentPageSProvider)) return false;

    ref.read(currentPageSProvider.notifier).state = page;
    _pauseAllAndPlayIndex(page);

    return false;
  }

  _pauseAllAndPlayIndex(int index) {
    final listActive = ref.read(activePageSProvider);
    for (var activeItem in listActive) {
      ref.read(
        playPauseProvider(
          PlayPauseProviderParamsClass(index: activeItem, isPlay: false),
        ),
      );
    }
    if (index >= 2) {
      ref.read(playerControllerByPageProvider(index - 2)).dispose();
      ref.read(playerControllerByPageProvider(index + 2)).dispose();
      // ref.read(playerControllerByPageProvider(index + 2)).clearCache();
    }
    // ref.read(playerControllerByPageProvider(index + 1)).preCache(
    //       ref.read(dataSourceByPageProvider(index + 1)),
    //     );

    ref.read(
      playPauseProvider(
        PlayPauseProviderParamsClass(index: index, isPlay: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final videos = ref.watch(dataSourceProvider);

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: _onNotification,
              child: PageView.builder(
                allowImplicitScrolling: true,
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  String video = videos[index];
                  return Stack(
                    children: [
                      _VideoPlayer(
                        key: ValueKey('_VideoPlayer_$index'),
                        index: index,
                      ),
                      const _TopShadow(),
                      const _BottomShadow(),
                      _DebugPlayerWidget(video: video),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}

class _VideoPlayer extends ConsumerWidget {
  const _VideoPlayer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BetterPlayer(
      key: ValueKey('_BetterPlayer_$index'),
      controller: ref.watch(playerControllerByPageProvider(index)),
    );
  }
}

class _DebugPlayerWidget extends ConsumerWidget {
  const _DebugPlayerWidget({required this.video});
  final String video;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activePageValue = ref.watch(activePageSProvider);

    return SafeArea(
      child: Text(
        '$video\nactive: ${activePageValue.join(', ')}',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class _TopShadow extends ConsumerWidget {
  const _TopShadow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            1,
          ],
          colors: [
            Colors.black87,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

class _BottomShadow extends ConsumerWidget {
  const _BottomShadow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              1,
            ],
            colors: [
              Colors.transparent,
              Colors.black54,
            ],
          ),
        ),
      ),
    );
  }
}
