class JobContent extends React.Component {
  constructor(props){
    super(props);
    this.setState({
      isEditable: false
    })

  }
  render () {
    
    return (
      <div className="card horizontal">
      <form id="Update" action={`/jobs/${this.props.job.id}`} acceptCharset='UTF-8' onSubmit={this.handleSubmit} data-remote='true' method='post'>
      <input type='hidden' name='_method' value='patch' />

      <input type='text' className="form-control" name='job[name]' defaultValue={this.props.job.name} onChange={this.handleChange} />

        <input type='text' className='form-control' name='job[description]' defaultValue={this.props.job.description} onChange={this.handleChange} />

        <input type='text' className='form-control' name='job[rate]' defaultValue={this.props.job.rate} onChange={this.handleChange} />
        <div className='actions'>
        <input type='submit' name='commit' value='Update Job' />
        </div>
        </form>
        <form id="delete" action={`/jobs/${this.props.job.id}`} acceptCharset='UTF-8' onSubmit={this.handleSubmit} data-remote='true' method='post'>
        <input type='hidden' name='_method' value='delete' />
        <input type='submit' name='delete' value='Delete Job' />
        </form>
        </div>
    );
  }
}

JobContent.propTypes = {
  job: PropTypes.object
};
