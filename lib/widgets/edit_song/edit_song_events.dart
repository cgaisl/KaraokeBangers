sealed class EditSongEvent {}

class EditSongEventArtistNameChanged extends EditSongEvent {
  final String artistName;

  EditSongEventArtistNameChanged(this.artistName);
}

class EditSongEventSongNameChanged extends EditSongEvent {
  final String songName;

  EditSongEventSongNameChanged(this.songName);
}

class EditSongEventAddLabel extends EditSongEvent {
  final String label;

  EditSongEventAddLabel(this.label);
}

class EditSongEventLyricsChanged extends EditSongEvent {
  final String lyrics;

  EditSongEventLyricsChanged(this.lyrics);
}

class EditSongEventCancel extends EditSongEvent {}

class EditSongEventSubmitSong extends EditSongEvent {}

class EditSongEventPitchChanged extends EditSongEvent {
  final int pitch;

  EditSongEventPitchChanged(this.pitch);
}

class EditSongEventRemoveLabel extends EditSongEvent {
  final String label;

  EditSongEventRemoveLabel(this.label);
}

class EditSongEventDeleteSong extends EditSongEvent {}
