class NewFriendJob extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      job: {
        name: '',
        description: '',
        rate: '',
      }
    }

    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleTitleChange = this.handleTitleChange.bind(this)
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this)
    this.handleRateChange = this.handleRateChange.bind(this)
  }

  handleSubmit(e){
    e.preventDefault()
    $.ajax({
      url: "/friend_jobs",
      method: "POST",
      dataType: "json",
      data: {friendJob: this.state.job},
      success: (data) => {
        console.log("Success", data);
        this.setState({
          job: data
        })
        this.props.onNewJob(data);
      }
    })

  }
  handleTitleChange(e){
    let name = e.target.value
    this.setState(prevState => ({
        job: {
          ...prevState.job,
        name: name
      }
    }))
  }
  handleDescriptionChange(e){
    let description = e.target.value
    this.setState(prevState => ({
        job: {
          ...prevState.job,
        description: description
      }
    }))
  }
  handleRateChange(e){
    let rate = e.target.value
    this.setState(prevState => ({
        job: {
          ...prevState.job,
        rate: rate
      }
    }))
  }

  render () {
    const job = this.state.job;

    return (
    <div className="" id="friendJobForm">
      <div className="row">
        <form className="col s12" onSubmit={this.handleSubmit}>
          <div className="row">

            <div>
              <div className="input-field col s12">
                <input
                  type='text'
                  onChange={this.handleTitleChange}
                  value={job.name}
                  placeholder="Job Name"
                  >
                </input>
              </div>
            </div>

            <div>
              <div className="input-field col s6">
                <div className="">
                  <select className="browser-default" value={job.rate} onChange={this.handleRateChange}>
                    <option value="Rate" className="disabled">Rate</option>
                    <option value="100">$100</option>
                    <option value="200">$200</option>
                    <option value="300">$300</option>
                  </select>
                </div>
              </div>
            </div>

              <div>
                <div className="input-field col s12">
                  <textarea
                    id="description"
                    type='text'
                    onChange={this.handleDescriptionChange}
                    value={job.description}
                    placeholder="Add a description to tell us about the type of medical professional you're looking for"
                    >
                  </textarea>
                </div>
              </div>
            </div>
            <input className="btn-large green-button" type="submit" value="Post Job"></input>

            </form>
          </div>
        </div>
    );
  }
}

NewFriendJob.propTypes = {

};
