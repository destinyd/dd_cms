@init_kind_editor = (selector, params) ->
  {@root} = params
  @root ||= ''
  console.log @root
  KindEditor.ready (K) ->
    K.create selector, {"class":["kindeditor","required"],"required":false,"aria-required":null,"width":"100%","height":300,"allowFileManager":true,"uploadJson": @root + "/kindeditor/upload","fileManagerJson": @root + "/kindeditor/filemanager"}

