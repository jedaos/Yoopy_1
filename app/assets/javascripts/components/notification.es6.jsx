class Notification extends React.Component {
  constructor() {
    super();
    this.state = {
      notifications: [],
      isActive: false,
      read: false
    };
    this.handleClick = this.handleClick.bind(this);
  }
  componentDidMount() {
    $.ajax({
      url: "./notifications.json",
      method: "GET",
      dataType: "JSON",
      success: items => {
        this.setState({
          notifications: items,
          isActive: ""
        });
      },
      error: err => {
        console.log("Something didnt Work", err);
      }
    });
  }
  handleClick() {
    $.ajax({
      url: "notifications/mark_as_read/",
      method: "POST",
      dataType: "JSON",
      success: () => {
        console.log("success");
        this.setState({
          isActive: !this.state.isActive
        });
      }
    });
  }

  render() {
    const { notifications, isActive, read } = this.state;
    let unread = notifications.length === 0 ? null : notifications.length;
    const listed = notifications.map(item => (
      <li key={item.id}>
        <i className="material-icons list-icon">
          {item.notifiable.type === "a job"
            ? "local_hospital"
            : "person_pin_circle"}
        </i>
        <a href={item.url}>
          {item.actor} {item.action} {item.notifiable.type}
          {console.log(item.notifiable.type.typeof)}
        </a>
      </li>
    ));
    let animateClass = () => {
      if (isActive === "") {
        return "notifications";
      } else if (isActive === true) {
        return "notifications is-active";
      } else {
        return "notifications not-active";
      }
    };

    return (
      <div>
        <div className={animateClass()}>
          <div className="drop-container">
            <ul data-behavior="notification-items">
              {notifications.length > 0 ? (
                listed
              ) : (
                <li>
                  <i className="material-icons list-icon">money_off</i>
                  No Recent Activity
                </li>
              )}
            </ul>
          </div>
        </div>
        <i
          className="material-icons"
          id="notif-icon"
          data-behavior="notifications-link"
          onClick={this.handleClick}
        >
          {read || notifications.length === 0
            ? "notifications_off"
            : "notifications_active"}
        </i>
      </div>
    );
  }
}
