class Job extends React.Component {
  render () {
    return (
      <div>
      <p>
        <strong>Name: </strong>
      { this.props.job.name }
      </p>
      <p>
          <strong>Description: </strong>
          { this.props.job.description }
        </p>
        <p>
          <strong>Rate: </strong>
          ${ this.props.job.rate }
        </p>
      </div>
    );
  }
}

Job.propTypes = {
  job: PropTypes.object
};
