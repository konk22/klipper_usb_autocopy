#!/bin/bash

# Переменная для хранения директории, содержащей файлы
source_dir=${HOME}/klipper_usb_autocopy

# Перемещение файла 99-mountcopy.rules в /etc/udev/rules.d/
sudo mv "$source_dir/99-mountcopy.rules" /etc/udev/rules.d/

# Перемещение файла usb-mount@.service в /etc/systemd/system/
sudo mv "$source_dir/usb-mount@.service" /etc/systemd/system/

# Перемещение файла mountcopy в /usr/bin/
sudo mv "$source_dir/mountcopy" /usr/bin/

# Назначение прав на выполнение для файла mountcopy
sudo chmod +x /usr/bin/mountcopy

# Перезагрузка правил udev и вызов триггера
sudo udevadm control --reload-rules && sudo udevadm trigger
