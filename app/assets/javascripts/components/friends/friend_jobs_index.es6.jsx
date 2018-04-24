
class FriendJobsIndex extends React.Component {
  render () {
    return (
      <div>
        {this.props.friendJobs.map(friendJob => {
        return <NoEditFriendJob key={friendJob.id} friendJob={friendJob}/>
        })}
      </div>
    )
  }
}

FriendJobsIndex.propTypes = {
  friendJobs: PropTypes.array
};
