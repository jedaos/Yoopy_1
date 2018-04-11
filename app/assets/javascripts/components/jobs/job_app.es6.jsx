class JobApp extends React.Component {
  render () {
    return (
      <div>
        {this.props.jobs.map((job) => {
          return (<JobContent job={job} key={job.id}/>)
        })}
      </div>
    )
  }
}

JobApp.propTypes = {
  jobs: PropTypes.array
};
