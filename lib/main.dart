import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_driven_app/preload_page_view.dart';

import 'lifecycle/lifecycle.dart';
import 'player/tiktok_player.dart';
import 'player/tiktok_player_controller.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [defaultLifecycleObserver],
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) => _init());
  }

  void _init() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: HomeWidget(),
    );
  }
}

class HomeWidget extends ConsumerWidget {
  HomeWidget({
    Key? key,
  }) : super(key: key);

  final PreloadPageController _pageController = PreloadPageController();

  @override
  Widget build(BuildContext context, ref) {
    final videos = ref.watch(dataSourceProvider);
    return PageViewLifecycleWrapper(
      onLifecycleEvent: (LifecycleEvent event) {
        debugPrint(
            'ParentPageLifecycleWrapperState($hashCode)#${event.toString()}');
      },
      child: PageView.builder(
        allowImplicitScrolling: true,
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        // controller: _pageController,
        // preloadPagesCount: 0,
        onPageChanged: (int index) {
          ref.read(playingVideoProvider.notifier).state =
              videos[index].toString();
        },
        itemBuilder: (BuildContext context, int index) {
          String source = videos[index];
          return ChildPageLifecycleWrapper(
            wantKeepAlive: false,
            index: index,
            onLifecycleEvent: (LifecycleEvent event) {
              debugPrint(
                  'ChildPageLifecycleWrapperState($hashCode)#${event.toString()}');
            },
            child: DouyinPlayer(
              source: source,
              douyinPlayerController: DouyinPlayerController(
                url: source,
                isPlaying: index == 0,
              ),
            ),
          );
        },
      ),
    );
  }
}
