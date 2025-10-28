$hours = 15
$minutes = 0
$PlusOrMinus = 1
$sleepSecond = 5

function getDate($type){
  if($type -eq 0){
    return Get-Date -Format HH
  }
  if($type -eq 1){
    return Get-Date -Format mm
  }
  if($type -eq 2){
    return Get-Date -Format ss
  }
}

function formatTime($time){
  if($time -lt 10){
    return "0$time"
  }
  return $time
}

Add-Type -AssemblyName System.Windows.Forms
if (-NOT ($hours -eq 0) -OR -NOT ($minutes -eq 0)) {
  if (-NOT ($hours -eq 0)) {
    $minutes = $minutes + ($hours * 60)
  }
  
  $seconds = (($minutes * 60) / $sleepSecond)
  $myshell = New-Object -com "Wscript.Shell"
  for ($i = 0; $i -lt $seconds; $i++) {
    $currentHour = getDate(0)
    $currentMinute = getDate(1)
    $currentSecond = getDate(2)

    if($currentHour -eq 14 -and $currentMinute -eq 30){
      $sleepProgram = "true"
      while ($sleepProgram -eq "true"){
        $currentHour = getDate(0)
        $currentMinute = getDate(1)
        if($currentHour -eq 15 -and $currentMinute -ge 50){
          $sleepProgram = "false"
        }
        Start-Sleep -Seconds 1
      }
    }

    if($currentHour -eq 18 -and  $currentMinute -ge 10){
      Write-Output "Bye Bye..."
      break;
    }

    $p = [System.Windows.Forms.Cursor]::Position
    $x = $p.X + $PlusOrMinus
    $y = $p.Y + $PlusOrMinus
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
    Start-Sleep -Seconds $sleepSecond
    $total = ($i+1)*$sleepSecond
    $letter = "$total Seconds"
    $letter = formatTime($total) "Seconds"
    if($total -ge 60) {
     $letter = ""
     $toRound = $total / 60
     $minutes = [math]::Floor($toRound)
     $scnds = $total - ($minutes * 60)
     $scnds = formatTime($scnds)
     $minutes = formatTime($minutes)
     $letter = "$minutes Minutes $scnds Seconds"
     if($minutes -ge 60) {
       $toRoundHours = $minutes /60
       $hoursR = [math]::Floor($toRoundHours)
       $newMinutes = $minutes - ($hoursR * 60)
       $newMinutes = formatTime($newMinutes)
       $letter = "$hoursR Hours $newMinutes Minutes $scnds Seconds"
     }
    }
    Write-Output "$letter sleep - $currentHour : $currentMinute : $currentSecond"
    $PlusOrMinus *= -1
    $myshell.SendKeys("$letter sleep")
    $myshell.sendkeys("~")
  } 
} else {
  Write-Output "Add Minutes or Hours"
  break;
}
