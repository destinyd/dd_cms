@init_kind_editor = (selector, params) ->
  {@root} = params
  @root ||= ''
  console.log @root
  KindEditor.ready (K) ->
    K.create selector, {"class":["kindeditor","required"],"required":false,"aria-required":null,"width":"100%","height":300,"allowFileManager":true,"uploadJson": @root + "/kindeditor/upload","fileManagerJson": @root + "/kindeditor/filemanager"}

@bind_permlink = (params={}) ->
  {selector_from, selector_to, root} = params
  root ||= ''
  selector_from ||= '.permlink_from'
  selector_to ||= '.permlink_to'

  $from = jQuery(selector_from)
  $to = jQuery(selector_to)
  if $from.length > 0 and $to.length > 0
    $from.on 'blur', ->
      title = jQuery(this).val()
      if title.length > 0
        jQuery.ajax
          url: root + '/permlink'
          method: 'POST'
          data:
            title: title
          success: (res) =>
            $to.val '/' + res
      else
        $to.val('')

