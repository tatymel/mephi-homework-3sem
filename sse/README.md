# SSE

Функция `ApplyModel` реализует вычисление некоторой функции. Вам нужно ускорить её примерно в 2 раза, используя векторные операции и compiler intrinsics.

Нужно реализовать две функции в файле `sse.cpp`:
  * В `Optimize` можно выполнить предобработку данных. Лучше разложить данные так, чтобы с ними было удобнее работать векторным операциям
  * Поведение функции `ApplyOptimizedModel` должно быть аналогично функции `ApplyModel`

Можно использовать любые инструкции до AVX2 включительно из `<immintrin.h>`.
Чтобы убедиться, что в вашем процессоре поддерживается AVX2, посмотрите в файл `/proc/cpuinfo`.

Подсказки:

  * Вам придётся работать с типами `__m128i` и `__m128` или 256 битными аналогами
    * `__m128` - это вектор из 4 float
    * `__m128i` - это вектор из 4 int
    * Можно кастовать `float*` к `__m128*` и `int*` к `__m128i*`
    * Чтобы делать векторное обращение к массиву по индексу можно использовать операцию gather

  * [Инструкции](https://www.laruence.com/sse)