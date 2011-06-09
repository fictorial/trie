{Trie,TrieNode} = require 'trie'

TrieNode::dump = (indent) ->
  s = ''
  for i in [0...indent]
    s += '─'
  s += (String.fromCharCode @key) + '=' + (JSON.stringify @value) + "\n"
  for _, v of @children
    s += '├─' + (v.dump indent+1)
  s

Trie::dump = ->
  s = ''
  for k,v of @root.children
    s += '├─' + (v.dump 0) + "\n"
  s

