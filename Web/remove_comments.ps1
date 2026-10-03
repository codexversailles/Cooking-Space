# Get all HTML files in the current directory
$htmlFiles = Get-ChildItem -Path . -Filter "*.html" -Recurse

foreach ($file in $htmlFiles) {
    # Read the file content
    $content = Get-Content $file.FullName -Raw
    
    # Remove HTML comments
    $content = $content -replace '<!--[\s\S]*?-->', ''
    
    # Remove CSS comments
    $content = $content -replace '/\*[\s\S]*?\*/', ''
    
    # Write the modified content back to the file
    $content | Set-Content $file.FullName -Force
    Write-Host "Removed comments from $($file.Name)"
}

Write-Host "Comment removal complete!" 