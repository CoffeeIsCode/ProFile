<# BASE FUNCTIONS 
Version: 1.01
Released: NOV_24_2024 #>

var win = window;
function windowMe() {}
function say($str1, $str2, $mode) { 
    $mode = $mode.ToLower(); # convert str to lower case ("ABC" to "abc").
    $html = @{}; #html array
    $html += ""

    if ($mode -eq $null) { $html.type = $str } elseif ($mode -eq 1 -or "warn" -or "warning") { 
        $html.type = "Warning";
    }

    $html.start = "<html><head><title>ProFile $type Page!</title></head><body>";
    $html.end = "</body></html>";

    $html.body = "$str1"; # add to body

    $html.script = "<script>alert('$str2')</script>" 
    
    "<h1>WARNING!</h1>" >> "$env:USERPROFILE/Desktop/w.html"; 
} 