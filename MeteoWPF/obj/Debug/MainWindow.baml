   M S B A M L   `   `   `  ����O  Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem  5   	   H DWeatherCSharp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:WeatherCSharpWeatherCSharp 5   	      WeatherCSharp.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   6sys&clr-namespace:System;assembly=mscorlib     5   	   -localclr-namespace:WeatherCSharp     5   	   U QMaterialDesignThemes.Wpf, Version=2.3.0.823, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5
   	     � Title$  WeatherCsharp��5	   	   $	��450��6   $	��500��6+   $	��440��6;   $	��500��6J    � SizeToContent$ WidthAndHeight=�6Y      MaterialDesignBody#���   5   	   $��Regular"�5   	   $��13(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	   .��5      �  � ShowGridLines .   � RowDefinitions 5   
   �� 5      $��60 �6   6*   �� 5      $��* �6   6)   �� 5      $��* �6   6)    � ColumnDefinitions 5   
   �� 5      $��* �6   6+   .+�5   
   � $��0��6    .   5       �� 5!      6%   �� 5"      $��50 �6#   60   .+�5&      �� -   5         ��Name$ DateBox��5)      $��0��5&      $��35,0,0,0q�5'      $��Bottom=�5(      $
��Bold"�5*      ���#545454
������ $��16(�5-      .��6    5.      �� 51      -   5        $��localisation��52      $��	0,12,1,25q�53      $��Right=�54      $
��Bold"�55      $��18(�56      $��	Roboto Cn)�57      ���#545454Please Refresh58   9   ]� 5:      $��0��6   $��1��5;      .+�5?      o�  o� 
IsMainMenu . $	��Top=�6)   .@�5@      m� 	 m� Icon	 5A      '  !MaterialDesignThemes.Wpf.PackIcon  5B      �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.3.0.823, Culture=neutral, PublicKeyToken=null]]
   Kind$
 Settings=�66   ���#5454546]   .@�5D      d� -   5         d�Name$ Toggle_theme��5D   '   ���#FF8400  ToggleButtonThemed#���  5E   8    � 	Resources 5G       �� 
TargetType �� Property �� Value J� SnapsToDevicePixels �� StrokeDashArray   PrimaryHueMidForegroundBrush  PrimaryHueMidBrush �� 
TargetType � 	Resources-  'System.Windows.Media.Animation.SineEase  Key7  1System.Windows.Media.Animation.EasingFunctionBase   
EasingMode g� Duration	 W� To �� TargetProperty �� 
TargetName W� EasingFunction W� From'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   Transitions%  System.Windows.VisualTransition   From   GeneratedDuration	   To    GeneratedEasingFunction!   
Storyboard9	  3System.Windows.Media.Animation.EasingDoubleKeyFrame" O� KeyTime# O� Value$ 	  EasingFunction2
  ,System.Windows.Media.Animation.QuadraticEase%   States   System.Windows.VisualState&   
Storyboard' ��Name( J� Opacity) �� RadiusY* �� RadiusX+ �Name, T� X- T� Y. A�Name  PrimaryHueLightBrush/ J� RenderTransformOrigin0 �� ScaleY1 �� ScaleX2 J� 	CacheMode3 �� RelativeSource  MaterialDesignShadowDepth14 J� Effect5 ��Name6 �� Triggers7 P� Property8 P� Value9 �� 
TargetName: ]� 
Conditions; �� Property< �� Value1  +MaterialDesignThemes.Wpf.ToggleButtonAssist= N� EnterActions> N� ExitActions? �� Color@ �� Opacity��%�  &	       �� 5H   "   " d�6C   .�5I   &   ��  �@�FocusVisualStyle 5J   *   �� 5K   .   .�5L   2   ��  � �� 5M   6   �� 5N   :   .R�5O   >   �� $��2q�6H    . #��� ��6n   $��1��6�   $	 1 2R�6�   5P   ;   5R   3   5S   /   5U   '   �� 5V   &    � ��# �  6C   �� 5W   &    � ��# �  6C   �� 5X   &    � ��$ 1q�6H   �� 5Y   &    � ��$ 0,1,0,0q�6@   �� 5Z   &    � �� 5[   *   �� 5\   .   " d�6>    5]   2   ��  5^   6   RippleEasingFunction $ 	EaseInOut=�6\   �� 5_   6   
HideRipple .��5`   :   W� $ 0:0:0.3D�6J   $ 0X�6]   $ Opacity�6d   $ RippleThumb��6�    5a   >     5b   B   $ 	EaseInOut=�6K   5d   ;   5e   7   �� 5f   6   
ShowRipple .��5g   :   W� $ 0D�6J   $
 0.26X�6W   $ Opacity�6a   $ RippleThumb��6�    5h   >     5i   B   $ 	EaseInOut=�6K   5k   ;   W� 5l   :   $ 0:0:0.2D�6J   $ 1X�6]   $	 2.5X�6f   $9 3(UIElement.RenderTransform).(ScaleTransform.ScaleX)�6o   $ RippleThumb��6�    5m   >     5n   B   $ 	EaseInOut=�6K   5p   ;   W� 5q   :   $ 0:0:0.2D�6J   $ 1X�6]   $	 2.5X�6f   $9 3(UIElement.RenderTransform).(ScaleTransform.ScaleY)�6o   $ RippleThumb��6�    5r   >     5s   B   $ 	EaseInOut=�6K   5u   ;   5v   7   5w   3   .R�5x   2   (� $��34��6:    5y   6     5z   :   CheckStates�� 5{   >     5|   B   $ *��6S   $ 0D�6\   $ Checked��6�     6r   Z� .! 5}   F   �� .��5~   J   U� $8 2(UIElement.RenderTransform).(TranslateTransform.X)�6h   $ ThumbHolder��6�   .\�5   N   	  $" 0��6c   $# 0Q�6o   	  5�   N   $" 0:0:0.2��6c   $
# 23.5Q�6u   $ 5�   R   
  5�   V   $ EaseOut=�6d   5�   O   5�   K   5�   G   5�   C     5�   B   $ Checked��6S   $ 0D�6b   $ 	Unchecked��6�     6x   Z� .! 5�   F   �� .��5�   J   U� $8 2(UIElement.RenderTransform).(TranslateTransform.X)�6h   $ ThumbHolder��6�   .\�5�   N   	  $" 0��6c   $
# 23.5Q�6o   	  5�   N   $" 0:0:0.2��6c   $# 0Q�6u   $ 5�   R   
  5�   V   $ EaseOut=�6d   5�   O   5�   K   5�   G   5�   C   .% 5�   >     Checked��.& 5�   B   �� .��5�   F   W� $ 0D�6V   $
 23.5X�6c   $8 2(UIElement.RenderTransform).(TranslateTransform.X)�6m   $ ThumbHolder��6�   5�   C   5�   ?     5�   >   	Unchecked��.& 5�   B   �� .��5�   F   W� $ 0D�6V   $ 0X�6c   $8 2(UIElement.RenderTransform).(TranslateTransform.X)�6j   $ ThumbHolder��6�   5�   C   5�   ?   5�   ;   .��5�   6   � .+�5�   :   �� $' Track��6D   
���   �$
��Left=�6`   $��15��6{   $��4.211,5,4.211,0q�6�   $
( 0.26Q�6�   $	) 7.5��6�   $	* 7.5��6�   $	��Top=�6�   $��40��6�   ��6�   Z� 6�   � 5�   :   $+ ThumbHolder��6?   $
��Left=�6T   $	��Top=�6o   z�5�   >   T� 5�   B   $, 0Q�6U   $- 0Q�6[   .+�5�   >   A� $. RippleThumb��6F   #���  6[   $��Center=�6�   $��25��6�   $��0q�6�   $
( 0.26Q�6�   $/ 0.5,0.5&�6�   $��Center=�6�   $��25��6  z�5�   B   �� 5�   F   $0 1Q�6U   $1 1Q�6`   5�   ?   �� 5�   >   2 6O   �� *)'(materialDesign:ShadowAssist.CacheMode)+3 �� *Self+.u�5�   B   A� $. Thumb��6J   #4 �  6Y   ���	#FF00D7FF$��Center=�6�   $��25��6�   $��0q�6�   $/ 0.5,0.5&�6�   $��Center=�6  $��25��6!  ��6�   Z� 6!  5�   ?   �� 5�   >   $5 ContentPresenter��6O   #��z��6i   #��z��6�   $��LeftToRight=�6�   #��z��6�   #��z��6   #��z��6C  5�   ;   5�   7   5�   3   6 5�   2   P� 5�   6   7 �@d�	IsChecked$
8 TrueY�6S   . �5�   :   �� $9 Thumb��6Q    6d   �� *
Background+3 �� *TemplatedParent+ � ���� 5�   :   $9 Track��6Q   # �  6d    � ���� 5�   :   # �  6W    � ��5�   7   ]� 5�   6   : 5�   :   �� 5�   >   ; �@d�	IsChecked$
< TrueY�6]   �� 5�   >   ; �@ HasOnContent< . 6�   ./�5�   :   �� $9 ContentPresenter��6T    6r   �� */-(materialDesign:ToggleButtonAssist.OnContent)+3 �� *TemplatedParent+ � ���� 5�   :   $9 ContentPresenter��6\    6z   �� *75(materialDesign:ToggleButtonAssist.OnContentTemplate)+3 �� *TemplatedParent+ � ��5�   7   P� 5�   6   7 �@d�	IsChecked$8 FalseY�6S   . �5�   :   �� # �  6W    � ��5�   7   P� 5�   6   7 �@��IsDefaulted8 . 6\   P� 5�   6   7 �@J�IsMouseOver8 . 6U   P� 5�   6   7 � ��8 . = 5�   :   �� 5�   >   .��5�   B   �� .��5�   F   W� $ 0D�6V   $
 0.26X�6c   $ Opacity�6m   $ RippleThumb��6�    5�   J     5�   N   $ 	EaseInOut=�6W   5�   G   W� 5�   F   $ 0:0:0.2D�6V   $ 1X�6i   $	 2.5X�6r   $9 3(UIElement.RenderTransform).(ScaleTransform.ScaleX)�6{   $ RippleThumb��6�    5�   J     5�   N   $ 	EaseInOut=�6W   5�   G   W� 5�   F   $ 0:0:0.2D�6V   $ 1X�6i   $	 2.5X�6r   $9 3(UIElement.RenderTransform).(ScaleTransform.ScaleY)�6{   $ RippleThumb��6�    5�   J     5�   N   $ 	EaseInOut=�6W   5�   G   5�   C   5�   ?   > 5�   :   �� 5�   >   .��5�   B   �� .��5�   F   W� $ 0:0:0.3D�6V   $ 0X�6i   $ Opacity�6p   $ RippleThumb��6�    5�   J     5�   N   $ 	EaseInOut=�6W   5�   G   5�   C   5�   ?   5�   7   P� 5�   6   7 � {�8 .  . �5�   :   �� $9 Thumb��6Q    � �� �	#FFBDBDBD6d   �� 5�   :   $9 Track��6Q    � �� 5�   >   �� 5�   B   $? Black��6R   $
@ 0.12Q�6`   5�   ;   5�   7   5�   /   5�   '   5�   #   5�      5�      m� 5�      -   5        A m�Name$A Refresh��5�   #   $��Refresh��5�   #   	 5�        5�   "   $
 	Autorenew=�6:   5�      m� 5     -   5        $A About��5  #   $��About��5  #   	 5       5  "   $)
 #CheckboxMultipleMarkedCircleOutline=�6:   6g   5     m� 5     -   5        $A Close��5  #   $
��Exit��5  #   	 5       5  "   $
 	ExitToApp=�6:   5     �� 5     m� 5     -   5        $A Langage��5  #   $��Langage��5  #   	 5       5  "   $
 Keyboard=�6:   6L   .@�5     m� -   5        $A FR��5  L   $��	Français��6'   B m� IsCheckableB . 6L   m� 5     -	   5        $A EN��5  K   $��Anglais��6'   B . 6K   5     m� 5      -
   5        $A Localisation��5"  #   $��Localisation��5   #   	 5#       5$  "   $

 City=�6:   6H   .@�5(     m� -   5        $	A Mtp��5(  O   $��Montpellier��6'   B . 6O   m� 5)     -   5        $	A Mar��5)  M   $��	Marseille��6'   B . 6M   m� 5*     -   5        $	A Par��5*  I   $��Paris��6'   B . 6I   m� 5+     -   5        $	A Nic��5+  H   $
��Nice��6'   B . 6H   m� 5,     -   5        $	A Tou��5,  L   $��Toulouse��6'   B . 6L   5.     5/     51     52     53     �� 56  
   -   5        $��topGraySeparator��56     ���	#D7D7D7D7$��0��6D   $��0��6T   $��1q�6a   $	��0 1q�6u   $��Bottom=�6�   6�   �� 57  
   -   5        $��topWhiteSeparator��57     ���	#FFFFFFFF$��0��6E   $��0��6U   $��1q�6b   $��0q�6v   $��Bottom=�6�   � 5:  
   $��1��6    .  ���	#FFEFEFEF 5;     �� 5<     6"   �� 5=     6"    5?     �� 5@     $
��105* �6#   62   �� 5A     $��5 �6#   6/   �� 5B     $
��120* �6#   62   .+�5E     �� C �� Orientation$C 
Horizontal=�6   $��1��62   .+�5F     �� $��Stretch=�6   $��1��68   $	��0 0q�6B   ���	#FFFFFFFF6d   �� 5G     $��Stretch=�6   $��1��68   $��0 0 0 0q�6B   ���#D7D7D76f   5H     �� 5J     $C 
Horizontal=�6   $��1��62   $��1��6B   .+�5K     �� $��Stretch=�6   $��1��68   $	��0 0q�6B   ���	#FFFFFFFF6d   �� 5L     $��Stretch=�6   $��1��68   $��0 0 0 0q�6B   ���#D7D7D76f   5M     �� 5P     $��0��6   $��2��6)   .+�5S       -   5        D  Name$D currentWeatherIcon��5W     $��0 -1 0 0q�5T     $��80��5U     $��80��5V     $	��Top=�5X     $��Center=�5Y      	 bluColor#��� 	 5Z     4 5]     3  -System.Windows.Media.Effects.DropShadowEffect  5^     E   Color$E 	#FF949494��6+   F   	Direction$	F -90Q�5_  +   G   Opacity$
G 0.55Q�5`  +   H   ShadowDepth$H 2Q�5a  +   I   
BlurRadius$I 2Q�5b  +   5d     �� 5g     -   5        $��weatherStatus��5h     $��0��5g     J �� TextAlignment$J Center=�5i     $��18(�5j     $
��Bold"�5k     
������ $��	25,0,25,0q�5m     ���#545454.��5n  *   Please Refresh6:   �� 5p     $C 
Horizontal=�6   $��0 5 0 2q�66   .+�5s       $��35 0 0 0q�5t     $��40��5u     $��40��5v     $
 WeatherWindy=�5w     $	��Top=�5x     $��Center=�5y     #��� 	 5z     4 5}       5~     $E 	#FF949494��6/   $	F -90Q�5  +   $
G 0.55Q�5�  +   $H 2Q�5�  +   $I 2Q�5�  +   5�     �� 5�     -   5        $��
windStatus��5�     $��1��5�     $J Center=�5�     $��Center=�5�     $
��Bold"�5�     
������ $��5,5,25,0q�5�     $��16(�5�     ���#545454.��5�  /   Please Refresh6?   5�     5�     �� 5�     $��2��6   $��2��6)   .+�5�     �� -   5        $��tempC��5�     $J Center=�5�     $��0,35,0,0q�5�     
������ $��48(�5�     $��./#ScreenMatrix)�5�     #��� 	 5�     $��Light"�5�     .��6)   .��5�  1   	Refresh4 5�       5�     $E 	#FF949494��6+   $	F -90Q�5�  +   $
G 0.55Q�5�  +   $H 2Q�5�  +   $I 2Q�5�  +   .��5�  &   5�     �� 5�     -   5        $��
tempMinMax��5�     $J Center=�5�     
������ $��0,0,0,0q�5�     $
��Bold"�5�     $��15(�5�     ���#545454.��5�  +   Please Refresh6;   5�     5�     �� 5�  
   -   5        $��bottomSeparator��5�     ���#FFFFFF$��1q�6A   $��1��6U   $	��0 1q�6c   $��Bottom=�6p   6�   �� 5�  
   -   5        $��bottomWhiteSeparator��5�     ���#D7D7D7$��1��6G   $��3q�6T   $	��0 0q�6h   $��Bottom=�6u   � 5�  
   -   5        $+ expGrid��5�  2   $��2��6    .  $��0,3,0,-3q�6C    5�     �� 5�     $��* �6    6-    5�     �� 5�     6%   .+�5�     9� -   5        K 9�Name$K 	xpandFore��5�     $��Stretch=�5�     $	��Top=�5�     L 9� ExpandDirection$
L Down=�5�     $��0��5�     ��5�     �� 5�     $��Forecast��6    $��Right=�60   $��15(�6L   $
��Bold"�6Z   6n   .��5�     �� $��
0 -10 0 20q�6   .+�5�     �� -   5        M ��Name$M 	titleDay0��5�      $
��Bold"�63   ���#545454$��Center=�6Z   $	��0 3q�6w   6�   �� 5�     $C 
Horizontal=�6!   .+�5�       -   5        $D weatherIcon0��5�     $��25��5�     $��25��5�     #��� 	 5�     4 5�       5�  "   $E 	#FF949494��63   $	F -90Q�5�  +   $
G 0.55Q�5�  +   $	H 1.5Q�5�  +   $I 2Q�5�  +   5�     �� 5�     -   5        $
M Day0��5�  $   $	��5 0q�62   $��Center=�6[   ��6?   �� N �� Path$N value�6[   �� 5�     -   5        $M DayWeather0��5�  $   $��Right=�6U   $��Center=�6q   ��69   �� $N value�6q   5�     �� 5�     -   5        $M 	titleDay1��5�      $
��Bold"�63   ���#545454$��Center=�6Z   $��0 0 0 0q�6w   6�   �� 5�     $C 
Horizontal=�6!   .+�5�       -    5        $D weatherIcon1��5�     $��25��5�     $��25��5�     #��� 	 5�     
 5�     �� $N value�4 5�       5�  "   $E 	#FF949494��63   $	F -90Q�5�  +   $
G 0.55Q�5�  +   $	H 1.5Q�5�  +   $I 2Q�5�  +   5      �� 5     -!   5        $
M Day1��5  $   $	��5 0q�62   $��Center=�6?   �� 5     -"   5        $M DayWeather1��5  $   $��Right=�6U   $��Center=�6q   ��69   �� $N value�6q   5     �� 5     -#   5        $M 	titleDay2��5      $
��Bold"�63   ���#545454$��Center=�6Z   $	��0 2q�6w   6�   �� 5	     $C 
Horizontal=�6!   .+�5       -$   5        $D weatherIcon2��5     $��25��5     $��25��5     #��� 	 5     4 5       5  "   $E 	#FF949494��63   $	F -90Q�5  +   $
G 0.55Q�5  +   $	H 1.5Q�5  +   $I 2Q�5  +   5     �� 5     -%   5        $
M Day2��5  $   $	��5 0q�62   $��Center=�6?   �� 5     -&   5        $M DayWeather2��5  $   $��Right=�6U   $��Center=�6q   ��69   �� $N value�6q   5     5      5!     5"     5#     5$     