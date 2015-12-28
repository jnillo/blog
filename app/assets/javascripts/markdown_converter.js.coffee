#= require markdown.sanitizer
@markdown=
  render_text: (block,text) ->
    converter = new Markdown.getSanitizingConverter();
    $(block).html(converter.makeHtml(text))