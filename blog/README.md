# 个人技术博客

面向面试官展示数据工程经历：半年量化数据工作、技术文章、从零搭建线上数据的实践。

本目录位于 **pipitong.github.io** 仓库下的 `blog/`，由仓库根目录的 GitHub Actions 从本目录部署，站点地址：**https://pipitong.github.io**。

---

## 本地预览

```bash
cd blog
npm run preview
# 或：npx serve .  或  python -m http.server 8080
```

浏览器访问终端提示的地址。

---

## 部署（GitHub Pages）

推送 `main` 分支且本目录有变更时，会自动运行 "Deploy to GitHub Pages" 并发布。也可在仓库 **Actions** 里手动 Run workflow。

---

## 可选：Firebase Hosting

见本目录内 `firebase.json`、`deploy.ps1`；首次需 `firebase use <项目ID>`，之后可在本目录执行 `npm run deploy` 或 `.\deploy.ps1`。

---

## 目录结构

```
blog/
├── index.html
├── css/style.css
├── articles/
├── BLOG_PLAN.md
├── 博客写作指南-面试向.md
├── firebase.json, .firebaserc, package.json, deploy.ps1, continue.ps1
└── README.md（本文件）
```
