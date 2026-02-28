<font size =6>**Hướng dẫn cài đặt cơ bản cho người mới dùng linux**</font>
<!-- Font sizr of heading 1 is 6 -->

## Mục lục
- [Các lệnh cơ bản](#các-lệnh-cơ-bản)
  - [Kiểm tra phiên bản của distro](#kiểm-tra-phiên-bản-của-distro)
  - [Kiểm tra Display Server](#kiểm-tra-display-server)
  - [Kiểm tra các gói đã cài đặt](#kiểm-tra-các-gói-đã-cài-đặt)
- [Thao tác với kho lưu trữ (repositories)](#thao-tác-với-kho-lưu-trữ-repositories)
  - [Thêm repositories](#thêm-repositories)
  - [Kích hoạt repositories](#kích-hoạt-repositories)
  - [Vô hiệu hóa repositories](#vô-hiệu-hóa-repositories)
  - [Xóa repositories](#xóa-repositories)
- [Thao tác với kernel](#thao-tác-với-kernel)
  - [Làm quen với kernel](#làm-quen-với-kernel)
  - [Cập nhật kernel](#cập-nhật-kernel)
  - [Chọn kernel làm mặc định](#chọn-kernel-làm-mặc-định)
  - [Xóa kernel](#xóa-kernel)
- [Cửa hàng ứng dụng gói Flathub và Snap Store](#cửa-hàng-ứng-dụng-gói-flathub-và-snap-store)
  - [Flatpak](#flatpak)
  - [Snap Store](#snap-store)
- [Sửa lỗi headphone microphone](#sửa-lỗi-headphone-microphone)
- [Sửa lỗi không bật được Bluetooth](#sửa-lỗi-không-bật-được-bluetooth)
  - [Sửa lỗi thủ công bằng bash script](#sửa-lỗi-thủ-công-bằng-bash-script)
- [Sửa lỗi Suspend không hoạt động](#sửa-lỗi-suspend-không-hoạt-động)
- [Cài đặt zsh](#cài-đặt-zsh)
- [Cài đặt oh-my-zsh](#cài-đặt-oh-my-zsh)
- [Cài đặt zsh autosuggestions](#cài-đặt-zsh-autosuggestions)
- [Theme Power10k cho zsh shell](#theme-power10k-cho-zsh-shell)
- [CopyQ - Quản lý bảng nhớ tạm](#copyq---quản-lý-bảng-nhớ-tạm)
- [Cài đặt bộ gõ tiếng Việt](#cài-đặt-bộ-gõ-tiếng-việt)
  - [Cài đặt cho Ubuntu](#cài-đặt-cho-ubuntu)
  - [Cài đặt từ mã nguồn](#cài-đặt-từ-mã-nguồn)
  - [Cài đặt từ OpenBuildService (khuyên dùng)](#cài-đặt-từ-openbuildservice-khuyên-dùng)
  - [Hướng dẫn sử dụng](#hướng-dẫn-sử-dụng)
- [Cài đặt neofetch (ngừng phát triển)](#cài-đặt-neofetch-ngừng-phát-triển)
- [Cài đặt fastfetch](#cài-đặt-fastfetch)
- [Cài đặt bashtop](#cài-đặt-bashtop)
- [Terminal](#terminal)
  - [Terminator](#terminator)
  - [Terminology](#terminology)
- [Cài đặt phím tắt](#cài-đặt-phím-tắt)
  - [Phím tắt mở Terminal mới](#phím-tắt-mở-terminal-mới)
  - [Phím tắt đến Desktop](#phím-tắt-đến-desktop)
- [Gnome extentions](#gnome-extentions)
- [GNOME Tweaks](#gnome-tweaks)
- [Themes](#themes)
- [Icons](#icons)
- [Fonts](#fonts)
- [Các ứng dụng thu âm](#các-ứng-dụng-thu-âm)
  - [Gnome Sound Recorder](#gnome-sound-recorder)
  - [Audio Recorder](#audio-recorder)
  - [Audacity](#audacity)
  - [Ardour](#ardour)
- [Cài đặt NVIDIA Drivers cho các RedHat distro](#cài-đặt-nvidia-drivers-cho-các-redhat-distro)
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
- [Chuyển đổi cạc đồ họa NVIDIA và Intel/AMD](#chuyển-đổi-cạc-đồ-họa-nvidia-và-intelamd)
  - [Cài đặt Envy Control](#cài-đặt-envy-control)
  - [Chuyển đổi cạc đồ hoa thông qua System Menu](#chuyển-đổi-cạc-đồ-hoa-thông-qua-system-menu)
- [Cài đặt ICC profile cho Linux](#cài-đặt-icc-profile-cho-linux)
- [Tham khảo](#tham-khảo)
        - [on top](#on-top)

## Các lệnh cơ bản

### Kiểm tra phiên bản của distro

Linux:
```sh
cat /etc/os-release
```

<p align="center">
  <img src="images/os-release.png">
</p>

Fedora:
```sh
echo $(rpm -E %fedora)
```

```
# Output:
# 36
```

### Kiểm tra Display Server

Kiểm tra là [Wayland](https://quantrimang.com/cong-nghe/chu-y-khi-su-dung-linux-voi-wayland-168753) hay Xorg: 

```sh
echo $XDG_SESSION_TYPE
```

```
# Output:
# wayland
```

Để biết thêm sự khác biệt giữa Wayland và Xorg thì hãy xem tại [đây](https://www.secjuice.com/wayland-vs-xorg/).

### Kiểm tra các gói đã cài đặt

Debian/Ubuntu:

```sh
sudo apt list
# or
# sudo apt list | grep <package name>
```

Fedora/RHEL/AlmaLinux:

```sh
sudo dnf list installed
# or
# sudo dnf list
# sudo dnf list installed | grep <package name>
```

## Thao tác với kho lưu trữ (repositories)

Danh sách các repo đang được bật:

```sh
dnf repolist
```

Tất cả danh sách các repo:

```sh
dnf repolist --all
```

### Thêm repositories

Dành cho Fedora 40 hoặc cũ hơn (DNF 4):

- Để thêm kho lưu trữ mới, hãy thực hiện như sau **root**.

  1. Xác định một kho lưu trữ mới bằng cách thêm một tệp mới có hậu tố `.repo` vào thư mục `/etc/yum.repos.d/`. Để biết chi tiết về các tùy chọn khác nhau để sử dụng trong file `.repo`.

  2. Thêm kho lưu trữ bằng --add-repo, trong đó kho lưu trữ là đường dẫn tệp:

      ```sh
      dnf config-manager --add-repo <repository>
      ```

     Ví dụ:

      ```sh
      dnf config-manager --add-repo /tmp/fedora_extras.repo
      ```

Dành cho Fedora 41 trở lên (DNF 5):

- Để thêm kho lưu trữ mới, hãy thực hiện như sau **root**.

  1. Xác định một kho lưu trữ mới bằng cách thêm một tệp mới có hậu tố `.repo` vào thư mục `/etc/yum.repos.d/`. Để biết chi tiết về các tùy chọn khác nhau để sử dụng trong file `.repo`.

  2. Thêm kho lưu trữ bằng --add-repo, trong đó kho lưu trữ là đường dẫn tệp:

      ```sh
      dnf config-manager addrepo --from-repofile=<repository>
      ```

     Ví dụ:

      ```sh
      dnf config-manager addrepo --from-repofile=/tmp/fedora_extras.repo
      ```

### Kích hoạt repositories

Phần này hướng dẫn cách kích hoạt kho phần mềm cụ thể bằng cách sử dụng lệnh `dnf config-manager`.

- Để kích hoạt một kho lưu trữ cụ thể, hãy chạy lệnh sau dưới dạng **root**.

  ```sh
  sudo dnf config-manager setopt <repository>.enabled=1
  ```

  Khi repository có ID repository duy nhất, ví dụ:

  ```sh
  sudo dnf config-manager setopt fedora-extras.enabled=1
  ```
  
### Vô hiệu hóa repositories

Phần này hướng dẫn cách vô hiệu hóa kho phần mềm cụ thể bằng cách sử dụng lệnh `dnf config-manager`.

- Để kích hoạt một kho lưu trữ cụ thể, hãy chạy lệnh sau dưới dạng **root**.

  ```sh
  sudo dnf config-manager setopt <repository>.enabled=0
  ```

  Khi repository có ID repository duy nhất, ví dụ:

  ```sh
  sudo dnf config-manager setopt fedora-extras.enabled=0
  ```

### Xóa repositories

Phần này hướng dẫn cách xóa kho lưu trữ Yum (hoặc file `.repo`).

*NOTE: Nếu bạn biết ID của một kho lưu trữ, nhưng không chắc `.repo` nó thuộc về kho lưu trữ nào, bạn có thể chạy lệnh sau `grep -E "^\[.*]" /etc/yum.repos.d/*`. Lệnh này sẽ in ra danh sách ID kho lưu trữ được liên kết với từng kho lưu trữ Yum.

- Để xóa kho lưu trữ Yum, hãy chạy lệnh sau dưới dạng root.

  ```sh
  rm /etc/yum.repos.d/<file_name>.repo
  ```

  Trong đó `file_name` là tên của file `.repo`.

Tham khảo:
https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/

## Thao tác với kernel

### Làm quen với kernel

Xem kernel hiện tại: 
```sh
uname -r
```

<p align="center">
  <img src="images/uname_r.png">
</p>

Xem thời gian cài đặt kernel hiện tại:

```sh
uname -v
```

<p align="center">
  <img src="images/installed_kernel_time.png">
</p>

Xem danh sách các kernel:

```sh
dnf list kernel
```

<p align="center">
  <img src="images/dnf_list_kernel.png">
</p>

Xem toàn bộ thông tin về kernel: 

```sh
dnf info kernel
# dnf list kernel
```

<p align="center">
  <img src="images/kernel_info.png">
</p>

Phiên bản kernel có cấu trúc:

```
<major_version>-<minor_version>-<release>.<architecture>
hoặc 
<major_version>-<release>.<architecture>
Ví dụ: 5.17.5-300.fc36.x86_64
```

Tại dòng **Available Packages** ta có thể xem các kernel phiên bản mới chưa được cài đặt.

Hoặc cũng có thể nhìn vào màu sắc của terminal để xác định. Nhìn màu sắc của `kernel` ta có thể thấy được kernel phiên bản 5.19.4 là phiên bản mới chưa được cài đặt vào máy.

### Cập nhật kernel

*** Cảnh báo: Sử dụng DNF để cài đặt các kernel bất cứ khi nào có thể.
Khi có thể, hãy sử dụng trình quản lý gói ***DNF*** hoặc ***PackageKit*** để cài đặt kernel mới bởi vì nó luôn ***cài đặt*** một kernel mới thay vì thay thế phiên bản hiện tại, điều này có thể tránh việc hệ thống của bạn không thể khởi động.

*** Hãy giữ lại kernel phiên bản cũ khi thực hiện nâng cấp kernel.
Chúng tôi đặc biệt đề xuất điều này trong trường hợp có nhiều lỗi với kernel mới.

Để cập nhật kernel mới nhất, hãy chạy câu lệnh DNF dưới đây, nó tự động cài đặt phiên bản kernel mới phù hợp nhất với hệ thống của bạn.

```sh
sudo dnf install kernel --best
```

Nếu muốn cài đặt một kernel cụ thể thì dùng lệnh sau:

```
# sudo dnf install kernel-<major_version>-<minor_version>-<release>.<architecture>
# hoặc
# sudo dnf install kernel-<major_version>-<release>.<architecture>

# Ví dụ: 
sudo dnf install kernel-5.19.4-200.fc36.x86_64
```

Để các thay đổi có hiệu lực, khởi động lại hệ thống. Nếu không, hệ thống của bạn vẫn sẽ chạy trên kernel cũ.

```sh
reboot
```

### Chọn kernel làm mặc định

Nếu có nhiều phiên bản của kernel được cài đặt thì sẽ có một kernel được chọn làm kernel mặc định khi khởi động máy tính. Ta cũng có thể chọn một phiên bản khác để làm kernel mặc định.

Câu lệnh **grubby** là một công cụ được sử dụng để cấu hình bootloader. Tuy nhiên, câu lệnh grubby cũng có thể được sử dụng để hiển thị thông tin của phiên bản kernel.

Chạy câu lệnh grubby dưới đây để in ra vị trí lưu và phiên bản của kernel mặc định khi boot.

```sh
sudo grubby --default-kernel
```
<p align="center">
  <img src="images/defaut_kernel.png">
</p>

Tiếp theo, câu lệnh bên dưới sẽ liệt kê tất cả các kernel đã cài đặt, nó cũng in ra tất cả các thành phần của GRUB của tất các các kernel đó.

```sh
sudo grubby --info=ALL
```

<p align="center">
  <img src="images/kernel_info_all.png">
</p>

Để cài đặt phiên bản kernel như kernel mặc định, ta lấy vị trí của kernel các bước trước và áp dụng vào câu lệnh bên dưới. Ví dụ, tôi chuyển /boot/vmlinuz-5.17.5-300.fc36.x86_64 thành phiên bản kernel mặc định thay vì boot/vmlinuz-5.18.19-200.fc36.x86_64.

```sh
sudo grubby --set-default <kernel>
# sudo grubby --set-default /boot/vmlinuz-5.17.5-300.fc36.x86_64
```

<p align="center">
  <img src="images/set_default_kernel.png">
</p>

Khởi động lại hệ thống để các thay đổi được áp dụng.

```sh
reboot
```

Việc cập nhật kernel không còn là một tác vụ khó khăn nữa. 

### Xóa kernel

Để xóa toàn bộ kernel, hãy dùng câu lệnh bên dưới:

```
sudo dnf remove $(rpm -qa | grep ^kernel | grep <kernel-version>)
```

```sh
# xóa phiên bản kernel 5.18.xxx
# sudo dnf remove $(rpm -qa | grep ^kernel | grep 5.18)
```

Sau đó khởi động lại để áp dụng thay đổi và kiểm tra xem menu boot đã xóa phiên bản kernel đó hay chưa.

```sh
reboot
```

Nếu chưa, hãy thử rebuilding grub menu:

```sh
sudo mkconfig-grub2 -o /boot/efi/EFI/fedora/grub.cfg
```

(Câu lệnh trên giả định rằng bạn đang chạy trên hệ thống UEFI).

## Cửa hàng ứng dụng gói Flathub và Snap Store

Flathub và Snap Store là hai trang web phát triển xung quanh hai định dạng gói phổ quát riêng biệt dành cho Linux: Flakpak và snap.

Ý tưởng đằng sau cả hai định dạng gói này là chúng cung cấp cách phân phối ứng dụng trên Linux, hoạt động bất kể bạn sử dụng bản phân phối nào. Các định dạng này cũng cung cấp những cải tiến bảo mật. Cả hai đều có thể cách ly các ứng dụng với nhau, để một phần mềm không thể truy cập vào các hình ảnh hoặc mật khẩu mà bạn đã mở ở nơi khác trên desktop.

`Flatpak` được tích hợp rất nhiều vào môi trường desktop GNOME, nhưng nó vẫn hoạt động với những môi trường khác. Nhiều bản phân phối Linux đã coi Flatpak là định dạng gói phổ biến ưa thích. Flatpak là một dự án cộng đồng, mặc dù các công ty tư nhân Red Hat và Endless đã tài trợ phần lớn cho sự phát triển của công cụ này.

`Snap` là một định dạng file đến từ Canonical, công ty tạo ra phân phối Linux Ubuntu. Không giống như Flatpak, snap ban đầu được dành cho các máy chủ. Mặc dù snap hoạt động trên rất nhiều bản phân phối Linux khác nhau, nhưng chúng lại cực kỳ phù hợp với Ubuntu. Tất nhiên, với số lượng người sử dụng Ubuntu lớn hơn rất nhiều so với các bản phân phối khác, Snap Store không hề thiếu các ứng dụng.

Xem chi tiết tại [đây](https://quantrimang.com/cong-nghe/so-sanh-flathub-va-snap-store-166089#:~:text=Snap%20l%C3%A0%20m%E1%BB%99t%20%C4%91%E1%BB%8Bnh%20d%E1%BA%A1ng,k%E1%BB%B3%20ph%C3%B9%20h%E1%BB%A3p%20v%E1%BB%9Bi%20Ubuntu).

### Flatpak

Cài đặt flatpak cho Ubuntu:

```sh
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak
```

*NOTE: flatpak đã cài đặt sẵn trên Fedora.

Đôi khi flathub bị tắt đi vì lý do gì đó: 

```
error: Unable to load summary from remote flathub: Can't fetch summary from disabled remote ‘flathub’
```

Kiểm tra xem các nguồn bị tắt:

```console
$ flatpak remotes --show-disabled
Name           Options
fedora         system,oci
fedora-testing system,disabled,oci
flathub        system
flathub-1      system
pcsx2-origin   system,disabled,no-enumerate,no-gpg-verify
```

Bật flathub lên: 

```sh
flatpak remote-modify --enable flathub
```

Tự động thêm Flathub repository nếu chưa có:

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

*NOTE: Hãy đăng xuất và đăng nhập lại hoặc khởi động lại hệ thống để đảm bảo flatpak chính xác.

Danh sách các ứng dụng đã cài đặt:

```sh
flatpak list
```

Tìm kiếm 1 ứng dụng trong flatpak:

```sh
flatpak search <aapplication name>
# flatpak search Stremio
```

Cài đặt 1 ứng dụng trong flatpak:

```sh
flatpak install <full application id>
# flatpak install flathub com.stremio.Stremio

# or

flatpak install <aapplication name>
# flatpak install Stremio
```

Chạy 1 ứng dụng trong flatpak:

```sh
flatpak run <application id>
```

Xóa 1 ứng dụng trong flatpak:

```sh
flatpak uninstall <application id>
```

Xóa các runtimes/dependencies không sử dụng trong flatpak:

```sh
flatpak uninstall --unused
```

Còn nếu bạn muốn xem tất cả các ứng dụng có sẵn, bạn có thể duyệt Flatpak qua trang web chính thức của Flathub: https://flathub.org.


### Snap Store

Cài đặt snap cho Fedora:

```sh
sudo dnf install snapd -y
```

*NOTE: Hãy đăng xuất và đăng nhập lại hoặc khởi động lại hệ thống để đảm bảo đường dẫn của snap được cập nhật chính xác.

Để bật hỗ trợ `classic` snap, nhập lệnh sau để tạo liên kết tượng trưng giữa `/var/lib/snapd/snap` và `/snap`:

```sh
sudo ln -s /var/lib/snapd/snap /snap
```

Danh sách các ứng dụng đã cài đặt:

```sh
snap list
```

Cài đặt 1 ứng dụng trong snap store:

```sh
sudo snap install <app name>
```

Xóa 1 ứng dụng trong snap:

```sh
sudo snap remove <app name>
```

Còn nếu bạn muốn xem tất cả các ứng dụng có sẵn, bạn có thể duyệt Snap Store qua trang web chính thức của Snap: https://snapcraft.io/store.

## Sửa lỗi headphone microphone

Khi cắm tai nghe có microphone vào máy, linux có thể không nhận dạng được microphone. Để sữa lỗi này ta làm theo các bước bên dưới.

Chạy câu lệnh: 

```sh
hdajackretask
```

Chọn như hình: 

<p align="center">
  <img src="./images/HDAJackRetask.png">
</p>

Chọn `Apply Now`, nhập password.

Nếu lỗi thì chọn `Install boot override` sau đó khởi động lại máy. 

Tiếp theo chạy lệnh cli `alsamixer`.

Chọn như hình: 

<p align="center">
  <img src="./images/alsamixer_1.png">
</p>

Chỉnh như hình: 

<p align="center">
  <img src="./images/alsamixer_2.png">
</p>

Nhấn nút **M** hoặc **,** hoặc **.** để chuyển từ `MM -> 00`

Nhấn `Esc` để thoát.

Nếu cách này không thành công thì ta tiếp tục thử chạy câu lệnh bên dưới:   
> the issue is most likely in wireplumber not pipewire itself. People have been switching that for pipewire-media-server instead in the short term:

``` sh 
dnf swap wireplumber pipewire-media-session
```

Xong!

Tham khảo: 
https://www.reddit.com/r/Fedora/comments/qzaofq/headset_mic_not_working/

https://www.youtube.com/watch?v=yx33W-c4Cmg 

https://teddit.net/r/Fedora/comments/qmtl59/no_sound_audio_after_upgrade_to_fedora_35/

## Sửa lỗi không bật được Bluetooth

*NOTE: hướng dẫn sửa lỗi này được thực hiện ở Fedora distro:
  - version 41
  - Destop Environment: Gnome 47
  - kernel 6.12.12-200.fc41.x86_64
  - Bluetooth card: Foxconn / Hon Hai Wireless_Device
  - Wifi card: etwork controller: MEDIATEK Corp. Device 7925

Bạn kiểm tra thấy bluetooth hoạt động nhưng không bật được bluetooth. Lỗi này do Gnome không tương thích, nếu sử dụng `KDE Plasma 6.2.5` thì không có trường hợp này.


```sh
systemctl status bluetooth
```

<p align="center">
  <img src="./images/systemctl_status_bluetooth.png">
</p>


Chạy lệnh `rfkill` nhưng không thấy device `hci0`.

```sh
rfkill
```

<p align="center">
  <img src="./images/rfkill_bt_notfound.png">
</p>

Chạy lệnh `inxi -E` nhưng bluetooth không có driver.

```sh
inxi -E
```

<p align="center">
  <img src="./images/inxi_E_notfound.png">
</p>

Không thấy module `btusb` được cài đặt.

```sh
lsmod | grep btusb
```

<p align="center">
  <img src="./images/lsmod_btusb_notfound.png">
</p>

Chúng ta có thể sửa lỗi bằng cách cài đặt lại module bluetooth `btusb` cho thiết bị.

```sh
sudo rmmod btusb
sudo modprobe btusb
```

Sau khi cài đặt, có thể kiểm tra lại bằng 1 trong các câu lệnh dưới đây:

```sh
rfkill
```

<p align="center">
  <img src="./images/rfkill.png">
</p>

```sh
inxi -NE
```

<p align="center">
  <img src="./images/inxi_NE.png">
</p>

```sh
lsmod | grep btusb
```

<p align="center">
  <img src="./images/lsmod_btusb.png">
</p>

### Sửa lỗi thủ công bằng bash script

Tạo script bluetooth-reload.sh:

```sh
sudo nano ./bluetooth-reload.sh
```

Có nội dung:

```sh
#!/bin/bash

sudo rmmod btusb
sudo modprobe btusb
sudo systemctl restart bluetooth
```

Cấp quyền thực thi cho file:

```sh
sudo chmod +x bluetooth-reload.sh
```

Mở terminal và chạy script thủ công sau mỗi lần đăng nhập:

```sh
./bluetooth-reload.sh
```

## Sửa lỗi Suspend không hoạt động

Một vài thiết bị hoặc kernel đang dùng không hỗ trợ tính năng Suspend. Khi ta sử dụng tính năng này bằng cách chạy lệnh `systemctl suspend` hoặc gập laptop, máy tính sẽ không thể gọi dậy được, ta phải **reset cứng** lại thiết bị. Điều này làm cho công việc không được lưu lại, bị mất dữ liệu. Để giải quyết vấn đề này ta có thể tắt tính năng suspend đi.

Tắt suspend:

```sh
sudo systemctl mask suspend.target
```

Bật lại suspend:

```sh
sudo systemctl unmask suspend.target
```

## Cài đặt zsh

> Zsh is a shell designed for interactive use, although it is also a powerful scripting language. Many of the useful features of bash, ksh, and tcsh were incorporated into zsh; many original features were added.

Debian/Ubuntu: 

```sh
sudo apt-get install zsh -y
```

Fedora/RHEL/Almalinux: 

```sh
sudo dnf install zsh -y
```

Kiểm tra xem đã cài đặt thành công chưa:

```
$ which zsh

/usr/bin/zsh
```

~~Mở file *.bashrc*, thêm `exec zsh` vào đầu file.~~

Thay đổi shell mặc định của người dùng thành `zsh`.

Mở terminal, chạy đoạn lệnh bên dưới:

```sh
zsh
chsh -s $(which zsh)
```
*** Để cài đặt tự động Zsh, Oh My Zsh và Powerlevel10k bạn có thể chạy scipt này:

```sh
chmod +x ./install_OhMyZsh.sh
./install_OhMyZsh.sh
```

Sau đó **Logout** rồi đăng nhập lại.

## Cài đặt oh-my-zsh

Oh-my-zsh hiểu đơn giản là một framework giúp bạn quản lý các thiết lập của zsh một cách dễ dàng. oh-my-zsh hiện đang cung cấp hơn 200 plugins và hơn 140 themes được phát triển từ cộng đồng.

```sh
sudo curl -L http://install.ohmyz.sh | sh
```

## Cài đặt zsh autosuggestions

Cài đặt plugin **zsh-autosuggestions**, giúp tự động **suggetions** các lệnh mà mình đã dùng:

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

Mở file **.zshrc**:

```sh
nano ~/.zshrc
```

Sửa dòng `plugins=(git)` thành `plugins=(git zsh-autosuggestions)`. Lưu lại file.

*** Nếu autosuggestions plugin không hoạt động thì hãy thử đăng xuất và được nhập lại, nếu như không được thì thêm câu lệnh này vào cuối file `.zshrc`

```sh
# ...
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
```

Tham khảo: https://viblo.asia/p/cach-cai-dat-zsh-va-zsh-autosuggestions-tren-ubuntu-LzD5ddDO5jY

## Theme Power10k cho zsh shell

Powerlevel10k là theme cho Zsh. Nó nhấn mạnh vào [tốc độ](https://github.com/romkatv/powerlevel10k#uncompromising-performance), [tính linh hoạt](https://github.com/romkatv/powerlevel10k#extremely-customizable) và [trải nghiệm vượt trội](https://github.com/romkatv/powerlevel10k#configuration-wizard).

Cài font [MesloLGS NF](https://github.com/romkatv/powerlevel10k#fonts).

Cài đặt vào oh-my-zsh:

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Mở file **~/.zshrc**, sửa dòng `ZSH_THEME="robbyrussell"` thành `ZSH_THEME="powerlevel10k/powerlevel10k"`.

Lưu file, mở terminal để cài đặt themes. File cấu hình được lưu ở `~/.p10k.zsh`.

Nếu muốn thay đổi tùy chọn của theme thì gõ lệnh `p10k configure`.

Chỉnh lại font của terminal là `MesloLGS NF`.

Xong rồi. Tận hưởng thôi! 

Dưới đây là [giao diện của mình](.p10k.zsh) đã tùy chỉnh.

<p align="center">
  <img src="./images/gnome-terminal.png">
</p>

Tham khảo: https://github.com/romkatv/powerlevel10k#configuration

## CopyQ - Quản lý bảng nhớ tạm

CopyQ là trình quản lý bảng nhớ tạm – một ứng dụng cho "desktop" để lưu trữ nội dung của hệ thống bất cứ khi nào nó thay đổi và cho phép tìm kiếm lịch sử và sao chép lại vào bảng nhớ tạm của hệ thống hoặc dán trực tiếp vào các ứng dụng khác. Nó có thể hoạt động trên cả Linux, Windows và MacOS

Fedora:

  ```sh
  sudo dnf install -y copyq
  ```
Ubuntu:
  ```sh
  sudo apt install software-properties-common python-software-properties
  sudo add-apt-repository ppa:hluk/copyq
  sudo apt update
  sudo apt install copyq
  # this package contains all plugins and documentation
  ```
*NOTE: `CopyQ` hiện tại không hoạt động tốt trên **Wayland**, bạn có thể sử dụng [Clipboard Indicator](#gnome-extentions) để thay thế.

<p align="center">
  <img src="./images/CopyQ.png">
</p>

## Cài đặt bộ gõ tiếng Việt

### Cài đặt cho Ubuntu

```sh
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

```sh
# Debian/Ubuntu:
sudo apt-get install make golang libx11-dev libxtst-dev libgtk-3-dev

# Fedora, CentOS,...
sudo yum install make go libX11-devel libXtst-devel gtk3-devel

# openSUSE Tumbleweed
sudo zypper install make go libX11-devel libXtst-devel gtk3-devel
```

Tải bamboo repository xuống: 
```sh
wget https://github.com/BambooEngine/ibus-bamboo/archive/master.zip -O ibus-bamboo.zip
unzip ibus-bamboo.zip

# hoặc clone từ github:
git clone https://github.com/BambooEngine/ibus-bamboo.git
```

Build và cài đặt: 

```sh
cd ibus-bamboo
sudo make install

# Restart ibus
ibus restart
```

Gỡ cài đặt

```sh
sudo make uninstall
ibus restart
```

### Cài đặt từ OpenBuildService (khuyên dùng)

[![OpenBuildService](./images/obs.png)](https://software.opensuse.org//download.html?project=home%3Alamlng&package=ibus-bamboo)

### Hướng dẫn sử dụng

Sau khi cài đặt xong thì restart lại ibus

```sh
ibus restart
```

Đặt ibus-bamboo làm bộ gõ mặc định cho `Ubuntu` và `Fedora`:
- Với command:

  ```sh
  env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"
  ```

- Với Gnome:
  
  Vào `Settings` -> `Keyboard` -> `Input Source` -> `Add Input Source`. 
  
  Kéo xuống cuối, chọn `More`, gõ và chọn `Vietnamese`. 

  <p align="center">
  <img src="./images/add-keyboard-layout.png">
</p>

  Chọn 1 layout muốn sử dụng rồi nhấn `Add`.

  <p align="center">
  <img src="./images/add-keyboard-layout_1.png">
  </p>
  
Mặc định ,để chuyển đổi ngôn ngữ tiếng Anh và tiếng Việt cho nhau, sử dụng tổ hợp phím `Super` + `Space`.

Ảnh minh họa cho cài đặt phím tắt.
<p align="center">
<img src="./images/add-keyboard-layout-shortcut.png">
</p>

Nguồn: https://github.com/BambooEngine/ibus-bamboo/blob/master/README.md 

## Cài đặt neofetch (ngừng phát triển)

Neofetch được mô tả là "công cụ kiểm tra thông tin hệ thống dưới dạng dòng lệnh, được viết bằng bash 3.2+" và dễ sử dụng hơn trên các bản phân phối Linux, nhưng cũng có thể được sử dụng trên macOS và Windows sau khi cài đặt một số thành phần bổ sung.

Debian/Ubuntu:

```sh
sudo apt update
sudo apt install neofetch
```

Fedora/RHEL:

```sh
sudo dnf makecache --refresh
#sudo yum install epel-release
sudo dnf -y install neofetch
```

<p align="center">
  <img src="./images/neofetch.png">
</p>

## Cài đặt fastfetch

[Fastfetch](https://github.com/fastfetch-cli/fastfetch) là một công cụ giống như neofetch để lấy thông tin hệ thống và hiển thị thông tin đó một cách đẹp mắt. Nó được viết chủ yếu bằng C, chú trọng đến hiệu suất và khả năng tùy chỉnh. Hiện tại, Linux, Android, FreeBSD, macOS, SunOS và Windows 7+ được hỗ trợ.

Một số distro đóng gói phiên bản fastfetch lỗi thời. Các phiên bản cũ hơn không được hỗ trợ, vì vậy hãy luôn cố gắng sử dụng phiên bản mới nhất.

* Ubuntu: [`ppa:zhangsongcui3371/fastfetch`](https://launchpad.net/~zhangsongcui3371/+archive/ubuntu/fastfetch) (for Ubuntu 22.04 or newer)
* Debian: `apt install fastfetch` (for Debian 13 or newer)
* Debian / Ubuntu: Download `fastfetch-linux-<proper architecture>.deb` from [Github release page](https://github.com/fastfetch-cli/fastfetch/releases/latest) and double-click it (for Ubuntu 20.04 or newer and Debian 11 or newer).
* Arch Linux: `pacman -S fastfetch`
* Fedora: `dnf install fastfetch -y`
* Gentoo: `emerge --ask app-misc/fastfetch`
* Alpine: `apk add --upgrade fastfetch`
* NixOS: `nix-shell -p fastfetch`
* openSUSE: `zypper install fastfetch`
* ALT Linux: `apt-get install fastfetch`
* Exherbo: `cave resolve --execute app-misc/fastfetch`
* Solus: `eopkg install fastfetch`
* Slackware: `sbopkg -i fastfetch`
* Void Linux: `xbps-install fastfetch`
* Venom Linux: `scratch install fastfetch`

Bạn có thể cần dùng `sudo`, `doas` or `sup` để chạy những câu lệnh này.

Nếu fastfetch không được đóng gói cho bản phân phối của bạn hoặc phiên bản được đóng gói đã cũ, [linuxbrew](https://brew.sh/) là một giải pháp thay thế tốt: `brew install fastfetch`

<p align="center">
  <img src="./images/fastfetch.png">
</p>

## Cài đặt bashtop

Các công cụ giám sát rất quan trọng và mọi quản trị viên hệ thống đều biết điều đó. Với sự trợ giúp của các ứng dụng giám sát tài nguyên, chúng ta có thể liên tục quan sát tình trạng tài nguyên của hệ thống khi một tác vụ đang chạy.

Tác giả của bộ đôi công cụ giám sát này đã phát triển Bashtop trước và sau đó tạo ra cổng Python của Bashtop và đặt tên là Bpytop. Chúng không có nhiều sự khác biệt. Cả hai tiện ích đều phục vụ cùng một mục đích và có cùng một bộ tính năng. Sự khác biệt duy nhất là cả hai đều được viết bằng các ngôn ngữ lập trình khác nhau. Bashtop được viết bằng Bash và Bpytop được viết bằng Python. Bashtop và Bpytop hỗ trợ GNU / Linux, Mac OS và FreeBSD.

Nhà phát triển tuyên bố `Bpytop` `nhanh hơn` `Bashtop` và Bpytop có nhiều tính năng hơn và đề xuất chúng tôi sử dụng Bpytop thay vì Bashtop. Tuy nhiên đó là sự lựa chọn cá nhân của bạn. Bạn có thể thử cả hai và chọn loại phù hợp với mình.

Bài này sẽ hướng dẫn cài đặt bashtop nhé.

```sh
git clone https://github.com/aristocratos/bashtop.git
cd bashtop
sudo make install 
```

Sau khi cài đặt xong thì gọi câu lệnh bên dưới để chạy:

```sh
bashtop
```

<p align="center">
  <img src="./images/bashtop.png">
</p>

Tham khảo: https://github.com/aristocratos/bashtop#manual-installation-linux-osx-and-freebsd

## Terminal

### Terminator

Terminator là một trình giả lập thiết bị đầu cuối dành cho các hệ thống giống như Linux và Unix, cho phép người dùng tạo nhiều thiết bị đầu cuối trong một cửa sổ duy nhất và sắp xếp chúng thành lưới. Mỗi cửa sổ đầu cuối có thể được thay đổi kích thước tùy theo nhu cầu. Terminator dựa trên Gnome và được viết bằng ngôn ngữ Python.

**Debian/Ubuntu**

```sh
sudo apt-get install terminator
 ```

Nếu cài đặt không thành công, bạn có thể cần thêm kho lưu trữ PPA và phiên bản Ubuntu mới hơn mà bạn không phải chạy lệnh **update**.
```sh
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update
sudo apt-get install terminator
```

**Fedora/RHEL**

```sh
sudo dnf makecache --refresh
sudo dnf install terminator
```

<p align="center">
  <img src="./images/terminator.png">
</p>

Tắt **Show titlebar**: Chuột phải vào màn hình terminator -> Preferences -> Profiles -> General -> bỏ chọn Show titlebar.

<p align="center">
  <img src="images/uncheck_show_titlebar.png">
</p>

Để **gỡ cài đặt** terminator, dùng câu lệnh:

```sh
sudo dnf remove terminator; sudo dnf autoremove terminator;sudo dnf clean packages;
```

Tập tin cấu hình của terminator nằm ở địa chỉ: `/home/<your-user-name>/.config/terminator/config`. Để xóa sạch hoàn toàn terminator, ta sẽ xóa luôn thư mục này. 

```sh
rm -rfvI /home/your_user_name/.config/terminator
```

### Terminology

Là terminal có thể xem ảnh và video ngay bên  trong.

Fedora/RHEL:
```sh
sudo dnf makecache --refresh
sudo dnf -y install terminology
```

<p align="center">
  <img src="./images/terminology.png">
</p>

## Cài đặt phím tắt

Vào Settings -> Keyboard -> Keyboard Shortcuts -> View and Customize Shortcuts -> Custome Shortcut.

### Phím tắt mở Terminal mới

<p align="center">
  <img src="./images/TerminalShortcut.png">
</p>

### Phím tắt đến Desktop

<p align="center">
  <img src="./images/DesktopShortcut.png">
</p>

Cài thư viện `wmctrl`: 

Fedora/RHEL:

```sh
sudo dnf -y install wmctrl
```

Debian/Ubuntu:

```sh
sudo apt-get update
sudo apt-get install wmctrl
```

Câu lệnh: 

```sh
wmctrl -k on
```

Tham khảo: 

https://www.redhat.com/sysadmin/linux-terminal-window
https://askubuntu.com/questions/97219/how-to-show-desktop-from-command-line 

## Gnome extentions

https://extensions.gnome.org/

Extention thường dùng:

- [User Themes](https://extensions.gnome.org/extension/19/user-themes/) - làm mờ topbar.
- [Dash2Dock Lite](https://extensions.gnome.org/extension/4994/dash2dock-lite/) - chuyển Dash thành Dock và có thêm hiệu ứng chuyển động.
- [Resource Monitor](https://extensions.gnome.org/extension/1634/resource-monitor/) - hiển thị thông tin phần cứng trên topbar.
- [Remove App Menu](https://extensions.gnome.org/extension/3906/remove-app-menu/)
- [GPU profile selector](https://extensions.gnome.org/extension/5009/gpu-profile-selector/) - chuyển đổi giữa các GPU thông qua System Menu ở góc phải của topbar. Cần phải cài đặt [Envy Control](#cài-đặt-envy-control) trước.
- [Show Desktop Button](https://extensions.gnome.org/extension/1194/show-desktop-button/)
- [Unblank lock screen](https://extensions.gnome.org/extension/1414/unblank/) - Luôn hiện màn hình khóa.
- [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/) - Quản lý bảng nhớ tạm.

## GNOME Tweaks

[GNOME Tweaks](https://icare24h.net/cach-cai-dat-gnome-tweaks-tren-fedora-linux/) là một ứng dụng nhỏ tuyệt vời cung cấp cho bạn quyền truy cập vào các tùy chọn bổ sung để sửa đổi trải nghiệm GNOME của bạn. Điều này bao gồm mọi thứ từ tiện ích mở rộng, đến thay đổi chủ đề và điều chỉnh cài đặt nguồn.

```sh
sudo dnf makecache --refresh
sudo dnf install -y gnome-tweaks 
```

Mở Gnome tweaks bằng câu lệnh bên dưới:

```
gnome-tweaks
```

<p align="center">
  <img src="./images/gnome-tweaks.png">
</p>

## Themes

- [Tokyo Night](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme)
- [Otis](https://github.com/EliverLara/otis)
- [Graphite](https://github.com/vinceliuice/Graphite-gtk-theme)
- [Colloid](https://github.com/vinceliuice/Colloid-gtk-theme)
- [Orchis](https://github.com/vinceliuice/Orchis-theme) (đề xuất - có hướng dẫn cài đặt)

Copy thư mục chứa theme vào `/usr/share/themes/` hoặc `$HOME/.themes`.

Ví dụ: 

- Tải theme Otis:

```sh
git clone https://github.com/EliverLara/Otis.git
```

- Sao chép theme Otis vào nơi cài đặt:

```sh
sudo cp -r Otis /usr/share/themes/Otis
```

- Để sử dụng theme Otis trên Gnome, thì chạy câu lệnh trong Terminal:

```sh
gsettings set org.gnome.desktop.interface gtk-theme "Otis"
gsettings set org.gnome.desktop.wm.preferences theme "Otis"
```

Hoặc chỉnh qua công cụ [Gnome Tweaks](#gnome-tweaks).

## Icons

- [Adwaita-Blue](https://www.gnome-look.org/p/1310137)
- [Sevi](https://github.com/TaylanTatli/Sevi) (đề xuất - có hướng dẫn cài đặt)

Copy thư mục chứa icon vào `/usr/share/icons/`

Chỉnh qua công cụ [Gnome Tweaks](#gnome-tweaks).

## Fonts

- [Roboto](https://fonts.google.com/specimen/Roboto)
- [Fira Code Retina Nerd Font Complete](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete.ttf)
- [Tổng hợp sẵn](https://www.pling.com/p/1939902/)

Copy các font vừa tải vào thư mục `Home/.local/share/fonts`.

Cấu hình Font theo hình bên dưới:

<p align="center">
  <img src="./images/font_customize.png">
</p>


## Các ứng dụng thu âm

### Gnome Sound Recorder

Cài đặt:

```sh
sudo dnf install -y gnome-sound-recorder
```

Chạy:

```sh
gnome-sound-recorder
```

<p align="center">
  <img src="./images/gnome-sound-recorder.png">
</p>


### Audio Recorder

*** Đang bị lỗi, chưa cài thành công.

[Audio Recorder](https://launchpad.net/audio-recorder) là một trình ghi âm tuyệt vời trên hệ điều hành Linux có tất cả các loại tùy chọn để hoạt động như một nguồn âm thanh. Ví dụ, bạn có thể sử dụng micrô, webcam và thậm chí cả Skype. Thời gian có thể được đặt cho bản ghi âm của bạn để bạn kiểm soát môi trường làm việc. Nó hỗ trợ các định dạng MP3, FLAC, OGG, WAV và SPX.

Sửa lỗi : configure: error: Package requirements (gstreamer-1.0 >= 1.4) were not met.

```sh
sudo dnf install -y gstreamer1-devel gstreamer1-plugins-base-tools gstreamer1-doc gstreamer1-plugins-base-devel gstreamer1-plugins-good gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-devel gstreamer1-plugins-bad-free-extras
```

Tham khảo tại [đây](https://gstreamer.freedesktop.org/documentation/installing/on-linux.html?gi-language=c)

Lỗi: Package requirements (appindicator3-0.1 >= 0.3) were not met: - chưa sửa được.

```
sudo dnf install -y libindicator-devel 
libindicator-gtk3-devel
libindicator-gtk3-tools
```

```sh 
sudo dnf makecache --refresh
# sudo dnf -y install gstreamer1
```

### Audacity

[Audacity](https://www.audacityteam.org/) là một phần mềm tự do, trình sửa nhạc số đa nền tảng và ứng dụng ghi âm. Nó có thể hoạt động trên Windows, Mac OS X, Linux và BSD. Audacity được tạo ra bởi Dominic Mazzoni khi anh đang là nghiên cứu sinh tại Đại học Carnegie Mellon, bang Pennsylvania, Hoa Kỳ.

<p align="center">
  <img src="images/audacity.png">
</p>

### Ardour

[Ardor](https://ardour.org/) là một giải pháp mã nguồn mở tại chỗ giúp các doanh nghiệp tải lên, ghi và chỉnh sửa các đoạn âm thanh trên các thiết bị Linux, MacOS và Windows. Người chỉnh sửa có thể trích xuất nhạc phim từ video đã nhập, thêm khung trống và định tuyến các bản nhạc đa kênh đến các dải trộn riêng biệt.

<p align="center">
  <img src="./images/ardour.png">
</p>

## Cài đặt NVIDIA Drivers cho các RedHat distro

### Kiểm tra GPUs và Drivers đã dùng

Bạn có thể [kiểm tra](https://rpmfusion.org/Howto/NVIDIA#Determining_your_card_model) liệu rằng máy vi tính của bạn đã cài GPU NVIDIA hay chưa với câu lệnh sau:

```sh
lspci -k | grep -A 2 -E "(VGA|3D)"
# hoặc
lspci | egrep 'VGA|NVIDIA'
```

<p align="center">
  <img src="images/lspci.png">
</p>

Kiểm tra card nvidia:

```sh
lsmod | grep nvidia
```

<p align="center">
  <img src="images/empty_nvidia.png">
</p>

Theo mặc định, Fedora 36 sẽ sử dụng drivers Nouveau mã nguồn mở nếu bạn đã cài đặt GPU NVIDIA trên máy tính của mình, như bạn có thể thấy trong ảnh chụp màn hình bên dưới.

Hầu hết các hệ thống Máy tính để bàn Linux hiện đại như AlmaLinux đều có trình điều khiển NVIDIA được cài đặt sẵn trong trình điều khiển thiết bị đồ họa nguồn mở Nouveau dành cho cạc video Nvidia. Đối với hầu hết các phần, điều này có thể chấp nhận được; tuy nhiên, nếu bạn đang sử dụng hệ thống Linux của mình để thiết kế đồ họa hoặc chơi game, bạn có thể nhận được trình điều khiển tốt hơn.

Về mặt lịch sử, các driver độc quyền của Nouveau chậm hơn của Nvidia, vốn thiếu các tính năng phần cứng, công nghệ phần mềm và hỗ trợ mới nhất của cạc đồ họa. Trong hầu hết các tình huống, việc nâng cấp drivers Nvidia của bạn với các phiên bản driver phù hợp sẽ có lợi hơn là không nâng cấp. Trong một số trường hợp, bạn có thể thấy một số cải tiến đáng kể về tổng thể.

```sh
lsmod | grep nouveau
```

<p align="center">
  <img src="./images/nouveau.png">
</p>

### Cập nhật hệ thống

Đầu tiên, cập nhật kho lưu trữ gói DNF cache với câu lệnh bên dưới:

```sh
sudo dnf upgrade --refresh -y
```

Nếu có bất kỳ bản cập nhật nào cần được cài đặt, trình quản lý gói DNF sẽ hiển thị cho bạn bản tóm tắt về bản nâng cấp, như được hiển thị trong ảnh chụp màn hình bên dưới. Nếu không, nó sẽ cho bạn biết rằng hệ thống của bạn đã được cập nhật.

Trình quản lý gói DNF sẽ tải xuống tất cả các bản cập nhật được yêu cầu từ internet. Có thể mất một lúc để hoàn thành.

### Cài đặt EPEL

Nếu không phải Fedora thì cài thêm [EPEL](https://docs.fedoraproject.org/en-US/epel/) - 
Extra Packages for Enterprise Linux.

Trước tiên, bật CRB repository.

```sh
sudo dnf config-manager --set-enabled crb
```

Tiếp theo, cài đặt `EPEL` thông qua `dnf`.

```sh
dnf install epel-release epel-next-release
```

### Tùy chọn - Xóa EPEL 

Tìm EPEL package và tiến hành xoá gói EPEL nếu cài đặt thông qua **rpm**.

```sh
rpm -qa | grep epel
# epel-release-6-8.noarch
```

Xoá gói package bằng command **rpm -e**.

```sh
# rpm -e epel-release-6-8.noarch
```

### Cài đặt kho lưu trữ tổng hợp RPM Fusion

Theo mặc định, giống như hầu hết các bản phân phối Linux, Fedora không đi kèm với các trình điều khiển độc quyền của NVIDIA. Phương pháp tốt nhất để cài đặt những thứ này trên Fedora 36 là sử dụng kho lưu trữ tổng hợp RPM.

RPM Fusion là một kho chứa các gói tiện ích bổ sung cho Fedora và EL + EPEL mà một nhóm tình nguyện viên cộng đồng duy trì. RPM Fusion không phải là một kho lưu trữ độc lập mà là một phần mở rộng của các gói mặc định của Fedora không thể được đưa vào do Fedora bị ràng buộc bởi các hạn chế pháp lý giống như Red Hat.

Đầu tiên, mở terminal của bạn và thêm các kho lưu trữ sau:

- Thêm RPM Fusion Free repository:

```sh
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

- Thêm RPM Fusion Non-Free repository:

```sh
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Sau khi cài đặt, làm mới danh sách kho lưu trữ:

```sh
sudo dnf makecache
```

### Tùy chọn thêm

RPM Fusion có một nhánh thử nghiệm chứa hầu hết các gói chuỗi trình điều khiển NVIDIA phát hành mới hoặc các gói beta. Điều này có thể hữu ích cho những người muốn cài đặt trình điều khiển NVIDIA hiện đại.

Tham khảo tại [đây](https://www.linuxcapable.com/how-to-install-nvidia-drivers-on-almalinux-9/#Optional_-_Enable_RPM_Fusion_TESTING_Branch)

### Cài đặt NVIDIA Drivers

Bây giờ bạn đã nhập kho lưu trữ RPM Fusion, hãy thực thi lệnh sau để cài đặt trình điều khiển Nvidia mới nhất trên hệ thống của bạn.

```sh
sudo dnf install -y akmod-nvidia
```

Tiếp theo, cài đặt drivers hỗ trợ CUDA. Bạn có thể không cần điều này, nhưng đôi khi nếu sự cố vẫn tiếp diễn, việc cài đặt hỗ trợ CUDA có thể giải quyết vấn đề.

```sh
sudo dnf install -y xorg-x11-drv-nvidia-cuda
```

Lưu ý rằng lệnh NVIDIA-SMI chỉ có thể sử dụng được với sự hỗ trợ của Cuda.

Khi mọi thứ đã được cài đặt, bạn phải khởi động lại hệ thống của mình. Theo mặc định, điều này cũng sẽ tự động tắt trình điều khiển Nouveau.

```sh
reboot
```

### Xác minh cài đặt NVIDIA Drivers

Khi bạn đã quay lại, xem NVIDIA X Server Settings bằng cách sử dụng đường dẫn sau.

`Activities > Show Applications > NVIDIA X Server`

Ngoài ra, nếu bạn đã mở một terminal, hãy sử dụng lệnh sau.

```sh
nvidia-settings
```

<p align="center">
  <img src="images/nvidia_settings.png">
</p>

Hoặc cũng có thể, sau khi khởi động lại hệ thống, bạn có thể tìm thấy ứng dụng NVIDIA X Server Settings ở trong Application Menu. Nhấn vào biểu tượng NVIDIA X Server Settings như màn hình bên dưới.
Ví dụ nếu cài đặt thành công:

<p align="center">
  <img src="images/nvidia_installed.png">
</p>

Những hệ thống đã cài đặt **Cuda support** có thể chạy câu lệnh bên dưới.

```sh
nvidia-smi
```

Lệnh `nvidia-smi` chỉ có thể sử dụng được với sự hỗ trợ của Cuda. Câu lệnh này cũng có thể kiểm tra phiên bản của Drivers.

Các trình điều khiển NVIDIA độc quyền được sử dụng, như bạn có thể thấy trong ảnh chụp màn hình bên dưới.

```sh
lsmod | grep nvidia
```

<p align="center">
  <img src="./images/lsmod_nvidia.png">
</p>

Drivers Nouveau đã không còn được sử dụng.

```sh
lsmod | grep nouveau
```

### Cập nhật Nvidia Drivers

Tất cả các bản cập nhật trong tương lai sẽ nằm trong quy trình lệnh `dnf refresh` tiêu chuẩn và điều này sẽ kiểm tra kho lưu trữ RPM Fusion để biết các bản cập nhật của các driver và các gói phần mềm còn lại của bạn.

```sh
sudo dnf upgrade --refresh
```

### Cách xóa Nvidia Drivers và RollBack

Nếu bạn không muốn tiếp tục sử dụng trình điều khiển chính thức của Nvidia, hãy sử dụng lệnh sau:

```sh
sudo dnf -y autoremove akmod-nvidia xorg-x11-drv-nvidia-cuda
```

Thao tác này sẽ xóa tất cả các phần phụ thuộc đã cài đặt. Sau khi xóa, bạn phải khởi động lại.

```sh
reboot
```

Trong quá trình khởi động lại, quá trình này sẽ kích hoạt lại các driver Nouveau. Bạn sẽ thấy một thông báo cho biết không tìm thấy trình điều khiển Nvidia đang bật lại trình điều khiển Nouveau, giúp bạn dễ dàng chuyển đổi qua lại nếu cần.

`NVIDIA kernel module missing. Falling back to nouveau.`

## Chuyển đổi cạc đồ họa NVIDIA và Intel/AMD

### Cài đặt Envy Control

[EnvyControl](https://github.com/geminis3/envycontrol) là một chương trình nhằm cung cấp một cách dễ dàng để chuyển đổi chế độ GPU trên hệ thống Nvidia Optimus (ví dụ như máy tính xách tay có cấu hình Intel + Nvidia hoặc AMD + Nvidia) trong hệ điều hành Linux.

EnvyControl có thể hoạt động trên bất kỳ bản phân phối nào của Linux, hãy xem [các bản phân phối đã thử nghiệm](https://github.com/geminis3/envycontrol/wiki/Frequently-Asked-Questions#tested-distros).

Mở terminal, tải repository Envy Control:

```sh
git clone https://github.com/geminis3/envycontrol.git
```

Cài đặt thư viện pip:

```sh
sudo dnf install -y python3-pip
```

Để áp dụng trên toàn bộ hệ thống, vào thư mục vừa tải và cài đặt gói thông qua pip:

```sh
cd envycontrol
sudo pip3 install .
```

Cách dùng:

```sh 
usage: envycontrol.py [-h] [-v] [-s MODE] [-q] [--dm DISPLAY_MANAGER] [--reset_sddm]

options:
  -h, --help            show this help message and exit
  -v, --version         show this program's version number and exit
  -s MODE, --switch MODE
                        switch the graphics mode, supported modes: integrated, hybrid, nvidia
  -q, --query           query the current graphics mode set by EnvyControl
  --dm DISPLAY_MANAGER  Manually specify your Display Manager. This is required only for systems without systemd. Supported DMs: gdm, sddm, lightdm
  --reset_sddm          restore original SDDM Xsetup file
```

Ví dụ:

Xem chế độ đồ họa hiện tại:

```cosonle
envycontrol --query
```

Chuyển chế độ đồ họa hiện tại thành integrated (tắt nguồn Nvidia dGPU):

```sh
sudo envycontrol -s integrated
```

Chuyển chế độ đồ họa hiện tại thành nvidia (tự động cài đặt display manager)

```sh
sudo envycontrol -s nvidia
```

Chuyển chế độ đồ họa hiện tại thành nvidia và cài đặt SDDM display manager.

```sh
sudo envycontrol -s nvidia --dm sddm
```

### Chuyển đổi cạc đồ hoa thông qua System Menu

Có một tiện ích mở rộng được gọi là GPU profile selector cho phép bạn chuyển đổi giữa các GPU thông qua menu hệ thống ở góc trên bên phải.

<p align="center">
  <img src="images/envycontrol_system_menu.png">
</p>

Đối với giai diện Gnome(Fedora/Ubuntu,...), chỉ cần mở [liên kết này](https://extensions.gnome.org/extension/5009/gpu-profile-selector/) và sử dụng nút ON/OFF để cài đặt tiện ích mở rộng.

LƯU Ý: Tiện ích mở rộng này yêu cầu cài đặt [Envy Control](#cài-đặt-envy-control) trước. Và, nếu bạn không thấy nút ON/OFF, hãy nhấp vào liên kết **Click here to install browser extension** để cài đặt tiện ích mở rộng trình duyệt và tải lại trang web.

<p align="center">
  <img src="images/gnome_extension_gpu_profile_selector.png">
</p>

Sau khi thực hiện chuyển đổi, bạn có thể xác minh nó bằng cách chạy một lệnh duy nhất trong terminal:

```sh
glxinfo | egrep "OpenGL vendor|OpenGL renderer"
```

<p align="center">
  <img src="./images/glxinfo_is_gpu_used.png">
</p>

## Cài đặt ICC profile cho Linux

Cấu hình ICC ([International Color Consortium](https://en.wikipedia.org/wiki/International_Color_Consortium)) là tệp nhị phân chứa dữ liệu chính xác về các thuộc tính màu sắc của đầu vào hoặc thiết bị đầu ra (màn hình). Một hoặc nhiều hồ sơ có thể được áp dụng trên một hệ thống và các thiết bị của nó để tạo ra kết quả nhất quán và có thể lặp lại để chỉnh sửa và xuất bản đồ họa và tài liệu.

Nói nôm na, *.icc là file giúp cân bằng màu sắc của thiết bị, cụ thể  là màn hình.

Tải 1 file icc, sau đó copy vào đường dẫn `/usr/share/color/icc/colord`. 
Ví dụ  tải file icc cho màn hình [Galax Vivance-01](https://tftcentral.co.uk/icc_profiles/acer_nitro_vg270up.icc).

Tải file icc cho [Lenovo Thinkbook 14 G7+](./LEN8AB1_23-01-2025.icm).

Các profile cho các màn hình khác có thể tham khảo ở [đây](https://tftcentral.co.uk/articles/icc_profiles).

Nếu bạn có `gnome-color-manager` hoặc `colord-kde` đã được cài đặt thì chỉ cần nhấn đôi vào profile *.icc và nhấn Import. Bạn có thể gán một profile mới cho một thiết bị màn hình đã tồn tại bằng cách vào `System Settings` ▸ `Color panel`. Chọn màn hình muốn cài đặt profile, sau đó nhấn `Add profile`.

<p align="center">
  <img src="./images/ICC_initial.png">
</p>

Chọn profile mong muốn, sau đó nhấn `Add`:

<p align="center">
  <img src="./images/ICC_initial_select_profile.png">
</p>

Hình ảnh đã chọn thành công.

<p align="center">
  <img src="./images/ICC_initial_done.png">
</p>

Đường cong hiệu chỉnh cấu hình (profile calibration curves) sẽ được tải tự động khi đăng nhập hoặc có thể được tải cho tất cả người dùng khi khởi động nếu nhấp vào nút `Set for all users`.


## Tham khảo

https://www.linuxcapable.com/how-to-install-nvidia-drivers-on-almalinux-9/#Optional_-_Enable_RPM_Fusion_TESTING_Branch

https://vi.linuxcapable.com/how-to-install-nvidia-drivers-on-fedora-36-linux/

https://linuxhint.com/install-nvidia-drivers-on-fedora-35/

https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Fedora&target_version=35

https://linuxhint.com/check-version-update-fedora-linux-kernel/#:~:text=The%20best%20way%20to%20update,run%20the%20following%20DNF%20command

https://fostips.com/install-nvidia-driver-fedora-36/

###### [on top](#mục-lục)