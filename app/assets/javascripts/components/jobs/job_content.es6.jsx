class JobContent extends React.Component {
  constructor(props){
    super(props);
this.handleClick = this.handleClick.bind(this)
  }
  handleClick(e){
    e.preventDefault()
    $.ajax({
      url: `jobs/${this.props.job.id}`,
      method: "DELETE",
      data: {job:{
        name: this.props.job.name,
        description: this.props.job.description,
        rate: this.props.job.rate,
        slot_num: this.props.job.slot_num
      }},
      success(response){
        console.log("Success", response);
      },
      error(response){
        console.log("Error", response);
      }
    })
  }
  render () {

    return (
      <div className="card" id="job-posting-card">
        <form id="Update" action={`/jobs/${this.props.job.id}`} acceptCharset='UTF-8' data-remote='true' method='post'>
          <input type='hidden' name='_method' value='patch' />

          <input type='text' className="form-control" name='job[name]' defaultValue={this.props.job.name} onChange={this.handleChange} />

          <input type='text' className='form-control' name='job[description]' defaultValue={this.props.job.description} onChange={this.handleChange} />

          <input type='text' className='form-control' name='job[rate]' defaultValue={this.props.job.rate} onChange={this.handleChange} />

          <input type='text' className='form-control' name='job[slot_num]' defaultValue={this.props.job.slot_num} onChange={this.handleChange} />

          <div className='actions'>
            <input type='submit' name='commit' value='Update Job' className="btn #bdbdbd grey lighten-1" id="job-post-button"/>
            <input type='submit' name='destroy' value="Delete Job" className="btn #bdbdbd grey lighten-1" onClick={this.handleClick} />
          </div>
        </form>
      </div>
    )
  }
}

JobContent.propTypes = {
  job: PropTypes.object
};
