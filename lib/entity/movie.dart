import 'user.dart';

const User currentUser = User(
  username: 'Pandu Windito',
  profileImageUrl:
      'https://i.postimg.cc/y81mcd2F/LRM-EXPORT-20181014-142924.jpg',
  subscribers: '999K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: '001',
    author: currentUser,
    title: 'Kembali Bergerak',
    thumbnailUrl: 'https://i.postimg.cc/mrxTKzR9/THUMB.jpg',
    duration: '8:20',
    timestamp: DateTime(2023, 2, 24),
    dislikes: '100',
    viewCount: '10K',
    likes: '958',
  ),
  Video(
    author: currentUser,
    id: '002',
    title: 'Study With Me',
    thumbnailUrl: 'https://i.postimg.cc/WpyC9RsF/THUMB.png',
    duration: '02:22:06',
    timestamp: DateTime(2023, 2, 27),
    viewCount: '8K',
    dislikes: '100',
    likes: '485',
  ),
  Video(
    id: '003',
    author: currentUser,
    title: 'Mencoba',
    thumbnailUrl: 'https://i.postimg.cc/Wz4nj4jm/THUMB.jpg',
    duration: '01:10:53',
    timestamp: DateTime(2020, 12, 18),
    viewCount: '18K',
    dislikes: '100',
    likes: '1k',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: '004',
    author: currentUser,
    title: 'Memasak',
    thumbnailUrl:
        'https://i.postimg.cc/5NJVbdFH/GH010380-MP4-11-20-28-24-Still001.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2021, 7, 22),
    viewCount: '32K',
    dislikes: '100',
    likes: '1.9k',
  ),
  Video(
    id: '005',
    author: currentUser,
    title: 'Andai Saja',
    thumbnailUrl: 'https://i.postimg.cc/HWrGQwft/ANDAI-SAJA-fix2.jpg',
    duration: '12:12',
    timestamp: DateTime(2021, 1, 10),
    viewCount: '190K',
    dislikes: '100',
    likes: '9.3K',
  ),
  Video(
    id: '006',
    author: currentUser,
    title: 'Lily Terakhir Di Lembar Ini',
    thumbnailUrl: 'https://i.postimg.cc/6p5FpCLR/thumb.png',
    duration: '1:03:58',
    timestamp: DateTime(2021, 10, 27),
    viewCount: '358K',
    dislikes: '100',
    likes: '20k',
  ),
];
