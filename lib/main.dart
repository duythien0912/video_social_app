import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_driven_app/my_app_v2.dart';

import 'lifecycle/lifecycle.dart';
import 'player/tiktok_player.dart';
import 'player/tiktok_player_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  // runApp(const ProviderScope(child: MyApp()));
  runApp(const ProviderScope(child: MyAppV2()));
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
      body: Column(
        children: const [
          Expanded(child: HomeWidget()),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}

class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {
  int _currentIndex = 0;
  List<DouyinPlayerController> _pageControllerList = [];

  @override
  void initState() {
    super.initState();

    final list = ref.read(dataSourceProvider);
    _pageControllerList = List.generate(
      list.length,
      (index) => DouyinPlayerController(
        url: list[index],
        isPlaying: index == 0,
      ),
    ).toList();
  }

  @override
  void dispose() {
    for (var element in _pageControllerList) {
      element.dispose();
    }
    _pageControllerList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videos = ref.watch(dataSourceProvider);
    final images = ref.watch(dataSourceImageProvider);
    return PageViewLifecycleWrapper(
      onLifecycleEvent: (LifecycleEvent event) {
        debugPrint(
            'ParentPageLifecycleWrapperState($hashCode)#${event.toString()}');
      },
      child: PageView.builder(
        allowImplicitScrolling: true,
        // dragStartBehavior: DragStartBehavior.down,
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        // controller: _pageController,
        // preloadPagesCount: 0,
        onPageChanged: (int index) async {
          ref.read(playingVideoProvider.notifier).state =
              videos[index].toString();

          debugPrint('index:$index');
          DouyinPlayerController preController =
              _pageControllerList[_currentIndex];
          DouyinPlayerController currentController = _pageControllerList[index];
          try {
            // preController.pause();
            preController.dispose();
          } catch (e) {
            debugPrint('$e');
          }
          await Future.delayed(const Duration(milliseconds: 400));
          currentController.play();
          _currentIndex = index;
        },
        // layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          String source = videos[index];
          String image = images[index];
          return ChildPageLifecycleWrapper(
            wantKeepAlive: false,
            index: index,
            onLifecycleEvent: (LifecycleEvent event) {
              debugPrint(
                  'ChildPageLifecycleWrapperState($hashCode)#${event.toString()}');
            },
            child: DouyinPlayer(
              source: source,
              image: image,
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
