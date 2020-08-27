![<iOS>-<iOS 14.0 and later>](https://img.shields.io/badge/iOS-iOS%2014.0%20and%20later-brightgreen)

# DatePickerSampleForiOS14
This app is a sample app that confirms how UIDatePicker looks in iOS14.

## Note

このアプリは iOS 14 で `UIDatePicker` がどう見えるのか確認するサンプルアプリです。

`preferredDatePickerStyle` のデフォルト(automatic)が `.compact` になっているため  
`.wheels` に設定しないと今までのドラムロール表示にならないので注意が必要です。

Storyboard に DatePicker は配置できますが，  
コードで `preferredDatePickerStyle` を設定する必要があります。

スクリーンショット等は NDA の関係で割愛します。

---

This app is a sample app that confirms how `UIDatePicker` looks in iOS14.

Note that the default (automatic) of `preferredDatePickerStyle` is `.compact`,  
so if you do not set it to `.wheels`, the drum roll display you have used up to now will not be displayed.

You can place the DatePicker on the Storyboard,  
but you must set the preferredDatePickerStyle in your code.

Screenshots, etc. are omitted because of NDA.

## FYI

https://developer.apple.com/documentation/uikit/uidatepickerstyle
