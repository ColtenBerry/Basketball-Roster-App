import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//cut text editing controller, idk if that is needed
typedef RosterStatsUpdatedCallback = Function(
    bool starter,
    int minutesPlayed,
    int fieldGoalsAttempted,
    int fieldGoalsMade,
    int threePtAttempted,
    int threePtMade,
    int freeThrowsAttempted,
    int freeThrowsMade,
    int offensiveRebounds,
    int defensiveRebounds,
    int assists,
    int steals);

class RosterEditStatsDialog extends StatefulWidget {
  const RosterEditStatsDialog({super.key, required this.onGameAdded});

  // final RosterStatsUpdatedCallback onStatsUpdated;

  @override
  State<StatefulWidget> createState() {
    return RosterEditStatsDialogState();
  }

  final RosterStatsUpdatedCallback onGameAdded;
}
//what is the difference between a widget and a state???

class RosterEditStatsDialogState extends State<RosterEditStatsDialog> {
  bool starter = false;
  int minutesPlayed = 0;
  int fieldGoalsAttempted = 0;
  int fieldGoalsMade = 0;
  int threePtAttempted = 0;
  int threePtMade = 0;
  int freeThrowsAttempted = 0;
  int freeThrowsMade = 0;
  int offensiveRebounds = 0;
  int defensiveRebounds = 0;
  int assists = 0;
  int steals = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enter Game Stats"),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            const Text("Starter?"),
            Checkbox(
              value: starter,
              onChanged: (bool? value) {
                setState(() {
                  starter = value!;
                });
              },
            ),
          ],
        ),
        TextField(
          key: const Key("MinutesPlayedTextField"),
          decoration: const InputDecoration(labelText: "Minutes Played"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                minutesPlayed = int.parse(value);
              }
            });
          },
        ),
        TextField(
          key: const Key("FGATextField"),
          decoration: const InputDecoration(labelText: "Field Goals Attmpted"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                fieldGoalsAttempted = int.parse(value);
              }
            });
          },
        ),
        TextField(
          key: const Key("FGMTextField"),
          decoration: const InputDecoration(labelText: "Field Goals Made"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                fieldGoalsMade = int.parse(value);
              }
            });
          },
        ),
        TextField(
          key: const Key("3PTATextField"),
          decoration: const InputDecoration(labelText: "3 Pointers Attempted"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                threePtAttempted = int.parse(value);
              }
            });
          },
        ),
        TextField(
          key: const Key("3PTMTextField"),
          decoration: const InputDecoration(labelText: "3 Pointers Made"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                threePtMade = int.parse(value);
              }
            });
          },
        ),
        TextField(
          key: const Key("FTATextField"),
          decoration: const InputDecoration(labelText: "Free Throws Attempted"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                freeThrowsAttempted = int.parse(value);
              }
            });
          },
        ),
        TextField(
          key: const Key("FTMTextField"),
          decoration: const InputDecoration(labelText: "Free Throws Made"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                freeThrowsMade = int.parse(value);
              }
            });
          },
        ),
        TextField(
            key: const Key("OReboundsTextField"),
            decoration: const InputDecoration(labelText: "Offensive Rebounds"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  offensiveRebounds = int.parse(value);
                }
              });
            }),
        TextField(
          key: const Key("DReboundsTextField"),
          decoration: const InputDecoration(labelText: "Defensive Rebounds"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                defensiveRebounds = int.parse(value);
              }
            });
          },
        ),
        TextField(
          key: const Key("AssistsTextField"),
          decoration: const InputDecoration(labelText: "Assists"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                assists = int.parse(value);
              }
            });
          },
        ),
        TextField(
          key: const Key("StealsTextField"),
          decoration: const InputDecoration(labelText: "Steals"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                steals = int.parse(value);
              }
            });
          },
        ),
        ElevatedButton(
          key: const Key("UpdateStatsElevatedButton"),
          onPressed: () {
            setState(() {
              widget.onGameAdded(
                  starter,
                  minutesPlayed,
                  fieldGoalsAttempted,
                  fieldGoalsMade,
                  threePtAttempted,
                  threePtMade,
                  freeThrowsAttempted,
                  freeThrowsMade,
                  offensiveRebounds,
                  defensiveRebounds,
                  assists,
                  steals);
              Navigator.pop(context, freeThrowsAttempted);
            });
          },
          child: const Text("Update"),
        )
      ]),
    );
  }
}
