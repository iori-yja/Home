export XMODIFIERS=@im=uim
export QT_IM_MODULE=uim
export GTK_IM_MODULE=uim
exec uim-toolbar-gtk&
uim-xim&
xset b off
xmodmap ~/.Xmodmap
exec awesome

