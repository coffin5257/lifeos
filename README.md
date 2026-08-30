# LifeOS

LifeOS 是一个由你和 AI agent 共同维护的私人知识与决策系统。

它不是一套要求所有人照搬的目录，也不会在第一次使用时生成大量空文件。仓库只提供稳定的信息模型、隐私与写入边界，以及渐进式 onboarding。Codex 或 Claude Code 会根据你的当前目标和一个真实任务，创建最小、个性化的 LifeOS；后续只有在真实使用出现稳定模式时，才建议增加模板、规范或 skill。

## 开始使用

> 当前仓库为 private。开放给其他人之前，可将其改为 public，并在 GitHub 设置中启用 **Template repository**。

### Codex

1. 在 GitHub 点击 **Use this template**，创建一个 private repository。
2. 将新仓库克隆到本地，并在 Codex 中打开该文件夹。
3. 对 Codex 说：`帮我初始化我的 LifeOS。`

Codex 会自动读取 `AGENTS.md`，进行简短 onboarding，并在得到足够信息后创建最小系统。

### Claude Code

1. 在 GitHub 点击 **Use this template**，创建一个 private repository。
2. 将新仓库克隆到本地，在该目录启动 Claude Code。
3. 对 Claude 说：`帮我初始化我的 LifeOS。`

Claude Code 会自动读取 `CLAUDE.md`，执行同一套 onboarding。

## 初始化会发生什么

Agent 会先理解：

- 你现在最希望 LifeOS 帮你解决的问题；
- 你当前的重要角色与生活 context；
- 未来 30–90 天最重要的结果；
- 你的隐私、读取和写入边界；
- 你最常处理的输入与偏好的协作方式。

然后只生成当下必要的内容，通常是：

```text
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

完整规则见 [`system/core.md`](system/core.md)，初始化方式见 [`system/onboarding.md`](system/onboarding.md)，渐进演进机制见 [`system/evolution.md`](system/evolution.md)。

## 隐私

- 用户实例应默认使用 private GitHub repository。
- Agent 按需读取，不扫描与当前任务无关的私人内容。
- 未知事实保持未知，不用合理猜测补全。
- 分析和写入是两种权限；没有写入授权时保持只读。
- 原始资料保留来源，摘要不能覆盖原件。

## 当前阶段

这是 LifeOS 的仓库原生 MVP：没有独立 CLI、Web 服务或账户系统。GitHub 负责复制与版本管理，Codex / Claude Code 负责个性化初始化和持续演进。
