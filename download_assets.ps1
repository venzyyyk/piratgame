$base = "https://game-seawar.com"
$headers = @{ "Referer" = "https://game-seawar.com/"; "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" }

$files = @(
    "assets/img/piratgo_logox.jpg","assets/img/start.png","assets/img/logo_lux.jpg",
    "assets/img/more.jpg","assets/img/pirate_newgame.jpg","assets/img/city/1.jpg",
    "assets/img/wargames.jpg","assets/img/treasure.jpg","assets/img/monsters_index.jpg",
    "assets/img/taverna.jpg","assets/img/taverna_cask.jpg","assets/img/masters.jpg",
    "assets/img/shop1.png","assets/img/auk_index.png","assets/img/bokora.png",
    "assets/pic/wargame.jpg","assets/pic/kontr.png",
    "assets/pic/art/sunduk_old.jpg","assets/pic/art/myadra.jpg","assets/pic/trophy/69.jpg",
    "assets/pic/masters/blacksmith.png","assets/pic/masters/silver.png","assets/pic/masters/john.png",
    "assets/pic/masters/calipso.png","assets/pic/masters/erik.png",
    "assets/icons/info.png","assets/icons/weapon.png","assets/icons/base/dir.png",
    "assets/icons/res/money.png","assets/icons/res/piastr.png","assets/icons/res/rum.png",
    "assets/icons/weather/5.png",
    "assets/icons/nav/pirat.png","assets/icons/nav/city.png","assets/icons/nav/box.jpg",
    "assets/icons/nav/replay.png","assets/icons/nav/more.jpg","assets/icons/nav/pursuit.jpg",
    "assets/icons/nav/treasure.jpg","assets/icons/nav/treasure.png","assets/icons/nav/monsters_ico.jpg",
    "assets/icons/nav/travel.jpg","assets/icons/nav/travel_key.png","assets/icons/nav/taverna.jpg",
    "assets/icons/nav/shop.jpg","assets/icons/nav/auk.jpg","assets/icons/nav/masters.jpg",
    "assets/icons/nav/comuni.jpg","assets/icons/nav/wargame.jpg","assets/icons/nav/home.jpg",
    "assets/icons/nav/more_rait.png","assets/icons/nav/invis.png","assets/icons/nav/maps.png",
    "assets/icons/nav/zina.png","assets/icons/nav/barrakuda.png","assets/icons/nav/grap.png",
    "assets/icons/nav/hydra.png","assets/icons/nav/maid.png","assets/icons/nav/black.png",
    "assets/icons/nav/leva.png","assets/icons/nav/vans.png","assets/icons/nav/gun2.png",
    "assets/icons/nav/line.png","assets/icons/nav/fish_ico.jpg","assets/icons/nav/kirka.jpg",
    "assets/icons/nav/star_red.png","assets/icons/nav/upgrade.png","assets/icons/nav/ship.png",
    "assets/icons/nav/pushka.png","assets/icons/nav/pointer.png","assets/icons/nav/bank.jpg",
    "assets/icons/nav/auk_piastr.jpg","assets/icons/nav/auk_res.jpg","assets/icons/nav/auk_art.jpg",
    "assets/icons/nav/auk_real.jpg","assets/icons/nav/auk_table.jpg","assets/icons/nav/art_shop.jpg",
    "assets/icons/nav/trade_chat.jpg","assets/icons/nav/kafe.png","assets/icons/nav/man.png",
    "assets/styles/ui/green.png","assets/styles/ui/down.png","assets/styles/ui/links.png",
    "assets/styles/ui/but_g.png","assets/styles/style/links.png",
    "favicon.ico"
)

$dirset = @{}
foreach ($f in $files) {
    $dir = Split-Path ($f -replace "/","\") -Parent
    if ($dir -and -not $dirset.ContainsKey($dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
        $dirset[$dir] = $true
    }
}

$ok = 0; $fail = 0
foreach ($f in $files) {
    $local = $f -replace "/","\"
    try {
        Invoke-WebRequest -Uri "$base/$f" -Headers $headers -OutFile $local -UseBasicParsing
        $size = (Get-Item $local).Length
        if ($size -lt 150) { Write-Host "  SUSPICIOUS ($size b): $f" -ForegroundColor Yellow; $fail++ }
        else { $ok++ }
    } catch { Write-Host "  FAILED: $f" -ForegroundColor Red; $fail++ }
}

Write-Host ""
Write-Host "Done: $ok OK, $fail failed (of $($files.Count))" -ForegroundColor Cyan
if ($fail -gt 0) { Write-Host "Rerun to retry." -ForegroundColor Yellow }
