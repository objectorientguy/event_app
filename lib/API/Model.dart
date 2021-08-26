class EventList {
  DateTime eventDate;
  String eventDescription;
  String eventName;
  String eventTime;
  int noOfAttendees;

  EventList({
    this.eventDate,
    this.eventDescription,
    this.eventName,
    this.eventTime,
    this.noOfAttendees,
  });

  EventList.fromJson(Map<String, dynamic> json) {
    eventDate = json['eventDate'];
    eventDescription = json['eventDescription'];
    eventName = json['eventName'];
    eventTime = json['eventTime'];
    noOfAttendees = json['noOfAttendees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventDate'] = this.eventDate;
    data['eventDescription'] = this.eventDescription;
    data['eventName'] = this.eventName;
    data['eventTime'] = this.eventTime;
    data['noOfAttendees'] = this.noOfAttendees;

    return data;
  }
}
