import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'player/tiktok_player_controller.dart';

extension VideoPlayerValueX on VideoPlayerController {
  initAndPlayLoop() async {
    debugPrint('initAndPlayLoop:: $dataSource');
    value = value.copyWith(
      isPlaying: true,
      isLooping: true,
    );
    await initialize();
  }
}

final currentPage = StateProvider<int>((ref) {
  return 0;
});

final controllerFeatureProvider = FutureProvider<VideoPlayerController?>(
  (ref) async {
    final videos = ref.watch(dataSourceProvider);
    final currentIndex = ref.watch(currentPage);

    final controller = VideoPlayerController.network(videos[currentIndex]);

    ref.onDispose(() {
      controller.dispose();
    });

    await controller.initAndPlayLoop();

    return controller;
  },
);

class MyAppV2 extends ConsumerWidget {
  const MyAppV2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      showPerformanceOverlay: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePageV2(),
    );
  }
}

class MyHomePageV2 extends ConsumerWidget {
  const MyHomePageV2({super.key});

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
                    ref.invalidate(controllerFeatureProvider);
                    ref.read(currentPage.notifier).state = page;

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
    final controllerValue = ref.watch(controllerFeatureProvider);
    final currentPageValue = ref.watch(currentPage);

    return controllerValue.when(
      data: (controller) {
        if (controller == null) return const SizedBox();
        if (currentPageValue != widget.index) return const SizedBox();

        return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(
                key: ValueKey('child_VideoPlayer_${widget.index}'),
                controller,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: VideoProgressIndicator(
                  controller,
                  allowScrubbing: false,
                ),
              ),
            ],
          ),
        );
      },
      error: (e, s) {
        debugPrint('$e');
        debugPrint('$s');
        return Center(
          child: Text(
            '$e',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
      loading: () => const Center(
        child: Text(
          'loading...',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
