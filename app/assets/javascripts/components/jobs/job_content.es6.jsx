class JobContent extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      editable: false
    }
this.edit = this.edit.bind(this)
this.handleClick = this.handleClick.bind(this)
  }
  edit(){
    this.setState({
      editable: !this.state.editable
    })
  }
  handleClick(e){

  }
  render () {
    const { editable } = this.state
    return (
      <div className="job-table">
        <h5>Edit or Delete Current Jobs</h5>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Description</th>
              <th>Rate</th>
              <th>Slots</th>
              <th>Edit</th>
            </tr>
          </thead>
          <tbody>
          {this.props.jobs.map(job => (
              <JobTableRow key={job.id} id={job.id} name={job.name} description={job.description} rate={job.rate} slots={job.slot_num} />
            ))}
          </tbody>
        </table>
      </div>
    )
  }
}

JobContent.propTypes = {
  job: PropTypes.object
};
