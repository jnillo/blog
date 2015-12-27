#= require markdown.sanitizer
@markdown=
  render_text: (block,text) ->
    converter = new Markdown.getSanitizingConverter();
    alert(text)
    $(block).html(converter.makeHtml(text))