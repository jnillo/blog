#= require pagedown_bootstrap
@clean_form=
  first_step: ->
    $('.first-step').show();
    $('.second-step').hide();
  second_step: ->
    $('.first-step').hide();
    $('.second-step').show();
  init_textarea: ->
    $('textarea.big-textarea').each (i, input) ->
      attr = '-'+$(input).attr('id')
      $(input).attr('id', 'wmd-input' + attr)
      converter = new Markdown.Converter()
      Markdown.Extra.init(converter)
      help =
        handler: () ->
          window.open('http://daringfireball.net/projects/markdown/syntax')
          return false
        title: "<%= I18n.t('components.markdown_editor.help', default: 'Markdown Editing Help') %>"
      editor = new Markdown.Editor(converter, attr, help)
      editor.run()