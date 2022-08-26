# Hướng dẫn cài đặt cơ bản cho người mới dùng linux

## Mục lục
- [Fix headphone microphone](#fix-headphone-microphone)
- [Cài đặt zsh](#cài-đặt-zsh)
- [Cài đặt oh-my-zsh](#cài-đặt-oh-my-zsh)
- [Cài đặt zsh autosuggestions](#cài-đặt-zsh-autosuggestions)
- [Theme Power10k cho zsh shell](#theme-power10k-cho-zsh-shell)
- [Cài bộ gõ tiếng Việt](#cài-đặt-bộ-gõ-tiếng-việt)
  * [Ubuntu](#ubuntu)
  * [Cài đặt từ mã nguồn](#cài-đặt-từ-mã-nguồn)
    + [Gỡ cài đặt:](#gỡ-cài-đặt)
- [Cài đặt neofetch](#cài-đặt-neofetch)
- [Cài đặt bashtop](#cài-đặt-bashtop)
- [Terminal](#terminal)
  * [Terminator](#terminator)
  * [Terminology](#terminology)
- [Cài đặt phím tắt](#cài-đặt-phím-tắt)
- [Gnome extention](#gnome-extention)
- [Themes](#themes)
- [Icons](#icons)

## Fix headphone microphone
chạy cli: `hdajackretask`

Chọn như hình: ![HDAJackRetask](./images/HDAJackRetask.png)
Chọn `Apply Now`, nhập password.

Nếu lỗi thì chọn `Install boot override` sau đó khởi động lại máy. 

Tiếp theo chạy lệnh cli `alsamixer`.

Chọn như hình: ![alsamixer1](./images/alsamixer_1.png)

Chỉnh như hình: ![alsamixer2](./images/alsamixer_2.png)

Nhấn `Esc` để thoát.

Xong!

Tham khảo: https://www.reddit.com/r/Fedora/comments/qzaofq/headset_mic_not_working/
https://www.youtube.com/watch?v=yx33W-c4Cmg 

## Cài đặt zsh
Debian/Ubuntu: 

```console
sudo apt-get install zsh -y
```

Fedora/RHEL/Almalinux: 

```console
sudo dnf install zsh -y
```
Kiểm tra xem đã cài đặt thành công chưa:
```
$ which zsh

/usr/bin/zsh
```
Mở file *.bashrc*, thêm `exec zsh` vào đầu file.

## Cài đặt oh-my-zsh
```console
sudo curl -L http://install.ohmyz.sh | sh
```
## Cài đặt zsh autosuggestions
```console
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```
Mở file ~/.zshrc, sửa dòng `plugins=(git)` thành `plugins=(git zsh-autosuggestions)`

Nếu autosuggestions plugin không hoạt động thì thêm câu lệnh này vào cuối file .zshrc
```console
~ vim ~/.zshrc
...
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
```
Tham khảo: https://viblo.asia/p/cach-cai-dat-zsh-va-zsh-autosuggestions-tren-ubuntu-LzD5ddDO5jY

## Theme Power10k cho zsh shell
Cài font [MesloLGS NF](https://github.com/romkatv/powerlevel10k#fonts).

Cài đặt vào oh-my-zsh:

```console
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
Mở file ~/.zshrc, sửa dòng `ZSH_THEME="robbyrussell"` thành `ZSH_THEME="powerlevel10k/powerlevel10k"`.

Lưu file, mở terminal để cài đặt themes. File cài đặt được lưu ở `~/.p10k.zsh`.

Nếu muốn thay đổi tùy chọn của theme thì gõ lệnh `p10k configure`.

Chỉnh lại font của terminal là `MesloLGS NF`.

Xong rồi. Tận hưởng thôi! 

Dưới đây là giao diện mình đã tùy chỉnh.
![gnome-terminal](./images/gnome-terminal.png)
Tham khảo: https://github.com/romkatv/powerlevel10k#configuration

## Cài đặt bộ gõ tiếng Việt
### Ubuntu
```console
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus ibus-bamboo --install-recommends
ibus restart
# Đặt ibus-bamboo làm bộ gõ mặc định
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"
```
### Cài đặt từ mã nguồn
Cài đặt các gói phụ thuộc:
- make
- golang
- libgtk-3-dev
- libx11-dev
- libxtst-dev

```console
# Debian/Ubuntu:
sudo apt-get install make golang libx11-dev libxtst-dev libgtk-3-dev

# Fedora, CentOS,...
sudo yum install make go libX11-devel libXtst-devel gtk3-devel

# openSUSE Tumbleweed
sudo zypper install make go libX11-devel libXtst-devel gtk3-devel
```
Tải xuống: 
```console
wget https://github.com/BambooEngine/ibus-bamboo/archive/master.zip -O ibus-bamboo.zip
unzip ibus-bamboo.zip

# hoặc clone từ github:
git clone https://github.com/BambooEngine/ibus-bamboo.git
```
Build và Install: 
```console
cd ibus-bamboo
sudo make install

# Restart ibus
ibus restart
```
#### Gỡ cài đặt:
```console
sudo make uninstall
ibus restart
```

Nguồn: https://github.com/BambooEngine/ibus-bamboo/wiki/H%C6%B0%E1%BB%9Bng-d%E1%BA%ABn-c%C3%A0i-%C4%91%E1%BA%B7t-t%E1%BB%AB-m%C3%A3-ngu%E1%BB%93n 

## Cài đặt neofetch

Debian/Ubuntu:
```console
sudo apt update
sudo apt install neofetch
```

Fedora/RHEL:
```console
sudo dnf makecache --refresh
#sudo yum install epel-release
sudo dnf -y install neofetch
```

![neofetch](./images/neofetch.png)
## Cài đặt bashtop

```console
git clone https://github.com/aristocratos/bashtop.git
cd bashtop
sudo make install 
```
![bashtop](./images/bashtop.png)

https://github.com/aristocratos/bashtop#manual-installation-linux-osx-and-freebsd

## Terminal
### Terminator

Terminator là một trình giả lập thiết bị đầu cuối dành cho các hệ thống giống như Linux và Unix, cho phép người dùng tạo nhiều thiết bị đầu cuối trong một cửa sổ duy nhất và sắp xếp chúng thành lưới. Mỗi cửa sổ đầu cuối có thể được thay đổi kích thước tùy theo nhu cầu. Terminator dựa trên Gnome và được viết bằng ngôn ngữ Python.

**Debian/Ubuntu**
```console
sudo apt-get install terminator
 ```
Nếu điều đó không xảy ra, bạn có thể cần thêm kho lưu trữ PPA và phiên bản Ubuntu mới hơn mà bạn không phải chạy lệnh ‘cập nhật’.
```console
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update
sudo apt-get install terminator
 ```
**Fedora/RHEL**
```console
sudo dnf makecache --refresh
sudo dnf install terminator
 ```
![terminator](./images/terminator.png)

Tắt **Show titlebar**: Chuột phải vào màn hình terminator -> Preferences -> Profiles -> General -> bỏ chọn Show titlebar.

### Terminology
Có thể xem ảnh và video ngay trong terminal.

Fedora/RHEL:
```console
sudo dnf makecache --refresh
sudo dnf -y install terminology
```
![terminology](./images/terminology.png)

## Cài đặt phím tắt
Vào Settings->Keyboard -> Keyboard Shortcuts -> View and Customize Shortcuts -> Custome Shortcut.

Terminal shortcut:

![Terminal Shortcut](./images/TerminalShortcut.png)

Desktop Shortcut:

![Desktop Short](./images/DesktopShortcut.png)

Cài thư viện wmctrl: 

Fedora/RHEL:
```console
sudo dnf -y install wmctrl
```
Debian/Ubuntu:
```console
sudo apt-get update
sudo apt-get install wmctrl
```

Câu lệnh: `wmctrl -k on`

Tham khảo: 

https://www.redhat.com/sysadmin/linux-terminal-window
https://askubuntu.com/questions/97219/how-to-show-desktop-from-command-line 

## Gnome extention

https://extensions.gnome.org/

Extention thường dùng:
- [User Themes](https://extensions.gnome.org/extension/19/user-themes/) - làm mờ topbar.
- [Dash2Dock Lite](https://extensions.gnome.org/extension/4994/dash2dock-lite/)
- [Resource Monitor](https://extensions.gnome.org/extension/1634/resource-monitor/) - hiển thị thông tin phần cứng.
- [Remove App Menu](https://extensions.gnome.org/extension/3906/remove-app-menu/)
- [Show Desktop Button](https://extensions.gnome.org/extension/1194/show-desktop-button/)
- [Unblank lock screen](https://extensions.gnome.org/extension/1414/unblank/) - Luôn hiện màn hình khóa.


## Themes
- [Tokyo Night](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme)

- [Otis](https://github.com/EliverLara/otis)

- [Graphite](https://github.com/vinceliuice/Graphite-gtk-theme)

- [Colloid](https://github.com/vinceliuice/Colloid-gtk-theme)


Copy thư mục chứa theme vào `/usr/share/themes/`.

Ví dụ: 

- Tải theme Otis:
```console
git clone https://github.com/EliverLara/Otis.git
```
- Sao chép theme Otis vào nơi cài đặt:
```console
sudo cp -r Otis /usr/share/themes/Otis
```
- Để sử dụng theme Otis trên Gnome, thì chạy câu lệnh trong Terminal:

```console
gsettings set org.gnome.desktop.interface gtk-theme "Otis"
gsettings set org.gnome.desktop.wm.preferences theme "Otis"
```
Hoặc chỉnh qua tool Gnome Tweak.

## Icons
- [Adwaita-Blue](https://www.gnome-look.org/p/1310137)

Copy thư mục chứa icon vào `/usr/share/icons/`

Chỉnh qua tool Gnome Tweak.
###### [on top](#mục-lục)