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