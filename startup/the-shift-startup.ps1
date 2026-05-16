# The Shift — Startup Block Notifier
# Shows a Windows toast with your current active Shift block when PC starts.
#
# SETUP (one-time):
#   1. Save this file anywhere, e.g. C:\Tools\the-shift-startup.ps1
#   2. Open Task Scheduler → Create Basic Task
#      Trigger : "When I log on"
#      Action  : Start a program
#      Program : powershell.exe
#      Args    : -WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\Tools\the-shift-startup.ps1"

$now  = Get-Date
$mins = $now.Hour * 60 + $now.Minute   # minutes since midnight (local IST time)

# ── Block definitions ──────────────────────────────────────────────────────────
# Each block: [start_min, end_min, emoji, title, body]
# B11 crosses midnight (23:45 → 01:15), handled separately below.
$blocks = @(
    # start  end   emoji  title                       body
    @(530,  540,  "🌅",  "B0: Pre-Shift Briefing",   "Shift starts in 10 min. 6 study blocks · PPL session · Nap at 2 PM. Drink water.")
    @(540,  585,  "🌅",  "B1: Morning Launch",        "Drink water · 5000K light · Morning Stack (B12, Nootropic, Omega-3). Next: Study at 9:45 AM")
    @(585,  780,  "📚",  "B2: Study Block 1+2",       "90 min active recall → 10 min break → 90 min practice problems. SIT DOWN NOW.")
    @(780,  840,  "🥗",  "B3: Detox Lunch",           "Step away from ALL screens. High-protein meal. No phone. Next: Nap at 2:00 PM")
    @(840,  1020, "😴",  "B4: Biphasic Nap",          "Blackout curtains · earplugs · 90 min sleep. Protect this. Next: Iron Session at 5 PM")
    @(1020, 1110, "💪",  "B5: Iron Session",          "PPL WORKOUT NOW. Caffeine cut-off from this point — no exceptions.")
    @(1110, 1155, "🍽️",  "B6: Dinner & Dose 2",       "High-protein dinner + Omega-3 capsule. Decompress. Next: Battle Planning at 7:15 PM")
    @(1155, 1305, "📝",  "B7: Battle Planning",       "Write tonight's EXACT target problems on paper. Night shift in 2h 30m.")
    @(1305, 1320, "🔒",  "B8: Environment Lock-in",   "5000K on · phone in drawer · clear desk. LOCK IN. Peak window opens in 15 min.")
    @(1320, 1410, "🔥",  "B9: Heavy Lifting",         "PEAK WINDOW. Hardest material now — derivations, actuarial theory. Zero distractions.")
    @(1410, 1425, "🧊",  "B10: Break 1",              "Stand · stretch · ice water. Keep 5000K ON. 15 min — no screens.")
    @($null,$null,"🔄",  "B11: Context Switch",       "DIFFERENT domain from Block 9 — full context switch. 90 min. Next: Break at 1:15 AM")
    @(75,   105,  "🚶",  "B12: Mid-Shift Break",      "Leave desk completely. Light protein snack if needed — no carbs. Next: The Grind at 1:45 AM")
    @(105,  195,  "⚡",  "B13: The Grind",            "Active output only — past papers · diagrams · coding. Fight adenosine. 90 min.")
    @(195,  210,  "❄️",  "B14: Cold Reset",           "SPLASH COLD WATER. Pace room 5 minutes. Final block starts 3:30 AM.")
    @(210,  300,  "📖",  "B15: Closeout",             "Low-friction review. At 4:45 AM write tomorrow's problem list on paper. LAST BLOCK.")
    @(300,  330,  "🌙",  "B16: Light Shift",          "5000K off → 2700K/red light. Take 2x Magnesium Bisglycinate now.")
    @(330,  360,  "📵",  "B17: Digital Sunset",       "PC off · phone away · read physical book 30 min.")
    @(360,  530,  "🛌",  "B18: Post-Study Sleep",     "The Shift is complete. Cool blackout room · earplugs · 3h sleep. You showed up.")
)

# ── Find active block ──────────────────────────────────────────────────────────
$active = $null

# B11 crosses midnight: active if mins >= 1425 OR mins < 75
if ($mins -ge 1425 -or $mins -lt 75) {
    $active = $blocks[11]
} else {
    foreach ($b in $blocks) {
        if ($b[0] -eq $null) { continue }   # skip B11 placeholder
        if ($mins -ge $b[0] -and $mins -lt $b[1]) {
            $active = $b
            break
        }
    }
}

if (-not $active) {
    Write-Host "No active block found for time $($now.ToString('HH:mm'))"
    exit 0
}

$emoji = $active[2]
$title = "THE SHIFT · $($active[3])"
$body  = $active[4]

# ── Show Windows toast ─────────────────────────────────────────────────────────
[Windows.UI.Notifications.ToastNotificationManager,
 Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument,
 Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml(@"
<toast duration="long">
  <visual>
    <binding template="ToastGeneric">
      <text>$emoji $title</text>
      <text>$body</text>
    </binding>
  </visual>
  <audio src="ms-winsoundevent:Notification.Default"/>
</toast>
"@)

$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("The Shift").Show($toast)
