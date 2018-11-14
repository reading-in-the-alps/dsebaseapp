xquery version "3.1";
import module namespace app="http://www.digital-archiv.at/ns/rita2-app/templates" at "../modules/app.xql";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare option exist:serialize "method=json media-type=text/javascript";

let $query := request:get-parameter('index', '1')
let $directory := request:get-parameter('directory', 'rita1')
let $index := xs:int($query)
let $collection := string-join(($app:data,$directory), '/')
let $all := sort(xmldb:get-child-resources($collection))
let $result := "show.html?document="||$all[$index]||"&amp;directory="||$directory
return $result