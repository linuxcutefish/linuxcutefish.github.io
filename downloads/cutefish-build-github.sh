#!/bin/bash
#case select test for
echo 'Welcome to use CutefishDE automatic compilation script, this script is suitable for most Debian/Ubuntu distributions, aiming to make more Linux use cutefish.'
echo 'If there is an error in compilation, you can modify the script content according to the official GitHub and compile again. Official Github: https://github.com/cutefishos/ .'
echo 'The original author Moore Benmo, Github: https://github.com/Moore2253/CutefishOSBuild.sh'
echo 'Added the function of compiling all libraries at once, modified by wujunyi'
echo 'Prompt: Please enter the current serial number of the project and press Enter to start compiling, enter 25(quit) to exit'

PS3='Please select the project you want to compile, 27 is to exit:'
echo $PS3
echo 'Check whether there is a cutefishos folder in the ~/ directory'
if test -e ~/cutefishos
then
   echo 'A folder with the same name has been detected and is being deleted'
   sudo rm -rf ~/cutefishos
   echo 'Delete completed, re-create folder, continue compiling'
   mkdir ~/cutefishos
else
   echo "No folder with the same name, continue compiling"
   mkdir ~/cutefishos
fi

echo 'Start installing dependencies'
sudo apt install libpolkit-qt5-1-dev qml-module-qtquick-dialogs libxcb-damage0-dev libicu-dev libqapt-dev libkf5solid-dev pkg-config extra-cmake-modules libpam0g-dev libxcb-util-dev lintian libsm-dev libkf5screen-dev libxcb-composite0-dev qml-module-qt-labs-settings libqt5sensors5-dev libcanberra-dev qml-module-qtqml debhelper libfreetype6-dev libkf5bluezqt-dev qml-module-qtquick-shapes libapt-pkg-dev xserver-xorg-dev qtbase5-dev libx11-dev libcrypt-dev libfontconfig1-dev cmake qml-module-qtquick-particles2 libxcb1-dev xserver-xorg-input-synaptics-dev libkf5idletime-dev libkf5networkmanagerqt-dev automake libqt5x11extras5-dev git libxcb-dri2-0-dev qml-module-qtquick2 libxcursor-dev qttools5-dev qml-module-qtquick-layouts libcanberra-pulse libxcb-keysyms1-dev libsystemd-dev gcc -y libxcb-glx0-dev qttools5-dev-tools qml-module-qtquick-window2 libxcb-image0-dev libcap-dev libpulse-dev libxcb-randr0-dev qml-module-qtquick-controls2 libxcb-shm0-dev libxcb-ewmh-dev equivs libxcb-icccm4-dev qtdeclarative5-dev libkf5kio-dev qtquickcontrols2-5-dev libkf5coreaddons-dev devscripts libxcb-xfixes0-dev libxcb-record0-dev qml-module-qt-labs-platform libxtst-dev libxcb-dpms0-dev build-essential libkf5windowsystem-dev xserver-xorg-input-libinput-dev autotools-dev libx11-xcb-dev libxcb-dri3-dev qml-module-org-kde-kwindowsystem libkf5globalaccel-dev qtbase5-private-dev modemmanager-qt-dev libpolkit-agent-1-dev curl libxcb-shape0-dev --no-install-recommends -y

function Compile(){
    case $1 in 
        filemanager)
        echo 'Start compiling filemanager'
        cd ~/cutefishos
        echo 'Cloning project'
        git clone https://github.com/cutefishos/filemanager.git
        echo 'compiling'
        cd ~/cutefishos/filemanager
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        echo 'Compilation complete, installing'
        sudo make install
        echo 'filemanager installation complete'
        ;;
        dock)
        echo 'start compiling dock'
        cd ~/cutefishos
        echo 'Cloning project'
        git clone https://github.com/cutefishos/dock.git
        echo 'compiling'
        cd ~/cutefishos/dock
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        echo 'Compilation complete, installing'
        sudo make install
        echo 'dock installation complete'
        ;;
        fishui)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/fishui.git
        cd ~/cutefishos/fishui
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        screenshot)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/screenshot.git
        cd ~/cutefishos/screenshot
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        qt-plugins)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/qt-plugins.git
        cd ~/cutefishos/qt-plugins
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        terminal)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/terminal.git
        cd ~/cutefishos/terminal
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        launcher)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/launcher.git
        cd ~/cutefishos/launcher
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        settings)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/settings.git
        cd ~/cutefishos/settings
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        debinstaller)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/debinstaller.git
        cd ~/cutefishos/debinstaller
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        icons)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/icons.git
        cd ~/cutefishos/icons
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake  ..
        make
        sudo make install
        ;;
        gtk-themes)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/gtk-themes.git
        cd ~/cutefishos/gtk-themes
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        daemon)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/daemon.git
        cd ~/cutefishos/daemon
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        statusbar)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/statusbar.git
        cd ~/cutefishos/statusbar
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        libcutefish)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/libcutefish.git
        cd ~/cutefishos/libcutefish
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        core)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/core.git
        cd ~/cutefishos/core
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        updator)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/updator.git
        cd ~/cutefishos/updator
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        screenlocker)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/screenlocker.git
        cd ~/cutefishos/screenlocker
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        texteditor)
        cd ~/cutefishos
        sudo mk-build-deps -i -t "apt-get --yes" -r
        git clone https://github.com/cutefishos/texteditor.git
        cd ~/cutefishos/texteditor
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        calculator)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/calculator.git
        cd ~/cutefishos/calculator
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        kwin-plugins)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/kwin-plugins.git
        cd ~/cutefishos/kwin-plugins
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        videoplayer)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/videoplayer.git
        cd ~/cutefishos/videoplayer
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        sddm-theme)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/sddm-theme.git
        cd ~/cutefishos/sddm-theme
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake ..
        make
        sudo make install
        ;;
        appmotor)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/appmotor.git
        cd ~/cutefishos/appmotor
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        wallpapers)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/wallpapers.git
        cd ~/cutefishos/wallpapers
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        calamares)
        cd ~/cutefishos
        git clone https://github.com/cutefishos/calamares.git
        cd ~/cutefishos/calamares
        sudo mk-build-deps ./debian/control -i -t "apt-get --yes" -r
        dpkg-buildpackage -b -uc -us
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
        make
        sudo make install
        ;;
        quit)
        exit 1
        ;;
        *)
        echo "Input error, please enter the current serial number of the project or enter 27 (quit) to exit"
        ;;
    esac
}

select i in fishui libcutefish qt-plugins kwin-plugins core daemon filemanager dock screenshot terminal launcher settings debinstaller icons gtk-themes statusbar updator screenlocker calculator videoplayer sddm-theme appmotor wallpapers calamares texteditor all quit
do
   if test $i == all
   then
       for j in fishui libcutefish qt-plugins kwin-plugins core daemon filemanager dock screenshot terminal launcher settings debinstaller icons gtk-themes statusbar updator screenlocker calculator videoplayer sddm-theme appmotor wallpapers calamares texteditor
       do
          Compile $j
        done
    else
       Compile $i
    fi
done
