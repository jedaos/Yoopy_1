class AllJobs extends React.Component {
  constructor(props){
    super(props)
  }

  render() {
    return (
        <div>

            {this.props.jobs.map((job) => {
              return (<NoEditJob job={job} owner={this.props.owner} key={job.id}/>)
            })}

        </div>

    );
  }
}

AllJobs.propTypes = {
  jobs: PropTypes.array.isRequired,

};
