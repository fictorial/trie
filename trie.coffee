class TrieNode
  constructor: (@key) ->
    @children = {}
    @value = null

class Trie
  constructor: ->
    @root = new TrieNode

  _find_node: (key_path, node_path=null) ->
    node = @root
    node_path.push @root if node_path
    for i in [0...key_path.length]
      child_key = key_path.charCodeAt i
      node = node.children[child_key]
      return null unless node?
      node_path.push node if node_path?
    node

  set: (key_path, value) ->
    node = @root
    for i in [0...key_path.length]
      child_key = key_path.charCodeAt i
      unless node.children[child_key]?
        node.children[child_key] = new TrieNode child_key
      node = node.children[child_key]
    node.value = value
    @

  get: (key_path) ->
    node = @_find_node key_path
    if node? then node.value else null

  has: (key_path) ->
    (@get key_path)?

  _expand_from: (node, key_path_prefix, out_paths) ->
    out_paths.push key_path_prefix if node.value?
    for child_key, child of node.children
      child_key = String.fromCharCode child_key
      @_expand_from child, key_path_prefix + child_key, out_paths

  prefix_match: (key_path_prefix) ->
    node = @_find_node key_path_prefix
    return [] unless node?
    key_paths = []
    @_expand_from node, key_path_prefix, key_paths
    key_paths

  remove: (key_path) ->
    node_path = []
    node = @_find_node key_path, node_path
    return false unless node?
    node.value = null
    for i in [node_path.length-1 ... 0]
      [current_node, parent_node] = [node_path[i], node_path[i-1]]
      if not current_node.value? and (Object.keys current_node.children).length is 0
        delete parent_node.children[current_node.key]
    true

exports.Trie = Trie
exports.TrieNode = TrieNode
