# 1. 生成静态网页
Write-Host "正在生成静态页面..." -ForegroundColor Green
hugo

# 2. 添加所有更改
Write-Host "正在添加更改..." -ForegroundColor Green
git add .

# 3. 提交更改 (自动带上当前时间)
$time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "Site update: $time"
Write-Host "正在提交: $commitMessage" -ForegroundColor Green
git commit -m "$commitMessage"

# 4. 推送到 main 分支 (源码)
Write-Host "正在推送到 GitHub main..." -ForegroundColor Green
git push origin main

# 5. 发布到 gh-pages 分支 (网页)
Write-Host "正在发布到 gh-pages..." -ForegroundColor Green
git subtree push --prefix public origin gh-pages

Write-Host "发布完成！🎉" -ForegroundColor Cyan