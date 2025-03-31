const path = 'assets/icons/technologies/';

class Technology {
  final String name;
  final String icon;

  Technology({required this.name, required this.icon});
}

class Technologies {
  final List<Technology> technology;
  final String title;
  Technologies({required this.technology, required this.title});
}

final programmingLanguages = [
  Technology(name: 'Python', icon: '$path/programming_languages/python.svg'),
  Technology(name: 'C++', icon: '$path/programming_languages/c++.svg'),
  Technology(name: 'Dart', icon: '$path/programming_languages/dart.svg'),
  Technology(
    name: 'JavaScript',
    icon: '$path/programming_languages/javascript.svg',
  ),
  Technology(name: 'Go', icon: '$path/programming_languages/go.svg'),
  Technology(name: 'SQL', icon: '$path/programming_languages/sql.svg'),
  Technology(
    name: 'TypeScript',
    icon: '$path/programming_languages/typescript.svg',
  ),
  Technology(name: 'HTML', icon: '$path/programming_languages/html.svg'),
  Technology(name: 'CSS', icon: '$path/programming_languages/css.svg'),
];

final frameworks = [
  Technology(name: 'Django', icon: '$path/frameworks/django.svg'),
  Technology(name: 'FastApi', icon: '$path/frameworks/fastApi.svg'),
  Technology(name: 'Flutter', icon: '$path/frameworks/flutter.svg'),
  Technology(name: 'React', icon: '$path/frameworks/reactJs.svg'),
  Technology(name: 'Bootstrap', icon: '$path/frameworks/bootstrap.svg'),
];

final operatingSystems = [
  Technology(name: 'Windows', icon: '$path/operating_systems/windows.svg'),
  Technology(name: 'Linux', icon: '$path/operating_systems/ubuntu.svg'),
  Technology(name: 'MacOS', icon: '$path/operating_systems/mac.svg'),
];

final databases = [
  Technology(name: 'Firebase', icon: '$path/databases/firebase.svg'),
  Technology(name: 'PostgreSQL', icon: '$path/databases/postgre.svg'),
  Technology(name: 'MySQL', icon: '$path/databases/mysql.svg'),
  Technology(name: 'SQLite', icon: '$path/databases/sqlite.svg'),
];

final tools = [
  Technology(name: 'Git', icon: '$path/tools/git.svg'),
  Technology(name: 'CI/CD', icon: '$path/tools/ciCd.svg'),
  Technology(name: 'Docker', icon: '$path/tools/docker.svg'),
  Technology(name: 'Nginx', icon: '$path/tools/nginx.svg'),
  Technology(name: 'Postman', icon: '$path/tools/postman.svg'),
  Technology(name: 'Rest API', icon: '$path/tools/rest.svg'),
  Technology(name: 'GraphQL', icon: '$path/tools/graphql.svg'),
  Technology(name: 'Sentry', icon: '$path/tools/sentry.svg'),
  Technology(name: 'VSCode', icon: '$path/tools/vscode.svg'),
];

final agile = [
  Technology(name: 'Atlassian', icon: '$path/agile/atlassian.svg'),
  Technology(name: 'Jira', icon: '$path/agile/jira.svg'),
  Technology(name: 'Trello', icon: '$path/agile/trello.svg'),
];

final allTechnologies = [
  Technologies(
    technology: programmingLanguages,
    title: 'Programming Languages',
  ),
  Technologies(technology: frameworks, title: 'Frameworks'),
  Technologies(technology: databases, title: 'Databases'),
  Technologies(technology: tools, title: 'Tools'),
  Technologies(technology: agile, title: 'Agile'),
  Technologies(technology: operatingSystems, title: 'Operating Systems'),
];
