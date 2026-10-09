# 中科炼化AI智慧安全监控系统

Vue 2 + Arco Design 风格的纯前端监控系统。

## 📋 功能

- 数据中心 / 监测预警 / 作业监管 / 历史查询 / 系统管理 五个 Tab
- 作业监管：配置筛选、作业任务列表（分页 10/25/50/100 条/页）
- 增删改查、批量删除、CSV 导出（仅已勾选）
- 编辑作业任务：基础配置 + 关联摄像头（支持多选）
- 作业状态 4 种、作业票状态 8 种、分析启停单/分析状态
- 盈科系统同步模拟（每 30 秒新增一条任务）

## 🚀 部署到 GitHub Pages

1. 在 GitHub 创建新仓库（公开），命名为 `zkj-ai-monitoring`
2. 推送此目录的全部内容到 `main` 分支
3. 仓库 → Settings → Pages → Source: Deploy from a branch → Branch: `main` / `(root)`
4. 几分钟后访问：`https://<用户名>.github.io/zkj-ai-monitoring/`

## 💻 本地运行

```bash
# 方式 1：直接打开
open index.html

# 方式 2：本地服务器
python3 -m http.server 8000
# 浏览器访问 http://localhost:8000/
```

## 📦 依赖（全部本地化）

- `vue.min.js` — Vue 2.7.16
- `arco.css` — Arco Design 设计令牌
- `plant-map.png` — 3号场站平面图
- `cam-preview.svg` — 摄像头预览占位

## 🎨 主题

主色：`rgb(1, 120, 236)`（Arco Design 蓝色）
