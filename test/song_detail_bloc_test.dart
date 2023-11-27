import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karaoke_bangers/data/model/song.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:karaoke_bangers/screens/song_detail/song_detail_screen_bloc.dart';
import 'package:karaoke_bangers/screens/song_detail/song_detail_screen_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SongRepository mockSongRepository;
  late SongDetailScreenBloc songDetailScreenBloc;
  const Song mockSong = Song(
    id: '1',
    songName: 'Test song name',
    artistName: 'Test song artist',
    pitchInfo: 0,
    lyrics: 'Test song lyrics',
    labels: ['Test label'],
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    mockSongRepository = SharedPreferencesSongRepository(
      await SharedPreferences.getInstance(),
    );
    await mockSongRepository.addSong(mockSong);
    songDetailScreenBloc = SongDetailScreenBloc(
      songId: '1',
      songRepository: mockSongRepository,
    );
  });

  blocTest<SongDetailScreenBloc, SongDetailScreenState>(
    'emits updated pitch when SongDetailScreenEventPitchChanged is added',
    build: () => songDetailScreenBloc,
    act: (bloc) => bloc.add(SongDetailScreenEventPitchChanged(1)),
    expect: () => [
      SongDetailScreenStateExtension.fromSong(
        song: mockSong,
      ),
      SongDetailScreenStateExtension.fromSong(
        song: mockSong.copyWith(pitchInfo: 1),
      ),
    ],
  );
}
