// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:video_player/video_player.dart';
//
// import '../common/common.dart';
// import '../screen_model_providers/movie_detail_screen_model.dart';
//
// class VideoPlayerView extends ConsumerStatefulWidget {
//   const VideoPlayerView({Key? key, required this.trailerUrl}) : super(key: key);
//
//   final String trailerUrl;
//
//   @override
//   _VideoPlayerViewState createState() => _VideoPlayerViewState();
// }
//
// class _VideoPlayerViewState extends ConsumerState<VideoPlayerView> {
//   late VideoPlayerController _controller;
//   late ChewieController chewieController;
//   final movieSm = MoviesDetailScreenModel();
//
//   @override
//   void initState() {
//     print('${ImageResource.youtubeUrl}${widget.trailerUrl}');
//     super.initState();
//     _controller = VideoPlayerController.network(
//       '${ImageResource.youtubeUrl}${widget.trailerUrl}',
//       formatHint: VideoFormat.dash,
//     )
//       ..addListener(() {
//         setState(() {});
//       })
//       ..initialize().then((_) {
//         setState(() {
//           chewieController = ChewieController(
//             videoPlayerController: _controller,
//             autoPlay: false,
//             looping: false,
//           );
//         });
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     chewieController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return !chewieController.isPlaying
//         ? Positioned(
//             right: MediaQuery.of(context).size.width / 2,
//             top: (AppDimensions.heroImageHeight) / 3,
//             child: Container(
//               height: AppDimensions.mdContainerY,
//               width: AppDimensions.mdContainerY,
//               padding: EdgeInsets.all(AppDimensions.xsX),
//               alignment: Alignment.centerRight,
//               decoration: BoxDecoration(
//                 color: Colors.black26,
//                 borderRadius: BorderRadius.circular(
//                   AppDimensions.mdContainerY / 2,
//                 ),
//               ),
//               child: GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onTap: () {
//                   chewieController.isPlaying
//                       ? chewieController.pause()
//                       : chewieController.play();
//                   setState(() {});
//                 },
//                 child: _controller.value.isPlaying
//                     ? Container()
//                     : Icon(
//                         Icons.play_arrow,
//                         size: AppDimensions.xxlgIconImageSizeX,
//                         color: AppColors.primaryColorAccent,
//                       ),
//               ),
//             ),
//           )
//         : Container(
//             alignment: Alignment.topCenter,
//             child: AspectRatio(
//               aspectRatio: chewieController.aspectRatio!,
//               child: Chewie(
//                 controller: chewieController,
//               ),
//             ),
//           );
//   }
// }
