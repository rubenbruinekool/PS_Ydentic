<#
 .Synopsis
  All powershell commandos, for simple manage your Ydentic API commando's.
#>
$version = 0.0.6

$script:baseurl = ""


##SET
Function set-YDbaseurl{
    param(
        [string]$url
    )
    $script:baseUrl = $url
}


##Get
function get-YDbaseurl{
    write-host $script:baseurl
}

Function get-YDtoken
{
    Param(
        [string] $ydentictoken
    )
    
    $header = @{
        "yd-token"=$ydentictoken
    }
    $uri = $script:baseurl + "/api/v2/Company.Service/auth"
    $method = "POST"
    $ContentType = "application/json"

    $tokenResponse = Invoke-RestMethod -Method $method -ContentType $ContentType -Uri $uri -Headers $header
    return $tokenResponse
}

Function get-YDCompanyforauditlog{
    Param(
        [string] $authtoken,
        [string] $companyname
    )
    $headers = @{
        "Authorization"= "Bearer $authtoken"
    }
    $uri = $script:baseUrl + "/api/v2/AuditLogging.Services.AuditLogInfo/get-log-tenants"
    $method = "Post"

    $companyquery = Invoke-WebRequest -Method $method -Uri $uri -Headers $headers -ErrorAction Stop
    $companys = $companyquery | ConvertFrom-Json
    If($null -ne $companyname){
        $company = $companys | Where-Object {$_.name -eq $companyname}
    }
    return $company
}


function get-YDmoduleversion {
    write-host $version
  }

##Remove
function remove-YDbaseURL {
    $script:baseUrl = ""
}



##Export Functions
Export-ModuleMember -Function set-YDbaseurl,
get-YDbaseurl,
remove-YDbaseURL,
get-YDCompanyforauditlog,
get-YDtoken,
get-YDmoduleversion
