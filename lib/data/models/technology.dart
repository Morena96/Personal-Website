const path = 'assets/icons/technologies/';

class Technology {
  final String name;
  final String icon;

  Technology({required this.name, required this.icon});
}

final programmingLanguages = [
  Technology(name: 'C++', icon: '$path/programming_languages/c++.svg'),
  Technology(name: 'Dart', icon: '$path/programming_languages/dart.svg'),
  Technology(
    name: 'JavaScript',
    icon: '$path/programming_languages/javascript.svg',
  ),
  Technology(name: 'Python', icon: '$path/programming_languages/python.svg'),
  Technology(name: 'Go', icon: '$path/programming_languages/go.svg'),
  Technology(name: 'CSS', icon: '$path/programming_languages/css.svg'),
  Technology(name: 'HTML', icon: '$path/programming_languages/html.svg'),
  Technology(name: 'SQL', icon: '$path/programming_languages/sql.svg'),
  Technology(
    name: 'TypeScript',
    icon: '$path/programming_languages/typescript.svg',
  ),
];

final operatingSystems = [];
