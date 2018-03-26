class AllJobs extends React.Component {
  constructor(props){
    super(props)
  }

  render() {
    return (
        <div>
            {this.props.jobs.map((job) => {
              return (<NoEditJob job={job} key={job.id}/>)
            })}
            <p>
              </p>
        </div>

    );
  }
}

AllJobs.propTypes = {
  jobs: PropTypes.array.isRequired,
};
