# Концепції

<details>
  <summary><a href="./concept/RoutineInput.md#Масив-аргументів">
    Масив аргументів
  </a></summary>
    Це сукупність параметрів рутини, котрі сформовано в псевдомасив <code>arguments</code>.
</details>

<details>
  <summary><a href="./concept/RoutineInput.md#Мапа-опцій">
    Мапа опцій
  </a></summary>
    Це контейнер, що призначений для передачі даних в рутину та управління її поведінкою.
</details>

<details>
  <summary><a href="./concept/RoutineInput.md#мапа-дефолтних-значень">
    Мапа дефолтних значень
  </a></summary>
    Короткий опис...
</details>

<details>
  <summary><a href="./concept/Vectorization.md#векторизація">
    Векторизація
  </a></summary>
    Векторизація - це процес перетворення алгоритму від операцій над одним значенням за раз, до операцій над набором
    значень(<a href="./concept/Vector.md#вектор">вектором</a>) за один раз.
</details>

<details>
  <summary><a href="./concept/Vectorization.md#автоматична-векторизація">
    Автоматична векторизація
  </a></summary>
  Векторизацію можливо виконати за допомогою рутини <a href="./tutorial/Vectorize.md">vectorize</a>.
</details>

<details>
  <summary><a href="./concept/Vectorization.md#ручна-векторизація">
    Ручна векторизація
  </a></summary>
  Операції над даними можуть бути складними і не піддаватись автоматичній векторизації або робити її недоцільною.
  В такому разі можливо векторизувати рутини вручну.
</details>

<details>
  <summary><a href="./concept/Vector.md">
    Вектор
  </a></summary>
    Це контейнер, що призначений для передачі даних в рутину, містить впорядкований скінченний набір елементів (даних).
</details>

<details>
  <summary><a href="./concept/Evaluator.md">
    Евалуатор
  </a></summary>
    Це рутина або пара рутин, які дозволяють довільним чином перетворити елементи масиву перед їх порівнянням. 
    Якщо отримані значення співпадають евалуатор повертає <code>true</code>, інакше - <code>false</code>. 
    Евалуатор, в якості колбека, передається в рутини для роботи із <a href="./concept/Long.md">Long</a> типами.
</details>

<details>
  <summary><a href="./concept/Equalizer.md">
    Еквалайзер
  </a></summary>
    Це функція, котра порівнюючи два елементи масиву повертає <code>true</code> у випадку, якщо умова порівняння виконується, 
    інакше - <code>false</code>. Еквалайзер, в якості колбека, передається в рутини для роботи із
    <a href="./concept/Long.md">Long</a> типами.
</details>

<details>
  <summary><a href="./concept/TypePrimitive.md">
    Тип <code>primitive</code>
  </a></summary>
    В <code>JavaScript</code> усі типи даних, що є цілісними і не мають змінюваних елементів називають примітивними.
</details>

<details>
  <summary><a href="./concept/TypePrimitive.md#тип-string">
    Тип string
  </a></summary>
    Примітивний тип даних для представлення текстових даних.
</details>

<details>
  <summary><a href="./concept/TypeIndexed.md">
    Впорядковані типи даних
  </a></summary>
    Комплексні типи даних, що містять множину елементів котрі ідентифікуються за індексом.
</details>

<details>
  <summary><a href="./concept/TypeUnroll.md">
    Тип <code>unroll</code>
  </a></summary>
    <code>Unroll</code> - тип даних - особливий вид масиву, здатний розготатись в іншому масиві при виконанні операції над ним.
</details>

<details>
  <summary><a href="./concept/Buffer.md">
    Буферні типи
  </a></summary>
    Сутності, для зберігання та обробки бінарних даних.
</details>

<details>
  <summary><a href="./concept/BufferRaw.md">
    Тип <code>BufferRaw</code>
  </a></summary>
    Стандартний нетипізований буфер, буфер необроблених даних, що призначений не для доступу до даних через цей об'єкт напряму, а для використання іншими буферами, як контейнера даних.
</details>

