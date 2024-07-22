#!/bin/bash

# Global variables
ZSH_CUSTOM="$HOME/.zsh"
CHEZMOI_REPO="https://github.com/jeffsilva01/dotfiles.git"

# Function update system
update_system() {
	sudo pacman -Syu || {
		printf "Failed to update system\n" >&2
		return 1
	}
}

# Function to install packages
install_packages() {
	local packages=(
		"yay"
		"rust"
		"zsh"
		"neovim"
		"lazygit"
		"docker"
		"docker-compose"
		"flatpak"
		"vscodium-bin"
		"libpamac-flatpak-plugin"
		"tmux"
	)
	sudo pacman -Syu --needed "${packages[@]}" || {
		printf "Failed to install packages\n" >&2
		return 1
	}
}

# Function to install chezmoi
install_chezmoi() {
	sh -c "$(curl -fsLS get.chezmoi.io)" || {
		printf "Failed to install chezmoi\n" >&2
		return 1
	}
}

# Function to initialize chezmoi and apply dotfiles
setup_dotfiles() {
	chezmoi init --apply $CHEZMOI_REPO || {
		printf "Failed to initialize and apply chezmoi dotfiles\n" >&2
		return 1
	}
}

# Function to install zsh plugins without Oh My Zsh
setup_zsh_plugins() {
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/powerlevel10k" || {
		printf "Failed to install Powerlevel10k\n" >&2
		return 1
	}
	git clone https://github.com/larkery/zsh-histdb "$ZSH_CUSTOM/zsh-histdb" || {
		printf "Failed to install zsh-histdb\n" >&2
		return 1
	}
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/zsh-syntax-highlighting" || {
		printf "Failed to install zsh-syntax-highlighting\n" >&2
		return 1
	}
	git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/zsh-autosuggestions" || {
		printf "Failed to install zsh-autosuggestions\n" >&2
		return 1
	}
}

# Function to install ASDF
install_asdf() {
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 || {
		printf "Failed to install asdf\n" >&2
		return 1
	}
}

# Function to install Node.js with asdf
install_languages_asdf() {
	if ! asdf plugin-list | grep -q "nodejs"; then
		asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git || {
			printf "Failed to add Node.js plugin to asdf\n" >&2
			return 1
		}
	fi
	asdf install nodejs latest || {
		printf "Failed to install Node.js with asdf\n" >&2
		return 1
	}
	asdf global nodejs latest

	if ! asdf plugin-list | grep -q "maven"; then
		asdf plugin-add maven || {
			printf "Failed to add Maven plugin to asdf\n" >&2
			return 1
		}
	fi
	asdf install maven latest || {
		printf "Failed to install Maven with asdf\n" >&2
		return 1
	}
	asdf global maven latest

	if ! asdf plugin-list | grep -q "java"; then
		asdf plugin-add java https://github.com/halcyon/asdf-java.git || {
			printf "Failed to add Java plugin to asdf\n" >&2
			return 1
		}
	fi
	asdf install Java oracle-17.0.7 || {
		printf "Failed to install Java with asdf\n" >&2
		return 1
	}
	asdf global java oracle-17.0.7
}

# Main function
main() {
	update_system || exit 1
	install_packages || exit 1
	install_chezmoi || exit 1
	install_asdf || exit 1
	setup_zsh_plugins || exit 1
	install_node_asdf || exit 1
	setup_dotfiles || exit 1

	printf "Setup completed successfully.\n"
}

main "$@"
