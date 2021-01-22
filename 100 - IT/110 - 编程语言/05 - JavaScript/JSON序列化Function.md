### 方法 ^[1]^
使用 Function::toString() 将 Function 保存为字符串，然后添加特殊标记，以便之后反序列化
> I made this answer to address some pretty big flaws with the existing answers: `.toString()`/`eval()` and `new Function()` on their own wont work at all if your function uses [`this`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this) or named arguments (`function (named, arg) {}`), respectively.
>
> Using [`toJSON()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify#toJSON()_behavior) below, **all you need to do is call [`JSON.stringify()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) as usual** on the function, and use `Function.deserialise` when [`parse()`ing](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse#Using_the_reviver_parameter).
>
> The following wont work for concise functions (`hello => 'there'`), but for standard ES5 fat functions it'll return it as it was defined, closures notwithstanding of course. [My other answer will work with all that ES6 goodness](https://stackoverflow.com/a/51123745/2518317).
>
> ------
>
> ```js
>Function.prototype.toJSON = function() {
>  var parts = this
>     .toString()
>      .match(/^\s*function[^(]*\(([^)]*)\)\s*{(.*)}\s*$/)
>  ;
>     if (parts == null)
>         throw 'Function form not supported';
>    
>     return [
>         'window.Function',
>         parts[1].trim().split(/\s*,\s*/),
>      parts[2]
>     ];
>    };
>    Function.deserialise = function(key, data) {
>     return (data instanceof Array && data[0] == 'window.Function') ?
>         new (Function.bind.apply(Function, [Function].concat(data[1], [data[2]]))) :
>      data
>  ;
>    };
>    ```
>    
>    ------
> 
> Take a look at the [**DEMO**](https://jsfiddle.net/5yh7130z/)
>
> At it's simplest:
>
> ```js
>var test = function(where) { return 'hello ' + where; };
> test = JSON.parse(JSON.stringify(test), Function.deserialise);
>console.log(test('there'));
> //prints 'hello there'
> ```
> 
> ------
> 
> More usefully, **you can serialise entire objects containing functions and pull them back out**:
>
> ```js
>test = {
> a : 2,
>run : function(x, y, z) { return this.a + x + y + z; }
> };
> var serialised = JSON.stringify(test);
>   console.log(serialised);
>   console.log(typeof serialised);
> 
> var tester = JSON.parse(serialised, Function.deserialise);
> console.log(tester.run(3, 4, 5));
> ```
> 
> Outputs:
> 
> ```js
>{"a":2,"run":["window.Function",["x","y","z"]," return this.a + x + y + z; "]}
> string
>14
> ```
> 
> ------
> 
> I didn't test older IE's, but it works on IE11, FF, Chrome, Edge.
>
> NB, the [`name`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/name) of the function is lost, if you use that property then there's nothing you can do, really.
>You can change it to not use `prototype` easily, but that's for you to do if that's what you need.



### 参考

1. [[How can I serialize a function in JavaScript?](https://stackoverflow.com/questions/7395686/how-can-i-serialize-a-function-in-javascript)