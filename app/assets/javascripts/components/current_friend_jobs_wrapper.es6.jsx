class CurrentFriendJobsWrapper extends React.Component {

  render () {
    return (
          <div className="container">
            <h3 className="align-left">Your Current Jobs</h3>
            {this.props.friendJobs.map((x) => {
            return <FriendJob key={x.id} job={x} />
            })}
          </div>

    );
  }
}

CurrentFriendJobsWrapper.propTypes = {
  jobs: PropTypes.node
};
