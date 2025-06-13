@echo off
chcp 65001
echo ====================================
echo      党员信息管理系统部署脚本
echo ====================================
echo.

echo [1/4] 检查Node.js环境...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 错误：未找到Node.js，请先安装Node.js
    echo 下载地址：https://nodejs.org/
    pause
    exit /b 1
)
echo ✅ Node.js环境检查通过

echo.
echo [2/4] 安装项目依赖...
npm install
if %errorlevel% neq 0 (
    echo ❌ 依赖安装失败，请检查网络连接
    pause
    exit /b 1
)
echo ✅ 依赖安装完成

echo.
echo [3/4] 构建生产版本...
npm run build
if %errorlevel% neq 0 (
    echo ❌ 构建失败，请检查代码
    pause
    exit /b 1
)
echo ✅ 构建完成

echo.
echo [4/4] 打开系统...
echo 系统已构建完成，文件位于 dist 文件夹中
echo 可以直接用浏览器打开 dist/index.html 文件
echo 或者部署到Web服务器上

start dist/index.html

echo.
echo ====================================
echo        部署完成！
echo ====================================
echo 如需开发模式，请运行：npm run dev
echo 如需重新构建，请运行：npm run build
echo.
pause 