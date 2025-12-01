# GitHub Actions - Workflows

Este diretório contém os workflows automatizados do repositório.

## 📋 Workflows Disponíveis

### 1. ShellCheck (`shellcheck.yml`)
**Quando executa:** Push e Pull Requests
**O que faz:**
- Valida sintaxe de todos os scripts `.sh`
- Detecta erros comuns em shell scripts
- Reporta warnings e problemas de segurança

### 2. Validate Package Lists (`validate-pkglist.yml`)
**Quando executa:** Mudanças em `pkglist.txt` ou `aur_pkglist.txt`
**O que faz:**
- Verifica duplicatas entre listas
- Checa ordem alfabética
- Valida formatação
- Conta total de pacotes

### 3. Auto-Update Package Lists (`update-pkglist.yml`)
**Quando executa:** Manualmente ou semanalmente (segundas 9h UTC)
**O que faz:**
- Ordena listas alfabeticamente
- Remove duplicatas
- Remove linhas vazias
- Cria Pull Request automático

### 4. Test Symlink Creation (`symlink-test.yml`)
**Quando executa:** Mudanças em `install.sh` ou `.config/`
**O que faz:**
- Valida sintaxe do `install.sh`
- Verifica se todos os diretórios de config existem
- Simula criação de symlinks

### 5. Generate Preview (`generate-screenshots.yml`)
**Quando executa:** Push na main com mudanças em configs ou screenshots
**O que faz:**
- Gera estatísticas do repositório
- Atualiza arquivo `STATS.md`
- Conta scripts, pacotes e linhas de código

## 🚀 Como Usar

### Executar Workflow Manualmente

1. Vá para a aba **Actions** no GitHub
2. Selecione o workflow desejado
3. Clique em **Run workflow**
4. Escolha a branch e confirme

### Ver Resultados

- ✅ Workflows bem-sucedidos aparecem com checkmark verde
- ❌ Workflows com falha aparecem com X vermelho
- Clique em qualquer workflow para ver detalhes e logs

### Badges no README

Adicione ao seu `README.md`:

```markdown
![ShellCheck](https://github.com/ticogafa/dotfiles/workflows/ShellCheck/badge.svg)
![Validate Packages](https://github.com/ticogafa/dotfiles/workflows/Validate%20Package%20Lists/badge.svg)
```

## 🔧 Configuração

### Secrets Necessários

Nenhum secret é necessário para os workflows atuais. Se adicionar workflows que interagem com serviços externos, configure em:
**Settings → Secrets and variables → Actions**

### Permissões

Os workflows precisam de:
- `contents: write` - Para criar commits e PRs
- `pull-requests: write` - Para criar e gerenciar PRs

Configure em: **Settings → Actions → General → Workflow permissions**

## 📚 Recursos

- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Workflow Syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Available Actions](https://github.com/marketplace?type=actions)

## 💡 Dicas

1. **Skip CI:** Adicione `[skip ci]` na mensagem de commit para pular workflows
2. **Debug:** Use `::debug::` em scripts para output de debug
3. **Artifacts:** Workflows podem salvar arquivos usando `upload-artifact`
4. **Cache:** Use cache para dependências e acelerar builds

## 🤝 Contribuindo

Ao adicionar novos workflows:
1. Documente o propósito e triggers
2. Use nomes descritivos
3. Adicione comentários explicativos
4. Teste antes de fazer merge
