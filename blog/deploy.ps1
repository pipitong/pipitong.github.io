# 一键部署博客到 Firebase Hosting（GCP）
# 用法：在 blog 目录下执行 .\deploy.ps1
# 首次使用需先：firebase login  且  firebase use <你的项目ID>

$ErrorActionPreference = "Stop"
if (-not (Get-Command firebase -ErrorAction SilentlyContinue)) {
  Write-Host "请先安装 Firebase CLI: npm install -g firebase-tools" -ForegroundColor Yellow
  exit 1
}
$proj = (Get-Content .firebaserc | ConvertFrom-Json).projects.default
if ([string]::IsNullOrWhiteSpace($proj)) {
  Write-Host "请先绑定 Firebase 项目: firebase use <你的项目ID>" -ForegroundColor Yellow
  Write-Host "项目 ID 可在 Firebase 控制台或 GCP 控制台项目设置中查看。" -ForegroundColor Gray
  exit 1
}
firebase deploy --only hosting
