# NOTE: expect that this is preceded by source command:
# . check-functions.src.ps1
#

$geminaboxVsnExpected_ = "0.13.1" | Extract-Version
$geminaboxVsnMax_ = "0.14.0" | Extract-Version

# Capture gem packages
#
$rcmd = "gem"
$rargs = "list" -split " "
[System.Collections.ArrayList]$gems = Invoke-Expression "$rcmd $rargs"


# Check whether geminabox installed
#
$min = $geminaboxVsnExpected_
$max = $geminaboxVsnMax_
If (-not ("geminabox" |
        Is-GemInstalled -IsAtLeast $min -IsLessThan $max -GemList $gems)) {
    $errcode = 4
    Exit
}

# Check whether bundler installed
#
If (-not ("bundler" | Is-GemInstalled -GemList $gems)) {
    $errcode = 4
    Exit
}
