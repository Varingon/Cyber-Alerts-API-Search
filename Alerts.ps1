#API List
$days = Read-Host -Promt 'How many days back?'
$API = "https://digital.nhs.uk/restapi/CyberAlert/"
$APIPageCount = (Invoke-RestMethod $API).publishedDate
$epochTime = (New-TimeSpan -Start (Get-Date "01/01/1970").AddDays($days) -End (Get-Date)).TotalSeconds
$date1 = Get-Date -Date "01/01/1970"
$date2 = Get-Date -Format "dd/MM/yyyy"
For ($i=0; $i -lt 7; $i++) {
    $data = Invoke-RestMethod ($API+"?publishedDate="+$epochime)
    $data.items | select threatid, title, threattype, severity
    $day = $day - 86400 
}

#Single API Search
$threat = Read-Host -Prompt 'Enter ThreadID number'
$singleAPI = "https://digital.nhs.uk/restapi/CyberAlert/single/"
$singleAPIResult = Invoke-RestMethod ($singleAPI+"?threatid=CC-"+$threat)
$singleAPIResult.items | select title, threattype, severity, shortsummary, remediationIntro
$singleAPIResult.items
Write-Output $singleAPIResult |  select title, threattype, severity, shortsummary, remediationIntro
