@post=
  initialize: (block) ->
    editor = new MediumEditor('#post_content', post.options())
    $('#post_content').mediumInsert({
        editor: editor
    })
  options: ->
    options = { toolbar:
                  allowMultiParagraphSelection: true
                  buttons: post.buttons()
                  diffLeft: 0
                  diffTop: -10
                  firstButtonClass: 'medium-editor-button-first'
                  lastButtonClass: 'medium-editor-button-last'
                  standardizeSelectionStart: false
                  static: false
                  relativeContainer: null
                  align: 'center'
                  sticky: false
                  updateOnEmptySelection: false
                ,
                placeholder: 
                  text: 'Write something amazing!'
              }
    return options
  buttons: ->
    return ['bold', 'italic', 'underline', 'anchor', 'h2', 'h3', 'h4', 'quote', 'orderedlist' , 'unorderedlist', 'image', 'link']