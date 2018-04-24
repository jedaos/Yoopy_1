class NewFriendJob extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      job: {
        name: '',
        description: '',
        rate: '',
        slot_num: ''
      }
    }

    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleTitleChange = this.handleTitleChange.bind(this)
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this)
    this.handleRateChange = this.handleRateChange.bind(this)
    this.handleSlotChange = this.handleSlotChange.bind(this)
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
        this.setState({
          job: {
            name: '',
            description: '',
            rate: '',
            slot_num: ''
          }
        })
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
  handleSlotChange(e){
    let slot_num = e.target.value
    this.setState(prevState => ({
        job: {
          ...prevState.job,
        slot_num: slot_num
      }
    }))
  }

  render () {
    const job = this.state.job;

    return (
    <div className="center" id="friendJobForm">

        <form className="col s12" onSubmit={this.handleSubmit}>
          <div className="row">
            <div className="col s8">
              <div className="input-field col s12">

                <input
                  type='text'
                  onChange={this.handleTitleChange}
                  value={job.name}
                  placeholder="Title"
                  >
                </input>
              </div>
            </div>
          </div>

          <div className="row">

                  <div className="col s6">
                      <select className="browser-default" value={job.rate} onChange={this.handleRateChange}>
                        <option value="Rate" className="disabled">Rate</option>
                        <option value="100">$100</option>
                        <option value="200">$200</option>
                        <option value="300">$300</option>
                      </select>
                    </div>

                  <div className="col s6">
                      <select className='browser-default' value={job.slot_num} onChange={this.handleSlotChange}>
                        <option value="Slots" className="disabled"> Number of Professionals</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                      </select>
                  </div>

              </div>

            <div className="col s12">
              <div className="row">
                <div className="input-field">
                  <textarea
                    id="description"
                    type='text'
                    onChange={this.handleDescriptionChange}
                    value={job.description}
                    placeholder="Description"
                    >
                  </textarea>
                  </div>
                </div>
              </div>


          <div className="row">
            <div className="col s1">
              <input className="btn btn-primary" type="submit" value="Submit"></input>
            </div>
          </div>
        </form>
      </div>


    );
  }
}

NewFriendJob.propTypes = {

};
