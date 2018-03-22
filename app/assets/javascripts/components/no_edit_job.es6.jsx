class NoEditJob extends React.Component {
  render () {
    return (
      <div className="card horizontal">
      <form id="index">
      <input type='text' className="form-control" name='job[name]' defaultValue={this.props.job.name} onChange={this.handleChange} />

        <input type='text' className='form-control' name='job[description]' defaultValue={this.props.job.description} onChange={this.handleChange} />

        <input type='text' className='form-control' name='job[rate]' defaultValue={this.props.job.rate} onChange={this.handleChange} />
        <div className='actions'>
        
        </div>
        </form>
        </div>
    );
  }
}

NoEditJob.propTypes = {
  jobs: PropTypes.array
};
