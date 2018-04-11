class AllFriendJobs extends React.Component {
  render () {
    return (
      <div>
        <div>
          <NewFriendJob owner={this.props.owner} />
          <CurrentFriendJobsWrapper friendJobs={this.props.friendJobs} />
        </div>
      </div>
    );
  }
}
