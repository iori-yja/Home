export XMODIFIERS=@im=uim
export QT_IM_MODULE=uim
export GTK_IM_MODULE=uim
exec uim-toolbar-gtk&
uim-xim&
xset b off
xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'clear Lock'
xmodmap -e 'add Control = Control_L'

xmodmap ~/.Xmodmap
exec awesome

