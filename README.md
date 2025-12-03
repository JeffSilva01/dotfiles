# Dotfiles

Meus arquivos de configuração pessoais gerenciados com [chezmoi](https://www.chezmoi.io/).

## Configurações Incluídas

### Terminal Emulators
- **Alacritty** - Terminal rápido e leve com suporte a GPU
  - Múltiplos temas pré-configurados
- **WezTerm** - Terminal moderno e configurável
  - Keymaps personalizados
  - Navegação e tabs customizados
  - Statusbar e tema personalizados

### Shell
- **Fish** - Shell amigável e interativo
  - Configurações personalizadas

### Editor
- **Neovim** - Editor modal altamente configurável
  - LazyVim como configuração base
  - Plugins e configurações personalizadas

### Multiplexer
- **Tmux** - Multiplexador de terminal
  - Tema Gruvbox Dark
  - Plugins essenciais (TPM, sensible, yank)
  - Integração Neovim/Tmux para navegação
  - Atalhos otimizados para produtividade
  - Mouse habilitado

### Outros
- **Git** - Configurações globais
- **XCompose** - Composição de caracteres especiais (ç, Ç)

## Instalação

### Pré-requisitos

```bash
# Instalar chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### Instalando as Configurações

```bash
# Inicializar com este repositório
chezmoi init https://github.com/jeffsilva01/dotfiles.git

# Verificar o que será aplicado
chezmoi diff

# Aplicar as configurações
chezmoi apply -v
```

### Instalando Dependências

#### Arch Linux / Manjaro

```bash
# Terminal emulators
sudo pacman -S alacritty wezterm

# Shell
sudo pacman -S fish

# Editor
sudo pacman -S neovim

# Multiplexer
sudo pacman -S tmux

# Git
sudo pacman -S git
```

#### Debian / Ubuntu

```bash
# Terminal emulators
sudo apt install alacritty
# WezTerm precisa ser instalado via release do GitHub

# Shell
sudo apt install fish

# Editor
sudo apt install neovim

# Multiplexer
sudo apt install tmux

# Git
sudo apt install git
```

### Configurações Adicionais

#### Tmux Plugin Manager

```bash
# Clonar TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Dentro do tmux, pressione prefix + I para instalar os plugins
```

#### Fish Shell

```bash
# Definir Fish como shell padrão
chsh -s $(which fish)
```

## Atualização

```bash
# Atualizar o repositório local
chezmoi update -v
```

## Personalização

Para fazer suas próprias modificações:

```bash
# Editar um arquivo
chezmoi edit ~/.config/nvim/init.lua

# Aplicar as mudanças
chezmoi apply -v

# Adicionar novos arquivos
chezmoi add ~/.config/novoarquivo

# Verificar o status
chezmoi status
```

## Estrutura do Repositório

```
.
├── dot_config/
│   ├── alacritty/        # Configurações do Alacritty
│   ├── fish/             # Configurações do Fish shell
│   ├── nvim/             # Configurações do Neovim
│   └── wezterm/          # Configurações do WezTerm
├── dot_gitconfig         # Configurações globais do Git
├── dot_tmux.conf         # Configurações do Tmux
└── dot_XCompose          # Composição de caracteres
```

## Atalhos Úteis

### Tmux

- `prefix` = `Ctrl+b` (padrão)
- `prefix + |` - Dividir horizontalmente
- `prefix + -` - Dividir verticalmente
- `prefix + r` - Recarregar configuração
- `prefix + S` - Sincronizar painéis
- `Alt + h/j/k/l` - Navegar entre painéis
- `Ctrl + h/j/k/l` - Navegação integrada Neovim/Tmux
- `Alt + v` - Layout vertical
- `Alt + h` - Layout horizontal

## Licença

MIT

## Autor

Jefferson Silva - [jeffsilva01.dev@gmail.com](mailto:jeffsilva01.dev@gmail.com)
