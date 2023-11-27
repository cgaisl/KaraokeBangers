import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karaoke_bangers/data/model/song.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:karaoke_bangers/screens/song_list/song_list_screen_bloc.dart';
import 'package:karaoke_bangers/screens/song_list/song_list_screen_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SongRepository mockSongRepository;
  late SongListScreenBloc songListScreenBloc;
  const Song mockSong1 = Song(
    id: '1',
    songName: 'A name',
    artistName: 'B artist',
    pitchInfo: 0,
    lyrics: 'Test song lyrics 1',
    labels: ['Test label'],
  );
  const Song mockSong2 = Song(
    id: '2',
    songName: 'B name',
    artistName: 'A artist',
    pitchInfo: 0,
    lyrics: 'Test song lyrics 2',
    labels: ['Test label 2'],
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    mockSongRepository = SharedPreferencesSongRepository(
      await SharedPreferences.getInstance(),
    );
    await mockSongRepository.addSong(mockSong1);
    await mockSongRepository.addSong(mockSong2);
    songListScreenBloc = SongListScreenBloc(
      songRepository: mockSongRepository,
      navigate: (String id) {},
    );
  });

  blocTest<SongListScreenBloc, SongListScreenState>(
    'emits updated sort bar renderings when SongListScreenEventOnSortClicked is added',
    build: () => songListScreenBloc,
    act: (bloc) => bloc.add(SongListScreenEventOnSortClicked(SortEnum.artist)),
    expect: () => [
      predicate<SongListScreenState>((state) {
        return state.titleButton.selected == true &&
            state.artistButton.selected == false;
      }, 'state with title button selected'),
      predicate<SongListScreenState>((state) {
        return state.titleButton.selected == false &&
            state.artistButton.selected == true;
      }, 'state with artist button selected')
    ],
  );

  blocTest<SongListScreenBloc, SongListScreenState>(
    'emits updated sort bar renderings when SongListScreenEventOnFilterClicked is added',
    build: () => songListScreenBloc,
    act: (bloc) => bloc.add(SongListScreenEventOnFilterClicked('Test label')),
    expect: () => [
      predicate<SongListScreenState>((state) {
        final labelButton = state.labelButtonRenderings.first;
        return labelButton.text == 'Test label' &&
            labelButton.selected == false;
      }, 'state with filter button unselected'),
      predicate<SongListScreenState>((state) {
        final labelButton = state.labelButtonRenderings.first;
        return labelButton.text == 'Test label' && labelButton.selected == true;
      }, 'state with filter button selected')
    ],
  );

  // test that checks that the song list is sorted by artist
  blocTest<SongListScreenBloc, SongListScreenState>(
    'emits updated song list renderings when SongListScreenEventOnSortClicked is added',
    build: () => songListScreenBloc,
    act: (bloc) => bloc.add(SongListScreenEventOnSortClicked(SortEnum.artist)),
    expect: () => [
      predicate<SongListScreenState>((state) {
        final songList = state.songListRenderings;
        return songList[0].artistName == 'B artist' &&
            songList[1].artistName == 'A artist';
      }, 'state with song list sorted by song name'),
      predicate<SongListScreenState>((state) {
        final songList = state.songListRenderings;
        return songList[0].artistName == 'A artist' &&
            songList[1].artistName == 'B artist';
      }, 'state with song list sorted by artist'),
    ],
  );
}

extension on SongListScreenState {
  SortButtonRendering get titleButton {
    return sortButtonRenderings[0];
  }

  SortButtonRendering get artistButton {
    return sortButtonRenderings[1];
  }

  List<SortButtonRendering> get sortButtonRenderings {
    return sortBarRenderings
        .whereType<SortButtonRendering>()
        .toList(growable: false);
  }

  List<LabelButtonRendering> get labelButtonRenderings {
    return sortBarRenderings
        .whereType<LabelButtonRendering>()
        .toList(growable: false);
  }
}
