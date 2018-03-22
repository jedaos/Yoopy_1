class NoEditJob extends React.Component {
  render () {
    return(

      <form id="index">
      <input type='text' className="form-control" name='job[name]' defaultValue={this.props.job.name} onChange={this.handleChange} />

        <input type='text' className='form-control' name='job[description]' defaultValue={this.props.job.description} onChange={this.handleChange} />

        <input type='text' className='form-control' name='job[rate]' defaultValue={this.props.job.rate} onChange={this.handleChange} />
        <p>
          {this.props.job.slot_num}
        </p>
        </form>

    );
  }
}

NoEditJob.propTypes = {
  jobs: PropTypes.array
};
