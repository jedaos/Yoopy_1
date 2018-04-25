class CurrentFriendJobsWrapper extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      jobs: this.props.friendJobs
    }
    this.handleDelete = this.handleDelete.bind(this)
  }
    handleDelete(data){
      $.ajax({
        url: `/friend_jobs/${data.id}`,
        method: "DELETE",
        dataType: 'json',
        data: data,
        success: (data) => {
          this.setState({
            jobs: this.state.jobs.splice(data.id, 1)
          })
        },
        error: (data) => {
          console.log("Error", data);
        }
      });

    }

  render () {
    return (
        <div className="" id="FriendJobList">
          {this.props.friendJobs.map(x => {
          return <FriendJob key={x.id} job={x} onDelete={this.handleDelete} />
          })}
        </div>
      )
  }
}

CurrentFriendJobsWrapper.propTypes = {
  jobs: PropTypes.node
};
