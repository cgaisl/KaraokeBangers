import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karaoke_bangers/data/model/song.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:karaoke_bangers/screens/song_update/song_update_screen_bloc.dart';
import 'package:karaoke_bangers/screens/song_update/song_update_screen_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SongRepository>()])
import 'song_new_bloc_test.mocks.dart';

void main() {
  late MockSongRepository mockSongRepository;
  late SongUpdateScreenBloc songUpdateScreenBloc;

  const mockSong = Song(
    id: '1',
    songName: 'Test song name',
    artistName: 'Test song artist',
    pitchInfo: 1,
    lyrics: 'Test song lyrics',
    labels: ['Test label'],
  );

  const expectedSong = Song(
    id: '1',
    songName: 'Updated Test song name',
    artistName: 'UpdatedTest song artist',
    pitchInfo: 2,
    lyrics: 'Updated Test song lyrics',
    labels: ['New Label', 'Test label'],
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    mockSongRepository = MockSongRepository();
    when(mockSongRepository.songById(any)).thenAnswer(
      (_) => BehaviorSubject.seeded(mockSong),
    );
    songUpdateScreenBloc = SongUpdateScreenBloc(
      songId: '1',
      songRepository: mockSongRepository,
      pop: () {},
      popUntil: (_) {},
    );
  });

  blocTest<SongUpdateScreenBloc, SongUpdateScreenState>(
      'updating values and saving to repository works',
      build: () => songUpdateScreenBloc,
      act: (bloc) {
        bloc.add(
            SongUpdateScreenEventArtistNameChanged(expectedSong.artistName));
        bloc.add(SongUpdateScreenEventSongNameChanged(expectedSong.songName));
        bloc.add(SongUpdateScreenEventAddLabel(expectedSong.labels![0]));
        bloc.add(SongUpdateScreenEventLyricsChanged(expectedSong.lyrics!));
        bloc.add(SongUpdateScreenEventPitchChanged(expectedSong.pitchInfo!));
        bloc.add(SongUpdateScreenEventSaveSong());
      },
      expect: () => [
            predicate<SongUpdateScreenState>((state) {
              return state.artistName == expectedSong.artistName;
            }, 'state with correct artist'),
            predicate<SongUpdateScreenState>((state) {
              return state.songName == expectedSong.songName;
            }, 'state with correct song name'),
            predicate<SongUpdateScreenState>((state) {
              return state.labels.contains(expectedSong.labels![0]);
            }, 'state with correct labels'),
            predicate<SongUpdateScreenState>((state) {
              return state.lyrics == expectedSong.lyrics;
            }, 'state with correct lyrics'),
            predicate<SongUpdateScreenState>((state) {
              return state.artistName == expectedSong.artistName &&
                  state.songName == expectedSong.songName &&
                  state.labels.contains(expectedSong.labels![0]) &&
                  state.lyrics == expectedSong.lyrics &&
                  state.pitch == expectedSong.pitchInfo;
            }, 'state with correct song'),
          ],
      verify: (_) {
        // verify whether mockSongRepository.addSong() was called once with the expected song but ignore the id of the expected song
        verify(mockSongRepository.updateSong(argThat(
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
