$ ->
  box = $('#filter-input')
  box.bind 'keyup', ->
    count1 = charCount(box.attr('value'))
    for td in $('.wordlist td.word')
      word = td.innerHTML
      count2 = charCount(word)
      hidden = false
      for k, v of count1
        if !count2.hasOwnProperty(k) || count2[k] < v
          hidden = true
          break
      if hidden
        $(td).parent().hide()
      else
        $(td).parent().show()

  charCount = (word) ->
    count = []
    for ch in word
      if count.hasOwnProperty(ch)
        count[ch] += 1
      else
        count[ch] = 1
    count
