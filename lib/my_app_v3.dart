import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:better_player/src/video_player/video_player.dart';

import 'player/tiktok_player_controller.dart';

final currentPage = StateProvider<int>((ref) {
  return 0;
});

final baseConfigBetterPlayerControllerProvider =
    Provider<BetterPlayerConfiguration>((ref) {
  return const BetterPlayerConfiguration(
    aspectRatio: 9 / 16,
    fit: BoxFit.contain,
    looping: true,
    showPlaceholderUntilPlay: false,
    showSubtitlesDrawer: false,
    placeholder: SizedBox(),
    autoPlay: true,
    autoDispose: false,
    handleLifecycle: false,
    controlsConfiguration: BetterPlayerControlsConfiguration(
      showControls: false,
      backgroundColor: Colors.transparent,
      loadingWidget: SizedBox(),
    ),
  );
});

final betterPlayerSourceProvider =
    Provider.family<BetterPlayerDataSource, int>((ref, index) {
  final videos = ref.watch(dataSourceProvider);
  String source = videos[index];

  BetterPlayerDataSource dataSource = BetterPlayerDataSource(
    BetterPlayerDataSourceType.network,
    source,
    liveStream: true,
    videoFormat: BetterPlayerVideoFormat.hls,
    cacheConfiguration: const BetterPlayerCacheConfiguration(
      useCache: true,
    ),
    //  Platform.isAndroid
    //     ? BetterPlayerCacheConfiguration(
    //         useCache: true,
    //         preCacheSize: 100 * 1024 * 1024,
    //         maxCacheSize: 10 * 1024 * 1024,
    //         maxCacheFileSize: 100 * 1024 * 1024,
    //         key: source,
    //       )
    //     : null,
  );
  return dataSource;
});

// currentPage controller
final betterPlayerControllerProvider = Provider<BetterPlayerController>((ref) {
  return BetterPlayerController(
    ref.watch(baseConfigBetterPlayerControllerProvider).copyWith(),
  );
});

// next page controller
final nextPlayerControllerProvider = Provider<BetterPlayerController>((ref) {
  return BetterPlayerController(
    ref.watch(baseConfigBetterPlayerControllerProvider).copyWith(
          autoPlay: false,
        ),
  );
});

// pre page controller
final prePlayerControllerProvider = Provider<BetterPlayerController>((ref) {
  return BetterPlayerController(
    ref.watch(baseConfigBetterPlayerControllerProvider).copyWith(
          autoPlay: false,
        ),
  );
});

class MyAppV3 extends ConsumerWidget {
  const MyAppV3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      // showPerformanceOverlay: true,
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
    final videos = ref.read(dataSourceProvider);
    final dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videos[1],
    );

    VideoPlayerController(
      bufferingConfiguration: dataSource.bufferingConfiguration,
    );
    await ref.read(betterPlayerControllerProvider).preCache(
          dataSource,
        );
  }

  @override
  Widget build(BuildContext context) {
    final videos = ref.watch(dataSourceProvider);
    final images = ref.watch(dataSourceImageProvider);

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification.depth == 0 &&
                    notification is ScrollEndNotification) {
                  final PageMetrics metrics =
                      notification.metrics as PageMetrics;

                  debugPrint('ScrollEndNotification: ${metrics.page}');

                  final page = metrics.page!.round();

                  if (page != ref.read(currentPage)) {
                    ref.read(currentPage.notifier).state = page;

                    // Pre-cache Image
                    // controlle play, stop, start video

                    try {
                      setupNext() async {
                        debugPrint('cache video: $page +1');
                        await ref.read(betterPlayerControllerProvider).preCache(
                              BetterPlayerDataSource(
                                BetterPlayerDataSourceType.network,
                                videos[page + 1],
                              ),
                            );

                        debugPrint('cache video: $page +2 +3');
                        VideoPlayerController(
                          bufferingConfiguration: BetterPlayerDataSource(
                            BetterPlayerDataSourceType.network,
                            videos[page + 1],
                          ).bufferingConfiguration,
                        );
                        VideoPlayerController(
                          bufferingConfiguration: BetterPlayerDataSource(
                            BetterPlayerDataSourceType.network,
                            videos[page + 2],
                          ).bufferingConfiguration,
                        );

                        ref.read(betterPlayerControllerProvider).preCache(
                              BetterPlayerDataSource(
                                BetterPlayerDataSourceType.network,
                                videos[page + 2],
                              ),
                            );
                        ref.read(betterPlayerControllerProvider).preCache(
                              BetterPlayerDataSource(
                                BetterPlayerDataSourceType.network,
                                videos[page + 3],
                              ),
                            );
                      }

                      setupNext();

                      debugPrint('cache image: $page +1 +2 +3');
                      final images = ref.read(dataSourceImageProvider);
                      precacheImage(NetworkImage(images[page + 1]), context);
                      precacheImage(NetworkImage(images[page + 2]), context);
                      precacheImage(NetworkImage(images[page + 3]), context);
                    } on RangeError {
                      debugPrint('RangeError: $page');
                    } catch (e, s) {
                      debugPrint('$e $s');
                    }
                  }
                }
                return false;
              },
              child: PageView.builder(
                allowImplicitScrolling: true,
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
                onPageChanged: (int index) async {},
                itemBuilder: (BuildContext context, int index) {
                  String source = videos[index];
                  String image = images[index];

                  return SafeArea(
                    child: Stack(
                      children: [
                        SafeArea(
                          child: SizedBox.expand(
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        _VideoPlayer(
                          key: ValueKey('_VideoPlayer_$index'),
                          index: index,
                        ),
                        Container(
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
                        ),
                        Align(
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
                        ),
                        SafeArea(
                          child: Text(
                            source,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          '$index',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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

class _VideoPlayer extends ConsumerStatefulWidget {
  const _VideoPlayer({
    super.key,
    required this.index,
  });

  final int index;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __VideoPlayerState();
}

class __VideoPlayerState extends ConsumerState<_VideoPlayer> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((final _) => _init());
  }

  _init() async {}

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(currentPage);
    if (widget.index != index) return const SizedBox();

    final betterPlayerController = ref.watch(betterPlayerControllerProvider);
    final dataSource = ref.watch(betterPlayerSourceProvider(widget.index));
    final stopwatch = Stopwatch()..start();
    debugPrint('setupDataSource() start');

    return FutureBuilder(
      future: betterPlayerController.setupDataSource(dataSource),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          debugPrint('setupDataSource() executed in ${stopwatch.elapsed}');
          debugPrint("rebuid player widget: ${widget.index}");
          return BetterPlayer(
            key: ValueKey('_BetterPlayer_${widget.index}'),
            controller: betterPlayerController,
          );
        }
        return const SizedBox();
      },
    );
    // return BetterPlayer(
    //   key: ValueKey('_BetterPlayer_${widget.index}'),
    //   controller: betterPlayerController,
    // );
  }
}
