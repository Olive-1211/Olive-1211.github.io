# 1. 生成静态网页
Write-Host "Generating static page..." -ForegroundColor Green
hugo

# 2. 添加所有更改
Write-Host "Applying changes..." -ForegroundColor Green
git add .

# 3. 提交更改 (自动带上当前时间)
$time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "Site update: $time"
Write-Host "Submitting: $commitMessage" -ForegroundColor Green
git commit -m "$commitMessage"

# 4. 推送到 main 分支 (源码)
Write-Host "Pushing to GitHub main..." -ForegroundColor Green
git push origin main

# 5. 发布到 gh-pages 分支 (网页)
Write-Host "Publishing to gh-pages..." -ForegroundColor Green
git subtree push --prefix public origin gh-pages

Write-Host "Success!" -ForegroundColor Cyan