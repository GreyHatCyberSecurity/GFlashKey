ENGLISH README
=====================
Welcome to GFlashKey!
GFlashKey - is a simple bash script which will monitor the presence of the specified device (usb flash drive, mouse, etc.) in the computer. 
When the selected device is disconnected, the script will perform the actions you specify. Initially, this action unmounts all mounted veracrypt volumes.
In order to do something like the standard GFLashKey, you need root access, but it's still really to run without root

Usage
=====================
First, set manually the actions to be performed (type them in the 'things' document in the GFlashKey folder).
Next, run the script and select the device which will be monitored. To do this, specify its ID, it can be found in the list of devices, which will give you GFlashKey.
The ID consists of 4 characters and 4 digits (it is enough to specify any one). The ID is unique for each device.
Then, GFlashKey will cycle through checking for it, you can see the corresponding inscription in the terminal window.
As soon as the device is removed from the computer, GFlashKey will immediately begin to perform the specified actions. When they are done, you will see a message saying that they are done.

Special use
=====================
Do not start the terminal in the same partition which will be unmounted (if you are going to unmount it with GFlashkEy), because the partition cannot be unmounted if it is 'busy'.
If you close the terminal to 'release' the partition, the script will close and will not perform the specified actions.
Also, specify a kill for each running process in the partition, otherwise you will not be able to unmount it. 
Consider every feature and situation to ensure that the script works 100% correctly.
If you have any questions/issues - please, feel free to contact us at 
E-Mail : greyhatfeedback@protonmail.com
Telegram : @greyhatfdbot

РУССКИЙ README
=====================
Добро пожаловать в GFlashKey!
GFlashKey - это простецкий bash-скрипт, который будет отслеживать наличие указанного устройства (usb-флешки, мыши и т.д.) в компьютере. 
Когда выбранное устройство будет отключено, скрипт выполнит указанные вами действия. 
Первоначально это действие размонтирует все смонтированные тома veracrypt.
Для того, чтобы сделать что-то похожее на стандартный GFLashkEy, вам нужен root-доступ, но его реально запустить и без root.

Использование
=====================
Сначала задайте вручную действия, которые необходимо выполнить (введите их в документ 'things' в папке GFlashKey).
Затем запустите скрипт и выберите устройство, за которым будет вестись наблюдение. Для этого укажите его ID, его можно найти в списке устройств, который вам выдаст GFlashKey.
ID состоит из 4 символов и 4 цифр (достаточно указать любую). ID уникален для каждого устройства.
Затем GFlashKey будет циклически проверять его наличие, соответствующую надпись вы сможете увидеть в окне терминала.
Как только устройство будет извлечено из компьютера, GFLashkEy немедленно начнет выполнять указанные действия. Когда они будут выполнены, вы увидите сообщение об их завершении.

Особое использование
=====================
Не запускайте терминал в том же разделе, который будет размонтирован (если вы собираетесь размонтировать его с помощью GFlashKey), потому что раздел не может быть размонтирован, если он "занят".
Если вы закроете терминал, чтобы "освободить" раздел, скрипт закроется и не выполнит указанных действий.
Также укажите kill для каждого запущенного процесса в разделе, иначе вы не сможете его размонтировать. 
Рассмотрите все возможности и ситуации, чтобы убедиться, что скрипт работает на 100% правильно.
Если у вас есть какие-либо вопросы/непонятки - смело обращайтесь к нам
E-Mail : greyhatfeedback@protonmail.com
Telegram : @greyhatfdbot
