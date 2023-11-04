# ProFile
# Created by: CoffeeIsCode
# Copyright (c) 2023 - Caffienated Software Systems - All Rights Reserved.

function a($q) {
    if ($null -eq $q) { "The question cannot be left empty. Please try again. Please try again."; } else {
    $answer = Read-Host -prompt "$q"  }
}

function question($question,$answer, $a, $b, $c, $d) {
    $q = $question; 
    $answer = read-host -prompt "$q"
    # check
    if ($answer -eq $a) {}
    if ($answer -eq $b) {}
    if ($answer -eq $c) {}
    if ($answer -eq $d) {}

}