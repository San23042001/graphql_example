enum Mpintype {
  setMpin,
  changeMpin,
}

enum PasswordScreenType {
  setPassword,
  changePassword,
}

enum TaskCardType {
  myTasks,

  focused,
}

enum EffortType {
  development,
  design,
  maintenance,
  support,
  discussion,
}

extension EffortTypeExtension on EffortType {
  String toJson() {
    switch (this) {
      case EffortType.development:
        return 'Development';
      case EffortType.design:
        return 'Design';
      case EffortType.maintenance:
        return 'Maintenance';
      case EffortType.support:
        return 'Support';
      case EffortType.discussion:
        return 'Discussion';

    }
  }
}

enum Status {
  newState,
  inProgress,
  closed,
}

extension StatusExtension on Status {
  String toJson() {
    switch (this) {
      case Status.newState:
        return 'New';
      case Status.inProgress:
        return 'In-progress';
      case Status.closed:
        return 'Closed';
    }
  }
}



enum VibrationType{

  popup,

  warning,

  alert,
}
