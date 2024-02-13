Function get-YDtoken
{
    Param(
        [string] $baseurl,
        [string] $ydentictoken
    )
    
    $header = @{
        "yd-token"=$ydentictoken
    }
    $uri = $baseurl+"/api/v2/Company.Service/auth"
    $method = "POST"
    $ContentType = "application/json"

    $tokenResponse = Invoke-RestMethod -Method $method -ContentType $ContentType -Uri $uri -Headers $header
    return $tokenResponse
}

$token = get-ydtoken -baseurl https://idm.controlcat.nl -ydentictoken F20X7PPZTPGOCHSYGCI9
$token