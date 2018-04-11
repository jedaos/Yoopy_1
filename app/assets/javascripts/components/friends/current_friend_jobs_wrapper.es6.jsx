class CurrentFriendJobsWrapper extends React.Component {

  render () {
    return (
<<<<<<< HEAD:app/assets/javascripts/components/friends/current_friend_jobs_wrapper.es6.jsx
          <div className="container" id="FriendJobList">
            <h3 className="align-left">Your Current Jobs</h3>
=======
          <div className="">
            <h5 className="align-left">Your Current Jobs</h5>
>>>>>>> eda3519a45711814cf428397881993166cf222e2:app/assets/javascripts/components/current_friend_jobs_wrapper.es6.jsx
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
