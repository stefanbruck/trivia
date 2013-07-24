Param($numberOfSeeds,$outputDirectory)

$totalErrors = 0;

for ($seed=1; $seed -le $numberOfSeeds; $seed++) 
{
	cmd /C "Trivia.exe $seed > $outputDirectory\Current$seed.txt"
	if (diff (get-content $outputDirectory\GoldenMaster$seed.txt) (get-content $outputDirectory\Current$seed.txt))
	{
		$message = "$outputDirectory\Current$seed.txt differs from $outputDirectory\GoldenMaster$seed.txt"
		$message
		$totalErrors++
	}
}

if ($totalErrors -eq 0)
{
	"Everything OK"
}
else
{
	"Error"
}
