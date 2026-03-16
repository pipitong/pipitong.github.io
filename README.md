# pipitong.github.io

个人技术博客，托管在 GitHub Pages。访问：**https://pipitong.github.io**

博客内容在 **`blog/`** 目录下（由 learning_proj/blog 移入）。部署时 GitHub Actions 会从 `blog/` 发布，站点根目录即为博客首页。

## 本地预览

```bash
cd blog
npm run preview
# 或：npx serve .  或  python -m http.server 8080
```

浏览器打开终端提示的地址。

## 部署（GitHub Pages）

1. 仓库名须为 **pipitong.github.io**。
2. **Settings → Pages**，**Source** 选 **GitHub Actions**。
3. 推送 `main` 分支后自动部署，或在 **Actions** 里手动运行 "Deploy to GitHub Pages"。

## 更新博客

直接编辑 `blog/` 下文件（如 `blog/index.html`、`blog/articles/*.html`）后 push 即可。若你同时在 learning_proj 里改，把变更同步到本仓库 `blog/` 再 push。
