# trie

A Trie implementation in CoffeeScript.

## Usage

````coffeescript
#!/usr/bin/env coffee

t = new (require 'trie').Trie
require 'trie-util'

t.set 'hello', 1
t.set 'goodbye', 2
t.set 'help', 3

console.log t.dump()
console.log t.prefix_match 'hel' # [ 'hello', 'help' ]

t.remove 'hello'
console.log t.has 'goodbye' # true
````

Output:

    ├─g=null
    ├──o=null
    ├───o=null
    ├────d=null
    ├─────b=null
    ├──────y=null
    ├───────e=2

    ├─h=null
    ├──e=null
    ├───l=null
    ├────l=null
    ├─────o=1
    ├────p=3

    [ 'hello', 'help' ]
    true

## Author

Brian Hammond <brian@fictorial.com> (http://fictorial.com)

## License

Copyright (c) 2011 Fictorial LLC.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

