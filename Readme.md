
# ReadMe

## Content
 * [Basics](#basics)
 * [Disclaimer and Warning](#disclaimer-and-warning)
 * [Release Notes](#release-notes)
 * [Ussage](*Ussage)

## Basics
Install the powershell module to download the PS_ydentic folder and copy this files to your powershell module folder

# Import module
import-module -name "PS-ydentic"

## Disclaimer and Warning
**Be careful!** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


## Release notes
### Version 0.1.0
* Sorted the Audit log on Createdate
  
### Version 0.0.9
* Fix issue with CompanyGUID in the get-YDactorauditlog

### Version 0.0.8
* added and modify multiple commands: set-YDtoken, get-YDtoken, Remove-YDtoken
* Use **set-YDtoken** to import the token.

### Version 0.0.7
* Added multiple commands: get-YDcompanyauditlog, get-YDActorauditlog
* Token will now use the same token after creating

### Version 0.0.6
* Added multiple commands: set-YDbaseurl, get-YDbaseurl, remove-YDbaseurl, get-YDCompanyforauditlog
* URL's will now use the baseurl

### Version 0.0.5
* Create the first script to get a token and moduleversion

## Ussage
### BaseURL
You can set the baseurl by use the following command:<br>
**set-YDbaseurl -url {URL of the Ydentic Portal}**

You can view the baseurl with the following command:<br>
**get-YDbaseurl**

You can remove the baseurl with the following command:<br>
**remove-YDbaseurl**

### Authentication Token
You can create a token with the following command:<br>
**set-YDtoken -ydentictoken {Token created in Ydentic}**

You can view the created token with the following command:<br>
**get-YDtoken**

You can remove the value of the token with the following command:<br>
**remove-YDtoken**

### Get the companyinfo for using by audit log
Get the company info for reading the auditlog with the following command:<br>
**$company = get-YDCompanyforauditlog -companyname {Name of your company in Ydentic}**

### Get audit log entries
There are multiple commands to get the auditlog but there are multiple ways to get the auditlog.<br>
To view all audit log for one company use the following command:<br>
**get-YDcompanyauditlog -companyid $company**

To view the auditlog filtered by an actor, you can use the following command:<br>
**get-YDActorauditlog -user {Full UPN of the user} -actorcompanyid {CompanyID from actor} -companyid $company**
* You can create an variable for actorcompanyid by using the following $Actorcompany = get-YDCompanyforauditlog -companyname {Name of your company in Ydentic}**<br>
You can now use the following command:<br>
**get-YDActorauditlog -user {Full UPN of the user} -actorcompanyid $Actorcompany -companyid $company**



### Get the current module version
You will get the version of my module with the following command:<br>
**get-YDmoduleversion**





