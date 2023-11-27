import 'package:flutter/material.dart';
import 'package:karaoke_bangers/screens/song_list/song_list_screen_state.dart';
import 'package:karaoke_bangers/theme.dart';

class SortBar extends StatelessWidget {
  final List<SortBarButtonRendering> sortBarButtonRenderings;

  SortBar({super.key, required this.sortBarButtonRenderings});

  @override
  Widget build(BuildContext context) {
    // A horizontal list of chips with a vertical divider after the first two chips
    // The chips are ElevatedButtons with a Text child

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 36,
          child: Row(
            children: sortBarButtonRenderings
                .map(
                  (buttonRendering) {
                    return switch (buttonRendering) {
                      SortButtonRendering() => ElevatedButton(
                          style: buttonRendering.selected
                              ? alternativeElevatedButtonStyle
                              : null,
                          onPressed: buttonRendering.onPressed,
                          child: Text(buttonRendering.text),
                        ),
                      LabelButtonRendering() => ElevatedButton(
                          style: buttonRendering.selected
                              ? alternativeElevatedButtonStyle
                              : null,
                          onPressed: buttonRendering.onPressed,
                          child: Text(buttonRendering.text),
                        ),
                      SortBarDivider() => const VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          width: 1,
                        ),
                    };
                  },
                )
                .map(
                  (e) => Align(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
