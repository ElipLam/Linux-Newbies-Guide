# Hướng dẫn cài đặt cơ bản cho người mới dùng linux

## Mục lục
  - [Các lệnh cơ bản](#các-lệnh-cơ-bản)
    - [Kiểm tra các gói đã cài đặt](#kiểm-tra-các-gói-đã-cài-đặt)
    - [Kiểm tra Display Server](#kiểm-tra-display-server)
  - [Fix headphone microphone](#fix-headphone-microphone)
  - [Cài đặt zsh](#cài-đặt-zsh)
  - [Cài đặt oh-my-zsh](#cài-đặt-oh-my-zsh)
  - [Cài đặt zsh autosuggestions](#cài-đặt-zsh-autosuggestions)
  - [Theme Power10k cho zsh shell](#theme-power10k-cho-zsh-shell)
  - [Cài đặt bộ gõ tiếng Việt](#cài-đặt-bộ-gõ-tiếng-việt)
    - [Ubuntu](#ubuntu)
    - [Cài đặt từ mã nguồn](#cài-đặt-từ-mã-nguồn)
      - [Gỡ cài đặt:](#gỡ-cài-đặt)
  - [Cài đặt neofetch](#cài-đặt-neofetch)
  - [Cài đặt bashtop](#cài-đặt-bashtop)
  - [Terminal](#terminal)
    - [Terminator](#terminator)
    - [Terminology](#terminology)
  - [Cài đặt phím tắt](#cài-đặt-phím-tắt)
  - [Gnome extention](#gnome-extention)
  - [Themes](#themes)
  - [Icons](#icons)
  - [Cài đặt NVIDIA driver cho các RedHat distro](#cài-đặt-nvidia-driver-cho-các-redhat-distro)
    - [Kiểm tra GPUs và Drivers đã dùng](#kiểm-tra-gpus-và-drivers-đã-dùng)
    - [Cập nhật hệ thống](#cập-nhật-hệ-thống)
    - [Cài đặt EPEL](#cài-đặt-epel)
    - [Tùy chọn - Xóa EPEL](#tùy-chọn---xóa-epel)
    - [Cài đặt kho lưu trữ tổng hợp RPM Fusion](#cài-đặt-kho-lưu-trữ-tổng-hợp-rpm-fusion)
    - [Tùy chọn thêm](#tùy-chọn-thêm)
    - [Cài đặt NVIDIA Drivers](#cài-đặt-nvidia-drivers)
    - [Xác minh cài đặt NVIDIA Drivers](#xác-minh-cài-đặt-nvidia-drivers)
    - [Cập nhật Nvidia Drivers](#cập-nhật-nvidia-drivers)
    - [Cách xóa Nvidia Drivers và RollBack](#cách-xóa-nvidia-drivers-và-rollback)
          - [on top](#on-top)


## Các lệnh cơ bản

### Kiểm tra phiên bản của distro

Fedora:
```console
echo $(rpm -E %fedora)
```
```
# Output:
# 36
```

### Kiểm tra Display Server

Kiểm tra là Wayland hay Xorg: 

```console
echo $XDG_SESSION_TYPE
```

```
# Output:
# wayland
```

### Kiểm tra các gói đã cài đặt

Debian/Ubuntu:
```console
sudo apt list
# or
# sudo apt list | grep <package name>
```

Fedora/RHEL/AlmaLinux:
```console
sudo dnf list installed
# or
# sudo dnf list
# sudo dnf list installed | grep <package name>
```
## Fix headphone microphone
chạy cli: 

```console
hdajackretask
```

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

Câu lệnh: 
```console
wmctrl -k on
```

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

## Các ứng dụng thu âm

### Gnome Sound Recorder

```console
sudo dnf install -y gnome-sound-recorder
```
```console
gnome-sound-recorder
```

![gnome-sound-recorder](images/gnome-sound-recorder.png)


### Audio Recorder

[Audio Recorder](https://launchpad.net/audio-recorder) là một trình ghi âm tuyệt vời trên hệ điều hành Linux có tất cả các loại tùy chọn để hoạt động như một nguồn âm thanh. Ví dụ, bạn có thể sử dụng micrô, webcam và thậm chí cả Skype. Thời gian có thể được đặt cho bản ghi âm của bạn để bạn kiểm soát môi trường làm việc. Nó hỗ trợ các định dạng MP3, FLAC, OGG, WAV và SPX.


looi:
configure: error: Package requirements (gstreamer-1.0 >= 1.4) were not met

sua: cai gstreamer:
tham khao tai [day](https://gstreamer.freedesktop.org/documentation/installing/on-linux.html?gi-language=c)
```console
sudo dnf install -y gstreamer1-devel gstreamer1-plugins-base-tools gstreamer1-doc gstreamer1-plugins-base-devel gstreamer1-plugins-good gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-devel gstreamer1-plugins-bad-free-extras
```

loi: Package requirements (appindicator3-0.1 >= 0.3) were not met:

```
sudo dnf install -y libindicator-devel 
libindicator-gtk3-devel
z
```

```console 
sudo dnf makecache --refresh
# sudo dnf -y install gstreamer1
```

### Audacity

[Audacity](https://www.audacityteam.org/) là một phần mềm tự do, trình sửa nhạc số đa nền tảng và ứng dụng ghi âm. Nó có thể hoạt động trên Windows, Mac OS X, Linux và BSD. Audacity được tạo ra bởi Dominic Mazzoni khi anh đang là nghiên cứu sinh tại Đại học Carnegie Mellon, bang Pennsylvania, Hoa Kỳ.

![audacity](images/audacity.png)

### Ardour

[Ardor](https://ardour.org/) là một giải pháp mã nguồn mở tại chỗ giúp các doanh nghiệp tải lên, ghi và chỉnh sửa các đoạn âm thanh trên các thiết bị Linux, MacOS và Windows. Người chỉnh sửa có thể trích xuất nhạc phim từ video đã nhập, thêm khung trống và định tuyến các bản nhạc đa kênh đến các dải trộn riêng biệt.

![ardour](./images/ardour.png)

## Cài đặt NVIDIA driver cho các RedHat distro

### Kiểm tra GPUs và Drivers đã dùng
Bạn có thể [kiểm tra](https://rpmfusion.org/Howto/NVIDIA#Determining_your_card_model) liệu rằng máy vi tính của bạn đã cài GPU NVIDIA hay chưa với câu lệnh sau:

```console
lspci -k | grep -A 2 -E "(VGA|3D)"
# hoặc
lspci | egrep 'VGA|NVIDIA'
```

![VGA|3D](images/lspci.png)

Kiểm tra card nvidia:

```console
lsmod | grep nvidia
```

![empty_nvidia](images/empty_nvidia.png)

By default, Fedora 36 will use the open-source Nouveau drivers if you have an NVIDIA GPU installed on your computer, as you can see in the screenshot below.

Most modern Linux Desktop systems such as AlmaLinux come with an NVIDIA driver pre-installed in the Nouveau open-source graphics device driver for Nvidia video cards. For the most part, this is acceptable; however, if you are using your Linux system for graphical design or gaming, you may get better drivers.

Historically, the Nouveau proprietary drivers are slower than Nvidia’s, which lacks the latest graphics card hardware features, software technology, and support. In most situations, upgrading your Nvidia Drivers with proper NVIDIA drivers is more beneficial than not. In some cases, you may see some substantial improvements overall.

```console
lsmod | grep nouveau
```

![nouveau](/images/nouveau.png)

### Cập nhật hệ thống

First, update the DNF package repository cache with the following command:

```console
sudo dnf upgrade --refresh -y
```

If there are any updates to be installed, the DNF package manager should show you a summary of the upgrade, as shown in the screenshot below. Otherwise, it will tell you that your system is up to date.


The DNF package manager will download all the required updates from the internet. It may take a while to complete.

Updates are being installed. It may take a while to complete.

At this point, all the updates should be installed.

### Cài đặt EPEL
Nếu không phải Fedora thì cài thêm [EPEL](https://docs.fedoraproject.org/en-US/epel/) - 
Extra Packages for Enterprise Linux.

First, enable the CRB repository.

```console
sudo dnf config-manager --set-enabled crb
```

Next, install `EPEL` using the following `(dnf)` terminal command.

```console
dnf install epel-release epel-next-release
```

### Tùy chọn - Xóa EPEL 

Tìm EPEL package và tiến hành xoá gói EPEL nếu cài đặt thông qua **rpm**.

```console
rpm -qa | grep epel
# epel-release-6-8.noarch
```

Xoá gói package bằng command **rpm -e**.

```console
# rpm -e epel-release-6-8.noarch
```


### Cài đặt kho lưu trữ tổng hợp RPM Fusion
RPM Fusion is a repository of add-on packages for Fedora and EL+EPEL that a group of community volunteers maintains. RPM Fusion is not a standalone repository but an extension of Fedora’s default packages that could not be included due to Fedora being bound by the same legal restrictions as Red Hat.

Theo mặc định, giống như hầu hết các bản phân phối Linux, Fedora không đi kèm với các trình điều khiển độc quyền của NVIDIA. Phương pháp tốt nhất để cài đặt những thứ này trên Fedora 36 là sử dụng kho lưu trữ tổng hợp RPM.

Đầu tiên, mở thiết bị đầu cuối của bạn và thêm các kho lưu trữ sau

Thêm RPM Fusion Free repository:
```console
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```
Thêm RPM Fusion Non-Free repository:

```console
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Sau khi cài đặt, làm mới danh sách kho lưu trữ:

```console
sudo dnf makecache
```

### Tùy chọn thêm

RPM Fusion có một nhánh thử nghiệm chứa hầu hết các gói chuỗi trình điều khiển NVIDIA phát hành mới hoặc các gói beta. Điều này có thể hữu ích cho những người muốn cài đặt trình điều khiển NVIDIA hiện đại.

Tham khảo tại [đây](https://www.linuxcapable.com/how-to-install-nvidia-drivers-on-almalinux-9/#Optional_-_Enable_RPM_Fusion_TESTING_Branch)

### Cài đặt NVIDIA Drivers

Bây giờ bạn đã nhập kho lưu trữ RPM Fusion, hãy thực thi lệnh sau để cài đặt trình điều khiển Nvidia mới nhất trên hệ thống của bạn.


```console
sudo dnf install -y akmod-nvidia
```

Next, install the CUDA driver support. Ideally, you may not need this, but sometimes if issues persist, installing the CUDA support can solve problems.

Tiếp theo, cài đặt hỗ trợ trình điều khiển CUDA. Lý tưởng nhất là bạn có thể không cần điều này, nhưng đôi khi nếu sự cố vẫn tiếp diễn, việc cài đặt hỗ trợ CUDA có thể giải quyết vấn đề.

```console
sudo dnf install -y xorg-x11-drv-nvidia-cuda
```
Note the NVIDIA-SMI command is only useable with Cuda support.

Once everything has been installed, you must restart your system. By default, this will also disable Nouveau drivers automatically.

```console
reboot
```

### Xác minh cài đặt NVIDIA Drivers

Once you have returned, view the NVIDIA X Server Settings by using the following path.

`Activities > Show Applications > NVIDIA X Server`

Alternatively, if you opened a terminal, use the following command.


```console
nvidia-settings
```

Ví dụ nếu cài đặt thành công:

Them anh tai day

Once your computer boots, you should find the NVIDIA X Server Settings app in the Application Menu. Click on the NVIDIA X Server Settings app icon as marked in the screenshot below.

![nvidia_installed](images/nvidia_installed.png)

Users who installed **Cuda support** can run the following command in your terminal.

```console
nvidia-smi
```
Câu lệnh này cũng có thể kiểm tra phiên bản của Drivers.

Them anh tai day.

The proprietary NVIDIA drivers are used, as you can see in the screenshot below.

```console
lsmod | grep nvidia
```

The open-source Nouveau drivers are no longer used.

```console
lsmod | grep nouveau
```

### Cập nhật Nvidia Drivers

All future updates will be in the standard dnf refresh command procedure, and this will check the RPM Fusion repository for updates and the rest of your AlmaLinux packages.

```console
sudo dnf upgrade --refresh
```
### Cách xóa Nvidia Drivers và RollBack

If you do not want to continue to use the Nvidia official drivers, use the following command:

```console
sudo dnf -y autoremove akmod-nvidia xorg-x11-drv-nvidia-cuda
```

This will remove all dependencies installed, and once removed, you must reboot.

```console
reboot
```

During the reboot, the process will re-enable the Nouveau drivers. You will see a message stating Nvidia drivers not found re-enabling Nouveau drivers, making it easier to switch back and forth if needed.


Tham khảo:

https://www.linuxcapable.com/how-to-install-nvidia-drivers-on-almalinux-9/#Optional_-_Enable_RPM_Fusion_TESTING_Branch
https://vi.linuxcapable.com/how-to-install-nvidia-drivers-on-fedora-36-linux/
https://linuxhint.com/install-nvidia-drivers-on-fedora-35/
https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Fedora&target_version=35

###### [on top](#mục-lục)