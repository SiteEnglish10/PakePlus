#!/bin/bash

echo "===================================="
echo "     党员信息管理系统部署脚本"
echo "===================================="
echo

echo "[1/4] 检查Node.js环境..."
if ! command -v node &> /dev/null; then
    echo "❌ 错误：未找到Node.js，请先安装Node.js"
    echo "下载地址：https://nodejs.org/"
    exit 1
fi
echo "✅ Node.js环境检查通过"

echo
echo "[2/4] 安装项目依赖..."
if ! npm install; then
    echo "❌ 依赖安装失败，请检查网络连接"
    exit 1
fi
echo "✅ 依赖安装完成"

echo
echo "[3/4] 构建生产版本..."
if ! npm run build; then
    echo "❌ 构建失败，请检查代码"
    exit 1
fi
echo "✅ 构建完成"

echo
echo "[4/4] 打开系统..."
echo "系统已构建完成，文件位于 dist 文件夹中"
echo "可以直接用浏览器打开 dist/index.html 文件"
echo "或者部署到Web服务器上"

# 尝试在不同系统上打开文件
if command -v open &> /dev/null; then
    # macOS
    open dist/index.html
elif command -v xdg-open &> /dev/null; then
    # Linux
    xdg-open dist/index.html
else
    echo "请手动在浏览器中打开 dist/index.html 文件"
fi

echo
echo "===================================="
echo "        部署完成！"
echo "===================================="
echo "如需开发模式，请运行：npm run dev"
echo "如需重新构建，请运行：npm run build"
echo 