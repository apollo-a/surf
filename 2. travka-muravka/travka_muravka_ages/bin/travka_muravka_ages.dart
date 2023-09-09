enum Countries {
  brazil,
  russia,
  turkish,
  spain,
  japan
}

class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      [
        'Кукуруза'
      ],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      [
        'Картофель'
      ],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      [
        'Лук'
      ],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      [
        'Хмель'
      ],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      [
        'Чай'
      ],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      [
        'Рис'
      ],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      [
        'Арбузы'
      ],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      [
        'Табак'
      ],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

void main() {
  // Задаем переменную нынешнего года для рассчета возраста техники
  int currentYear = DateTime.now().year;

  // Выставляем параметры множества уникальной техники
  Set<AgriculturalMachinery> uniqueMachinery = {};

  // Формируем список уникальной техники из обоих map
  for (List<Territory> territories in mapBefore2010.values) {
    uniqueMachinery.addAll(territories.expand((territory) => territory.machineries));
  }

  for (List<Territory> territories in mapAfter2010.values) {
    uniqueMachinery.addAll(territories.expand((territory) => territory.machineries));
  }

  // Выполняем подсчет возрастов для уникальной техники и считаем средний возраст
  List<int> ages = [];
  for (AgriculturalMachinery machinery in uniqueMachinery) {
    int age = currentYear - machinery.releaseDate.year;
    ages.add(age);
  }

  double averageAge = ages.reduce((a, b) => a + b) / ages.length;
  print('Средний возраст всей техники: $averageAge');

  // Сортируем возрасты от самого большого к наименьшему
  ages.sort((a, b) => b - a);
  int middleIndex = (ages.length / 2).ceil() - 1;

  // Вычисляем сумму элементов первой половины списка, наиболее старых машин
  int sum = 0;
  for (int i = 0; i <= middleIndex; i++) {
    sum += ages[i];
  }

  double averageAgeOldest = sum / (middleIndex + 1);
  print('Средний возраст элементов первой половины списка: $averageAgeOldest');
}