<details>
  <summary><a href="./concept/BufferTyped.md">
    Тип <code>BufferTyped</code>
  </a></summary>
    Стандартні типізовані буфери.
</details>

<details>
  <summary><a href="./concept/BufferView.md">
    Тип <code>BufferView</code>
  </a></summary>
    Cтандартний нетипізований буфер для динамічного типізування даних `BufferRaw`.
</details>

<details>
  <summary><a href="./concept/BufferNode.md">
    Тип <code>BufferNode</code>
  </a></summary>
    Нестандартна реалізація <code>NodeJS</code> нетипізованого буфера з вбудованою можливістю доступу до нього.
</details>

<details>
  <summary><a href="./concept/TypeRange.md">
    Тип <code>Range</code>
  </a></summary>
    <code>Range</code> - збірний тип даних - пара чисел, що задає послідовність.
</details>

<details>
  <summary><a href="./concept/LongDescriptor.md">
    Дескриптор типу <code>long</code>
  </a></summary>
    Дескриптор, що визначає тип контейнеру при створенні лонгу, якщо тип не вказано явно.
</details>

## Туторіали

<!--
<details>
  <summary><a href="./tutorial/Abstract.md">
    Загальна інформація
  </a></summary>
    Загальна інформація про модуль Tools.
</details>

<details>
  <summary><a href="./tutorial/Installation.md">
    Встановлення
  </a></summary>
    Процедура встановлення модуль Tools.
</details>
-->

<details>
  <summary><a href="./tutorial/ConventionNamingInArray.md">
    Array routines call conventions: naming
  </a></summary>
    Принципи найменування рутин сімейства <code>Array</code>.
</details>

<details>
  <summary><a href="./tutorial/ConventionCallbecksInArray.md">
    Array routines call conventions: callbacks
  </a></summary>
    Як використовувати <code>callback</code>-и в рутинах сімейства <code>Array</code>.
</details>

<details>
  <summary><a href="./tutorial/ConventionDstArgInArray.md">
    Array routines call conventions: dst argument
  </a></summary>
    Про що свідчить використання аргумента <code>dst</code>.
</details>

<details>
  <summary><a href="./tutorial/ConventionDefaultsMapInRoutine.md">
    Routines call convention: routine defaults map
  </a></summary>
    Як зберігаються та змінюються налаштування за замовчуванням в рутинах.
</details>

<details>
  <summary><a href="./tutorial/ConventionDstNullNew.md">
    Call conventions: dst - null
  </a></summary>
    Передача значення <code>null</code> в параметр <code>dst</code>.
</details>

<details>
  <summary><a href="./tutorial/ConventionNamingMakeAndFrom.md">
    Суфікси <code>Make</code> i <code>From</code> в найменуванні рутин
  </a></summary>
    Для позначення рутин-конструкторів використовуються рутини в назві яких є суфікси <code>Make</code> i <code>From</code>.
</details>

<details>
  <summary><a href="./tutorial/TimeMeasurement.md">
    Як заміряти час
  </a></summary>
    Замір часу виконання алгоритмів для вибору оптимального рішення.
</details>

<details>
  <summary><a href="./tutorial/Timer.md">
    Таймер
  </a></summary>
    Все про таймери.
</details>

<details>
  <summary><a href="./tutorial/EmbeddedModules.md">
    Вбудовані модулі
  </a></summary>
    Вбудовані модулі та відстрочене виконання коду, що потребує недоступного в даний момент модуля за допомогою механізму подій.
</details>

<details>
  <summary><a href="./tutorial/RoutineFromPreAndBody.md">
    Рутина routineFromPreAndBody
  </a></summary>
    Автоматичне об'єднання рутини підготовки даних і рутини для їх обробки.
</details>

<details>
  <summary><a href="./tutorial/Vectorize.md">
    Векторизація рутин
  </a></summary>
    Використання рутини <code>vectorize</code> для векторизації скалярних рутин.
</details>

<details>
  <summary><a href="./tutorial/VectorizeOptions.md">
    Налаштування рутин при векторизації
  </a></summary>
    Як використовувати опції рутини <code>vectorize</code> при створенні векторизованої рутини.
</details>
