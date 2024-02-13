
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

### Version 0.0.6
* Added multiple commands: set-YDbaseurl, get-YDbaseurl, remove-YDbaseurl, get-YDCompanyforauditlog
* URL's will now use the baseurl

### Version 0.0.5
* Create the first script to get a token and moduleversion

## Ussage
## BaseURL
You can set the baseurl by use the following command:
set-YDbaseurl -url <URL of the Ydentic Portal>

You can view the baseurl with the following command:
get-YDbaseurl

You can remove the baseurl with the following command:
remove-YDbaseurl

## Create Token
You can create a token with the following command:
$token = get-ydtoken -baseurl <URL of the ydentic portal> -ydentictoken <Token created in Ydentic>

## Get the companyinfo for using by audit log
$company = get-YDCompanyforauditlog -authtoken $token -companyname <Name of your company in Ydentic>


## Get the current module version
You will get the version of my module with the following command:
get-YDmoduleversion





