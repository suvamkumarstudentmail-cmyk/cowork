# The Shift — Claude Scheduled Tasks

Run each command below once in the **Claude Code web interface** (claude.ai/code).
Each creates a daily cloud task that fires at the block's time (IST) and sends
you a notification through the Claude iOS app.

**How to run:** Open claude.ai/code → paste the command → press Enter.
**To review:** `/schedule list`
**To cancel one:** `/schedule update` → select the task → set to disabled.

---

## Setup Commands (run once each)

```
/schedule daily at 9:00am remind me The Shift Block 1 is starting — Morning Launch: drink two glasses of water, expose eyes to 5000K+ light, take Morning Stack (B12 sublingually, Nootropic before food, Omega-3 with breakfast)
```

```
/schedule daily at 9:45am remind me The Shift Block 2 is starting — Study Block 1+2: 90min active recall and light consolidation → 10min break → 90min moderate study (practice problems, concept mapping). Ends 1:00 PM.
```

```
/schedule daily at 1:00pm remind me The Shift Block 3 is starting — Digital Detox Lunch: high-protein meal, step away from desk and all screens entirely
```

```
/schedule daily at 2:00pm remind me The Shift Block 4 is starting — Biphasic Nap: 90-minute target sleep in blackout environment with earplugs
```

```
/schedule daily at 5:00pm remind me The Shift Block 5 is starting — Iron Session: complete PPL resistance training workout. This is the strict daily caffeine cut-off.
```

```
/schedule daily at 6:30pm remind me The Shift Block 6 is starting — Dinner and Dose 2: high-protein dinner and second Omega-3 capsule
```

```
/schedule daily at 7:15pm remind me The Shift Block 7 is starting — Battle Planning: decompress fully, then write tonight's exact target problems on physical paper
```

```
/schedule daily at 9:45pm remind me The Shift Block 8 is starting — Environment Lock-in: switch all lights to 5000K cool white, phone in drawer, clear the desk
```

```
/schedule daily at 10:00pm remind me The Shift Block 9 is starting — Study Block 3 Heavy Lifting: 90min active output on hardest material (complex derivations, actuarial theory). Peak window.
```

```
/schedule daily at 11:30pm remind me The Shift Block 10 is starting — Break 1: stand, stretch, drink ice water. Keep 5000K lights on.
```

```
/schedule daily at 11:45pm remind me The Shift Block 11 is starting — Study Block 4 Context Switch: 90min in a completely different domain from Block 3
```

```
/schedule daily at 1:15am remind me The Shift Block 12 is starting — Mid-Shift Break: leave the desk completely. Optional light protein snack, no carbs or sugar.
```

```
/schedule daily at 1:45am remind me The Shift Block 13 is starting — Study Block 5 The Grind: 90min highly active output (past paper questions, diagrams, coding) to fight adenosine buildup
```

```
/schedule daily at 3:15am remind me The Shift Block 14 is starting — Cold Reset: splash cold water on face, pace the room for 5 minutes
```

```
/schedule daily at 3:30am remind me The Shift Block 15 is starting — Study Block 6 Closeout: 90min low-friction review. Spend final 15 minutes writing tomorrow's exact problem list on paper.
```

```
/schedule daily at 5:00am remind me The Shift Block 16 is starting — Light Shift: turn off all 5000K lights, switch to 2700K/red light, take two Magnesium Bisglycinate tablets
```

```
/schedule daily at 5:30am remind me The Shift Block 17 is starting — Digital Sunset: turn off PC, put phone away, read a physical book for 30 minutes
```

```
/schedule daily at 6:00am remind me The Shift Block 18 is starting — Post-Study Sleep: get into bed for a 3-hour target sleep in a cool, blackout room with earplugs
```

---

## Notes

- Tasks run on Anthropic-managed infrastructure — no machine needs to stay on.
- All times are **IST** (the scheduler uses your Claude.ai account timezone).
- Blocks 10/11 (11:30 PM / 11:45 PM) and Blocks 8/9 (9:45 PM / 10:00 PM) are
  15 minutes apart — each is a separate daily task, which is valid since the
  1-hour minimum applies to recurrence frequency, not spacing between tasks.
- The GitHub Actions workflow (`.github/workflows/the-shift-reminders.yml`)
  remains as a backup remote trigger.
