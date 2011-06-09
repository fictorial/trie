Trie = (require 'trie').Trie
require 'trie-util'
util = require 'util'

exports.test_set_get_has_length_one = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  t.set 'a', 1
  test.ok t.has 'a'
  test.equal (t.get 'a'), 1
  test.done()

exports.test_set_get_has_length_two = (test) ->
  t = new Trie
  test.ok not t.has 'ab'
  t.set 'ab', 1
  test.ok t.has 'ab'
  test.equal (t.get 'ab'), 1
  test.done()

exports.test_set_get_has_length_three = (test) ->
  t = new Trie
  test.ok not t.has 'abc'
  t.set 'abc', 1
  test.ok t.has 'abc'
  test.equal (t.get 'abc'), 1
  test.done()

exports.test_set_get_has_child_parent = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  test.ok not t.has 'ab'
  t.set 'a', 1
  t.set 'ab', 2
  test.ok t.has 'a'
  test.ok t.has 'ab'
  test.equal (t.get 'a'), 1
  test.equal (t.get 'ab'), 2
  test.done()

exports.test_set_get_has_string_values = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  t.set 'a', 'foo'
  test.equal (t.get 'a'), 'foo'
  test.done()

exports.test_set_get_has_object_values = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  t.set 'a', {hello:42}
  test.deepEqual (t.get 'a'), {hello:42}
  test.done()

exports.test_set_get_remove_length_one = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  t.set 'a', 1
  test.ok t.has 'a'
  test.equal (t.get 'a'), 1
  t.remove 'a'
  test.ok not t.has 'a'
  test.equal (t.get 'a'), null
  test.doesNotThrow (-> t.remove 'a')
  test.done()

exports.test_set_get_remove_length_two = (test) ->
  t = new Trie
  test.ok not t.has 'ab'
  t.set 'ab', 1
  test.ok t.has 'ab'
  test.equal (t.get 'ab'), 1
  t.remove 'ab'
  test.ok not t.has 'ab'
  test.equal (t.get 'ab'), null
  test.doesNotThrow (-> t.remove 'ab')
  test.done()

exports.test_set_get_remove_length_three = (test) ->
  t = new Trie
  test.ok not t.has 'abc'
  t.set 'abc', 1
  test.ok t.has 'abc'
  test.equal (t.get 'abc'), 1
  t.remove 'abc'
  test.ok not t.has 'abc'
  test.equal (t.get 'abc'), null
  test.doesNotThrow (-> t.remove 'abc')
  test.done()

exports.test_remove_parent = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  test.ok not t.has 'ab'
  t.set 'a', 1
  t.set 'ab', 2
  test.ok t.has 'a'
  test.ok t.has 'ab'
  test.equal (t.get 'a'), 1
  test.equal (t.get 'ab'), 2
  t.remove 'a'
  test.ok not t.has 'a'
  test.ok t.has 'ab'
  test.equal (t.get 'a'), null
  test.equal (t.get 'ab'), 2
  test.done()

exports.test_remove_child = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  test.ok not t.has 'ab'
  t.set 'a', 1
  t.set 'ab', 2
  test.ok t.has 'a'
  test.ok t.has 'ab'
  test.equal (t.get 'a'), 1
  test.equal (t.get 'ab'), 2
  t.remove 'ab'
  test.ok not t.has 'ab'
  test.ok t.has 'a'
  test.equal (t.get 'a'), 1
  test.equal (t.get 'ab'), null
  test.done()

exports.test_set_multiple_times = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  t.set 'a', 1
  test.ok t.has 'a'
  test.equal (t.get 'a'), 1
  t.set 'a', 2
  test.ok t.has 'a'
  test.equal (t.get 'a'), 2
  test.done()

exports.test_set_remove_get = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  t.set 'a', 1
  test.ok t.has 'a'
  test.equal (t.get 'a'), 1
  t.remove 'a'
  test.ok not t.has 'a'
  test.equal (t.get 'a'), null
  t.set 'a', 2
  test.ok t.has 'a'
  test.equal (t.get 'a'), 2
  test.done()

exports.test_prefix_match_length_one = (test) ->
  t = new Trie
  test.ok not t.has 'a'
  t.set 'a', 1
  test.ok t.has 'a'
  test.equal (t.get 'a'), 1
  test.deepEqual (t.prefix_match 'a'), [ 'a' ]
  test.ok not t.has 'b'
  t.set 'b', 1
  test.ok t.has 'b'
  test.equal (t.get 'b'), 1
  test.deepEqual (t.prefix_match 'b'), [ 'b' ]
  test.done()

exports.test_prefix_match_length_two = (test) ->
  t = new Trie
  test.ok not t.has 'ab'
  t.set 'ab', 1
  test.ok t.has 'ab'
  test.equal (t.get 'ab'), 1
  test.deepEqual (t.prefix_match 'ab'), [ 'ab' ]
  test.ok not t.has 'bc'
  t.set 'bc', 1
  test.ok t.has 'bc'
  test.equal (t.get 'bc'), 1
  test.deepEqual (t.prefix_match 'bc'), [ 'bc' ]
  test.done()

exports.test_prefix_match_length_three = (test) ->
  t = new Trie
  test.ok not t.has 'abc'
  t.set 'abc', 1
  test.ok t.has 'abc'
  test.equal (t.get 'abc'), 1
  test.deepEqual (t.prefix_match 'abc'), [ 'abc' ]
  test.ok not t.has 'bcd'
  t.set 'bcd', 1
  test.ok t.has 'bcd'
  test.equal (t.get 'bcd'), 1
  test.deepEqual (t.prefix_match 'bcd'), [ 'bcd' ]
  test.done()

exports.test_prefix_match_many_basic = (test) ->
  t = new Trie
  t.set 'aa', 1
  t.set 'ab', 2
  t.set 'ac', 3
  test.deepEqual (t.prefix_match 'a'), [ 'aa', 'ab', 'ac' ]
  t.set 'a', 4
  test.deepEqual (t.prefix_match 'a'), [ 'a', 'aa', 'ab', 'ac' ]
  test.done()

exports.test_prefix_match_multiple_children_same_branch = (test) ->
  t = new Trie
  test.ok not t.has 'abc'
  t.set 'abc', 1
  test.ok t.has 'abc'
  test.equal (t.get 'abc'), 1
  test.deepEqual (t.prefix_match 'abc'), [ 'abc' ]
  test.ok not t.has 'abd'
  t.set 'abd', 1
  test.ok t.has 'abd'
  test.equal (t.get 'abd'), 1
  test.deepEqual (t.prefix_match 'abd'), [ 'abd' ]
  test.deepEqual (t.prefix_match 'ab'), [ 'abc', 'abd' ]
  test.done()

