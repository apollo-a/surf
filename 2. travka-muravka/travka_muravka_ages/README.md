Программа выводит значения среднего возраста всей используемой техники из `mapBefore2010` и `mapAfter2010`.

Далее сортирует список по возрасту техники (от старой к более новой) и считает средний возраст техники из верхней половины (с округлением в большую сторону). 

Вопрос по выполнению задания: для интереса прогнал код через ChatGPT, он предложил заменить цикл for-in на метод forEach. Выполнил эти действия, результат сохранив в отдельной ветки feature/OptimisingCode. IDE выдала предупреждение: `Function literals shouldn't be passed to 'forEach'. Try using a 'for' loop.` Но результат все-равно получается. 
Также в подсказке предложило использовать void: `void forEach(void Function(AgriculturalMachinery) action) Type: void Function(void Function(AgriculturalMachinery))`. Что в данной ситуации корректно и как использовать?
