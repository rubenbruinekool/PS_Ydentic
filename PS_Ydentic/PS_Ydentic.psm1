<#
 .Synopsis
  All powershell commandos, for simple manage your Ydentic API commando's.
#>
$version = 0.0.9

$script:baseurl = ""


##SET
Function set-YDbaseurl{
    param(
        [string]$url
    )
    $script:baseUrl = $url
}

Function set-YDtoken
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
    $script:authtoken = $tokenResponse
}

##Get
function get-YDbaseurl{
    write-host $script:baseurl
}

function get-YDtoken{
    write-host $script:authtoken
}

Function get-YDCompanyforauditlog{
    Param(
        [string] $companyname
    )
    $headers = @{
        "Authorization"= "Bearer $script:authtoken"
    }
    $uri = $script:baseUrl + "/api/v2/AuditLogging.Services.AuditLogInfo/get-log-tenants"
    $method = "Post"

    $companyquery = Invoke-WebRequest -Method $method -Uri $uri -Headers $headers -ErrorAction Stop
    $companys = $companyquery | ConvertFrom-Json
    If($null -ne $companyname){
        $company = $companys | Where-Object {$_.name -eq $companyname}
    }
    $company = $company.guid
    return $company
}

Function get-YDcompanyauditlog{
    Param(
        [string] $companyID
    )
    $headers = @{
        "Authorization"= "Bearer $script:authtoken"
    }
    $uri = $script:baseUrl + "/api/v2/AuditLogging.Services.AuditLogInfo/get-log-entries"
    $method = "Post"

    $body = @{
        skip      ='0'
        Take      ='100'
        Description = 'Update'
        CompanyId = $companyID
 } | ConvertTo-Json

    $YDauditlog = Invoke-WebRequest -Method $method -Uri $uri -Headers $headers -body $body -ErrorAction Stop
    $YDcompanyauditlog = $YDauditlog.content | ConvertFrom-Json
    return $YDcompanyauditlog
}


Function get-YDActorauditlog{
    Param(
        [string] $user,
        [string] $actorcompanyid,
        [string] $companyID
        
    )
    $headers = @{
        "Authorization"= "Bearer $script:authtoken"
    }
    $uri = $script:baseUrl + "/api/v2/AuditLogging.Services.AuditLogInfo/get-log-entries-for-actor"
    $method = "Post"
    $body = @{
        skip      ='0'
        Take      ='100'
        Description = 'Update'
        ActorId = $user
        actorcompanyid = $actorcompanyid
        companyid = $companyID
 } | ConvertTo-Json
    $YDactorauditlog = Invoke-WebRequest -Method $method -Uri $uri -Headers $headers -body $body -ErrorAction Stop
    $YDactorauditlog = $YDactorauditlog.content | ConvertFrom-Json
    return $YDactorauditlog
    
}

function get-YDmoduleversion {
    write-host $version
  }

##Remove
function remove-YDbaseURL {
    $script:baseUrl = ""
}

function remove-YDtoken {
    $script:authtoken = ""
}




##Export Functions
Export-ModuleMember -Function set-YDbaseurl,
get-YDbaseurl,
remove-YDbaseURL,
get-YDCompanyforauditlog,
get-YDcompanyauditlog,
get-YDActorauditlog,
set-YDtoken,
get-YDtoken,
remove-YDtoken,
get-YDmoduleversion
