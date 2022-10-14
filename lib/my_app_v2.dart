import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'player/tiktok_player_controller.dart';

final currentPage = StateProvider<int>((ref) {
  return 0;
});

final controllerFeatureProvider = FutureProvider<VideoPlayerController?>(
  (ref) async {
    final videos = ref.watch(dataSourceProvider);
    final source = videos[ref.watch(currentPage)];

    final controller = VideoPlayerController.network(source,
        videoPlayerOptions: VideoPlayerOptions(
          allowBackgroundPlayback: false,
          mixWithOthers: false,
        ));

    ref.onDispose(() {
      controller.dispose();
    });

    await controller.initialize();
    await controller.setLooping(true);

    try {
      play() async {
        await Future.delayed(const Duration(milliseconds: 100));
        controller.play();
      }

      play();
    } catch (e) {
      //
    }
    return controller;
  },
);

class MyAppV2 extends ConsumerWidget {
  const MyAppV2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    final indexValue = ref.watch(currentPage);

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

                  if (page != indexValue) {
                    ref.invalidate(controllerFeatureProvider);
                    ref.read(currentPage.notifier).state = page;
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
                      // if (!widget.douyinPlayerController.videoPlayerController
                      //     .value.isInitialized)
                      //   const Center(
                      //     child: Text(
                      //       'Loading...',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
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

class _VideoPlayer extends ConsumerWidget {
  const _VideoPlayer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerValue = ref.watch(controllerFeatureProvider);
    final currentPageValue = ref.watch(currentPage);

    return controllerValue.when(
      data: (controller) {
        if (controller == null) return const SizedBox();
        if (currentPageValue != index) return const SizedBox();

        return Column(
          children: [
            Expanded(
              child: VideoPlayer(
                key: ValueKey('child_VideoPlayer_$index'),
                controller,
              ),
            ),
          ],
        );
      },
      error: (e, s) => Center(
        child: Text(
          '$e',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
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
