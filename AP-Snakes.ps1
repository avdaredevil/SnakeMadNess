<#
|===============================================================>|
   AP-Snakes [SnakeMadNess] by APoorv Verma [AP] on 10/15/2013
|===============================================================>|
      $) Color Scheming                   1
      $) Level Making                   0 * 2
      $) MAP Saving and Loading           3
      $) Obstruction Creation
      $) Laser Beams To cut through walls
      $) Warping of Obstructions and Snake
      $) Game-Console with Laser and Score count
      $) CPU cycle and sleep time adjustment as game progresses
      $) Snake Grows upon eating food
      $) Restore Console Properties upon Close
|===============================================================>|
#>
param([Switch]$Trail, [ValidatePattern("[A-z]?:?.?\\.*\..*")][String]$MapFile='/*\', [Switch]$LoadDefaultSave)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gUGF1c2Uge3BhcmFtKFtTdHJpbmddJFBhdXNlUSA9ICJQcmVzcyBhbnkga2V5IHRvIGNvbnRpbnVlIC4gLiAuICIpDQoNCiAgICBXcml0ZS1Ib3N0IC1ub05ld2xpbmUgJFBhdXNlUQ0KICAgICRudWxsID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiTm9FY2hvLCBJbmNsdWRlS2V5dXAiKQ0KICAgIFdyaXRlLUhvc3QgIiINCn0KCmZ1bmN0aW9uIEFsaWduLVRleHQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJFRleHQsIFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0NlbnRlcicpDQoNCiAgICBpZiAoJFRleHQuY291bnQgLWd0IDEpIHsNCiAgICAgICAgJGFucyA9IEAoKQ0KICAgICAgICBmb3JlYWNoICgkbG4gaW4gJFRleHQpIHskQW5zICs9IEFsaWduLVRleHQgJGxuICRBbGlnbn0NCiAgICAgICAgcmV0dXJuICgkYW5zKQ0KICAgIH0gZWxzZSB7DQogICAgICAgICRXaW5TaXplID0gJChHZXQtSG9zdCkuVUkuUmF3VUkuV2luZG93U2l6ZS5XaWR0aA0KICAgICAgICBpZiAoKCIiKyRUZXh0KS5MZW5ndGggLWdlICRXaW5TaXplKSB7DQogICAgICAgICAgICAkQXBwZW5kZXIgPSBAKCIiKTsNCiAgICAgICAgICAgICRqID0gMA0KICAgICAgICAgICAgZm9yZWFjaCAoJHAgaW4gMC4uKCgiIiskVGV4dCkuTGVuZ3RoLTEpKXsNCiAgICAgICAgICAgICAgICBpZiAoKCRwKzEpJSR3aW5zaXplIC1lcSAwKSB7JGorKzskQXBwZW5kZXIgKz0gIiJ9DQojICAgICAgICAgICAgICAgICIiKyRqKyIgLSAiKyRwDQogICAgICAgICAgICAgICAgJEFwcGVuZGVyWyRqXSArPSAkVGV4dC5jaGFycygkcCkNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIHJldHVybiAoQWxpZ24tVGV4dCAkQXBwZW5kZXIgJEFsaWduKQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0oIiIrJFRleHQpLkxlbmd0aCkvMikrJFRleHQpDQogICAgICAgICAgICB9IGVsc2VpZiAoJEFsaWduIC1lcSAiUmlnaHQiKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuICgiICIqKCRXaW5TaXplLSgiIiskVGV4dCkuTGVuZ3RoLTEpKyRUZXh0KQ0KICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gKCRUZXh0KQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KfQoKZnVuY3Rpb24gS2V5UHJlc3NlZCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kS2V5LCAkU3RvcmU9Il5eXiIpDQoNCiAgICBpZiAoJFN0b3JlIC1lcSAiXl5eIiAtYW5kICRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlVcCxOb0VjaG8iKX0gZWxzZSB7aWYgKCRTdG9yZSAtZXEgIl5eXiIpIHtyZXR1cm4gJEZhbHNlfX0NCiAgICAkQW5zID0gJEZhbHNlDQogICAgJEtleSB8ICUgew0KICAgICAgICAkU09VUkNFID0gJF8NCiAgICAgICAgdHJ5IHsNCiAgICAgICAgICAgICRBbnMgPSAkQW5zIC1vciAoS2V5UHJlc3NlZENvZGUgJFNPVVJDRSAkU3RvcmUpDQogICAgICAgIH0gY2F0Y2ggew0KICAgICAgICAgICAgRm9yZWFjaCAoJEsgaW4gJFNPVVJDRSkgew0KICAgICAgICAgICAgICAgIFtTdHJpbmddJEsgPSAkSw0KICAgICAgICAgICAgICAgIGlmICgkSy5sZW5ndGggLWd0IDQgLWFuZCAoJEtbMCwxLC0xLC0yXSAtam9pbigiIikpIC1lcSAifn5+fiIpIHsNCiAgICAgICAgICAgICAgICAgICAgJEFucyA9ICRBTlMgLW9yIChLZXlQcmVzc2VkQ29kZSAoS2V5VHJhbnNsYXRlKCRLKSkgJFN0b3JlKQ0KICAgICAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoJEsuY2hhcnMoMCkgLWluICRTdG9yZS5DaGFyYWN0ZXIpDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KICAgIHJldHVybiAkQW5zDQp9CgpmdW5jdGlvbiBBUC1SZXF1aXJlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW0FsaWFzKCJGdW5jdGlvbmFsaXR5IiwiTGlicmFyeSIpXVtTdHJpbmddJExpYiwgW1NjcmlwdEJsb2NrXSRPbkZhaWw9e30sIFtTd2l0Y2hdJFBhc3N0aHJ1KQ0KDQogICAgW2Jvb2xdJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQiICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXmRlcDooLiopIiAge2lmICgkTWF0Y2hlc1sxXSAtbmUgIndoZXJlIil7QVAtUmVxdWlyZSAiZGVwOndoZXJlIiB7JE1PREU9Mn19ZWxzZXskTU9ERT0yfTtpZiAoJE1PREUtMil7R2V0LVdoZXJlICRNYXRjaGVzWzFdfWVsc2V7dHJ5eyYgJE1hdGNoZXNbMV0gIi9mamZkamZkcyAtLWRzamFoZGhzIC1kc2phZGoiIDI+JG51bGw7InN1Y2MifWNhdGNoe319fQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikiICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopIiAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICB9KQ0KICAgIGlmICghJFN0YXQpIHskT25GYWlsLkludm9rZSgpfQ0KICAgIGlmICgkUGFzc3RocnUpIHtyZXR1cm4gJFN0YXR9DQp9Cg==")))
# ========================================END=OF=COMPILER===========================================================|
$ErrorActionPreferenceO = $ErrorActionPreference
$ErrorActionPreference  = "SilentlyContinue"
. (Resolve-path Modules.ps1,.\Modules.ps1,"$(split-path $PSCommandPath)\Modules.ps1")[0] 2>&1>$null
$ErrorActionPreference  = $ErrorActionPreferenceO
# -------------
[int[]]$Win       = @([Console]::WindowHeight-2)
$Win             += @([Console]::WindowWidth)
$TitleBkp         = [Console]::Title
$BkColBkp         = [Console]::BackGroundColor
$SaveFile         = "$(split-path $PSCommandPath)\AP-Snakes.Map.Save"
$FoodCol          = "Yellow"
$FoodIcon         = "♣"
$SnakeStartSz     = 5
$SnakeCol         = "DarkGreen"
$SnaketCol        = "Red"
$SCRIPT:SnakePos  = "" #FIND = will find randomly#@([Math]::Floor($Win[0]/2),[Math]::Floor($Win[1]/2))
$SCRIPT:Repainter = 0
$SCRIPT:Direction = 1
$DirArray         = @("<","^",">","v")
$SpaceMap         = " "
$WallMap          = "W"
$FoodMap          = "P"
$WallCol          = "darkred"
$BkCol            = "Black"#[Console]::BackgroundColor
$GCCol            = "DarkGreen"
$GCBkCol          = "Red"
$ScoreCol         = "DarkGreen"
$ScoreMplr        = 10
$BodyCoords       = @()
[int] $Score      = 0 
[int] $Sleep            = 0
[int] $SleepAdj         = 0
[decimal] $PixRatio     = 70/35
[decimal] $ObstrRatio   = 4/5 # Def = 1/5 || 4/5 Is pretty Fun
[decimal] $ImpctRatio   = 5/120
[int] $ObstrucCt        = 0
[int] $ObstrucMod       = 10
[int] $SlowTime         = 0
[int] $SoJa             = 15  #Laser Yellow-White Print time [ms]
[int] $Script:LaserCnt  = 3   #Def - 1 || -100 for Infinite
[int] $BitesPLaser      = 3   #Def - 7 at 1/5 || Def - 3 at 4/5
$Tail             = ?:($Trail){"."}{" "}
$ColConv          = @("A","B","C","D","E","F")
[Console]::BackgroundColor = $BkCol
[Console]::Title = "Snake MADness By AP"
# -------------
$SCRIPT:SnakeLook  = @()
$SCRIPT:SnakeLook += 0..($SnakeStartSz-1) | % {$DirArray[$Direction]}
# -------------
$ScoreBoard = New-Object System.Management.Automation.Host.Rectangle
#1..($ScoreBoard.Right) | % {$SBFiller += New-Object System.Management.Automation.Host.BufferCell;$SBFiller[$_-1].BackgroundColor = $BkCol;$SBFiller[$_-1].ForegroundColor = 2}
$SBFiller = New-Object System.Management.Automation.Host.BufferCell
# -------------
$ScoreBoard.Left+=1;$ScoreBoard.Right = $Win[1]-2
$SBFiller.BackgroundColor = $GCBkCol;$SBFiller.ForegroundColor = $GCCol;$SBFiller.Character = " "
# -------------
$Wall  = @()
$WFill = @()
0..3 | % {
    $Wall  += New-Object System.Management.Automation.Host.Rectangle
    $WFill += New-Object System.Management.Automation.Host.BufferCell
    if ($_%2 -eq 0) {$Wall[$_].Bottom = $Win[0]-1} else {$Wall[$_].Left += 1;$Wall[$_].Right = $Win[1]-2}
}
# -------------
"Left","Right" | % {$Wall[2].$_   = $Win[1]-1}
"Top","Bottom" | % {$Wall[3].$_   = $Win[0]-1}
"Top","Bottom" | % {$ScoreBoard.$_= $Win[0]}
0,2 | % {$WFill[$_].Character = "█"} #475
$WFill[1].Character = "▀"
$WFill[3].Character = "▄"
# -------------
0..3 | % {$WFill[$_].ForegroundColor = $WallCol;$WFill[$_].BackgroundColor = $BkCol}
# -------------
$GRID = @($WallMap*$Win[1])
$GRID += 0..($Win[0]-3) | % {
    $WallMap+($SpaceMap*($Win[1]-2))+$WallMap
}
$GRID += @($WallMap*$Win[1])
0..($Grid.Count-1) | % {
     $Grid[$_] = ($Grid[$_] -split (""))[1..$Grid[$_].Length]
}
# -------------
function Game-Console ([String]$Text = "SnakeMADness By Apoorv Verma") {
    $Bkp = @([Console]::CursorTop)
    $Bkp += [Console]::CursorLeft
    [Console]::CursorTop  = $ScoreBoard.Top
    [Console]::CursorLeft = $ScoreBoard.Left
    $Host.UI.RawUI.SetBufferContents($ScoreBoard,$SBFiller)
    $LaserText = " Lasers : $(if ($LaserCnt -eq -100) {'∞'} else {$Script:LaserCnt}) "
    $OffSetS = -1-" SCORE : $Score".Length
    $OffSetL = -1-$LaserText.Length
    $OffSet  = $OffSetS+$OffsetL
    $Area = $ScoreBoard.Right-$ScoreBoard.Left+$Offset
    if ($Text.length -gt $Area) {$text = $text.substring(0,$Area-3)+"..."}
    Write-Host -NoNewLine -f $ScoreCol -b $GCBkCol (Align-Text $Text).substring(1-[Math]::Floor($OffSet/2))
    Place-Aligned-Text -NNL $WFill[0].Character -Align "Right" -ForeCol $WallCol -BackCol $GCBkCol -offset $OffSet
    Place-Aligned-Text -NNL $LaserText -Align "Right" -ForeCol $ScoreCol -BackCol $GCBkCol -offset (Invoke-Expression "-1+$OffSetS")
    Place-Aligned-Text -NNL $WFill[0].Character -Align "Right" -ForeCol $WallCol -BackCol $GCBkCol -offset $OffSetS
    Place-Aligned-Text " SCORE : $Score" -Align "Right" -ForeCol $ScoreCol -BackCol $GCBkCol -offset -1
    [Console]::CursorTop  = $Bkp[0]
    [Console]::CursorLeft = $Bkp[1]
}
function WriteTo-Pos ([string] $str, [int] $x = 0, [int] $y = 0,[ConsoleColor] $bgc = [console]::BackgroundColor,[ConsoleColor] $fgc = [Console]::ForegroundColor) {
    if($x -ge 0 -and $y -ge 0 -and $x -le [Console]::WindowWidth -and $y -le [Console]::WindowHeight) {
        $CTY = [console]::CursorTop
        $WTY = [console]::WindowTop       
        try {[console]::setcursorposition($x,$WTY+$y)
        Write-Host -Object $str -BackgroundColor $bgc -ForegroundColor $fgc -NoNewline
        [console]::setcursorposition(0,$CTY)} catch {Draw-Walls}
    }
}
function QUIT {
    [Console]::CursorTop       = $Win[0]+3
    [Console]::CursorLeft      = 0
    [Console]::CursorVisible   = $true
    [Console]::Title           = $TitleBkp
    [Console]::BackGroundColor = $BkColBkp
    $Host.UI.RawUI.FlushInputBuffer()
    exit
}
function Keys-Check {
    while ($Host.UI.RawUI.KeyAvailable) {
        $Store = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeydown,IncludeKeyUp")
        if (!$Store.KeyDown) {Continue}
        If (KeyPressed "q","x","~~Escape~~" $Store) {Game-Console ". . . QUIT Signal . . .";QUIT}
        ElseIf (KeyPressed "~~left~~","A","4o"  $Store) {$SCRIPT:Directionh = ?:(($SCRIPT:Direction+2)%4 -eq 0) {$SCRIPT:Direction} {0}}
        ElseIf (KeyPressed "~~up~~","W","8o"    $Store) {$SCRIPT:Directionh = ?:(($SCRIPT:Direction+2)%4 -eq 1) {$SCRIPT:Direction} {1}}
        ElseIf (KeyPressed "~~right~~","d","6o" $Store) {$SCRIPT:Directionh = ?:(($SCRIPT:Direction+2)%4 -eq 2) {$SCRIPT:Direction} {2}}
        ElseIf (KeyPressed "~~down~~","S","5o"  $Store) {$SCRIPT:Directionh = ?:(($SCRIPT:Direction+2)%4 -eq 3) {$SCRIPT:Direction} {3}}
        ElseIf (KeyPressed "-"  $Store) {$SleepAdj += 2}
        ElseIf (KeyPressed "+"  $Store) {$SleepAdj -= 2}
        ElseIf (KeyPressed "~~space~~","L","Z","~~Control~~"  $Store) {. Laser-Beam $SCRIPT:Direction $SCRIPT:SnakePos}
        ElseIf (KeyPressed "p"  $Store) {Pause-Screen}
        ElseIf (KeyPressed "0s" $Store) {. Digest-Food}
        ElseIf (KeyPressed "123" $Store) {Game-Console "Loading Full Screen";cmd /c start /max cmd /k "mode con cols=239 lines=84&powershell -ep bypass $PSCommandPath";QUIT}
        ElseIf (KeyPressed "~~Tab~~" $Store) {Game-Console ". . . Saving Game State . . .";Save-State;Game-Console ". . . Saved Game State . . ."}
        ElseIf (KeyPressed "116" $Store) {f5}
    }
}
function Pause-Screen {
    $TargetView = 
    $BKP = $Host.UI.RawUI.GetBufferContents($ScoreBoard)
    $Host.UI.RawUI.ScrollBufferContents($ScoreBoard,$cds, $rt, $SBFiller)
    $Host.UI.RawUI.FlushInputBuffer()
}
function Make-Food {
    $Coord = Get-EmptyCoord
    $GRID[$Coord[0]][$Coord[1]] = $FoodMap
    WriteTO-Pos $FoodIcon -y $Coord[0] -x $Coord[1] -fgc $FoodCol
}
function Draw-Walls {
    0..3 | % {$Host.UI.RawUI.SetBufferContents($Wall[$_],$WFill[$_])}
    $OWall = $Wall[0,2,3]
    "Top","Bottom" | % {$prp = $_;0..2 | % {$OWall[$_].$prp += 2}}
    0..2 | % {$Host.UI.RawUI.SetBufferContents($OWall[$_],$WFill[(?:($_ -eq 2){0}{0})])}
    "Top","Bottom" | % {$prp = $_;0..2 | % {$OWall[$_].$prp -= 2}}
}
function Warp-Coords ($Coords) {
    0..1 | % {$Coords[$_] = (($Coords[$_]%$Win[$_])+$Win[$_])%$Win[$_]}
    return $Coords
}
function Transform-Snake {
    $SCRIPT:SnakeLookO = $SCRIPT:SnakeLook
    $SCRIPT:SnakeLook[$SCRIPT:SnakeLook.count-1] = $DirArray[$SCRIPT:Direction]
    foreach ($p in 0..($SCRIPT:SnakeLook.count-2)) {
        $SCRIPT:SnakeLook[$p] = $SCRIPT:SnakeLookO[$p+1]
    }
}
function Move-Head {
    switch ($SCRIPT:Direction) {
        0 {$SCRIPT:SnakePos[1] -= 1}
        1 {$SCRIPT:SnakePos[0] -= 1}
        2 {$SCRIPT:SnakePos[1] += 1}
        3 {$SCRIPT:SnakePos[0] += 1}
    }
}
function Digest-Food {
    $Score += $ScoreMplr
    $GRID[$SCRIPT:SnakePos[0]][$SCRIPT:SnakePos[1]] = $SpaceMap
    WriteTO-Pos " " -y $SCRIPT:SnakePos[0] -x $SCRIPT:SnakePos[1] -fgc $SnakeCol
    . Make-Food
    $SCRIPT:SnakeLook = 0..($SCRIPT:SnakeLook.count-1) | % {$p = $_;0..(?:($p -eq 0){1}{0}) | % {$SCRIPT:SnakeLook[$p]}}
    Game-Console
    $SleepAdj -=.15
}
function Get-EmptyCoord {
    $Coord = @(0,0)
    $TmOut = .5*$Win[1]*$Win[0]
    while ($true) {
        $Coord[0] = 0..($Win[0]-1) | get-random
        $Coord[1] = 0..($Win[1]-1) | get-random
        if ($tmout -le 0) {Game-Console "Game Took Too Long to Find Coords";QUIT}
        $TmOut--
        if ($GRID[$Coord[0]][$Coord[1]] -eq $SpaceMap) {return $Coord}
    }
}
function Equals-Coord ($Coords1,$Coords2) {
    return (($Coords1 -join (":")) -eq ($Coords2 -join (":")))
}
function Contains-Coord ($Coords1,$Coords2) {
    If ($Coords1 -match $Coords2) {
        if ((($Coords1 -match ($Coords2[0],$Coords2[1])).item(0) -join (":")) -eq ($Coords2 -join (":"))) {
            return $true
        }
    }
    return $False
}
function Draw-Obstructor {
    $Coord = @();$Length = @(0,0)
    $TmOut = $Win[1]*$Win[0]
    While ($True) {
        $Coord = Get-EmptyCoord
        if (([Math]::Abs($Coord[0]-$SCRIPT:SnakePos[0]) -gt $ImpctRatio*$Win[0]) -and ([Math]::Abs($Coord[1]-$SCRIPT:SnakePos[1]) -gt $ImpctRatio*$Win[1])){break}
        if ($tmout -le 0) {Game-Console "Game Took Too Long to Find Non-Impact Coords";QUIT}
        $TmOut--
    }
    $Length[0] = 1..($Win[0]*$ObstrRatio) | get-random
    $Length[1] = 1..($Win[1]*$ObstrRatio) | get-random
    $SnakeBuried = $False
#    $SCRIPT:SnakePos[0] -in $Coord[0]..($Coord[0]+$Length[0])
    foreach ($p in $Coord[0]..($Coord[0]+$Length[0])) {
        foreach ($d in $Coord[1]..($Coord[1]+$Length[1])) {
            $nc=Warp-Coords $p,$d
            if ($GRID[$nc[0]][$nc[1]] -eq $WallMap) {continue}
            if ($GRID[$nc[0]][$nc[1]] -eq $FoodMap) {
                Make-Food
            } elseif ((Contains-Coord $BodyCoords $nc) -or (Equals-Coord $SnakePos $nc)) {
                $SnakeBuried = $true
                Set-Variable -Name SlowTime -value 70 -scope 1
                foreach ($x in $BodyCoords) {
                    if ($GRID[$x[0]][$x[1]] -ne $WallMap) {WriteTO-Pos $SpaceMap -y $x[0] -x $x[1]}
                }
                WriteTO-Pos (Map2Symb $GRID[$SnakePos[0]][$SnakePos[1]]) -y $SnakePos[0] -x $SnakePos[1] -fgc (Map2Col $GRID[$SnakePos[0]][$SnakePos[1]])
            }
            $GRID[$nc[0]][$nc[1]] = $WallMap
            WriteTO-Pos $WFill[0].Character -y $nc[0] -x $nc[1] -fgc $WallCol -bgc $WallCol
        }
    }
    if ($SnakeBuried) {$Host.UI.RawUI.FlushInputBuffer();$SCRIPT:SnakePos = Get-EmptyCoord;Ready-Steady-Po;$SnakeBuried = $False}#;$SCRIPT:Repainter++}
}
function Ready-Steady-Po ([int]$Dir=1) {
    Game-Console ". . . READY . . ."
    $SCRIPT:SnakeLook = $SCRIPT:SnakeLook | % {$DirArray[$Dir]}
    $SCRIPT:Direction=$Dir
    Draw-Snake
    Start-sleep -s 1
    Game-Console ". . . STEADY . . ."
    Start-sleep -s 1
    Game-Console ". . . ! GO ! . . ."
}
function Map2Col ($Map){
    switch ($Map) {
        $WallMap  {$WallCol}
        $FoodMap  {$FoodCol}
        $SpaceMap {$BkCol}
        Default   {$BkCol}
    }
}
function Map2Symb ($Map){
    switch ($Map) {
        $WallMap  {[Char]([int]$WFill[0].Character)}
        $FoodMap  {$FoodIcon}
        $SpaceMap {" "}
        Default   {$Map}
    }
}
function Match-Grid ([String]$Message = "Recreating Map", [Switch]$FastLoad){
    foreach ($p in 0..($Win[0]-1)) {
        Game-Console "$Message : $([Math]::Floor($p/($Win[0]-1)*100))%"
        if ($SnakePos[0] -eq $p) {Continue}
        foreach ($d in 0..($Win[1]-1)) {
            $Kt=$GRID[$p][$d]
            if ($FastLoad -and $Kt -eq " " -and !($p -in 0,($Win[0]-1)) -and !($d -in 0,($Win[1]-1))) {continue}
            WriteTO-Pos (Map2Symb $Kt) -y $p -x $d -fgc (Map2Col $Kt)
        }
    }
}
function Laser-Beam ($Directn, $Pos){
    if (($Script:LaserCnt -le 0) -and ($Script:LaserCnt -ne -100)) {Game-Console "- - - - - - - - No More Lasers - - - - - - - -";return}
    if ($Directn -in 0,2) {
        $Set = 0..($Win[1]-1)
        if ($Directn -eq 0) {$Set = $Set | sort -Descending}
        foreach ($p in $Set){
            if ($GRID[$pos[0]][$p] -eq $WallMap){
                $GRID[$pos[0]][$p] = $SpaceMap
                0..1 | % {WriteTO-Pos (?:($_%2 -eq 0){"█"}{" "}) -y $pos[0] -x $p -fgc "yellow";start-sleep -m (?:($_%2 -eq 0){$SoJa}{0})}
            }
        }
    } else {
        $Set = 0..($Win[0]-1)
        if ($Directn -eq 1) {$Set = $Set | sort -Descending}
        foreach ($p in $Set){
            if ($GRID[$p][$pos[1]] -eq $WallMap){
                $GRID[$p][$pos[1]] = $SpaceMap
                0..1 | % {WriteTO-Pos (?:($_%2 -eq 0){"█"}{" "}) -y $p -x $pos[1] -fgc "yellow";start-sleep -m (?:($_%2 -eq 0){$SoJa}{0})}
            }
        }
    }
    if ($Script:LaserCnt -ne -100) {$Script:LaserCnt--}
    Game-Console
}
function Save-State ($File=$SaveFile) {
    "This is a Save File from SnakeMADness by Apoorv Verma [AP]
    Copyright 2014 All Rights Reserved
    AP|--------------------------------->
        >>Score.....= $Score
        >>Window....= $Win
        >>Lasers....= $Script:LaserCnt
        >>SnakeSize.= $($Script:SnakeLook.count)
    AP|--------------------------------->" | % {$_.replace((" "*4),"").replace(">>",(" "*4))} | out-file -Encoding ascii $File
    $Grid | % {$_ -join("")} | Out-File -Append -Encoding ascii $File
}
function Load-Map ($Mapper) {
    $GRID_s = @()
    $Launch = @{}
    $Loader = 0
    cat "$Mapper" | % {
        if ($_ -match "AP\|\-*>") {$Loader++;} else {
            if ($Loader -eq 1) {$Tr = $_.split("=").trim().trim(".");$Launch += @{$TR[0] = ($TR[1..($tr.count-1)] -join(""))}}
            if ($Loader -eq 2) {$GRID_s += ,@("$_".toCharArray())}
        }
    }
    if ($Grid_s.count -eq 0) {Game-Console "Invalid Map File ... Will Load Normal Game"} else {
        if ($Launch.Score -ne $Null) {$Score = $Launch.Score}
        if ($Launch.Lasers -ne $Null) {$Script:LaserCnt = $Launch.Lasers}
        if ($Launch.SnakeSize -ne $Null) {$SCRIPT:SnakeLook = @();$SCRIPT:SnakeLook += 0..($Launch.SnakeSize-1) | % {$DirArray[0]}}
        $GRID = $GRID_s
        Match-Grid -FastLoad
    }
    Remove-Variable Launch,GRID_s,Loader,Mapper,TR
    f5
}
function f5 {
    $OP = ?:([console]::WindowHeight -gt 3){-1}{1}
    [console]::WindowHeight += $OP
    [console]::WindowHeight -= $OP
}
function Draw-Snake {
    WriteTO-Pos $SCRIPT:SnakeLook[$SCRIPT:SnakeLook.Count-1] -y $SCRIPT:SnakePos[0] -x $SCRIPT:SnakePos[1] -fgc $SnakeCol
    $x = $SCRIPT:SnakePos[1]
    $y = $SCRIPT:SnakePos[0]
    $BodyCoordsO = $BodyCoords[-1]
    $BodyCoords = @()
    foreach ($p in ($SCRIPT:SnakeLook.Count-2)..0) {
        switch ($SCRIPT:SnakeLook[$p]) {
            "<" {$x+=1}
            "^" {$y+=1}
            ">" {$x-=1}
            "v" {$y-=1}
        }
        $nc = Warp-Coords $y,$x
        WriteTO-Pos $SCRIPT:SnakeLook[$p] -y $nc[0] -x $nc[1] -fgc $SnakeTCol
        $BodyCoords += ,@($y,$x)
    }
    if ($BodyCoordsO -ne $null) {$Kret=$GRID[$BodyCoordsO[0]][$BodyCoordsO[1]];WriteTO-Pos (?:($Kret -ne $SpaceMap){Map2Symb $kret}{$Tail}) -y $BodyCoordsO[0] -x $BodyCoordsO[1] -fgc (?:($Kret -ne $SpaceMap){Map2Col $kret}{$SnakeTCol})}
#    Game-Console "$($BodyCoordsO) 0 $($BodyCoordsO -ne $null)"
    $BodyCoords = $BodyCoords | % {,(Warp-Coords $_)}
}
[Console]::CursorVisible = $False
cls
Game-Console
Draw-Walls
if (($MapFile -ne '/*\') -and (Test-path -type leaf $MapFile)) {
    . Load-Map $MapFile
    $SCRIPT:SnakePos = Get-EmptyCoord
    Ready-Steady-Po
} elseif ($LoadDefaultSave) {
    . Load-Map $SaveFile
    $SCRIPT:SnakePos = Get-EmptyCoord
    Ready-Steady-Po
} else {
    Make-Food
}
if ($SCRIPT:SnakePos -in "","LOAD") {$SCRIPT:SnakePos = Get-EmptyCoord}
while ($true) {
    $SCRIPT:Directionh = $SCRIPT:Direction
    . Transform-Snake
    . Draw-Snake
    . Keys-Check
    $SCRIPT:Direction = $SCRIPT:Directionh
    . Move-Head
    $SCRIPT:SnakePos = Warp-Coords $SCRIPT:SnakePos
    If (($Score%$ObstrucMod -lt $ObstrucMod/10) -and ($Score/$ObstrucMod -eq $ObstrucCt)) {Draw-Obstructor;$ObstrucCt++}
    If ($GRID[$SCRIPT:SnakePos[0]][$SCRIPT:SnakePos[1]] -eq $WallMap) {
        Game-Console "Snake Lost its head to a wall, You Lost!"
        QUIT
    }
    If ($GRID[$SCRIPT:SnakePos[0]][$SCRIPT:SnakePos[1]] -eq $FoodMap) {
        . Digest-Food
        if ($Score%($ScoreMplr*$BitesPLaser) -lt $ScoreMplr/10) {if ($Script:LaserCnt -ne -100) {$Script:LaserCnt++;Game-Console}}
    } ElseIf (Contains-Coord $BodyCoords $SCRIPT:SnakePos) {
        Game-Console "$((($BodyCoords -match ($SCRIPT:SnakePos[0],$SCRIPT:SnakePos[1])).item(0) -join (":"))) -eq $($SCRIPT:SnakePos -join(":"))"
        Game-Console "Snake bit itself, You Lost!"
        QUIT
    }
    $Sleep = ?:($SCRIPT:Direction -in 1,3){$PixRatio*(35+$SleepAdj+[Math]::Floor($SlowTime/5))}{35+$SleepAdj+[Math]::Floor($SlowTime/5)}
    if ($SCRIPT:Repainter -gt 0) {$SCRIPT:Repainter--;if ($SCRIPT:Repainter -eq 0) {Match-grid}}
    $SlowTime = [Math]::Floor($SlowTime/5*4)
    if ($Sleep -lt 0) {$Sleep = 0}
    start-sleep -m $Sleep
}
