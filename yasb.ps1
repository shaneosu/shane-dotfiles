Import-Module C:\Users\shane\winwal\winwal.psm1

$colorsPath = "$HOME\.cache\wal\yasbcolors.json"
$colors = Get-Content -Raw -Path $colorsPath | ConvertFrom-Json
$variablesSection = @"
:root{
    --backgroundcol: $($colors.colors.background);
    --foregroundcol: $($colors.colors.foreground);
    --foregroundtranscol: $($colors.colors.foregroundtrans);
    --backgroundtranscol: $($colors.colors.backgroundtrans);
    --cursorcol: $($colors.colors.cursor);
    --colors0: $($colors.colors.color0);
    --colors1: $($colors.colors.color1);
    --colors2: $($colors.colors.color2);
    --colors3: $($colors.colors.color3);
    --colors4: $($colors.colors.color4);
    --colors5: $($colors.colors.color5);
    --colors6: $($colors.colors.color6);
    --colors7: $($colors.colors.color7);
    --colors8: $($colors.colors.color8);
    --colors9: $($colors.colors.color9);
    --colors10: $($colors.colors.color10);
    --colors11: $($colors.colors.color11);
    --colors12: $($colors.colors.color12);
    --colors13: $($colors.colors.color13);
    --colors14: $($colors.colors.color14);
    --colors15: $($colors.colors.color15);
}
"@
$stylesPath = "$HOME\.config\yasb\styles.css"
$stylesContent = Get-Content -Raw -Path $stylesPath
if ($stylesContent -match ":root\{[\s\S]*?\}") {
    $newStylesContent = $stylesContent -replace ":root\{[\s\S]*?\}", $variablesSection
} else {
    $newStylesContent = "$variablesSection`n$stylesContent"
}
$newStylesContent = $newStylesContent.TrimEnd()
$newStylesContent | Set-Content -Path $stylesPath   

Update-WalTerminal