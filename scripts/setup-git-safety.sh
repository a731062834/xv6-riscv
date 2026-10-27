#!/bin/sh
# 每个新 clone 跑一次：配置 origin/upstream 与 pre-push 防误推钩子
set -e
cd "$(git rev-parse --show-toplevel)"

git remote get-url origin   >/dev/null 2>&1 || git remote add origin git@github.com:a731062834/xv6-riscv.git
git remote get-url upstream >/dev/null 2>&1 || git remote add upstream https://github.com/mit-pdos/xv6-riscv.git
git remote set-url --push upstream no_push

git config remote.pushDefault origin
git config core.hooksPath .githooks
git config branch.riscv.pushRemote origin
chmod +x .githooks/pre-push 2>/dev/null || true

echo "✅ 安全检查已启用"
git remote -v
