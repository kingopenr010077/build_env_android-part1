# build_env_android-part1

Android 14 离线构建环境分片包 - 第一部分

## 说明

本仓库是完整方案A（不含 NDK）的 17 个分片中的前 8 个分片（aa-ah）。

**必须与 [build_env_android_part2](https://github.com/kingopenr010077/build_env_android_part2) 配合使用**，才能还原完整环境。

## 文件列表

| 文件 | 大小 |
|---|---|
| scheme-a-full.tar.gz.aa | 95MB |
| scheme-a-full.tar.gz.ab | 95MB |
| scheme-a-full.tar.gz.ac | 95MB |
| scheme-a-full.tar.gz.ad | 95MB |
| scheme-a-full.tar.gz.ae | 95MB |
| scheme-a-full.tar.gz.af | 95MB |
| scheme-a-full.tar.gz.ag | 95MB |
| scheme-a-full.tar.gz.ah | 95MB |

## 完整还原方法

### 前置条件

- 需要同时克隆 `build_env_android_part2` 仓库

### 还原步骤

```bash
# 1. 克隆两个部分到同一目录
git clone https://github.com/kingopenr010077/build_env_android-part1.git
git clone https://github.com/kingopenr010077/build_env_android_part2.git

# 2. 合并所有分片并解压
cat build_env_android-part1/scheme-a-full.tar.gz.* \
    build_env_android_part2/scheme-a-full.tar.gz.* \
    > scheme-a-full.tar.gz

# 3. 解压
tar xzf scheme-a-full.tar.gz

# 4. 按需解压各组件
cd scheme-a-full
tar xzf jdk-17.tar.gz -C /usr/lib/jvm/
tar xzf android-sdk.tar.gz -C /root/
tar xzf gradle-8.4.tar.gz -C /opt/
tar xzf maven-repo.tar.gz -C /your-project/
tar xzf gradle-cache.tar.gz -C ~/.gradle/
```

### 快速还原脚本

```bash
# restore.sh - 一键还原
#!/bin/bash
PART1_DIR="build_env_android-part1"
PART2_DIR="build_env_android_part2"

echo "合并分片中..."
cat "$PART1_DIR"/scheme-a-full.tar.gz.* "$PART2_DIR"/scheme-a-full.tar.gz.* > scheme-a-full.tar.gz

echo "解压中..."
tar xzf scheme-a-full.tar.gz

echo "解压各组件..."
cd scheme-a-full
tar xzf jdk-17.tar.gz -C /usr/lib/jvm/
tar xzf android-sdk.tar.gz -C /root/
tar xzf gradle-8.4.tar.gz -C /opt/
tar xzf maven-repo.tar.gz -C .
tar xzf gradle-cache.tar.gz -C ~/.gradle/

echo "完成！"
echo "请设置环境变量："
echo "  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64"
echo "  export ANDROID_HOME=/root/android-sdk"
echo "  export GRADLE_HOME=/opt/gradle-8.4"
```

## 环境变量配置

```bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export ANDROID_HOME=/root/android-sdk
export GRADLE_HOME=/opt/gradle-8.4
export PATH=$JAVA_HOME/bin:$GRADLE_HOME/bin:$PATH
```

## 相关内容

- [build_env_android_part2](https://github.com/kingopenr010077/build_env_android_part2) - 第二部分（分片 ai-aq）
- [build_env_base](https://github.com/kingopenr010077/build_env_base) - 方案A的 LFS 版
- [build_env_ndk_part](https://github.com/kingopenr010077/build_env_ndk_part) - NDK 分片包