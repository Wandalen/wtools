### <code>BufferNode</code> буфери

Нестандартна реалізація <code>NodeJS</code> нетипізованого буфера.

[`BufferNode` буфери](https://nodejs.org/dist/latest-v12.x/docs/api/buffer.html) представлені одним класом `BufferNode` ( `Buffer` ). Клас `BufferNode` наслідує властивості від класу [`U8x`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array) типу [`BufferTyped`](BufferTyped.md), а тому дані в ньому представляються в вигляді послідовності восьмибітних беззнакових чисел.

`Node` буфери працюють тільки в середовищі інтерпретатора `NodeJS`, а тому не можуть використовуватись в інших інтерпретаторах. Такі буфери потрібно перетворити до іншого типу.

Через недоліки в реалізації `BufferNode` буферів в модулі `Tools` їх використання обмежене.

### Приклади

Для створення буферу використовуються методи `from`, `alloc`, `allocUnsafe`. Створення екземпляру класу `BufferNode` з використанням `new` [не рекомендується](https://nodejs.org/dist/latest-v12.x/docs/api/buffer.html).

```js
var buffer = BufferNode.alloc( 5 );
console.log( buffer );
// log <Buffer 00 00 00 00 00>
```
Метод `alloc` виділяє ініціалізовану ділянку пам'яті указаної довжини. 

```js
var buffer = BufferNode.alloc( 5, 1 );
console.log( buffer );
// log <Buffer 01 01 01 01 01>
```

Метод `alloc` може відразу заповнити буфер. Для цього другим аргументом передається необхідне значення.

```js
var buffer = BufferNode.allocUnsafe( 5 );
console.log( buffer );
// log <Buffer 20 29 0a 20 20>
```

Метод `allocUnsafe` також виділяє ділянку пам'яті, проте не очищує її від попередніх даних.

```js
var buffer = BufferNode.from( [ 1, 2, 3 ] );
console.log( buffer );
// returns <Buffer 01 02 03>
```

Метод `from` може приймати значення у вигляді [`Long`](TypeIndexed.md)-у. Вихідний буфер матиме довжину рівну довжині переданого `Long`-у.

```js
var buffer = BufferNode.from('hello, world');
console.log( buffer );
// returns <Buffer 68 65 6c 6c 6f 2c 20 77 6f 72 6c 64>
```

Якщо в метод `from` передати рядок, він буде зконвертований у буфер. Кожен знак в рядку конвертуєтся в відповідний байт буферу з кодуванням `ASCII`.

```js
var buffer = BufferNode.from('hello, world', 'base64');
console.log( buffer );
//returns <Buffer 85 e9 65 a3 0a 2b 95>
```

Кодування може бути заданим в другиму аргументі. В приведеному прикладі використовується кодування `base64`, довжина вихідного буферу `buffer` скоротилась до 7 байтів з 12 при `ASCII` кодуванні.

### Підсумок 

- `BufferNode` буфери, це реалізація нетипізованого буферу в середовищі інтерпретатора `NodeJS`.
- `BufferNode` буфери потребують перетворення для використання в інших інтерпретаторах.

[Повернутись до змісту](../README.md#Концепції)
