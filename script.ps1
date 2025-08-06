$hours = 15
$minutes = 0
$PlusOrMinus = 1
$sleepSecond = 5

Add-Type -AssemblyName System.Windows.Forms
if (-NOT ($hours -eq 0) -OR -NOT ($minutes -eq 0)) {
  if (-NOT ($hours -eq 0)) {
    $minutes = $minutes + ($hours * 60)
  }
  
  $seconds = (($minutes * 60) / $sleepSecond)
  $myshell = New-Object -com "Wscript.Shell"
  for ($i = 0; $i -lt $seconds; $i++) {
    $p = [System.Windows.Forms.Cursor]::Position
    $x = $p.X + $PlusOrMinus
    $y = $p.Y + $PlusOrMinus
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
    Start-Sleep -Seconds $sleepSecond
    $total = ($i+1)*$sleepSecond
    $letter = "$total Seconds"
    if($total -lt 10){
      $letter = "0$total Seconds"
    }
    if($total -ge 60) {
     $letter = ""
     $toRound = $total / 60
     $minutes = [math]::Floor($toRound)
     $scnds = $total - ($minutes * 60)
     if($scnds -lt 10){
      $scnds = "0$scnds"
     }
     if($minutes -lt 10){
      $minutes = "0$minutes"
     }
     $letter = "$minutes Minutes $scnds Seconds"
     if($minutes -ge 60) {
       $toRoundHours = $minutes /60
       $hoursR = [math]::Floor($toRoundHours)
       $newMinutes = $minutes - ($hoursR * 60)
       if($scnds -lt 10){
        $scnds = "0$scnds"
       }
       if($newMinutes -lt 10){
        $newMinutes = "0$newMinutes"
       }
       $letter = "$hoursR Hours $newMinutes Minutes $scnds Seconds"
     }
    }
    echo "$letter sleep"
    $PlusOrMinus *= -1
    $myshell.SendKeys("$letter sleep")
    $myshell.sendkeys("~")
  } 
} else {
  echo "Add Minutes or Hours"
  break;

}
