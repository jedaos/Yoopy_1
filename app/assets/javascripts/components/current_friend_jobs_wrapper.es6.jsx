class CurrentFriendJobsWrapper extends React.Component {

  render () {
    return (
          <div className="">
            <h5 className="align-left">Your Current Jobs</h5>
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
