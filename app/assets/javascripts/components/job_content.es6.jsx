class JobContent extends React.Component {
  constructor(props){
    super(props);
    this.setState({
      isEditable: false
    })

  }
  render () {

    return (
      <div className="card" id="job-posting-card">
      <form id="Update" action={`/jobs/${this.props.job.id}`} acceptCharset='UTF-8' onSubmit={this.handleSubmit} data-remote='true' method='post'>
      <input type='hidden' name='_method' value='patch' />

      <input type='text' className="form-control" name='job[name]' defaultValue={this.props.job.name} onChange={this.handleChange} />

        <input type='text' className='form-control' name='job[description]' defaultValue={this.props.job.description} onChange={this.handleChange} />

        <input type='text' className='form-control' name='job[rate]' defaultValue={this.props.job.rate} onChange={this.handleChange} />

        <input type='text' className='form-control' name='job[slot_num]' defaultValue={this.props.job.slot_num} onChange={this.handleChange} />

        <div className='actions'>
        <input type='submit' name='commit' value='Update Job' class="btn #1de9b6 teal accent-3" id="job-post-button"/>
        <input type='submit' name='delete' value='Delete Job' class="btn #bdbdbd grey lighten-1" id="job-post-button"/>

        </div>
        </form>
        <form id="delete" action={`/jobs/${this.props.job.id}`} acceptCharset='UTF-8' onSubmit={this.handleSubmit} data-remote='true' method='post'>
        <input type='hidden' name='_method' value='delete' />
        </form>
        </div>
    );
  }
}

JobContent.propTypes = {
  job: PropTypes.object
};
