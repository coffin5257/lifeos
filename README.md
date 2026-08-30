# LifeOS

LifeOS 是一个由你和 AI agent 共同维护的私人知识与决策系统。

这个 GitHub 仓库只负责分发 LifeOS 的安装协议、运行规则和最小模板。它不是用户 LifeOS 的仓库模板，也不要求用户 fork、clone、提交或同步自己的个人数据。

用户可以把 LifeOS 创建在任意本地目录、已有知识库或自己选择的存储位置。是否使用 Git、云盘或其他版本管理方式，完全由用户决定。

## 一条提示词导入

当前源仓库是 private，只有仓库所有者和获邀协作者能读取。未来改为 public 后，任何人都可以把下面的提示词交给 Codex 或 Claude Code：

```text
请读取 https://github.com/coffin5257/lifeos/blob/main/INSTALL.md，
按照其中的协议在当前目录初始化我的 LifeOS。
不要创建、要求或假设 Git；先通过对话完成个性化。
```

如果不希望创建在当前目录，把“当前目录”替换成明确的本地路径即可。

### Codex

在希望存放个人 LifeOS 的目录中打开 Codex，发送上面的提示词。Codex 会读取 [`INSTALL.md`](INSTALL.md)，进行简短 onboarding，并把运行规则安装到目标目录。

### Claude Code

在希望存放个人 LifeOS 的目录中启动 Claude Code，发送同一条提示词。Claude Code 会执行相同的安装协议，并生成适用于 Claude Code 的入口文件。

用户不需要保留这个源仓库的本地副本。Agent 只需要在安装时读取它；安装完成后的 LifeOS 是自包含的。

## 初始化会发生什么

Agent 会先理解：

- 你现在最希望 LifeOS 帮你解决的问题；
- 你当前的重要角色与生活 context；
- 未来 30–90 天最重要的结果；
- 你的隐私、读取和写入边界；
- 你最常处理的输入与偏好的协作方式。

然后把 [`runtime/`](runtime/) 中的最小运行规则复制到目标目录，并只生成当下必要的个人内容，通常是：

```text
.lifeos/
AGENTS.md
CLAUDE.md
me/
  profile.md
  priorities.md
inbox/
source/
outputs/
```

`people/`、`project/`、`area/`、`minutes/`、`knowledge/` 等目录，会在第一个真实任务需要时自然出现。初始化阶段不会安装 skill。

## 核心原则

LifeOS 把信息分为五层：

1. 原始证据：会议、聊天、文档和其他 source；
2. 当前状态：今天仍有效的目标、关系和项目状态；
3. 分析判断：明确区分事实、推断、建议与不确定项；
4. 编译知识：可从来源重新生成的主题知识；
5. 历史归档：保留但默认不参与当前判断的旧上下文。

完整规则见 [`runtime/.lifeos/core.md`](runtime/.lifeos/core.md)，渐进演进机制见 [`runtime/.lifeos/evolution.md`](runtime/.lifeos/evolution.md)。

## 存储与隐私

- LifeOS 默认只是目标目录中的本地文件，不绑定任何托管或版本管理方案。
- 是否使用 Git、GitHub、云盘、NAS 或纯本地存储，由用户自行决定。
- Agent 按需读取，不扫描与当前任务无关的私人内容。
- 未知事实保持未知，不用合理猜测补全。
- 分析和写入是两种权限；没有写入授权时保持只读。
- 原始资料保留来源，摘要不能覆盖原件。
- 未经明确授权，不把个人内容发送到远端服务。

## 当前阶段

这是 LifeOS 的 agent-native MVP：没有独立 CLI、Web 服务或账户系统。GitHub 只是发布安装协议的地方；Codex / Claude Code 负责在用户选择的位置完成个性化初始化和持续演进。
