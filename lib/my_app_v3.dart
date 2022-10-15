import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'player/tiktok_player_controller.dart';

final currentPage = StateProvider<int>((ref) {
  return 0;
});

final BetterPlayerController _betterPlayerController = BetterPlayerController(
  const BetterPlayerConfiguration(
    aspectRatio: 9 / 16,
    autoPlay: false,
    autoDispose: false,
    looping: true,
  ),
);

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

class MyHomePageV3 extends ConsumerWidget {
  const MyHomePageV3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

                    String source = videos[page];

                    BetterPlayerDataSource betterPlayerDataSource =
                        BetterPlayerDataSource(
                      BetterPlayerDataSourceType.network,
                      source,
                      cacheConfiguration: const BetterPlayerCacheConfiguration(
                        useCache: false,
                      ),
                    );

                    _betterPlayerController
                        .setupDataSource(betterPlayerDataSource)
                        .then((value) async {
                      await _betterPlayerController.seekTo(Duration.zero);
                      await _betterPlayerController.play();
                    });

                    // Pre-cache Image
                    try {
                      debugPrint('cache: $page +1 +2 +3');
                      final images = ref.watch(dataSourceImageProvider);
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
                  return Stack(
                    children: [
                      SizedBox.expand(
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox.expand(
                        child: _VideoPlayer(
                          key: ValueKey('_VideoPlayer_$index'),
                          index: index,
                        ),
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
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 0,
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
  Widget build(BuildContext context) {
    final index = ref.watch(currentPage);

    if (widget.index != index) return const SizedBox();
    return BetterPlayer(
      controller: _betterPlayerController,
    );
  }
}
