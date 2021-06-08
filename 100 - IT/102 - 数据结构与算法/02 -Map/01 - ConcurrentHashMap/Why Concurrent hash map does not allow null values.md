## Why Concurrent hash map does not allow null values?



### 问题描述

The JavaDoc of [`ConcurrentHashMap`](http://java.sun.com/javase/6/docs/api/java/util/concurrent/ConcurrentHashMap.html) says this:

> Like `Hashtable` but unlike `HashMap`, this class does *not* allow `null` to be used as a key or value. ^[1]^



### 原因

> I believe it is, at least in part, ==to allow you to combine `containsKey` and `get` into a single call==. If the map can hold nulls, there is no way to tell if `get` is returning a null because there was no key for that value, or just because the value was null.
>
> Why is that a problem? Because ==there is no safe way to do that yourself==. Take the following code:
>
> ```java
> if (m.containsKey(k)) {
>    return m.get(k);
> } else {
>    throw new KeyNotPresentException();
> }
> ```
>
> Since `m` is a concurrent map, key k may be deleted between the `containsKey` and `get` calls, causing this snippet to return a null that was never in the table, rather than the desired `KeyNotPresentException`. ^[1]^





### 参考

1. [Why does ConcurrentHashMap prevent null keys and values?](https://stackoverflow.com/questions/698638/why-does-concurrenthashmap-prevent-null-keys-and-values)

2. [Why Concurrent hash map does not allow null key or null values](https://stackoverflow.com/questions/34209111/why-concurrent-hash-map-does-not-allow-null-key-or-null-values)

