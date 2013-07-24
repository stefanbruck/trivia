Param($numberOfSeeds,$outputDirectory)

if ((Test-Path -path $outputDirectory) -ne $True)
{
	New-Item $outputDirectory -type directory
}

for ($seed=1; $seed -le $numberOfSeeds; $seed++) 
{
	cmd /C "Trivia.exe $seed > $outputDirectory\GoldenMaster$seed.txt"
}

