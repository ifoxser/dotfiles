module.exports = {
  types: [
    { value: 'feat', name: 'feat: 新功能/新特性' },
    { value: 'fix', name: 'fix: 修复bug' },
    { value: 'docs', name: 'docs: 文档更新' },
    { value: 'style', name: 'style: 代码格式修改' },
    { value: 'refactor', name: 'refactor: 代码重构' },
    { value: 'conf', name: 'conf: 配置修改' },
    { value: 'test', name: 'test: 测试用例修改' },
    { value: 'chore', name: 'chore: 其他修改' }
  ],
  
  // dotfiles 相关的范围
  scopes: [
    { name: 'nvim' },
    { name: 'tmux' },
    { name: 'zsh' },
    { name: 'git' },
    { name: 'alacritty' },
    { name: 'other' }
  ],
  
  allowCustomScopes: true,
  allowBreakingChanges: ['feat', 'fix', 'refactor'],
  
  // 步骤消息
  messages: {
    type: '选择更改类型:',
    scope: '更改范围 (可选):',
    customScope: '自定义范围:',
    subject: '简短描述:\n',
    body: '详细描述 (可选):\n',
    breaking: '破坏性更改 (可选):\n',
    footer: '关联issue (可选):\n',
    confirmCommit: '确认提交?'
  },
  
  skipQuestions: ['footer']
};

