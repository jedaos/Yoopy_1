class AllJobs extends React.Component {
  render() {
    return (

      <div>
        {this.props.jobs.map((job) => {
          return (<NoEditJob job={job} key={job.id}/>)
        })};
      </div>

    );
  }
}

AllJobs.propTypes = {
  jobs: PropTypes.array.isRequired
};
