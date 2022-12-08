# 6-trans

## problem 

we need to translate files in real time and keep them around.

we need to only retranslate when a source changes.

we need deck slides to be able to use this.

## solution

https://cloud.yandex.com/en/docs/translate/quickstart is very simple, comaprd to the unholy mess that AWS and Google make.

slides system and Editor can maintain this
- English text inside each slide. User can set TRANS_LANG_SOURCE in config to change it.
- Every language file is maintained alongside the slide. User can set array of TRANS_LANG_SINKS in config such as "Russian, Spanish". Use internal symbols.
- when you change text in a slide it updates the trans files. We can segment by Sentence - should be good enough for v1.
- At runt time we detect locale ( gio has this ), and then use the corect trans file.
  - must slip stream the it in somehow. Not sure right now.
