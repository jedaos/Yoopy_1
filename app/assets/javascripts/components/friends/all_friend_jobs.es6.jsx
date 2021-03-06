class AllFriendJobs extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      friendJobs: JSON.parse(this.props.friendJobs)
    }
    this.handleNewJob = this.handleNewJob.bind(this);

  }

  handleNewJob(job) {
    this.setState({
      friendJobs: [...this.state.friendJobs, job]
    });
  }

  render () {
    return (
      <div>
        <div>
          <CurrentFriendJobsWrapper friendJobs={this.state.friendJobs} />
        </div>
      </div>
    );
  }
}
