# 🚀 Kubuntu Minimal Post-Install Setup Script

This script automates the initial setup for a fresh **Kubuntu Minimal** installation. It configures the system appearance, installs essential tools, and prepares the system for daily use and development.

## 🔧 What It Does

* 📦 **Updates the system** with the latest packages
* 🎨 **Applies the Breeze Dark theme** across the desktop environment
* 🛠️ **Installs core tools** like Flatpak, Snap, Git, Aria2, and Htop
* 🧩 **Enables Flatpak support** via Flathub and KDE Discover
* 🔐 **Generates an SSH key** for version control and remote access
* 📊 **Installs Mission Center** (a system monitor) via Flatpak
* 🌐 **Installs Google Chrome** directly from Google’s site
* 🎨 **Fixes GTK theming for Flatpak apps** to match Breeze Dark

## 💻 Target System

* Tested on **Kubuntu Minimal** (fresh install)

## ✅ Usage

Run the script in a terminal:

```bash
sudo apt-get install -yq curl && curl -o- https://raw.githubusercontent.com/calobyte/KubuntuKwikStart/refs/heads/main/25.04.sh | bash
```

> ⚠️ Make sure to review the script before running it.
