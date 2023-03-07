import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/entity/data.dart';
import 'package:youtube_clone/screens/homeScreen.dart';
import 'package:youtube_clone/screens/videoScreen.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/widgets/widgets.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const double _playerMinHeight = 60.0;

  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const Scaffold(body: Center(child: Text('Explore'))),
    const Scaffold(body: Center(child: Text('Add'))),
    const Scaffold(body: Center(child: Text('Subscriptions'))),
    const Scaffold(body: Center(child: Text('Library'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
          builder: (context, watch, _) {
            final selectedVideo = watch(selectedVideoProvider).state;
            final miniPlayerController =
                watch(miniPlayerControllerProvider).state;
            return Stack(
              children: _screens
                  .asMap()
                  .map((i, screen) => MapEntry(
                        i,
                        Offstage(
                          offstage: _selectedIndex != i,
                          child: screen,
                        ),
                      ))
                  .values
                  .toList()
                ..add(
                  Offstage(
                    offstage: selectedVideo == null,
                    child: Miniplayer(
                      controller: miniPlayerController,
                      minHeight: _playerMinHeight,
                      maxHeight: MediaQuery.of(context).size.height,
                      builder: (height, percentage) {
                        if (selectedVideo == null)
                          return const SizedBox.shrink();

                        if (height <= _playerMinHeight + 50.0)
                          return Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      selectedVideo.thumbnailUrl,
                                      height: _playerMinHeight - 4.0,
                                      width: 120.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                selectedVideo.title,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                selectedVideo.author.username,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.play_arrow),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () {
                                        context
                                            .read(selectedVideoProvider)
                                            .state = null;
                                      },
                                    ),
                                  ],
                                ),
                                const LinearProgressIndicator(
                                  value: 0.4,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        return VideoScreen();
                      },
                    ),
                  ),
                ),
            );
          },
        ),
        bottomNavigationBar: CustomBottomNavbar());
  }
}
