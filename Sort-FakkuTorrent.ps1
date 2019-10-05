# Very basic script at the moment
# Fill in the $FilePath in the script with your desired directory

# Extract all files from "chapters" folder to a single directory where they will be sorted
$FilePath = ""

$Files = Get-ChildItem $FilePath

$Authors = @()
foreach ($File in $Files) {
   $File -match '\[(.*?)\]'
   $Authors += $Matches[1]
}

foreach ($Author in $Authors) {
    New-Item -ItemType Directory -Name ($Author).tolower() -ErrorAction SilentlyContinue
}

for ($x=0; $x -lt $files.length; $x++) {
    $Author = $Authors[$x]
    $Files[$x] | Move-Item -Destination "$FilePath\$Author" -Verbose
}
