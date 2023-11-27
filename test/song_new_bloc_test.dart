import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karaoke_bangers/data/model/song.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:karaoke_bangers/screens/song_new/song_new_screen_bloc.dart';
import 'package:karaoke_bangers/screens/song_new/song_new_screen_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SongRepository>()])
import 'song_new_bloc_test.mocks.dart';

void main() {
  late MockSongRepository mockSongRepository;
  late SongNewScreenBloc songNewScreenBloc;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    mockSongRepository = MockSongRepository();
    songNewScreenBloc = SongNewScreenBloc(
      songRepository: mockSongRepository,
      pop: () {},
    );
  });

  const expectedSong = Song(
    id: '1',
    songName: 'Test song name',
    artistName: 'Test song artist',
    pitchInfo: 1,
    lyrics: 'Test song lyrics',
    labels: ['Test label'],
  );

  blocTest<SongNewScreenBloc, SongNewScreenState>(
      'inputting values and saving to repository works',
      build: () => songNewScreenBloc,
      act: (bloc) {
        bloc.add(SongNewScreenEventArtistNameChanged(expectedSong.artistName));
        bloc.add(SongNewScreenEventSongNameChanged(expectedSong.songName));
        bloc.add(SongNewScreenEventAddLabel(expectedSong.labels![0]));
        bloc.add(SongNewScreenEventLyricsChanged(expectedSong.lyrics!));
        bloc.add(SongNewScreenEventPitchChanged(expectedSong.pitchInfo!));
        bloc.add(SongNewScreenEventSaveSong());
      },
      expect: () => [
            predicate<SongNewScreenState>((state) {
              return state.artistName == expectedSong.artistName;
            }, 'state with correct artist'),
            predicate<SongNewScreenState>((state) {
              return state.songName == expectedSong.songName;
            }, 'state with correct song name'),
            predicate<SongNewScreenState>((state) {
              return state.labels.contains(expectedSong.labels![0]);
            }, 'state with correct labels'),
            predicate<SongNewScreenState>((state) {
              return state.lyrics == expectedSong.lyrics;
            }, 'state with correct lyrics'),
            predicate<SongNewScreenState>((state) {
              return state.artistName == expectedSong.artistName &&
                  state.songName == expectedSong.songName &&
                  state.labels.contains(expectedSong.labels![0]) &&
                  state.lyrics == expectedSong.lyrics &&
                  state.pitch == expectedSong.pitchInfo;
            }, 'state with correct song'),
          ],
      verify: (_) {
        // verify whether mockSongRepository.addSong() was called once with the expected song but ignore the id of the expected song
        verify(mockSongRepository.addSong(argThat(
          predicate<Song>((song) {
            return song.songName == expectedSong.songName &&
                song.artistName == expectedSong.artistName &&
                song.labels!.contains(expectedSong.labels![0]) &&
                song.lyrics == expectedSong.lyrics &&
                song.pitchInfo == expectedSong.pitchInfo;
          }, 'song with correct values'),
        ))).called(1);
      });
}
