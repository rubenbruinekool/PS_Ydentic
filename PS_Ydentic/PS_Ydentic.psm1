<#
 .Synopsis
  All powershell commandos, for simple manage your Ydentic API commando's.
#>

Function get-YDtoken
{
    Param(
        [string] $baseurl
        [string] $ydentictoken
    )
    
    $header = @{
        "yd-token"=$ydentictoken
    }
    $uri = "https://idm.controlcat.nl/api/v2/Company.Service/auth"
    $method = "POST"
    $ContentType = "application/json"

    $tokenResponse = Invoke-RestMethod -Method $method -ContentType $ContentType -Uri $uri -Headers $header

}


##Export Functions
Export-ModuleMember -Function get-YDtoken,