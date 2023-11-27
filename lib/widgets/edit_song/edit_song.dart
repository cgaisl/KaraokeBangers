import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:karaoke_bangers/widgets/add_dialog.dart';
import 'package:karaoke_bangers/widgets/banger_navigation_bar.dart';
import 'package:karaoke_bangers/widgets/category_label.dart';
import 'package:karaoke_bangers/widgets/delete_dialog.dart';
import 'package:karaoke_bangers/widgets/edit_song/edit_song_events.dart';
import 'package:karaoke_bangers/widgets/edit_song/edit_song_state.dart';
import 'package:karaoke_bangers/widgets/pitch_indicator.dart';
import 'package:karaoke_bangers/widgets/simple_text_field.dart';
import 'package:karaoke_bangers/widgets/small_elevated_button.dart';
import 'package:karaoke_bangers/widgets/titled_text_field.dart';

class EditSong extends StatelessWidget {
  final EditSongState state;
  final Function(EditSongEvent) onEvent;

  const EditSong({super.key, required this.state, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditSongNavigationBar(
          title: state.screenTitle,
          pitch: state.pitch,
          onDelete:
              state.canDelete ? () => onEvent(EditSongEventDeleteSong()) : null,
          onPitchChanged: (pitch) {
            onEvent(EditSongEventPitchChanged(pitch));
          },
        ),
        SongInputSection(
          artistName: state.artistName,
          songName: state.songName,
          onArtistNameChanged: (artistName) {
            onEvent(EditSongEventArtistNameChanged(artistName));
          },
          onSongNameChanged: (songName) {
            onEvent(EditSongEventSongNameChanged(songName));
          },
        ),
        AddLabelSection(
          labels: state.labels,
          onAddLabel: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: AddDialog(
                  title: "Add Label",
                  onSubmit: (label) {
                    onEvent(EditSongEventAddLabel(label));
                  },
                ),
              ),
            );
          },
          onRemoveLabel: (label) {
            onEvent(EditSongEventRemoveLabel(label));
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LyricsInputField(
              lyrics: state.lyrics,
              onLyricsChanged: (lyrics) {
                onEvent(EditSongEventLyricsChanged(lyrics));
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SmallElevatedButton(
              onPressed: () {
                onEvent(EditSongEventCancel());
              },
              text: "Cancel",
            ),
            const SizedBox(width: 16),
            SmallElevatedButton(
              onPressed: () {
                onEvent(EditSongEventSubmitSong());
              },
              text: state.submitButtonTitle,
            ),
            const SizedBox(width: 16),
          ],
        )
      ],
    );
  }
}

class EditSongNavigationBar extends StatelessWidget {
  final String title;
  final int pitch;
  final Function(int) onPitchChanged;
  final Function()? onDelete;

  const EditSongNavigationBar({
    Key? key,
    required this.title,
    required this.pitch,
    required this.onPitchChanged,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BangerNavigationBar(
      titleWidget: Expanded(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      actionsWidget: Row(
        children: [
          if (onDelete != null) ...[
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: DeleteDialog(
                      onSubmit: () {
                        onDelete?.call();
                      },
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            ),
            const SizedBox(width: 8),
          ],
          PitchIndicator(
            pitch: pitch,
            onPitchChanged: (pitch) {
              onPitchChanged(pitch);
            },
          ),
        ],
      ),
    );
  }
}

class SongInputSection extends StatelessWidget {
  final String artistName;
  final String songName;
  final Function(String) onArtistNameChanged;
  final Function(String) onSongNameChanged;

  const SongInputSection({
    Key? key,
    required this.artistName,
    required this.songName,
    required this.onArtistNameChanged,
    required this.onSongNameChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A column of Textfields for song name and artist name
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitledTextField(
            title: "Song:",
            value: songName,
            onChanged: onSongNameChanged,
          ),
          const SizedBox(height: 16),
          TitledTextField(
            title: "Artist:",
            value: artistName,
            onChanged: onArtistNameChanged,
          ),
        ],
      ),
    );
  }
}

class AddLabelSection extends StatelessWidget {
  final List<String> labels;
  final Function() onAddLabel;
  final Function(String) onRemoveLabel;

  const AddLabelSection({
    Key? key,
    required this.labels,
    required this.onAddLabel,
    required this.onRemoveLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text(
            "Label:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var label in labels)
                    Row(
                      children: [
                        CategoryLabel(label),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => onRemoveLabel(label),
                          child: Image.asset("assets/icon_delete.png"),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  SmallElevatedButton(
                    onPressed: onAddLabel,
                    text: "+ Add Label",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LyricsInputField extends StatefulWidget {
  final Function(String) onLyricsChanged;
  final String lyrics;

  const LyricsInputField({
    Key? key,
    required this.lyrics,
    required this.onLyricsChanged,
  }) : super(key: key);

  @override
  State<LyricsInputField> createState() => _LyricsInputFieldState();
}

class _LyricsInputFieldState extends State<LyricsInputField> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: Container(
        color: const Color(0xFF3D3D3D),
        padding: const EdgeInsets.all(16),
        child: SimpleTextField(
          value: widget.lyrics,
          onChanged: widget.onLyricsChanged,
          hint: "Lyrics",
          focusNode: focusNode,
        ),
      ),
    );
  }
}
