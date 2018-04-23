class NoEditFriendJob extends React.Component {
  render () {
    return (
    <div className="row">
      <div className="card horizontal">
          <div className='col s6'>
            <span>Timer</span>
            <ul>
              <li><h5>Rate:</h5></li>
              <p>${this.props.friendJob.rate}0</p>
            </ul>
          </div>




          <div className="col s6">
            <ul>
              <li><h5>Job Title:</h5></li>
              <p>{this.props.friendJob.name}</p>
              <li><h5>Description:</h5></li>
              <p>{this.props.friendJob.description}</p>
            </ul>
          </div>

      </div>
    </div>
    );
  }
}
