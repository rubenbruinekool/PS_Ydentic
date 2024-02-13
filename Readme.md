
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

### Version 0.0.5
* Create the first script to get a token and moduleversion

## Ussage
## Create Token
$token = get-ydtoken -baseurl <URL of the ydentic portal> -ydentictoken <Token created in Ydentic>

## Get the current module version
get-YDmoduleversion



