import 'package:flutter/material.dart';
import 'package:video_driven_app/lifecycle/lifecycle.dart';
import 'package:video_player/video_player.dart';

import 'tiktok_player_controller.dart';

/// @author jd
class DouyinPlayer extends StatefulWidget {
  const DouyinPlayer({
    super.key,
    this.source,
    required this.douyinPlayerController,
  });

  final String? source;
  final DouyinPlayerController douyinPlayerController;

  @override
  State<DouyinPlayer> createState() => _DouyinPlayerState();
}

class _DouyinPlayerState extends State<DouyinPlayer>
    with WidgetsBindingObserver, LifecycleAware, LifecycleMixin {
  @override
  void initState() {
    super.initState();
    debugPrint('(${widget.douyinPlayerController.url}) - player initState');
    WidgetsBinding.instance.addObserver(this);
    widget.douyinPlayerController.addListener(_listener);
    widget.douyinPlayerController.prepare();
  }

  void _listener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    debugPrint('(${widget.douyinPlayerController.url}) - player dispose');
    widget.douyinPlayerController.removeListener(_listener);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   debugPrint(
  //     '(${widget.douyinPlayerController.url}) - player didChangeDependencies',
  //   );
  //   super.didChangeDependencies();
  // }

  // @override
  // void didUpdateWidget(covariant DouyinPlayer oldWidget) {
  //   debugPrint(
  //       '(${widget.douyinPlayerController.url}) - player didUpdateWidget');
  //   super.didUpdateWidget(oldWidget);
  // }

  // @override
  // void deactivate() {
  //   debugPrint('(${widget.douyinPlayerController.url}) - player deactivate');
  //   super.deactivate();
  // }

  // @override
  // void didChangeMetrics() {
  //   debugPrint(
  //       '(${widget.douyinPlayerController.url}) - player didChangeMetrics');
  // }

  // @override
  // Future<bool> didPushRoute(String route) {
  //   debugPrint('(${widget.douyinPlayerController.url}) - player didPushRoute');
  //   return super.didPushRoute(route);
  // }

  // @override
  // Future<bool> didPopRoute() {
  //   debugPrint('(${widget.douyinPlayerController.url}) - player didPopRoute');
  //   return super.didPopRoute();
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   debugPrint(
  //     '(${widget.douyinPlayerController.url}) - player didChangeAppLifecycleState',
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    debugPrint('(${widget.douyinPlayerController.url}) - build');
    return FutureBuilder<dynamic>(
      future: widget.douyinPlayerController.videoPlayerFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            final isPlaying = widget
                .douyinPlayerController.videoPlayerController.value.isPlaying;
            if (isPlaying) {
              widget.douyinPlayerController.pause();
            } else {
              widget.douyinPlayerController.play();
            }
          },
          child: Stack(
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: widget.douyinPlayerController.videoPlayerController
                        .value.size.width,
                    height: widget.douyinPlayerController.videoPlayerController
                        .value.size.height,
                    child: VideoPlayer(
                      widget.douyinPlayerController.videoPlayerController,
                    ),
                  ),
                ),
              ),
              if (!widget.douyinPlayerController.isPlaying)
                const Center(
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              // if (kDebugMode)
              SafeArea(
                child: Text(
                  '${widget.source}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              if (!widget.douyinPlayerController.videoPlayerController.value
                  .isInitialized)
                SafeArea(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      widget.douyinPlayerController.prepare();
                    },
                    child: const Center(
                      child: Text(
                        'Loading...',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
        // }
      },
    );
  }

  @override
  void onLifecycleEvent(LifecycleEvent event) async {
    debugPrint('LifecycleEvent:: $event');
    if (event == LifecycleEvent.push) {
      debugPrint('(${widget.douyinPlayerController.url}) - player push ');
    } else if (event == LifecycleEvent.visible) {
      await widget.douyinPlayerController.videoPlayerFuture;
      debugPrint('(${widget.douyinPlayerController.url}) $event $currentLifecycleState - player visible ');
      await Future.delayed(const Duration(milliseconds: 400));
      if (currentLifecycleState == LifecycleEvent.active) {
        widget.douyinPlayerController.play();
      }
    } else if (event == LifecycleEvent.invisible) {
      widget.douyinPlayerController.pause();
      debugPrint('(${widget.douyinPlayerController.url}) - player invisible ');
    } else if (event == LifecycleEvent.active) {
      debugPrint('(${widget.douyinPlayerController.url}) - player active ');
    } else if (event == LifecycleEvent.inactive) {
      debugPrint('(${widget.douyinPlayerController.url}) - player inactive ');
      widget.douyinPlayerController.pause();
    } else if (event == LifecycleEvent.pop) {
      widget.douyinPlayerController.pause();
      debugPrint('(${widget.douyinPlayerController.url}) - player pop ');
    }
  }
}
