# Rime-Weasel 个人配置方案

这是一个基于 **Windows 11** 环境的 Rime 小狼毫（Weasel）个人配置集。

## 特性

* **词库**：基于 [rime-ice (雾凇拼音)](https://github.com/iDvel/rime-ice) 词库。
* **外观**：
  * 复刻**微软拼音深色模式**主题。
  * 类似微软拼音的任务栏中英文状态图标。另外提供Resource Hacker脚本用于替换图标。

![候选框](assets/prediction.png)
![中英文图标](assets/icon.png)

---

## 图标替换指引

项目根目录下的 `RH_script` 文件夹用于自动化替换小狼毫的系统图标（如任务栏状态图标）。

### 1. 准备工作

1. 确保电脑已安装 [Resource Hacker](https://www.google.com/search?q=http://www.angusj.com/resourcehacker/)。
2. 将本仓库中的 `RH_script` 文件夹整体移动到 Resource Hacker 的程序安装目录下（即与 `ResourceHacker.exe` 同级）。

### 2. 替换步骤

1. **关闭进程**：打开任务管理器，强制结束所有 `Weasel` 相关进程。
2. **切换输入法**：将系统输入法切换为 **英文 (ENG)**，防止文件被占用。
3. **提取文件**：从 Rime 的程序文件夹复制以下三个文件到 `RH_script` 文件夹内：
* `WeaselServer.exe`
* `weaselx64.dll`
* `weasel.dll`

4. **执行脚本**：运行文件夹内的 `weasel_replace_icons.bat` ，等待 Resource Hacker 完成自动备份+替换。
5. **还原文件**：将处理完毕的三个文件复制回 Rime 程序目录，覆盖原文件。
6. **重启服务**：重新启动 Weasel 服务或点击“重新部署”。

### 3. 如果图标未生效（缓存清理）

若覆盖后图标仍显示旧版，请尝试以下“强力刷新”操作：

1. **清理图标数据库**：
* 使用 Everything 搜索并删除 `iconcache.db`。
* 进入 `%LocalAppData%\Microsoft\Windows\Explorer`，删除所有以 `iconcache` 开头的 `.db` 文件。


2. **重启资源管理器**：在任务管理器中重启 `explorer.exe`。
3. **磁盘清理**：Windows 搜索“磁盘清理”，勾选所有项（重点是缩略图和临时文件）并执行清理。
4. **重启系统**：完成上述步骤后重启电脑。

---

## 维护说明

* 本项目仅追踪 `.yaml` 配置文件中的 `*custom.yaml` 文件。
* 修改配置后请务必执行 **“重新部署”** 以生效。

---

## 免责声明
**在使用 RH_script 修改图标前，请务必阅读以下内容：**

本项目提供的 RH_script 涉及对 dll、exe 等二进制文件的底层修改（通过 Resource Hacker 替换图标），有可能导致以下后果：

数字签名失效：修改后的 .dll 和 .exe 文件可能会导致其原有的数字签名失效。

封号风险：由于修改了二进制且破坏了签名，不排除极低概率下该行为被部分竞技类游戏的反作弊系统判定为非法篡改。

风险自担：本人未对任何游戏环境进行过兼容性测试。如因替换图标导致账号被封禁、系统不稳定或其他任何后果，本人概不负责。

如果你对此有任何顾虑，请不要使用该脚本替换图标，仅使用 .yaml 配置文件即可。rime_ice.custom.yaml中的替换图标属于官方提供的配置项，没有修改二进制，可以放心使用。

---