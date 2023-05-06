#!/usr/bin/env bash

echo -ne "
-------------------------------------------------------------------------
██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗    
██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝    
██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗      
██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝      
╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗    
 ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝    
                                                      
███████╗███████╗████████╗ █████╗ ██████╗              
██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗             
█████╗  ███████╗   ██║   ███████║██████╔╝             
██╔══╝  ╚════██║   ██║   ██╔══██║██╔══██╗             
██║     ███████║   ██║   ██║  ██║██████╔╝             
╚═╝     ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═════╝              
                                                                                             
-------------------------------------------------------------------------
"

# IFS=\" read -r _ vUUID _ vPARTUUID _ < <(blkid /dev/nvme0n1p4 -s UUID -s PARTUUID)
# echo $vUUID 

cat <<EOT >> /etc/fstab

#Mount Normal Drives

UUID=bd7b8781-f98f-45e3-8e5e-fee3d9fd8bbd   /media/Epsilon   btrfs   nofail                                                                       0 0 
UUID=b1121d57-4180-4ad1-af4f-158af3b18883   /media/Gamma     btrfs   nofail                                                                       0 0 
//192.168.2.10/sigma/Delta/                 /media/Sigma     cifs    vers=2.0,credentials=/home/deuce/.local/.smbcredentials,iocharset=utf8,gid=1000,uid=1000,file_mode=0777,dir_mode=0777   0 0
//192.168.2.10/Theta                        /media/Theta/    cifs    vers=2.0,credentials=/home/deuce/.local/.smbcredentials,iocharset=utf8,gid=1000,uid=1000,file_mode=0777,dir_mode=0777   0 0


EOT
cat /etc/fstab

sudo mkdir /media
cd /media
sudo mkdir Delta Epsilon Gamma Theta
sudo chown -R deuce:deuce Delta Epsilon Gamma Theta 
cd ~/
sudo mount -a
echo "--------------------------------------"
echo "--          Changed FSTAB            --"
echo "--------------------------------------"


sleep 3



# echo -ne "
# -------------------------------------------------------------------------
# ██╗   ██╗██████╗ ██████╗  █████╗ ████████╗███████╗    
# ██║   ██║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔════╝    
# ██║   ██║██████╔╝██║  ██║███████║   ██║   █████╗      
# ██║   ██║██╔═══╝ ██║  ██║██╔══██║   ██║   ██╔══╝      
# ╚██████╔╝██║     ██████╔╝██║  ██║   ██║   ███████╗    
#  ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝    
                                                      
# ██████╗  ██████╗ ██╗     ██╗  ██╗██╗████████╗         
# ██╔══██╗██╔═══██╗██║     ██║ ██╔╝██║╚══██╔══╝         
# ██████╔╝██║   ██║██║     █████╔╝ ██║   ██║            
# ██╔═══╝ ██║   ██║██║     ██╔═██╗ ██║   ██║            
# ██║     ╚██████╔╝███████╗██║  ██╗██║   ██║            
# ╚═╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝            
                                                                                                          
# -------------------------------------------------------------------------
# "

#  sleep 2

# cp -r ~/GitHub/ArchInstall/etc/* ~/etc


echo "--------------------------------------"
echo "-- No Passwd  Polkit          --"
echo "--------------------------------------"

touch /etc/polkit-1/rules.d/49-nopasswd_global.rules
cat <<EOT >> /* Allow members of the wheel group to execute any actions
 * without password authentication, similar to "sudo NOPASSWD:"
 */
polkit.addRule(function(action, subject) {
    if (subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});

EOT
cat /etc/polkit-1/rules.d/49-nopasswd_global.rules

# sleep 2

 cat /etc/zsh/zshenv

# sleep 2

# # echo "--------------------------------------"
# # echo "--No Passwd  Polkit enabled --"
# # echo "--------------------------------------"





# echo -ne "
# -------------------------------------------------------------------------
# ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗         
# ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║         
# ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║         
# ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║         
# ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗    
# ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝    
                                                          
# ███████╗ ██████╗ ███╗   ██╗████████╗███████╗              
# ██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔════╝              
# █████╗  ██║   ██║██╔██╗ ██║   ██║   ███████╗              
# ██╔══╝  ██║   ██║██║╚██╗██║   ██║   ╚════██║              
# ██║     ╚██████╔╝██║ ╚████║   ██║   ███████║              
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝              
                                                                                                                          
# -------------------------------------------------------------------------
# "

# sleep 2

# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
# unzip FiraCode.zip -d /usr/share/fonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraMono.zip
# unzip FiraMono.zip -d /usr/share/fonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Iosevka.zip
# unzip Iosevka.zip -d /usr/share/fonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
# unzip JetBrainsMono.zip -d /usr/share/fonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Meslo.zip
# unzip Meslo.zip -d /usr/share/fonts
# fc-cache -vf

# rm -R FiraCode.zip FiraMono.zip Iosevka.zip JetBrainsMono.zip Meslo.zip


# echo -ne "
# -------------------------------------------------------------------------
# ███████╗███████╗████████╗██╗   ██╗██████╗                     
# ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗                    
# ███████╗█████╗     ██║   ██║   ██║██████╔╝                    
# ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝                     
# ███████║███████╗   ██║   ╚██████╔╝██║                         
# ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝                         
                                                              
# ██╗   ██╗██╗██████╗ ████████╗    ███╗   ███╗ █████╗ ███╗   ██╗
# ██║   ██║██║██╔══██╗╚══██╔══╝    ████╗ ████║██╔══██╗████╗  ██║
# ██║   ██║██║██████╔╝   ██║       ██╔████╔██║███████║██╔██╗ ██║
# ╚██╗ ██╔╝██║██╔══██╗   ██║       ██║╚██╔╝██║██╔══██║██║╚██╗██║
#  ╚████╔╝ ██║██║  ██║   ██║       ██║ ╚═╝ ██║██║  ██║██║ ╚████║
#   ╚═══╝  ╚═╝╚═╝  ╚═╝   ╚═╝       ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
                                                                                                                                      
# -------------------------------------------------------------------------
# "

sleep 2




    echo -ne "
    -------------------------------------------------------------------------
    Enable and Start Libvirt
    -------------------------------------------------------------------------
    "
    sudo systemctl enable libvirtd.service
    sleep 2
    sudo systemctl start libvirtd.service
    sleep 2

    echo -ne "
    -------------------------------------------------------------------------
    Set default network, autostartm, check status
    -------------------------------------------------------------------------
    "
    
    sudo virsh net-start default
    sleep 2
    sudo virsh net-autostart default
    sleep 2

     echo -ne "
    -------------------------------------------------------------------------
    Add user and new group
    -------------------------------------------------------------------------
    "   
    
        sudo usermod -a -G libvirt $(whoami)
    sleep 2
    newgrp libvirt
    sleep 2
    
    echo -ne "
    -------------------------------------------------------------------------
    Restart Libvirt and set default network
    -------------------------------------------------------------------------
    "

    
    sudo systemctl restart libvirtd.service
    sleep 2

    echo -ne "
    -------------------------------------------------------------------------
    Virt-Manager Setup has been setup
    -------------------------------------------------------------------------
    "
