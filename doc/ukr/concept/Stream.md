# Тип ```Stream```

<code>Stream</code> - абстрактний інтерфейс для роботи з потоковими даними.

```stream``` модуль дає доступ до API для реалізації інтерфейсу.

```javascript
const stream = require('stream');
```

**Потоки можуть бути:**
* Читабельними(Readable) - потоки, з яких можна прочитати дані(``` fs.createReadStream()```).
* Записуючими(Writable) - потоки, у які можна записати дані(```fs.createWriteStream()```).
* Дуплексними(Duplex) - потоки, з яких можна прочитати та у які можна записати(```net.Socket```).
* Трансформуючими(Transform) - потоки, які можуть модифікувати або трансформувати дані, які записуються або читаються(```zlib.createDeflate()```).

Всі потоки - екземпляри ```EventEmitter```

Чимало потокових об'єктів доступні в ```Node.js```. Наприклад, запит до HTTP серверу та ```process.stdout``` обидва екземпляри ```stream```.

**Приклад записуючого потоку:**
```javascript
 /**
 * Pipes a http response to a destination file.
 * @param { -http.ServerResponse- } response
 * @param { -string- } destination
 */
async function httpResponseToFile( response, destination) 
{
  return new Promise( resolve => 
  {
    const file = fs.createWriteStream( destination )
    response.pipe( file )
    file.on( 'finish', () => file.close( resolve ) )
  } )
}
```

**Ресурси:**
* [Node.js документація](https://nodejs.org/api/stream.html)
* [Стаття mozilla.org](https://developer.mozilla.org/en-US/docs/Web/API/Streams_API)
* [Додаткові приклади](https://www.codota.com/code/javascript/modules/stream)