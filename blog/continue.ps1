# 在完成 firebase login 后运行此脚本：绑定项目并部署
# 用法：.\continue.ps1 [项目ID]
# 若不传项目ID，会先列出你的 Firebase 项目供你选择

param([string]$ProjectId = "")

$ErrorActionPreference = "Stop"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
Set-Location $PSScriptRoot

# 检查是否已登录
$list = firebase projects:list 2>&1
if ($LASTEXITCODE -ne 0) {
  Write-Host "未检测到 Firebase 登录。请先在本机终端执行：" -ForegroundColor Yellow
  Write-Host "  firebase login" -ForegroundColor Cyan
  Write-Host "在浏览器中完成登录后，再运行本脚本。" -ForegroundColor Gray
  exit 1
}

# 若未传项目ID，列出项目并提示
if ([string]::IsNullOrWhiteSpace($ProjectId)) {
  $current = (Get-Content .firebaserc -Raw | ConvertFrom-Json).projects.default
  if ([string]::IsNullOrWhiteSpace($current)) {
    Write-Host "当前未绑定项目。正在列出你的 Firebase 项目：" -ForegroundColor Cyan
    firebase projects:list
    Write-Host ""
    Write-Host "请用项目 ID 重新运行： .\continue.ps1 <你的项目ID>" -ForegroundColor Yellow
    exit 1
  }
  $ProjectId = $current
}

Write-Host "使用项目: $ProjectId" -ForegroundColor Green
firebase use $ProjectId
if ($LASTEXITCODE -ne 0) { exit 1 }
Write-Host "正在部署到 Firebase Hosting..." -ForegroundColor Cyan
firebase deploy --only hosting
